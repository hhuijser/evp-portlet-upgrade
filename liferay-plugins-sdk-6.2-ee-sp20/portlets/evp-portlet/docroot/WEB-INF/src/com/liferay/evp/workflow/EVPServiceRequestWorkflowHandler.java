/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.evp.workflow;

import com.liferay.compat.portal.kernel.util.ArrayUtil;
import com.liferay.compat.portal.kernel.util.ListUtil;
import com.liferay.evp.model.EVPKaleoForkInstance;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.service.EVPServiceRequestLocalServiceUtil;
import com.liferay.evp.util.EVPRoleConstants;
import com.liferay.evp.util.EVPWorkflowConstants;
import com.liferay.evp.util.EVPWorkflowUtil;
import com.liferay.evp.util.PortletKeys;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.workflow.BaseWorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowTask;
import com.liferay.portal.kernel.workflow.WorkflowTaskManagerUtil;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.security.permission.ResourceActionsUtil;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserGroupRoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * @author Danny Situ
 */
public class EVPServiceRequestWorkflowHandler extends BaseWorkflowHandler {

	@Override
	public String getClassName() {
		return EVPServiceRequest.class.getName();
	}

	public String getTitle(long evpServiceRequestId, Locale locale) {
		return String.valueOf(evpServiceRequestId);
	}

	public String getType(Locale locale) {
		return ResourceActionsUtil.getModelResource(locale, getClassName());
	}

	@Override
	public Object updateStatus(
			int status, Map<String, Serializable> workflowContext)
		throws PortalException, SystemException {

		long evpServiceRequestId = GetterUtil.getLong(
			workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

		EVPServiceRequest evpServiceRequest =
			EVPServiceRequestLocalServiceUtil.getEVPServiceRequest(
				evpServiceRequestId);

		ServiceContext serviceContext =
			(ServiceContext)workflowContext.get(
				WorkflowConstants.CONTEXT_SERVICE_CONTEXT);

		try {
			int serviceForkTypeMainStatus = updateEVPKaleoForkInstance(
				evpServiceRequestId, status, serviceContext, workflowContext);

			evpServiceRequest.setStatus(serviceForkTypeMainStatus);
		}
		catch (Exception e) {
			evpServiceRequest.setStatus(status);
		}

		List<Integer> statuses = getStatuses(evpServiceRequestId);

		completeWorkflowTask(
			evpServiceRequestId, evpServiceRequest.getCompanyId(), status,
			statuses, workflowContext);

		if (statuses.isEmpty()) {
			statuses.add(status);
		}

		updateContactUserPermissions(
			evpServiceRequest.getCompanyId(),
			evpServiceRequest.getContactUserId(), evpServiceRequestId,
			statuses);

		updateManagerUserPermissions(
			evpServiceRequest.getCompanyId(),
			evpServiceRequest.getManagerUserId(),
			evpServiceRequest.getSubsidiaryGroupId(), evpServiceRequestId,
			statuses);

		updateOwnerPermissions(
			evpServiceRequest.getCompanyId(), evpServiceRequest.getUserId(),
			evpServiceRequestId, statuses);

		User user = UserLocalServiceUtil.getUser(serviceContext.getUserId());

		evpServiceRequest.setStatusByUserId(user.getUserId());
		evpServiceRequest.setStatusByUserName(user.getFullName());

		evpServiceRequest.setStatusDate(serviceContext.getModifiedDate());

		return EVPServiceRequestLocalServiceUtil.updateEVPServiceRequest(
			evpServiceRequest);
	}

	protected static <T> boolean containsAny(
		Collection<T> collection1, Collection<T> collection2) {

		Set<T> set = getIntersection(collection1, collection2);

		return !set.isEmpty();
	}

	protected static <T> Set<T> getIntersection(
		Collection<T> collection1, Collection<T> collection2) {

		Set<T> set = new HashSet<T>(collection1);

		set.retainAll(collection2);

		return set;
	}

	protected static List<Integer> getStatuses(long classPK) {
		List<Integer> statuses = new ArrayList<Integer>();

		try {
			List<EVPKaleoForkInstance> evpKaleoForkInstances =
				EVPWorkflowUtil.getEVPKaleoForkInstances(classPK);

			for (EVPKaleoForkInstance evpKaleoForkInstance :
					evpKaleoForkInstances) {

				statuses.add(evpKaleoForkInstance.getStatus());
			}
		}
		catch (Exception e) {
		}

		return statuses;
	}

	protected void completeWorkflowTask(
			long evpServiceRequestId, long companyId, int status,
			List<Integer> statuses, Map<String, Serializable> workflowContext)
		throws PortalException, SystemException {

		if (!ArrayUtil.contains(
				EVPWorkflowConstants.SERVICE_STATUSES_AUTO_JOIN, status) ||
			!statuses.contains(status)) {

			return;
		}

		long defaultUserId = UserLocalServiceUtil.getDefaultUserId(companyId);

		List<WorkflowTask> workflowTasks = null;

		try {
			workflowTasks = EVPWorkflowUtil.getWorkflowTasks(
				companyId, getClassName(), evpServiceRequestId);
		}
		catch (Exception e) {
			throw new SystemException(e);
		}

		for (WorkflowTask workflowTask : workflowTasks) {
			List<String> transitionNames =
				WorkflowTaskManagerUtil.getNextTransitionNames(
					companyId, defaultUserId, workflowTask.getWorkflowTaskId());

			for (String transitionName : transitionNames) {
				if (ArrayUtil.contains(
						EVPWorkflowConstants.SERVICE_TRANSITIONS_AUTO_JOIN,
						transitionName)) {

					String comments = GetterUtil.getString(
						workflowContext.get(
							WorkflowConstants.CONTEXT_TRANSITION_NAME));

					WorkflowTaskManagerUtil.completeWorkflowTask(
						companyId, defaultUserId,
						workflowTask.getWorkflowTaskId(), transitionName,
						comments, workflowContext);

					break;
				}
			}
		}
	}

	protected void updateContactUserPermissions(
			long companyId, long contactUserId, long classPK,
			List<Integer> statuses)
		throws PortalException, SystemException {

		Role organizationContactRole = RoleLocalServiceUtil.getRole(
			companyId, EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

		if (containsAny(
				ListUtil.toList(
					EVPWorkflowConstants.SERVICE_STATUSES_ORGANIZATION_CONTACT),
				statuses)) {

			ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
				companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
				String.valueOf(classPK), organizationContactRole.getRoleId(),
				contactUserId, new String[] {"UPDATE_PROOF", "VERIFY"});

			ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
				companyId, PortletKeys.EVP, ResourceConstants.SCOPE_INDIVIDUAL,
				String.valueOf(0), organizationContactRole.getRoleId(),
				contactUserId, new String[] {"VIEW"});
		}
		else if (ResourcePermissionLocalServiceUtil.hasResourcePermission(
					companyId, getClassName(),
					ResourceConstants.SCOPE_INDIVIDUAL, String.valueOf(classPK),
					organizationContactRole.getRoleId(), "VERIFY")) {

			ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
				companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
				String.valueOf(classPK), organizationContactRole.getRoleId(),
				contactUserId, new String[0]);
		}
	}

	protected int updateEVPKaleoForkInstance(
			long evpServiceRequestId, int status, ServiceContext serviceContext,
			Map<String, Serializable> workflowContext)
		throws Exception {

		List<Integer> evpKaleoForkInstanceStatuses = getStatuses(
			evpServiceRequestId);

		if (containsAny(
				evpKaleoForkInstanceStatuses,
				ListUtil.toList(
					EVPWorkflowConstants.SERVICE_STATUSES_AUTO_JOIN))) {

			return status;
		}

		for (int type : EVPWorkflowConstants.SERVICE_STATUSES_FORK_TYPES) {
			int[] serviceForkTypeStatuses =
				EVPWorkflowConstants.getServiceForkTypeStatuses(type);

			long evpKaleoForkInstanceCount =
				EVPWorkflowUtil.getEVPKaleoForkInstancesCount(
					evpServiceRequestId, type);

			if ((EVPWorkflowConstants.getServiceForkTypeInitialStatus(type) ==
					status) ||
				(ArrayUtil.contains(serviceForkTypeStatuses, status) &&
				 (evpKaleoForkInstanceCount > 0))) {

				EVPWorkflowUtil.persistEVPKaleoForkInstance(
					evpServiceRequestId, status, type, serviceContext,
					workflowContext);

				return EVPWorkflowConstants.getServiceForkTypeMainStatus(type);
			}
		}

		return status;
	}

	protected void updateManagerUserPermissions(
			long companyId, long managerUserId, long groupId, long classPK,
			List<Integer> statuses)
		throws PortalException, SystemException {

		Role managerRole = RoleLocalServiceUtil.getRole(
			companyId, EVPRoleConstants.ROLE_NAME_MANAGER);

		if (Validator.isNull(managerRole)) {
			managerRole =
				RoleLocalServiceUtil.addRole(
					managerUserId, companyId,
					EVPRoleConstants.ROLE_NAME_MANAGER, null, null,
					RoleConstants.TYPE_ORGANIZATION);
		}

		Group group = GroupLocalServiceUtil.getGroup(groupId);

		UserLocalServiceUtil.addOrganizationUser(
			group.getClassPK(), managerUserId);

		UserGroupRoleLocalServiceUtil.addUserGroupRoles(
			managerUserId, groupId, new long[] {managerRole.getRoleId()});

		if (containsAny(
				ListUtil.toList(
					EVPWorkflowConstants.SERVICE_STATUSES_MANAGER_USER),
					statuses)) {

			ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
				companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
				String.valueOf(classPK), managerRole.getRoleId(), managerUserId,
				new String[] {"SET_STATUS", "VIEW"});
		}
		else if (ResourcePermissionLocalServiceUtil.hasResourcePermission(
					companyId, getClassName(),
					ResourceConstants.SCOPE_INDIVIDUAL, String.valueOf(classPK),
					managerRole.getRoleId(), "SET_STATUS")) {

			ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
				companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
				String.valueOf(classPK), managerRole.getRoleId(), managerUserId,
				new String[] {"VIEW"});
		}
	}

	protected void updateOwnerPermissions(
			long companyId, long ownerId, long classPK, List<Integer> statuses)
		throws PortalException, SystemException {

		Role ownerRole = RoleLocalServiceUtil.getRole(
			companyId, RoleConstants.OWNER);

		String[] actionIds;

		if (statuses.contains(
				EVPWorkflowConstants.SERVICE_STATUS_MORE_INFO_FROM_USER)) {

			actionIds = new String[] {
				"EDIT", "SET_OWN_STATUS", "UPDATE", "VIEW"};
		}
		else if (containsAny(
					ListUtil.toList(
						EVPWorkflowConstants.
							SERVICE_STATUSES_FEEDBACK_USER_EDITABLE),
					statuses)) {

			actionIds = new String[] {"FEEDBACK", "UPDATE_FEEDBACK", "VIEW"};
		}
		else {
			actionIds = new String[] {"VIEW"};
		}

		ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
			companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
			String.valueOf(classPK), ownerRole.getRoleId(), ownerId, actionIds);
	}

}
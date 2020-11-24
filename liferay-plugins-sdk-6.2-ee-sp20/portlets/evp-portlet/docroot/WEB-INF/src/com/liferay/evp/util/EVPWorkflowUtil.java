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

package com.liferay.evp.util;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.util.ArrayUtil;
import com.liferay.evp.model.EVPKaleoForkInstance;
import com.liferay.evp.service.EVPKaleoForkInstanceLocalServiceUtil;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.DateFormatFactoryUtil;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.StreamUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowDefinition;
import com.liferay.portal.kernel.workflow.WorkflowDefinitionManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;
import com.liferay.portal.kernel.workflow.WorkflowTask;
import com.liferay.portal.kernel.workflow.WorkflowTaskAssignee;
import com.liferay.portal.kernel.workflow.WorkflowTaskManagerUtil;
import com.liferay.portal.kernel.workflow.WorkflowThreadLocal;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.model.WorkflowInstanceLink;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserGroupRoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.WorkflowDefinitionLinkLocalServiceUtil;
import com.liferay.portal.service.WorkflowInstanceLinkLocalServiceUtil;

import java.io.InputStream;
import java.io.Serializable;

import java.text.DateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Val Nagy
 * @author Ethan Bustad
 */
public class EVPWorkflowUtil {

	public static void deployWorkflowDefinition(
			long companyId, long groupId, String fileName, String className)
		throws Exception {

		long userId = UserLocalServiceUtil.getDefaultUserId(companyId);

		DateFormat dateFormat = DateFormatFactoryUtil.getSimpleDateFormat(
			"yyyy-MM-dd");

		String title = "Automatically deployed on " + dateFormat.format(
			new Date());

		InputStream inputStream = null;

		try {
			ClassLoader classLoader = EVPWorkflowUtil.class.getClassLoader();

			inputStream = classLoader.getResourceAsStream(
				"/com/liferay/evp/dependencies/" + fileName);

			byte[] bytes = FileUtil.getBytes(inputStream);

			WorkflowDefinition workflowDefinition =
				WorkflowDefinitionManagerUtil.deployWorkflowDefinition(
					companyId, userId, title, bytes);

			WorkflowDefinitionLinkLocalServiceUtil.updateWorkflowDefinitionLink(
				userId, companyId, 0, className, 0, 0,
				workflowDefinition.getName(), workflowDefinition.getVersion());
		}
		finally {
			StreamUtil.cleanUp(inputStream);
		}
	}

	public static String doJoin(long classPK) throws Exception {
		List<EVPKaleoForkInstance> evpKaleoForkInstances =
			getEVPKaleoForkInstances(classPK);

		String returnValue = EVPWorkflowConstants.SERVICE_LABEL_COMPLETED;

		for (EVPKaleoForkInstance evpKaleoForkInstance :
				evpKaleoForkInstances) {

			if (ArrayUtil.contains(
					EVPWorkflowConstants.SERVICE_STATUSES_INFO_REQUESTED,
					evpKaleoForkInstance.getStatus())) {

				returnValue =
					EVPWorkflowConstants.
					SERVICE_TRANSITION_REQUEST_INFO_FROM_USER;
			}
			else if (ArrayUtil.contains(
						EVPWorkflowConstants.SERVICE_STATUSES_REJECTED,
						evpKaleoForkInstance.getStatus())) {

				returnValue =
					EVPWorkflowConstants.SERVICE_LABEL_REQUEST_REJECTED;
			}

			EVPKaleoForkInstanceLocalServiceUtil.deleteEVPKaleoForkInstance(
				evpKaleoForkInstance);
		}

		return returnValue;
	}

	public static List<EVPKaleoForkInstance> getEVPKaleoForkInstances(
			long classPK)
		throws Exception {

		AlloyServiceInvoker evpKaleoForkInstanceAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPKaleoForkInstance.class.getName());

		return evpKaleoForkInstanceAlloyServiceInvoker.executeDynamicQuery(
			new Object[] {"classPK", classPK});
	}

	public static long getEVPKaleoForkInstancesCount(long classPK, int type)
		throws Exception {

		AlloyServiceInvoker evpKaleoForkInstanceAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPKaleoForkInstance.class.getName());

		return evpKaleoForkInstanceAlloyServiceInvoker.executeDynamicQueryCount(
			new Object[] {"classPK", classPK, "type", type});
	}

	public static WorkflowTask getFirstWorkflowTaskForUser(
			long companyId, long groupId, long ownerId, long userId,
			String className, long classPK)
		throws Exception {

		List<WorkflowTask> workflowTasks = getWorkflowTasks(
			companyId, className, classPK);

		for (WorkflowTask workflowTask : workflowTasks) {
			if (isWorkflowTaskAssignedToUser(
					workflowTask, companyId, groupId, ownerId, userId)) {

				return workflowTask;
			}
		}

		return null;
	}

	public static long getWorkflowInstanceId(
			long companyId, long groupId, String className, long classPK)
		throws Exception {

		WorkflowInstanceLink workflowInstanceLink =
			WorkflowInstanceLinkLocalServiceUtil.getWorkflowInstanceLink(
				companyId, groupId, className, classPK);

		return workflowInstanceLink.getWorkflowInstanceId();
	}

	public static List<WorkflowTask> getWorkflowTasks(
			long companyId, long userId, String className, long classPK)
		throws Exception {

		try {
			return WorkflowTaskManagerUtil.search(
				companyId, userId, StringPool.BLANK, className,
				new Long[] {classPK}, null, null, false, null, false,
				QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
		}
		catch (Exception e) {
			StringBundler sb = new StringBundler(8);

			sb.append("Unable to find workflow tasks for company ");
			sb.append(companyId);
			sb.append(", user ");
			sb.append(userId);
			sb.append(", class name ");
			sb.append(className);
			sb.append(", and class PK ");
			sb.append(classPK);

			if (_log.isInfoEnabled()) {
				_log.info(sb.toString());
			}

			throw new Exception(sb.toString());
		}
	}

	public static List<WorkflowTask> getWorkflowTasks(
			long companyId, String className, long classPK)
		throws Exception {

		return getWorkflowTasks(
			companyId, UserLocalServiceUtil.getDefaultUserId(companyId),
			className, classPK);
	}

	public static boolean isWorkflowTaskAssignedToUser(
			WorkflowTask workflowTask, long companyId, long groupId,
			long ownerId, long userId)
		throws Exception {

		Role ownerRole = RoleLocalServiceUtil.getRole(
			companyId, RoleConstants.OWNER);

		if (workflowTask.isAssignedToSingleUser()) {
			if (workflowTask.getAssigneeUserId() == userId) {
				return true;
			}

			return false;
		}

		for (WorkflowTaskAssignee workflowTaskAssignee :
				workflowTask.getWorkflowTaskAssignees()) {

			String assigneeClassName =
				workflowTaskAssignee.getAssigneeClassName();

			if (assigneeClassName.equals(Role.class.getName())) {
				if (RoleLocalServiceUtil.hasUserRole(
						userId, workflowTaskAssignee.getAssigneeClassPK()) ||
					hasInheritedRole(
						userId, groupId,
						workflowTaskAssignee.getAssigneeClassPK())) {

					return true;
				}
				else if ((userId == ownerId) &&
						 (workflowTaskAssignee.getAssigneeClassPK() ==
							ownerRole.getRoleId())) {

					return true;
				}
			}
			else if (assigneeClassName.equals(User.class.getName())) {
				if (userId == workflowTaskAssignee.getAssigneeClassPK()) {
					return true;
				}
			}
		}

		return false;
	}

	public static void persistEVPKaleoForkInstance(
			long classPK, int status, int type, ServiceContext serviceContext,
			Map<String, Serializable> workflowContext)
		throws Exception {

		List<EVPKaleoForkInstance> evpKaleoForkInstances =
			getEVPKaleoForkInstances(classPK, type);

		if (evpKaleoForkInstances.isEmpty()) {
			EVPKaleoForkInstanceLocalServiceUtil.addEVPKaleoForkInstance(
				status, type, workflowContext, serviceContext);
		}
		else {
			EVPKaleoForkInstance evpKaleoForkInstance =
				evpKaleoForkInstances.get(0);

			evpKaleoForkInstance.setType(type);
			evpKaleoForkInstance.setStatus(status);

			EVPKaleoForkInstanceLocalServiceUtil.updateEVPKaleoForkInstance(
				evpKaleoForkInstance);
		}
	}

	public static void startWorkflowInstance(
			long companyId, long groupId, long userId, String className,
			long classPK, Object model, ServiceContext serviceContext,
			Map<String, Serializable> workflowContext)
		throws Exception {

		if (serviceContext.getWorkflowAction() !=
				WorkflowConstants.ACTION_PUBLISH) {

			return;
		}

		WorkflowHandler workflowHandler =
			WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

		if (workflowHandler == null) {
			if (WorkflowThreadLocal.isEnabled()) {
				throw new Exception(
					"No workflow handler found for " + className);
			}

			return;
		}

		workflowContext = new HashMap<String, Serializable>(workflowContext);

		workflowContext.put(
			WorkflowConstants.CONTEXT_COMPANY_ID, String.valueOf(companyId));
		workflowContext.put(
			WorkflowConstants.CONTEXT_GROUP_ID, String.valueOf(groupId));
		workflowContext.put(
			WorkflowConstants.CONTEXT_USER_ID, String.valueOf(userId));
		workflowContext.put(
			WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME, className);
		workflowContext.put(
			WorkflowConstants.CONTEXT_ENTRY_CLASS_PK, String.valueOf(classPK));
		workflowContext.put(
			WorkflowConstants.CONTEXT_ENTRY_TYPE,
			workflowHandler.getType(LocaleUtil.getDefault()));
		workflowContext.put(
			WorkflowConstants.CONTEXT_SERVICE_CONTEXT, serviceContext);
		workflowContext.put(
			WorkflowConstants.CONTEXT_TASK_COMMENTS,
			GetterUtil.getString(serviceContext.getAttribute("comments")));

		workflowHandler.startWorkflowInstance(
			companyId, groupId, userId, classPK, model, workflowContext);
	}

	protected static List<EVPKaleoForkInstance> getEVPKaleoForkInstances(
			long classPK, int type)
		throws Exception {

		AlloyServiceInvoker evpKaleoForkInstanceAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPKaleoForkInstance.class.getName());

		return evpKaleoForkInstanceAlloyServiceInvoker.executeDynamicQuery(
			new Object[] {"classPK", classPK, "type", type});
	}

	protected static boolean hasInheritedRole(
			long userId, long groupId, long roleId)
		throws Exception {

		Set<Long> organizationGroupIds =
			EVPDivisionUtil.getOrganizationGroupIds(groupId);

		for (long organizationGroupId : organizationGroupIds) {
			if (UserGroupRoleLocalServiceUtil.hasUserGroupRole(
					userId, organizationGroupId, roleId)) {

				return true;
			}
		}

		return false;
	}

	private static Log _log = LogFactoryUtil.getLog(EVPWorkflowUtil.class);

}
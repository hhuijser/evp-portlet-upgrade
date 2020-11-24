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

import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.service.EVPGrantRequestLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.BaseWorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.security.permission.ResourceActionsUtil;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.io.Serializable;

import java.util.Locale;
import java.util.Map;

/**
 * @author Val Nagy
 */
public class EVPGrantRequestWorkflowHandler extends BaseWorkflowHandler {

	@Override
	public String getClassName() {
		return EVPGrantRequest.class.getName();
	}

	public String getTitle(long evpGrantRequestId, Locale locale) {
		return String.valueOf(evpGrantRequestId);
	}

	public String getType(Locale locale) {
		return ResourceActionsUtil.getModelResource(locale, getClassName());
	}

	@Override
	public Object updateStatus(
			int status, Map<String, Serializable> workflowContext)
		throws PortalException, SystemException {

		long evpGrantRequestId = GetterUtil.getLong(
			workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

		EVPGrantRequest evpGrantRequest =
			EVPGrantRequestLocalServiceUtil.getEVPGrantRequest(
				evpGrantRequestId);

		updateOwnerPermissions(
			evpGrantRequest.getCompanyId(), evpGrantRequest.getUserId(),
			evpGrantRequestId, status);

		evpGrantRequest.setStatus(status);

		ServiceContext serviceContext =
			(ServiceContext)workflowContext.get(
				WorkflowConstants.CONTEXT_SERVICE_CONTEXT);

		User user = UserLocalServiceUtil.getUser(serviceContext.getUserId());

		evpGrantRequest.setStatusByUserId(user.getUserId());
		evpGrantRequest.setStatusByUserName(user.getFullName());

		evpGrantRequest.setStatusDate(serviceContext.getModifiedDate());

		return EVPGrantRequestLocalServiceUtil.updateEVPGrantRequest(
			evpGrantRequest);
	}

	protected void updateOwnerPermissions(
			long companyId, long ownerId, long classPK, int status)
		throws PortalException, SystemException {

		Role ownerRole = RoleLocalServiceUtil.getRole(
			companyId, RoleConstants.OWNER);

		String[] actionIds;

		if (status == _GRANT_STATUS_MORE_INFO_FROM_USER) {
			actionIds = new String[] {
				"EDIT", "SET_OWN_STATUS", "UPDATE", "VIEW"};
		}
		else {
			actionIds = new String[] {"VIEW"};
		}

		ResourcePermissionLocalServiceUtil.setOwnerResourcePermissions(
			companyId, getClassName(), ResourceConstants.SCOPE_INDIVIDUAL,
			String.valueOf(classPK), ownerRole.getRoleId(), ownerId, actionIds);
	}

	private static final int _GRANT_STATUS_MORE_INFO_FROM_USER = 103;

}
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

package com.liferay.evp.hook.service.impl;

import com.liferay.evp.util.EVPRoleConstants;
import com.liferay.evp.util.PortletPropsValues;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalService;
import com.liferay.portal.service.UserLocalServiceWrapper;

/**
 * @author Ethan Bustad
 */
public class EVPUserLocalServiceImpl extends UserLocalServiceWrapper {

	public EVPUserLocalServiceImpl(UserLocalService userLocalService) {
		super(userLocalService);
	}

	@Override
	public void addDefaultRoles(long userId)
		throws PortalException, SystemException {

		super.addDefaultRoles(userId);

		User user = getUser(userId);

		String[] emailAddressElements = StringUtil.split(
			user.getEmailAddress(), StringPool.AT);

		if (emailAddressElements.length <= 1) {
			return;
		}

		String emailDomain = emailAddressElements[1];

		String autoEmployeeEmailDomain =
			PortletPropsValues.AUTO_EMPLOYEE_EMAIL_DOMAIN;

		if (!StringUtil.equalsIgnoreCase(
				emailDomain, autoEmployeeEmailDomain)) {

			return;
		}

		Role employeeRole = RoleLocalServiceUtil.getRole(
			user.getCompanyId(), EVPRoleConstants.ROLE_NAME_EMPLOYEE);

		RoleLocalServiceUtil.addUserRole(
			user.getUserId(), employeeRole.getRoleId());
	}

	@Override
	public void unsetOrganizationUsers(
			long organizationId, final long[] userIds)
		throws PortalException, SystemException {

		super.unsetOrganizationUsers(organizationId, userIds);

		for (int i = 0; i < _POLL_INDEX_MAX_COUNT; i++) {
			if (getOrganizationUsersCount(
					organizationId, WorkflowConstants.STATUS_APPROVED) <= 0) {

				return;
			}

			try {
				Thread.sleep(_POLL_INDEX_WAIT_INTERVAL);
			}
			catch (Exception e) {
				throw new SystemException(e);
			}
		}
	}

	private static final long _POLL_INDEX_MAX_COUNT = 4;

	private static final long _POLL_INDEX_WAIT_INTERVAL = 250;

}
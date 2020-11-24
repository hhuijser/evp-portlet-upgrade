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

package com.liferay.evp.service.impl;

import com.liferay.evp.model.EVPKaleoForkInstance;
import com.liferay.evp.service.base.EVPKaleoForkInstanceLocalServiceBaseImpl;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.service.ServiceContext;

import java.io.Serializable;

import java.util.Date;
import java.util.Map;

/**
 * @author Val Nagy
 */
public class EVPKaleoForkInstanceLocalServiceImpl
	extends EVPKaleoForkInstanceLocalServiceBaseImpl {

	public EVPKaleoForkInstance addEVPKaleoForkInstance(
			int status, int type, Map<String, Serializable> workflowContext,
			ServiceContext serviceContext)
		throws PortalException, SystemException {

		long evpKaleoForkInstanceId = counterLocalService.increment();

		EVPKaleoForkInstance evpKaleoForkInstance =
			evpKaleoForkInstancePersistence.create(evpKaleoForkInstanceId);

		User user = userPersistence.findByPrimaryKey(
			serviceContext.getUserId());

		evpKaleoForkInstance.setCompanyId(user.getCompanyId());
		evpKaleoForkInstance.setUserId(user.getUserId());
		evpKaleoForkInstance.setUserName(user.getFullName());

		Date date = new Date();

		evpKaleoForkInstance.setCreateDate(date);
		evpKaleoForkInstance.setModifiedDate(date);

		String className = GetterUtil.getString(
			workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME));

		evpKaleoForkInstance.setClassName(className);

		long classPK = GetterUtil.getLong(
			workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

		evpKaleoForkInstance.setClassPK(classPK);

		evpKaleoForkInstance.setType(type);
		evpKaleoForkInstance.setStatus(status);

		evpKaleoForkInstancePersistence.update(evpKaleoForkInstance);

		return evpKaleoForkInstance;
	}

}
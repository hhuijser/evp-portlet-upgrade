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

import com.liferay.evp.model.EVPEmployee;
import com.liferay.evp.service.base.EVPEmployeeLocalServiceBaseImpl;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;

import java.util.Date;

/**
 * @author Val Nagy
 */
public class EVPEmployeeLocalServiceImpl
	extends EVPEmployeeLocalServiceBaseImpl {

	public EVPEmployee addEVPEmployee(
			long userId, long employeeUserId, long managerUserId,
			long subsidiaryEVPDivisionId, int employmentType, Date hireDate)
		throws PortalException, SystemException {

		long evpEmployeeId = counterLocalService.increment();

		EVPEmployee evpEmployee = evpEmployeePersistence.create(evpEmployeeId);

		User user = userPersistence.findByPrimaryKey(userId);

		evpEmployee.setCompanyId(user.getCompanyId());
		evpEmployee.setUserId(user.getUserId());
		evpEmployee.setUserName(user.getFullName());

		Date date = new Date();

		evpEmployee.setCreateDate(date);
		evpEmployee.setModifiedDate(date);

		evpEmployee.setEmployeeUserId(employeeUserId);
		evpEmployee.setManagerUserId(managerUserId);
		evpEmployee.setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
		evpEmployee.setEmploymentType(employmentType);
		evpEmployee.setHireDate(hireDate);

		evpEmployeePersistence.update(evpEmployee);

		return evpEmployee;
	}

	public EVPEmployee fetchEVPEmployeeByEmployeeUserId(long employeeUserId)
		throws SystemException {

		return evpEmployeePersistence.fetchByEmployeeUserId(employeeUserId);
	}

	public EVPEmployee getEVPEmployeeByEmployeeUserId(long employeeUserId)
		throws PortalException, SystemException {

		return evpEmployeePersistence.findByEmployeeUserId(employeeUserId);
	}

}
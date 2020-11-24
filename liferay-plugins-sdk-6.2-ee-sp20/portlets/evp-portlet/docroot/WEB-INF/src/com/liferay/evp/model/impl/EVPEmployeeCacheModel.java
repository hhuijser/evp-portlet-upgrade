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

package com.liferay.evp.model.impl;

import com.liferay.evp.model.EVPEmployee;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPEmployee in entity cache.
 *
 * @author Val Nagy
 * @see EVPEmployee
 * @generated
 */
public class EVPEmployeeCacheModel implements CacheModel<EVPEmployee>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(23);

		sb.append("{evpEmployeeId=");
		sb.append(evpEmployeeId);
		sb.append(", companyId=");
		sb.append(companyId);
		sb.append(", userId=");
		sb.append(userId);
		sb.append(", userName=");
		sb.append(userName);
		sb.append(", createDate=");
		sb.append(createDate);
		sb.append(", modifiedDate=");
		sb.append(modifiedDate);
		sb.append(", employeeUserId=");
		sb.append(employeeUserId);
		sb.append(", managerUserId=");
		sb.append(managerUserId);
		sb.append(", subsidiaryEVPDivisionId=");
		sb.append(subsidiaryEVPDivisionId);
		sb.append(", employmentType=");
		sb.append(employmentType);
		sb.append(", hireDate=");
		sb.append(hireDate);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPEmployee toEntityModel() {
		EVPEmployeeImpl evpEmployeeImpl = new EVPEmployeeImpl();

		evpEmployeeImpl.setEvpEmployeeId(evpEmployeeId);
		evpEmployeeImpl.setCompanyId(companyId);
		evpEmployeeImpl.setUserId(userId);

		if (userName == null) {
			evpEmployeeImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpEmployeeImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpEmployeeImpl.setCreateDate(null);
		}
		else {
			evpEmployeeImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpEmployeeImpl.setModifiedDate(null);
		}
		else {
			evpEmployeeImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpEmployeeImpl.setEmployeeUserId(employeeUserId);
		evpEmployeeImpl.setManagerUserId(managerUserId);
		evpEmployeeImpl.setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
		evpEmployeeImpl.setEmploymentType(employmentType);

		if (hireDate == Long.MIN_VALUE) {
			evpEmployeeImpl.setHireDate(null);
		}
		else {
			evpEmployeeImpl.setHireDate(new Date(hireDate));
		}

		evpEmployeeImpl.resetOriginalValues();

		return evpEmployeeImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpEmployeeId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		employeeUserId = objectInput.readLong();
		managerUserId = objectInput.readLong();
		subsidiaryEVPDivisionId = objectInput.readLong();
		employmentType = objectInput.readInt();
		hireDate = objectInput.readLong();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpEmployeeId);
		objectOutput.writeLong(companyId);
		objectOutput.writeLong(userId);

		if (userName == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(userName);
		}

		objectOutput.writeLong(createDate);
		objectOutput.writeLong(modifiedDate);
		objectOutput.writeLong(employeeUserId);
		objectOutput.writeLong(managerUserId);
		objectOutput.writeLong(subsidiaryEVPDivisionId);
		objectOutput.writeInt(employmentType);
		objectOutput.writeLong(hireDate);
	}

	public long evpEmployeeId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long employeeUserId;
	public long managerUserId;
	public long subsidiaryEVPDivisionId;
	public int employmentType;
	public long hireDate;
}
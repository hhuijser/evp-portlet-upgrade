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

import com.liferay.evp.model.EVPDivision;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPDivision in entity cache.
 *
 * @author Val Nagy
 * @see EVPDivision
 * @generated
 */
public class EVPDivisionCacheModel implements CacheModel<EVPDivision>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(21);

		sb.append("{evpDivisionId=");
		sb.append(evpDivisionId);
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
		sb.append(", organizationId=");
		sb.append(organizationId);
		sb.append(", parentEVPDivisionId=");
		sb.append(parentEVPDivisionId);
		sb.append(", abbreviation=");
		sb.append(abbreviation);
		sb.append(", type=");
		sb.append(type);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPDivision toEntityModel() {
		EVPDivisionImpl evpDivisionImpl = new EVPDivisionImpl();

		evpDivisionImpl.setEvpDivisionId(evpDivisionId);
		evpDivisionImpl.setCompanyId(companyId);
		evpDivisionImpl.setUserId(userId);

		if (userName == null) {
			evpDivisionImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpDivisionImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpDivisionImpl.setCreateDate(null);
		}
		else {
			evpDivisionImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpDivisionImpl.setModifiedDate(null);
		}
		else {
			evpDivisionImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpDivisionImpl.setOrganizationId(organizationId);
		evpDivisionImpl.setParentEVPDivisionId(parentEVPDivisionId);

		if (abbreviation == null) {
			evpDivisionImpl.setAbbreviation(StringPool.BLANK);
		}
		else {
			evpDivisionImpl.setAbbreviation(abbreviation);
		}

		evpDivisionImpl.setType(type);

		evpDivisionImpl.resetOriginalValues();

		return evpDivisionImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpDivisionId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		organizationId = objectInput.readLong();
		parentEVPDivisionId = objectInput.readLong();
		abbreviation = objectInput.readUTF();
		type = objectInput.readInt();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpDivisionId);
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
		objectOutput.writeLong(organizationId);
		objectOutput.writeLong(parentEVPDivisionId);

		if (abbreviation == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(abbreviation);
		}

		objectOutput.writeInt(type);
	}

	public long evpDivisionId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long organizationId;
	public long parentEVPDivisionId;
	public String abbreviation;
	public int type;
}
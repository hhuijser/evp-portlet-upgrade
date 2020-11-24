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

import com.liferay.evp.model.EVPRequestOrganization;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPRequestOrganization in entity cache.
 *
 * @author Val Nagy
 * @see EVPRequestOrganization
 * @generated
 */
public class EVPRequestOrganizationCacheModel implements CacheModel<EVPRequestOrganization>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(27);

		sb.append("{evpRequestOrganizationId=");
		sb.append(evpRequestOrganizationId);
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
		sb.append(", subsidiaryGroupId=");
		sb.append(subsidiaryGroupId);
		sb.append(", description=");
		sb.append(description);
		sb.append(", taxIdentificationNumber=");
		sb.append(taxIdentificationNumber);
		sb.append(", nonprofitType=");
		sb.append(nonprofitType);
		sb.append(", verified=");
		sb.append(verified);
		sb.append(", shared=");
		sb.append(shared);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPRequestOrganization toEntityModel() {
		EVPRequestOrganizationImpl evpRequestOrganizationImpl = new EVPRequestOrganizationImpl();

		evpRequestOrganizationImpl.setEvpRequestOrganizationId(evpRequestOrganizationId);
		evpRequestOrganizationImpl.setCompanyId(companyId);
		evpRequestOrganizationImpl.setUserId(userId);

		if (userName == null) {
			evpRequestOrganizationImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpRequestOrganizationImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpRequestOrganizationImpl.setCreateDate(null);
		}
		else {
			evpRequestOrganizationImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpRequestOrganizationImpl.setModifiedDate(null);
		}
		else {
			evpRequestOrganizationImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpRequestOrganizationImpl.setOrganizationId(organizationId);
		evpRequestOrganizationImpl.setSubsidiaryGroupId(subsidiaryGroupId);

		if (description == null) {
			evpRequestOrganizationImpl.setDescription(StringPool.BLANK);
		}
		else {
			evpRequestOrganizationImpl.setDescription(description);
		}

		if (taxIdentificationNumber == null) {
			evpRequestOrganizationImpl.setTaxIdentificationNumber(StringPool.BLANK);
		}
		else {
			evpRequestOrganizationImpl.setTaxIdentificationNumber(taxIdentificationNumber);
		}

		evpRequestOrganizationImpl.setNonprofitType(nonprofitType);
		evpRequestOrganizationImpl.setVerified(verified);
		evpRequestOrganizationImpl.setShared(shared);

		evpRequestOrganizationImpl.resetOriginalValues();

		return evpRequestOrganizationImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpRequestOrganizationId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		organizationId = objectInput.readLong();
		subsidiaryGroupId = objectInput.readLong();
		description = objectInput.readUTF();
		taxIdentificationNumber = objectInput.readUTF();
		nonprofitType = objectInput.readInt();
		verified = objectInput.readBoolean();
		shared = objectInput.readBoolean();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpRequestOrganizationId);
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
		objectOutput.writeLong(subsidiaryGroupId);

		if (description == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(description);
		}

		if (taxIdentificationNumber == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(taxIdentificationNumber);
		}

		objectOutput.writeInt(nonprofitType);
		objectOutput.writeBoolean(verified);
		objectOutput.writeBoolean(shared);
	}

	public long evpRequestOrganizationId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long organizationId;
	public long subsidiaryGroupId;
	public String description;
	public String taxIdentificationNumber;
	public int nonprofitType;
	public boolean verified;
	public boolean shared;
}
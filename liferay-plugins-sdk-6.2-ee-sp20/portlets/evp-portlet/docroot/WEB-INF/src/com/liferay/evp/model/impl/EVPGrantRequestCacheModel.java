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

import com.liferay.evp.model.EVPGrantRequest;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPGrantRequest in entity cache.
 *
 * @author Val Nagy
 * @see EVPGrantRequest
 * @generated
 */
public class EVPGrantRequestCacheModel implements CacheModel<EVPGrantRequest>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(51);

		sb.append("{evpGrantRequestId=");
		sb.append(evpGrantRequestId);
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
		sb.append(", contactEmailAddressId=");
		sb.append(contactEmailAddressId);
		sb.append(", contactPhoneId=");
		sb.append(contactPhoneId);
		sb.append(", contactUserId=");
		sb.append(contactUserId);
		sb.append(", evpRequestOrganizationId=");
		sb.append(evpRequestOrganizationId);
		sb.append(", parentEVPGrantRequestId=");
		sb.append(parentEVPGrantRequestId);
		sb.append(", requestOrganizationAddressId=");
		sb.append(requestOrganizationAddressId);
		sb.append(", requestOrganizationWebsiteId=");
		sb.append(requestOrganizationWebsiteId);
		sb.append(", subsidiaryGroupId=");
		sb.append(subsidiaryGroupId);
		sb.append(", description=");
		sb.append(description);
		sb.append(", employmentType=");
		sb.append(employmentType);
		sb.append(", employmentHoursPerWeek=");
		sb.append(employmentHoursPerWeek);
		sb.append(", purpose=");
		sb.append(purpose);
		sb.append(", purposeOther=");
		sb.append(purposeOther);
		sb.append(", behalfOf=");
		sb.append(behalfOf);
		sb.append(", behalfOfOther=");
		sb.append(behalfOfOther);
		sb.append(", status=");
		sb.append(status);
		sb.append(", statusByUserId=");
		sb.append(statusByUserId);
		sb.append(", statusByUserName=");
		sb.append(statusByUserName);
		sb.append(", statusDate=");
		sb.append(statusDate);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPGrantRequest toEntityModel() {
		EVPGrantRequestImpl evpGrantRequestImpl = new EVPGrantRequestImpl();

		evpGrantRequestImpl.setEvpGrantRequestId(evpGrantRequestId);
		evpGrantRequestImpl.setCompanyId(companyId);
		evpGrantRequestImpl.setUserId(userId);

		if (userName == null) {
			evpGrantRequestImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpGrantRequestImpl.setCreateDate(null);
		}
		else {
			evpGrantRequestImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpGrantRequestImpl.setModifiedDate(null);
		}
		else {
			evpGrantRequestImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpGrantRequestImpl.setContactEmailAddressId(contactEmailAddressId);
		evpGrantRequestImpl.setContactPhoneId(contactPhoneId);
		evpGrantRequestImpl.setContactUserId(contactUserId);
		evpGrantRequestImpl.setEvpRequestOrganizationId(evpRequestOrganizationId);
		evpGrantRequestImpl.setParentEVPGrantRequestId(parentEVPGrantRequestId);
		evpGrantRequestImpl.setRequestOrganizationAddressId(requestOrganizationAddressId);
		evpGrantRequestImpl.setRequestOrganizationWebsiteId(requestOrganizationWebsiteId);
		evpGrantRequestImpl.setSubsidiaryGroupId(subsidiaryGroupId);

		if (description == null) {
			evpGrantRequestImpl.setDescription(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setDescription(description);
		}

		evpGrantRequestImpl.setEmploymentType(employmentType);
		evpGrantRequestImpl.setEmploymentHoursPerWeek(employmentHoursPerWeek);

		if (purpose == null) {
			evpGrantRequestImpl.setPurpose(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setPurpose(purpose);
		}

		if (purposeOther == null) {
			evpGrantRequestImpl.setPurposeOther(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setPurposeOther(purposeOther);
		}

		if (behalfOf == null) {
			evpGrantRequestImpl.setBehalfOf(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setBehalfOf(behalfOf);
		}

		if (behalfOfOther == null) {
			evpGrantRequestImpl.setBehalfOfOther(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setBehalfOfOther(behalfOfOther);
		}

		evpGrantRequestImpl.setStatus(status);
		evpGrantRequestImpl.setStatusByUserId(statusByUserId);

		if (statusByUserName == null) {
			evpGrantRequestImpl.setStatusByUserName(StringPool.BLANK);
		}
		else {
			evpGrantRequestImpl.setStatusByUserName(statusByUserName);
		}

		if (statusDate == Long.MIN_VALUE) {
			evpGrantRequestImpl.setStatusDate(null);
		}
		else {
			evpGrantRequestImpl.setStatusDate(new Date(statusDate));
		}

		evpGrantRequestImpl.resetOriginalValues();

		return evpGrantRequestImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpGrantRequestId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		contactEmailAddressId = objectInput.readLong();
		contactPhoneId = objectInput.readLong();
		contactUserId = objectInput.readLong();
		evpRequestOrganizationId = objectInput.readLong();
		parentEVPGrantRequestId = objectInput.readLong();
		requestOrganizationAddressId = objectInput.readLong();
		requestOrganizationWebsiteId = objectInput.readLong();
		subsidiaryGroupId = objectInput.readLong();
		description = objectInput.readUTF();
		employmentType = objectInput.readInt();
		employmentHoursPerWeek = objectInput.readInt();
		purpose = objectInput.readUTF();
		purposeOther = objectInput.readUTF();
		behalfOf = objectInput.readUTF();
		behalfOfOther = objectInput.readUTF();
		status = objectInput.readInt();
		statusByUserId = objectInput.readLong();
		statusByUserName = objectInput.readUTF();
		statusDate = objectInput.readLong();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpGrantRequestId);
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
		objectOutput.writeLong(contactEmailAddressId);
		objectOutput.writeLong(contactPhoneId);
		objectOutput.writeLong(contactUserId);
		objectOutput.writeLong(evpRequestOrganizationId);
		objectOutput.writeLong(parentEVPGrantRequestId);
		objectOutput.writeLong(requestOrganizationAddressId);
		objectOutput.writeLong(requestOrganizationWebsiteId);
		objectOutput.writeLong(subsidiaryGroupId);

		if (description == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(description);
		}

		objectOutput.writeInt(employmentType);
		objectOutput.writeInt(employmentHoursPerWeek);

		if (purpose == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(purpose);
		}

		if (purposeOther == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(purposeOther);
		}

		if (behalfOf == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(behalfOf);
		}

		if (behalfOfOther == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(behalfOfOther);
		}

		objectOutput.writeInt(status);
		objectOutput.writeLong(statusByUserId);

		if (statusByUserName == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(statusByUserName);
		}

		objectOutput.writeLong(statusDate);
	}

	public long evpGrantRequestId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long contactEmailAddressId;
	public long contactPhoneId;
	public long contactUserId;
	public long evpRequestOrganizationId;
	public long parentEVPGrantRequestId;
	public long requestOrganizationAddressId;
	public long requestOrganizationWebsiteId;
	public long subsidiaryGroupId;
	public String description;
	public int employmentType;
	public int employmentHoursPerWeek;
	public String purpose;
	public String purposeOther;
	public String behalfOf;
	public String behalfOfOther;
	public int status;
	public long statusByUserId;
	public String statusByUserName;
	public long statusDate;
}
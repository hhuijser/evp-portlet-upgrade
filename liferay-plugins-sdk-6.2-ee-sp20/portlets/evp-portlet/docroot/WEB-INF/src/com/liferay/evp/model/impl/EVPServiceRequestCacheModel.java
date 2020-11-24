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

import com.liferay.evp.model.EVPServiceRequest;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPServiceRequest in entity cache.
 *
 * @author Val Nagy
 * @see EVPServiceRequest
 * @generated
 */
public class EVPServiceRequestCacheModel implements CacheModel<EVPServiceRequest>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(81);

		sb.append("{evpServiceRequestId=");
		sb.append(evpServiceRequestId);
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
		sb.append(", managerUserId=");
		sb.append(managerUserId);
		sb.append(", parentEVPServiceRequestId=");
		sb.append(parentEVPServiceRequestId);
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
		sb.append(", requestedStartDate=");
		sb.append(requestedStartDate);
		sb.append(", requestedEndDate=");
		sb.append(requestedEndDate);
		sb.append(", requestedTotalHours=");
		sb.append(requestedTotalHours);
		sb.append(", promoteTrip=");
		sb.append(promoteTrip);
		sb.append(", confirmedStartDate=");
		sb.append(confirmedStartDate);
		sb.append(", confirmedEndDate=");
		sb.append(confirmedEndDate);
		sb.append(", confirmedTotalHours=");
		sb.append(confirmedTotalHours);
		sb.append(", contactBenefit=");
		sb.append(contactBenefit);
		sb.append(", contactComments=");
		sb.append(contactComments);
		sb.append(", hash=");
		sb.append(hash);
		sb.append(", feedbackDescription=");
		sb.append(feedbackDescription);
		sb.append(", employeeBenefit=");
		sb.append(employeeBenefit);
		sb.append(", recipientBenefit=");
		sb.append(recipientBenefit);
		sb.append(", shareStory=");
		sb.append(shareStory);
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
	public EVPServiceRequest toEntityModel() {
		EVPServiceRequestImpl evpServiceRequestImpl = new EVPServiceRequestImpl();

		evpServiceRequestImpl.setEvpServiceRequestId(evpServiceRequestId);
		evpServiceRequestImpl.setCompanyId(companyId);
		evpServiceRequestImpl.setUserId(userId);

		if (userName == null) {
			evpServiceRequestImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setCreateDate(null);
		}
		else {
			evpServiceRequestImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setModifiedDate(null);
		}
		else {
			evpServiceRequestImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpServiceRequestImpl.setContactEmailAddressId(contactEmailAddressId);
		evpServiceRequestImpl.setContactPhoneId(contactPhoneId);
		evpServiceRequestImpl.setContactUserId(contactUserId);
		evpServiceRequestImpl.setEvpRequestOrganizationId(evpRequestOrganizationId);
		evpServiceRequestImpl.setManagerUserId(managerUserId);
		evpServiceRequestImpl.setParentEVPServiceRequestId(parentEVPServiceRequestId);
		evpServiceRequestImpl.setRequestOrganizationAddressId(requestOrganizationAddressId);
		evpServiceRequestImpl.setRequestOrganizationWebsiteId(requestOrganizationWebsiteId);
		evpServiceRequestImpl.setSubsidiaryGroupId(subsidiaryGroupId);

		if (description == null) {
			evpServiceRequestImpl.setDescription(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setDescription(description);
		}

		evpServiceRequestImpl.setEmploymentType(employmentType);
		evpServiceRequestImpl.setEmploymentHoursPerWeek(employmentHoursPerWeek);

		if (purpose == null) {
			evpServiceRequestImpl.setPurpose(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setPurpose(purpose);
		}

		if (purposeOther == null) {
			evpServiceRequestImpl.setPurposeOther(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setPurposeOther(purposeOther);
		}

		if (behalfOf == null) {
			evpServiceRequestImpl.setBehalfOf(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setBehalfOf(behalfOf);
		}

		if (behalfOfOther == null) {
			evpServiceRequestImpl.setBehalfOfOther(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setBehalfOfOther(behalfOfOther);
		}

		if (requestedStartDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setRequestedStartDate(null);
		}
		else {
			evpServiceRequestImpl.setRequestedStartDate(new Date(
					requestedStartDate));
		}

		if (requestedEndDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setRequestedEndDate(null);
		}
		else {
			evpServiceRequestImpl.setRequestedEndDate(new Date(requestedEndDate));
		}

		evpServiceRequestImpl.setRequestedTotalHours(requestedTotalHours);
		evpServiceRequestImpl.setPromoteTrip(promoteTrip);

		if (confirmedStartDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setConfirmedStartDate(null);
		}
		else {
			evpServiceRequestImpl.setConfirmedStartDate(new Date(
					confirmedStartDate));
		}

		if (confirmedEndDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setConfirmedEndDate(null);
		}
		else {
			evpServiceRequestImpl.setConfirmedEndDate(new Date(confirmedEndDate));
		}

		evpServiceRequestImpl.setConfirmedTotalHours(confirmedTotalHours);

		if (contactBenefit == null) {
			evpServiceRequestImpl.setContactBenefit(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setContactBenefit(contactBenefit);
		}

		if (contactComments == null) {
			evpServiceRequestImpl.setContactComments(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setContactComments(contactComments);
		}

		if (hash == null) {
			evpServiceRequestImpl.setHash(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setHash(hash);
		}

		if (feedbackDescription == null) {
			evpServiceRequestImpl.setFeedbackDescription(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setFeedbackDescription(feedbackDescription);
		}

		if (employeeBenefit == null) {
			evpServiceRequestImpl.setEmployeeBenefit(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setEmployeeBenefit(employeeBenefit);
		}

		if (recipientBenefit == null) {
			evpServiceRequestImpl.setRecipientBenefit(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setRecipientBenefit(recipientBenefit);
		}

		evpServiceRequestImpl.setShareStory(shareStory);
		evpServiceRequestImpl.setStatus(status);
		evpServiceRequestImpl.setStatusByUserId(statusByUserId);

		if (statusByUserName == null) {
			evpServiceRequestImpl.setStatusByUserName(StringPool.BLANK);
		}
		else {
			evpServiceRequestImpl.setStatusByUserName(statusByUserName);
		}

		if (statusDate == Long.MIN_VALUE) {
			evpServiceRequestImpl.setStatusDate(null);
		}
		else {
			evpServiceRequestImpl.setStatusDate(new Date(statusDate));
		}

		evpServiceRequestImpl.resetOriginalValues();

		return evpServiceRequestImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpServiceRequestId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		contactEmailAddressId = objectInput.readLong();
		contactPhoneId = objectInput.readLong();
		contactUserId = objectInput.readLong();
		evpRequestOrganizationId = objectInput.readLong();
		managerUserId = objectInput.readLong();
		parentEVPServiceRequestId = objectInput.readLong();
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
		requestedStartDate = objectInput.readLong();
		requestedEndDate = objectInput.readLong();
		requestedTotalHours = objectInput.readInt();
		promoteTrip = objectInput.readBoolean();
		confirmedStartDate = objectInput.readLong();
		confirmedEndDate = objectInput.readLong();
		confirmedTotalHours = objectInput.readInt();
		contactBenefit = objectInput.readUTF();
		contactComments = objectInput.readUTF();
		hash = objectInput.readUTF();
		feedbackDescription = objectInput.readUTF();
		employeeBenefit = objectInput.readUTF();
		recipientBenefit = objectInput.readUTF();
		shareStory = objectInput.readBoolean();
		status = objectInput.readInt();
		statusByUserId = objectInput.readLong();
		statusByUserName = objectInput.readUTF();
		statusDate = objectInput.readLong();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpServiceRequestId);
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
		objectOutput.writeLong(managerUserId);
		objectOutput.writeLong(parentEVPServiceRequestId);
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

		objectOutput.writeLong(requestedStartDate);
		objectOutput.writeLong(requestedEndDate);
		objectOutput.writeInt(requestedTotalHours);
		objectOutput.writeBoolean(promoteTrip);
		objectOutput.writeLong(confirmedStartDate);
		objectOutput.writeLong(confirmedEndDate);
		objectOutput.writeInt(confirmedTotalHours);

		if (contactBenefit == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(contactBenefit);
		}

		if (contactComments == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(contactComments);
		}

		if (hash == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(hash);
		}

		if (feedbackDescription == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(feedbackDescription);
		}

		if (employeeBenefit == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(employeeBenefit);
		}

		if (recipientBenefit == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(recipientBenefit);
		}

		objectOutput.writeBoolean(shareStory);
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

	public long evpServiceRequestId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long contactEmailAddressId;
	public long contactPhoneId;
	public long contactUserId;
	public long evpRequestOrganizationId;
	public long managerUserId;
	public long parentEVPServiceRequestId;
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
	public long requestedStartDate;
	public long requestedEndDate;
	public int requestedTotalHours;
	public boolean promoteTrip;
	public long confirmedStartDate;
	public long confirmedEndDate;
	public int confirmedTotalHours;
	public String contactBenefit;
	public String contactComments;
	public String hash;
	public String feedbackDescription;
	public String employeeBenefit;
	public String recipientBenefit;
	public boolean shareStory;
	public int status;
	public long statusByUserId;
	public String statusByUserName;
	public long statusDate;
}
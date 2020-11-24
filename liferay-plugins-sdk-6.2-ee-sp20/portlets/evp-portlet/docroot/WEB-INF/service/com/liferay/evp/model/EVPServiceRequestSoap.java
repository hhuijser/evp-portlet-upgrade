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

package com.liferay.evp.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * This class is used by SOAP remote services.
 *
 * @author Val Nagy
 * @generated
 */
public class EVPServiceRequestSoap implements Serializable {
	public static EVPServiceRequestSoap toSoapModel(EVPServiceRequest model) {
		EVPServiceRequestSoap soapModel = new EVPServiceRequestSoap();

		soapModel.setEvpServiceRequestId(model.getEvpServiceRequestId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setContactEmailAddressId(model.getContactEmailAddressId());
		soapModel.setContactPhoneId(model.getContactPhoneId());
		soapModel.setContactUserId(model.getContactUserId());
		soapModel.setEvpRequestOrganizationId(model.getEvpRequestOrganizationId());
		soapModel.setManagerUserId(model.getManagerUserId());
		soapModel.setParentEVPServiceRequestId(model.getParentEVPServiceRequestId());
		soapModel.setRequestOrganizationAddressId(model.getRequestOrganizationAddressId());
		soapModel.setRequestOrganizationWebsiteId(model.getRequestOrganizationWebsiteId());
		soapModel.setSubsidiaryGroupId(model.getSubsidiaryGroupId());
		soapModel.setDescription(model.getDescription());
		soapModel.setEmploymentType(model.getEmploymentType());
		soapModel.setEmploymentHoursPerWeek(model.getEmploymentHoursPerWeek());
		soapModel.setPurpose(model.getPurpose());
		soapModel.setPurposeOther(model.getPurposeOther());
		soapModel.setBehalfOf(model.getBehalfOf());
		soapModel.setBehalfOfOther(model.getBehalfOfOther());
		soapModel.setRequestedStartDate(model.getRequestedStartDate());
		soapModel.setRequestedEndDate(model.getRequestedEndDate());
		soapModel.setRequestedTotalHours(model.getRequestedTotalHours());
		soapModel.setPromoteTrip(model.getPromoteTrip());
		soapModel.setConfirmedStartDate(model.getConfirmedStartDate());
		soapModel.setConfirmedEndDate(model.getConfirmedEndDate());
		soapModel.setConfirmedTotalHours(model.getConfirmedTotalHours());
		soapModel.setContactBenefit(model.getContactBenefit());
		soapModel.setContactComments(model.getContactComments());
		soapModel.setHash(model.getHash());
		soapModel.setFeedbackDescription(model.getFeedbackDescription());
		soapModel.setEmployeeBenefit(model.getEmployeeBenefit());
		soapModel.setRecipientBenefit(model.getRecipientBenefit());
		soapModel.setShareStory(model.getShareStory());
		soapModel.setStatus(model.getStatus());
		soapModel.setStatusByUserId(model.getStatusByUserId());
		soapModel.setStatusByUserName(model.getStatusByUserName());
		soapModel.setStatusDate(model.getStatusDate());

		return soapModel;
	}

	public static EVPServiceRequestSoap[] toSoapModels(
		EVPServiceRequest[] models) {
		EVPServiceRequestSoap[] soapModels = new EVPServiceRequestSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPServiceRequestSoap[][] toSoapModels(
		EVPServiceRequest[][] models) {
		EVPServiceRequestSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPServiceRequestSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPServiceRequestSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPServiceRequestSoap[] toSoapModels(
		List<EVPServiceRequest> models) {
		List<EVPServiceRequestSoap> soapModels = new ArrayList<EVPServiceRequestSoap>(models.size());

		for (EVPServiceRequest model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPServiceRequestSoap[soapModels.size()]);
	}

	public EVPServiceRequestSoap() {
	}

	public long getPrimaryKey() {
		return _evpServiceRequestId;
	}

	public void setPrimaryKey(long pk) {
		setEvpServiceRequestId(pk);
	}

	public long getEvpServiceRequestId() {
		return _evpServiceRequestId;
	}

	public void setEvpServiceRequestId(long evpServiceRequestId) {
		_evpServiceRequestId = evpServiceRequestId;
	}

	public long getCompanyId() {
		return _companyId;
	}

	public void setCompanyId(long companyId) {
		_companyId = companyId;
	}

	public long getUserId() {
		return _userId;
	}

	public void setUserId(long userId) {
		_userId = userId;
	}

	public String getUserName() {
		return _userName;
	}

	public void setUserName(String userName) {
		_userName = userName;
	}

	public Date getCreateDate() {
		return _createDate;
	}

	public void setCreateDate(Date createDate) {
		_createDate = createDate;
	}

	public Date getModifiedDate() {
		return _modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		_modifiedDate = modifiedDate;
	}

	public long getContactEmailAddressId() {
		return _contactEmailAddressId;
	}

	public void setContactEmailAddressId(long contactEmailAddressId) {
		_contactEmailAddressId = contactEmailAddressId;
	}

	public long getContactPhoneId() {
		return _contactPhoneId;
	}

	public void setContactPhoneId(long contactPhoneId) {
		_contactPhoneId = contactPhoneId;
	}

	public long getContactUserId() {
		return _contactUserId;
	}

	public void setContactUserId(long contactUserId) {
		_contactUserId = contactUserId;
	}

	public long getEvpRequestOrganizationId() {
		return _evpRequestOrganizationId;
	}

	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpRequestOrganizationId = evpRequestOrganizationId;
	}

	public long getManagerUserId() {
		return _managerUserId;
	}

	public void setManagerUserId(long managerUserId) {
		_managerUserId = managerUserId;
	}

	public long getParentEVPServiceRequestId() {
		return _parentEVPServiceRequestId;
	}

	public void setParentEVPServiceRequestId(long parentEVPServiceRequestId) {
		_parentEVPServiceRequestId = parentEVPServiceRequestId;
	}

	public long getRequestOrganizationAddressId() {
		return _requestOrganizationAddressId;
	}

	public void setRequestOrganizationAddressId(
		long requestOrganizationAddressId) {
		_requestOrganizationAddressId = requestOrganizationAddressId;
	}

	public long getRequestOrganizationWebsiteId() {
		return _requestOrganizationWebsiteId;
	}

	public void setRequestOrganizationWebsiteId(
		long requestOrganizationWebsiteId) {
		_requestOrganizationWebsiteId = requestOrganizationWebsiteId;
	}

	public long getSubsidiaryGroupId() {
		return _subsidiaryGroupId;
	}

	public void setSubsidiaryGroupId(long subsidiaryGroupId) {
		_subsidiaryGroupId = subsidiaryGroupId;
	}

	public String getDescription() {
		return _description;
	}

	public void setDescription(String description) {
		_description = description;
	}

	public int getEmploymentType() {
		return _employmentType;
	}

	public void setEmploymentType(int employmentType) {
		_employmentType = employmentType;
	}

	public int getEmploymentHoursPerWeek() {
		return _employmentHoursPerWeek;
	}

	public void setEmploymentHoursPerWeek(int employmentHoursPerWeek) {
		_employmentHoursPerWeek = employmentHoursPerWeek;
	}

	public String getPurpose() {
		return _purpose;
	}

	public void setPurpose(String purpose) {
		_purpose = purpose;
	}

	public String getPurposeOther() {
		return _purposeOther;
	}

	public void setPurposeOther(String purposeOther) {
		_purposeOther = purposeOther;
	}

	public String getBehalfOf() {
		return _behalfOf;
	}

	public void setBehalfOf(String behalfOf) {
		_behalfOf = behalfOf;
	}

	public String getBehalfOfOther() {
		return _behalfOfOther;
	}

	public void setBehalfOfOther(String behalfOfOther) {
		_behalfOfOther = behalfOfOther;
	}

	public Date getRequestedStartDate() {
		return _requestedStartDate;
	}

	public void setRequestedStartDate(Date requestedStartDate) {
		_requestedStartDate = requestedStartDate;
	}

	public Date getRequestedEndDate() {
		return _requestedEndDate;
	}

	public void setRequestedEndDate(Date requestedEndDate) {
		_requestedEndDate = requestedEndDate;
	}

	public int getRequestedTotalHours() {
		return _requestedTotalHours;
	}

	public void setRequestedTotalHours(int requestedTotalHours) {
		_requestedTotalHours = requestedTotalHours;
	}

	public boolean getPromoteTrip() {
		return _promoteTrip;
	}

	public boolean isPromoteTrip() {
		return _promoteTrip;
	}

	public void setPromoteTrip(boolean promoteTrip) {
		_promoteTrip = promoteTrip;
	}

	public Date getConfirmedStartDate() {
		return _confirmedStartDate;
	}

	public void setConfirmedStartDate(Date confirmedStartDate) {
		_confirmedStartDate = confirmedStartDate;
	}

	public Date getConfirmedEndDate() {
		return _confirmedEndDate;
	}

	public void setConfirmedEndDate(Date confirmedEndDate) {
		_confirmedEndDate = confirmedEndDate;
	}

	public int getConfirmedTotalHours() {
		return _confirmedTotalHours;
	}

	public void setConfirmedTotalHours(int confirmedTotalHours) {
		_confirmedTotalHours = confirmedTotalHours;
	}

	public String getContactBenefit() {
		return _contactBenefit;
	}

	public void setContactBenefit(String contactBenefit) {
		_contactBenefit = contactBenefit;
	}

	public String getContactComments() {
		return _contactComments;
	}

	public void setContactComments(String contactComments) {
		_contactComments = contactComments;
	}

	public String getHash() {
		return _hash;
	}

	public void setHash(String hash) {
		_hash = hash;
	}

	public String getFeedbackDescription() {
		return _feedbackDescription;
	}

	public void setFeedbackDescription(String feedbackDescription) {
		_feedbackDescription = feedbackDescription;
	}

	public String getEmployeeBenefit() {
		return _employeeBenefit;
	}

	public void setEmployeeBenefit(String employeeBenefit) {
		_employeeBenefit = employeeBenefit;
	}

	public String getRecipientBenefit() {
		return _recipientBenefit;
	}

	public void setRecipientBenefit(String recipientBenefit) {
		_recipientBenefit = recipientBenefit;
	}

	public boolean getShareStory() {
		return _shareStory;
	}

	public boolean isShareStory() {
		return _shareStory;
	}

	public void setShareStory(boolean shareStory) {
		_shareStory = shareStory;
	}

	public int getStatus() {
		return _status;
	}

	public void setStatus(int status) {
		_status = status;
	}

	public long getStatusByUserId() {
		return _statusByUserId;
	}

	public void setStatusByUserId(long statusByUserId) {
		_statusByUserId = statusByUserId;
	}

	public String getStatusByUserName() {
		return _statusByUserName;
	}

	public void setStatusByUserName(String statusByUserName) {
		_statusByUserName = statusByUserName;
	}

	public Date getStatusDate() {
		return _statusDate;
	}

	public void setStatusDate(Date statusDate) {
		_statusDate = statusDate;
	}

	private long _evpServiceRequestId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _contactEmailAddressId;
	private long _contactPhoneId;
	private long _contactUserId;
	private long _evpRequestOrganizationId;
	private long _managerUserId;
	private long _parentEVPServiceRequestId;
	private long _requestOrganizationAddressId;
	private long _requestOrganizationWebsiteId;
	private long _subsidiaryGroupId;
	private String _description;
	private int _employmentType;
	private int _employmentHoursPerWeek;
	private String _purpose;
	private String _purposeOther;
	private String _behalfOf;
	private String _behalfOfOther;
	private Date _requestedStartDate;
	private Date _requestedEndDate;
	private int _requestedTotalHours;
	private boolean _promoteTrip;
	private Date _confirmedStartDate;
	private Date _confirmedEndDate;
	private int _confirmedTotalHours;
	private String _contactBenefit;
	private String _contactComments;
	private String _hash;
	private String _feedbackDescription;
	private String _employeeBenefit;
	private String _recipientBenefit;
	private boolean _shareStory;
	private int _status;
	private long _statusByUserId;
	private String _statusByUserName;
	private Date _statusDate;
}
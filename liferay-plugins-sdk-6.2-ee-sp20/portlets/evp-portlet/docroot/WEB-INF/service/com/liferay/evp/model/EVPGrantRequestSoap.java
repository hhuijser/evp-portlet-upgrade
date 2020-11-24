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
public class EVPGrantRequestSoap implements Serializable {
	public static EVPGrantRequestSoap toSoapModel(EVPGrantRequest model) {
		EVPGrantRequestSoap soapModel = new EVPGrantRequestSoap();

		soapModel.setEvpGrantRequestId(model.getEvpGrantRequestId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setContactEmailAddressId(model.getContactEmailAddressId());
		soapModel.setContactPhoneId(model.getContactPhoneId());
		soapModel.setContactUserId(model.getContactUserId());
		soapModel.setEvpRequestOrganizationId(model.getEvpRequestOrganizationId());
		soapModel.setParentEVPGrantRequestId(model.getParentEVPGrantRequestId());
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
		soapModel.setStatus(model.getStatus());
		soapModel.setStatusByUserId(model.getStatusByUserId());
		soapModel.setStatusByUserName(model.getStatusByUserName());
		soapModel.setStatusDate(model.getStatusDate());

		return soapModel;
	}

	public static EVPGrantRequestSoap[] toSoapModels(EVPGrantRequest[] models) {
		EVPGrantRequestSoap[] soapModels = new EVPGrantRequestSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPGrantRequestSoap[][] toSoapModels(
		EVPGrantRequest[][] models) {
		EVPGrantRequestSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPGrantRequestSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPGrantRequestSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPGrantRequestSoap[] toSoapModels(
		List<EVPGrantRequest> models) {
		List<EVPGrantRequestSoap> soapModels = new ArrayList<EVPGrantRequestSoap>(models.size());

		for (EVPGrantRequest model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPGrantRequestSoap[soapModels.size()]);
	}

	public EVPGrantRequestSoap() {
	}

	public long getPrimaryKey() {
		return _evpGrantRequestId;
	}

	public void setPrimaryKey(long pk) {
		setEvpGrantRequestId(pk);
	}

	public long getEvpGrantRequestId() {
		return _evpGrantRequestId;
	}

	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantRequestId = evpGrantRequestId;
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

	public long getParentEVPGrantRequestId() {
		return _parentEVPGrantRequestId;
	}

	public void setParentEVPGrantRequestId(long parentEVPGrantRequestId) {
		_parentEVPGrantRequestId = parentEVPGrantRequestId;
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

	private long _evpGrantRequestId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _contactEmailAddressId;
	private long _contactPhoneId;
	private long _contactUserId;
	private long _evpRequestOrganizationId;
	private long _parentEVPGrantRequestId;
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
	private int _status;
	private long _statusByUserId;
	private String _statusByUserName;
	private Date _statusDate;
}
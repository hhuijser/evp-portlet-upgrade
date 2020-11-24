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
public class EVPRequestOrganizationSoap implements Serializable {
	public static EVPRequestOrganizationSoap toSoapModel(
		EVPRequestOrganization model) {
		EVPRequestOrganizationSoap soapModel = new EVPRequestOrganizationSoap();

		soapModel.setEvpRequestOrganizationId(model.getEvpRequestOrganizationId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setOrganizationId(model.getOrganizationId());
		soapModel.setSubsidiaryGroupId(model.getSubsidiaryGroupId());
		soapModel.setDescription(model.getDescription());
		soapModel.setTaxIdentificationNumber(model.getTaxIdentificationNumber());
		soapModel.setNonprofitType(model.getNonprofitType());
		soapModel.setVerified(model.getVerified());
		soapModel.setShared(model.getShared());

		return soapModel;
	}

	public static EVPRequestOrganizationSoap[] toSoapModels(
		EVPRequestOrganization[] models) {
		EVPRequestOrganizationSoap[] soapModels = new EVPRequestOrganizationSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPRequestOrganizationSoap[][] toSoapModels(
		EVPRequestOrganization[][] models) {
		EVPRequestOrganizationSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPRequestOrganizationSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPRequestOrganizationSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPRequestOrganizationSoap[] toSoapModels(
		List<EVPRequestOrganization> models) {
		List<EVPRequestOrganizationSoap> soapModels = new ArrayList<EVPRequestOrganizationSoap>(models.size());

		for (EVPRequestOrganization model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPRequestOrganizationSoap[soapModels.size()]);
	}

	public EVPRequestOrganizationSoap() {
	}

	public long getPrimaryKey() {
		return _evpRequestOrganizationId;
	}

	public void setPrimaryKey(long pk) {
		setEvpRequestOrganizationId(pk);
	}

	public long getEvpRequestOrganizationId() {
		return _evpRequestOrganizationId;
	}

	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpRequestOrganizationId = evpRequestOrganizationId;
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

	public long getOrganizationId() {
		return _organizationId;
	}

	public void setOrganizationId(long organizationId) {
		_organizationId = organizationId;
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

	public String getTaxIdentificationNumber() {
		return _taxIdentificationNumber;
	}

	public void setTaxIdentificationNumber(String taxIdentificationNumber) {
		_taxIdentificationNumber = taxIdentificationNumber;
	}

	public int getNonprofitType() {
		return _nonprofitType;
	}

	public void setNonprofitType(int nonprofitType) {
		_nonprofitType = nonprofitType;
	}

	public boolean getVerified() {
		return _verified;
	}

	public boolean isVerified() {
		return _verified;
	}

	public void setVerified(boolean verified) {
		_verified = verified;
	}

	public boolean getShared() {
		return _shared;
	}

	public boolean isShared() {
		return _shared;
	}

	public void setShared(boolean shared) {
		_shared = shared;
	}

	private long _evpRequestOrganizationId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _organizationId;
	private long _subsidiaryGroupId;
	private String _description;
	private String _taxIdentificationNumber;
	private int _nonprofitType;
	private boolean _verified;
	private boolean _shared;
}
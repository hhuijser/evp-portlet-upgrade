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
public class EVPDivisionSoap implements Serializable {
	public static EVPDivisionSoap toSoapModel(EVPDivision model) {
		EVPDivisionSoap soapModel = new EVPDivisionSoap();

		soapModel.setEvpDivisionId(model.getEvpDivisionId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setOrganizationId(model.getOrganizationId());
		soapModel.setParentEVPDivisionId(model.getParentEVPDivisionId());
		soapModel.setAbbreviation(model.getAbbreviation());
		soapModel.setType(model.getType());

		return soapModel;
	}

	public static EVPDivisionSoap[] toSoapModels(EVPDivision[] models) {
		EVPDivisionSoap[] soapModels = new EVPDivisionSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPDivisionSoap[][] toSoapModels(EVPDivision[][] models) {
		EVPDivisionSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPDivisionSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPDivisionSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPDivisionSoap[] toSoapModels(List<EVPDivision> models) {
		List<EVPDivisionSoap> soapModels = new ArrayList<EVPDivisionSoap>(models.size());

		for (EVPDivision model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPDivisionSoap[soapModels.size()]);
	}

	public EVPDivisionSoap() {
	}

	public long getPrimaryKey() {
		return _evpDivisionId;
	}

	public void setPrimaryKey(long pk) {
		setEvpDivisionId(pk);
	}

	public long getEvpDivisionId() {
		return _evpDivisionId;
	}

	public void setEvpDivisionId(long evpDivisionId) {
		_evpDivisionId = evpDivisionId;
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

	public long getParentEVPDivisionId() {
		return _parentEVPDivisionId;
	}

	public void setParentEVPDivisionId(long parentEVPDivisionId) {
		_parentEVPDivisionId = parentEVPDivisionId;
	}

	public String getAbbreviation() {
		return _abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		_abbreviation = abbreviation;
	}

	public int getType() {
		return _type;
	}

	public void setType(int type) {
		_type = type;
	}

	private long _evpDivisionId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _organizationId;
	private long _parentEVPDivisionId;
	private String _abbreviation;
	private int _type;
}
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
public class EVPEmployeeSoap implements Serializable {
	public static EVPEmployeeSoap toSoapModel(EVPEmployee model) {
		EVPEmployeeSoap soapModel = new EVPEmployeeSoap();

		soapModel.setEvpEmployeeId(model.getEvpEmployeeId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setEmployeeUserId(model.getEmployeeUserId());
		soapModel.setManagerUserId(model.getManagerUserId());
		soapModel.setSubsidiaryEVPDivisionId(model.getSubsidiaryEVPDivisionId());
		soapModel.setEmploymentType(model.getEmploymentType());
		soapModel.setHireDate(model.getHireDate());

		return soapModel;
	}

	public static EVPEmployeeSoap[] toSoapModels(EVPEmployee[] models) {
		EVPEmployeeSoap[] soapModels = new EVPEmployeeSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPEmployeeSoap[][] toSoapModels(EVPEmployee[][] models) {
		EVPEmployeeSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPEmployeeSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPEmployeeSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPEmployeeSoap[] toSoapModels(List<EVPEmployee> models) {
		List<EVPEmployeeSoap> soapModels = new ArrayList<EVPEmployeeSoap>(models.size());

		for (EVPEmployee model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPEmployeeSoap[soapModels.size()]);
	}

	public EVPEmployeeSoap() {
	}

	public long getPrimaryKey() {
		return _evpEmployeeId;
	}

	public void setPrimaryKey(long pk) {
		setEvpEmployeeId(pk);
	}

	public long getEvpEmployeeId() {
		return _evpEmployeeId;
	}

	public void setEvpEmployeeId(long evpEmployeeId) {
		_evpEmployeeId = evpEmployeeId;
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

	public long getEmployeeUserId() {
		return _employeeUserId;
	}

	public void setEmployeeUserId(long employeeUserId) {
		_employeeUserId = employeeUserId;
	}

	public long getManagerUserId() {
		return _managerUserId;
	}

	public void setManagerUserId(long managerUserId) {
		_managerUserId = managerUserId;
	}

	public long getSubsidiaryEVPDivisionId() {
		return _subsidiaryEVPDivisionId;
	}

	public void setSubsidiaryEVPDivisionId(long subsidiaryEVPDivisionId) {
		_subsidiaryEVPDivisionId = subsidiaryEVPDivisionId;
	}

	public int getEmploymentType() {
		return _employmentType;
	}

	public void setEmploymentType(int employmentType) {
		_employmentType = employmentType;
	}

	public Date getHireDate() {
		return _hireDate;
	}

	public void setHireDate(Date hireDate) {
		_hireDate = hireDate;
	}

	private long _evpEmployeeId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _employeeUserId;
	private long _managerUserId;
	private long _subsidiaryEVPDivisionId;
	private int _employmentType;
	private Date _hireDate;
}
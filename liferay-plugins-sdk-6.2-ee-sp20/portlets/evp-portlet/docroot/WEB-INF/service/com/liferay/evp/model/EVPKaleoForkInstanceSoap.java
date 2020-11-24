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
public class EVPKaleoForkInstanceSoap implements Serializable {
	public static EVPKaleoForkInstanceSoap toSoapModel(
		EVPKaleoForkInstance model) {
		EVPKaleoForkInstanceSoap soapModel = new EVPKaleoForkInstanceSoap();

		soapModel.setEvpKaleoForkInstanceId(model.getEvpKaleoForkInstanceId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setClassNameId(model.getClassNameId());
		soapModel.setClassPK(model.getClassPK());
		soapModel.setType(model.getType());
		soapModel.setStatus(model.getStatus());

		return soapModel;
	}

	public static EVPKaleoForkInstanceSoap[] toSoapModels(
		EVPKaleoForkInstance[] models) {
		EVPKaleoForkInstanceSoap[] soapModels = new EVPKaleoForkInstanceSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPKaleoForkInstanceSoap[][] toSoapModels(
		EVPKaleoForkInstance[][] models) {
		EVPKaleoForkInstanceSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPKaleoForkInstanceSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPKaleoForkInstanceSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPKaleoForkInstanceSoap[] toSoapModels(
		List<EVPKaleoForkInstance> models) {
		List<EVPKaleoForkInstanceSoap> soapModels = new ArrayList<EVPKaleoForkInstanceSoap>(models.size());

		for (EVPKaleoForkInstance model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPKaleoForkInstanceSoap[soapModels.size()]);
	}

	public EVPKaleoForkInstanceSoap() {
	}

	public long getPrimaryKey() {
		return _evpKaleoForkInstanceId;
	}

	public void setPrimaryKey(long pk) {
		setEvpKaleoForkInstanceId(pk);
	}

	public long getEvpKaleoForkInstanceId() {
		return _evpKaleoForkInstanceId;
	}

	public void setEvpKaleoForkInstanceId(long evpKaleoForkInstanceId) {
		_evpKaleoForkInstanceId = evpKaleoForkInstanceId;
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

	public long getClassNameId() {
		return _classNameId;
	}

	public void setClassNameId(long classNameId) {
		_classNameId = classNameId;
	}

	public long getClassPK() {
		return _classPK;
	}

	public void setClassPK(long classPK) {
		_classPK = classPK;
	}

	public int getType() {
		return _type;
	}

	public void setType(int type) {
		_type = type;
	}

	public int getStatus() {
		return _status;
	}

	public void setStatus(int status) {
		_status = status;
	}

	private long _evpKaleoForkInstanceId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _classNameId;
	private long _classPK;
	private int _type;
	private int _status;
}
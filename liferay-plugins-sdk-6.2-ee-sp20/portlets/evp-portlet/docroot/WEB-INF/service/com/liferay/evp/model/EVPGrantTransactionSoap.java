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
public class EVPGrantTransactionSoap implements Serializable {
	public static EVPGrantTransactionSoap toSoapModel(EVPGrantTransaction model) {
		EVPGrantTransactionSoap soapModel = new EVPGrantTransactionSoap();

		soapModel.setEvpGrantTransactionId(model.getEvpGrantTransactionId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setUserId(model.getUserId());
		soapModel.setUserName(model.getUserName());
		soapModel.setCreateDate(model.getCreateDate());
		soapModel.setModifiedDate(model.getModifiedDate());
		soapModel.setEvpGrantRequestId(model.getEvpGrantRequestId());
		soapModel.setFileEntryId(model.getFileEntryId());
		soapModel.setGrantType(model.getGrantType());
		soapModel.setAmount(model.getAmount());
		soapModel.setCurrencyCode(model.getCurrencyCode());
		soapModel.setDate(model.getDate());
		soapModel.setNote(model.getNote());
		soapModel.setNumber(model.getNumber());
		soapModel.setBankBICCode(model.getBankBICCode());
		soapModel.setBankIBANCode(model.getBankIBANCode());
		soapModel.setBankName(model.getBankName());
		soapModel.setPurposeOfUse(model.getPurposeOfUse());

		return soapModel;
	}

	public static EVPGrantTransactionSoap[] toSoapModels(
		EVPGrantTransaction[] models) {
		EVPGrantTransactionSoap[] soapModels = new EVPGrantTransactionSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static EVPGrantTransactionSoap[][] toSoapModels(
		EVPGrantTransaction[][] models) {
		EVPGrantTransactionSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new EVPGrantTransactionSoap[models.length][models[0].length];
		}
		else {
			soapModels = new EVPGrantTransactionSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static EVPGrantTransactionSoap[] toSoapModels(
		List<EVPGrantTransaction> models) {
		List<EVPGrantTransactionSoap> soapModels = new ArrayList<EVPGrantTransactionSoap>(models.size());

		for (EVPGrantTransaction model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new EVPGrantTransactionSoap[soapModels.size()]);
	}

	public EVPGrantTransactionSoap() {
	}

	public long getPrimaryKey() {
		return _evpGrantTransactionId;
	}

	public void setPrimaryKey(long pk) {
		setEvpGrantTransactionId(pk);
	}

	public long getEvpGrantTransactionId() {
		return _evpGrantTransactionId;
	}

	public void setEvpGrantTransactionId(long evpGrantTransactionId) {
		_evpGrantTransactionId = evpGrantTransactionId;
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

	public long getEvpGrantRequestId() {
		return _evpGrantRequestId;
	}

	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantRequestId = evpGrantRequestId;
	}

	public long getFileEntryId() {
		return _fileEntryId;
	}

	public void setFileEntryId(long fileEntryId) {
		_fileEntryId = fileEntryId;
	}

	public int getGrantType() {
		return _grantType;
	}

	public void setGrantType(int grantType) {
		_grantType = grantType;
	}

	public double getAmount() {
		return _amount;
	}

	public void setAmount(double amount) {
		_amount = amount;
	}

	public String getCurrencyCode() {
		return _currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		_currencyCode = currencyCode;
	}

	public Date getDate() {
		return _date;
	}

	public void setDate(Date date) {
		_date = date;
	}

	public String getNote() {
		return _note;
	}

	public void setNote(String note) {
		_note = note;
	}

	public String getNumber() {
		return _number;
	}

	public void setNumber(String number) {
		_number = number;
	}

	public String getBankBICCode() {
		return _bankBICCode;
	}

	public void setBankBICCode(String bankBICCode) {
		_bankBICCode = bankBICCode;
	}

	public String getBankIBANCode() {
		return _bankIBANCode;
	}

	public void setBankIBANCode(String bankIBANCode) {
		_bankIBANCode = bankIBANCode;
	}

	public String getBankName() {
		return _bankName;
	}

	public void setBankName(String bankName) {
		_bankName = bankName;
	}

	public String getPurposeOfUse() {
		return _purposeOfUse;
	}

	public void setPurposeOfUse(String purposeOfUse) {
		_purposeOfUse = purposeOfUse;
	}

	private long _evpGrantTransactionId;
	private long _companyId;
	private long _userId;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _evpGrantRequestId;
	private long _fileEntryId;
	private int _grantType;
	private double _amount;
	private String _currencyCode;
	private Date _date;
	private String _note;
	private String _number;
	private String _bankBICCode;
	private String _bankIBANCode;
	private String _bankName;
	private String _purposeOfUse;
}
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

import com.liferay.evp.service.ClpSerializer;
import com.liferay.evp.service.EVPGrantTransactionLocalServiceUtil;

import com.liferay.portal.kernel.bean.AutoEscapeBeanHandler;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ProxyUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.model.impl.BaseModelImpl;
import com.liferay.portal.util.PortalUtil;

import java.io.Serializable;

import java.lang.reflect.Method;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Val Nagy
 */
public class EVPGrantTransactionClp extends BaseModelImpl<EVPGrantTransaction>
	implements EVPGrantTransaction {
	public EVPGrantTransactionClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return EVPGrantTransaction.class;
	}

	@Override
	public String getModelClassName() {
		return EVPGrantTransaction.class.getName();
	}

	@Override
	public long getPrimaryKey() {
		return _evpGrantTransactionId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpGrantTransactionId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpGrantTransactionId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpGrantTransactionId", getEvpGrantTransactionId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("evpGrantRequestId", getEvpGrantRequestId());
		attributes.put("fileEntryId", getFileEntryId());
		attributes.put("grantType", getGrantType());
		attributes.put("amount", getAmount());
		attributes.put("currencyCode", getCurrencyCode());
		attributes.put("date", getDate());
		attributes.put("note", getNote());
		attributes.put("number", getNumber());
		attributes.put("bankBICCode", getBankBICCode());
		attributes.put("bankIBANCode", getBankIBANCode());
		attributes.put("bankName", getBankName());
		attributes.put("purposeOfUse", getPurposeOfUse());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpGrantTransactionId = (Long)attributes.get(
				"evpGrantTransactionId");

		if (evpGrantTransactionId != null) {
			setEvpGrantTransactionId(evpGrantTransactionId);
		}

		Long companyId = (Long)attributes.get("companyId");

		if (companyId != null) {
			setCompanyId(companyId);
		}

		Long userId = (Long)attributes.get("userId");

		if (userId != null) {
			setUserId(userId);
		}

		String userName = (String)attributes.get("userName");

		if (userName != null) {
			setUserName(userName);
		}

		Date createDate = (Date)attributes.get("createDate");

		if (createDate != null) {
			setCreateDate(createDate);
		}

		Date modifiedDate = (Date)attributes.get("modifiedDate");

		if (modifiedDate != null) {
			setModifiedDate(modifiedDate);
		}

		Long evpGrantRequestId = (Long)attributes.get("evpGrantRequestId");

		if (evpGrantRequestId != null) {
			setEvpGrantRequestId(evpGrantRequestId);
		}

		Long fileEntryId = (Long)attributes.get("fileEntryId");

		if (fileEntryId != null) {
			setFileEntryId(fileEntryId);
		}

		Integer grantType = (Integer)attributes.get("grantType");

		if (grantType != null) {
			setGrantType(grantType);
		}

		Double amount = (Double)attributes.get("amount");

		if (amount != null) {
			setAmount(amount);
		}

		String currencyCode = (String)attributes.get("currencyCode");

		if (currencyCode != null) {
			setCurrencyCode(currencyCode);
		}

		Date date = (Date)attributes.get("date");

		if (date != null) {
			setDate(date);
		}

		String note = (String)attributes.get("note");

		if (note != null) {
			setNote(note);
		}

		String number = (String)attributes.get("number");

		if (number != null) {
			setNumber(number);
		}

		String bankBICCode = (String)attributes.get("bankBICCode");

		if (bankBICCode != null) {
			setBankBICCode(bankBICCode);
		}

		String bankIBANCode = (String)attributes.get("bankIBANCode");

		if (bankIBANCode != null) {
			setBankIBANCode(bankIBANCode);
		}

		String bankName = (String)attributes.get("bankName");

		if (bankName != null) {
			setBankName(bankName);
		}

		String purposeOfUse = (String)attributes.get("purposeOfUse");

		if (purposeOfUse != null) {
			setPurposeOfUse(purposeOfUse);
		}
	}

	@Override
	public long getEvpGrantTransactionId() {
		return _evpGrantTransactionId;
	}

	@Override
	public void setEvpGrantTransactionId(long evpGrantTransactionId) {
		_evpGrantTransactionId = evpGrantTransactionId;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpGrantTransactionId",
						long.class);

				method.invoke(_evpGrantTransactionRemoteModel,
					evpGrantTransactionId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getCompanyId() {
		return _companyId;
	}

	@Override
	public void setCompanyId(long companyId) {
		_companyId = companyId;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpGrantTransactionRemoteModel, companyId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getUserId() {
		return _userId;
	}

	@Override
	public void setUserId(long userId) {
		_userId = userId;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpGrantTransactionRemoteModel, userId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getUserId(), "uuid", _userUuid);
	}

	@Override
	public void setUserUuid(String userUuid) {
		_userUuid = userUuid;
	}

	@Override
	public String getUserName() {
		return _userName;
	}

	@Override
	public void setUserName(String userName) {
		_userName = userName;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, userName);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getCreateDate() {
		return _createDate;
	}

	@Override
	public void setCreateDate(Date createDate) {
		_createDate = createDate;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpGrantTransactionRemoteModel, createDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getModifiedDate() {
		return _modifiedDate;
	}

	@Override
	public void setModifiedDate(Date modifiedDate) {
		_modifiedDate = modifiedDate;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpGrantTransactionRemoteModel, modifiedDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getEvpGrantRequestId() {
		return _evpGrantRequestId;
	}

	@Override
	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantRequestId = evpGrantRequestId;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpGrantRequestId",
						long.class);

				method.invoke(_evpGrantTransactionRemoteModel, evpGrantRequestId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getFileEntryId() {
		return _fileEntryId;
	}

	@Override
	public void setFileEntryId(long fileEntryId) {
		_fileEntryId = fileEntryId;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setFileEntryId", long.class);

				method.invoke(_evpGrantTransactionRemoteModel, fileEntryId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getGrantType() {
		return _grantType;
	}

	@Override
	public void setGrantType(int grantType) {
		_grantType = grantType;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setGrantType", int.class);

				method.invoke(_evpGrantTransactionRemoteModel, grantType);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public double getAmount() {
		return _amount;
	}

	@Override
	public void setAmount(double amount) {
		_amount = amount;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setAmount", double.class);

				method.invoke(_evpGrantTransactionRemoteModel, amount);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getCurrencyCode() {
		return _currencyCode;
	}

	@Override
	public void setCurrencyCode(String currencyCode) {
		_currencyCode = currencyCode;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setCurrencyCode", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, currencyCode);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getDate() {
		return _date;
	}

	@Override
	public void setDate(Date date) {
		_date = date;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setDate", Date.class);

				method.invoke(_evpGrantTransactionRemoteModel, date);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getNote() {
		return _note;
	}

	@Override
	public void setNote(String note) {
		_note = note;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setNote", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, note);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getNumber() {
		return _number;
	}

	@Override
	public void setNumber(String number) {
		_number = number;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setNumber", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, number);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getBankBICCode() {
		return _bankBICCode;
	}

	@Override
	public void setBankBICCode(String bankBICCode) {
		_bankBICCode = bankBICCode;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setBankBICCode", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, bankBICCode);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getBankIBANCode() {
		return _bankIBANCode;
	}

	@Override
	public void setBankIBANCode(String bankIBANCode) {
		_bankIBANCode = bankIBANCode;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setBankIBANCode", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, bankIBANCode);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getBankName() {
		return _bankName;
	}

	@Override
	public void setBankName(String bankName) {
		_bankName = bankName;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setBankName", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, bankName);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getPurposeOfUse() {
		return _purposeOfUse;
	}

	@Override
	public void setPurposeOfUse(String purposeOfUse) {
		_purposeOfUse = purposeOfUse;

		if (_evpGrantTransactionRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantTransactionRemoteModel.getClass();

				Method method = clazz.getMethod("setPurposeOfUse", String.class);

				method.invoke(_evpGrantTransactionRemoteModel, purposeOfUse);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getEVPGrantTransactionRemoteModel() {
		return _evpGrantTransactionRemoteModel;
	}

	public void setEVPGrantTransactionRemoteModel(
		BaseModel<?> evpGrantTransactionRemoteModel) {
		_evpGrantTransactionRemoteModel = evpGrantTransactionRemoteModel;
	}

	public Object invokeOnRemoteModel(String methodName,
		Class<?>[] parameterTypes, Object[] parameterValues)
		throws Exception {
		Object[] remoteParameterValues = new Object[parameterValues.length];

		for (int i = 0; i < parameterValues.length; i++) {
			if (parameterValues[i] != null) {
				remoteParameterValues[i] = ClpSerializer.translateInput(parameterValues[i]);
			}
		}

		Class<?> remoteModelClass = _evpGrantTransactionRemoteModel.getClass();

		ClassLoader remoteModelClassLoader = remoteModelClass.getClassLoader();

		Class<?>[] remoteParameterTypes = new Class[parameterTypes.length];

		for (int i = 0; i < parameterTypes.length; i++) {
			if (parameterTypes[i].isPrimitive()) {
				remoteParameterTypes[i] = parameterTypes[i];
			}
			else {
				String parameterTypeName = parameterTypes[i].getName();

				remoteParameterTypes[i] = remoteModelClassLoader.loadClass(parameterTypeName);
			}
		}

		Method method = remoteModelClass.getMethod(methodName,
				remoteParameterTypes);

		Object returnValue = method.invoke(_evpGrantTransactionRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPGrantTransactionLocalServiceUtil.addEVPGrantTransaction(this);
		}
		else {
			EVPGrantTransactionLocalServiceUtil.updateEVPGrantTransaction(this);
		}
	}

	@Override
	public EVPGrantTransaction toEscapedModel() {
		return (EVPGrantTransaction)ProxyUtil.newProxyInstance(EVPGrantTransaction.class.getClassLoader(),
			new Class[] { EVPGrantTransaction.class },
			new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPGrantTransactionClp clone = new EVPGrantTransactionClp();

		clone.setEvpGrantTransactionId(getEvpGrantTransactionId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setEvpGrantRequestId(getEvpGrantRequestId());
		clone.setFileEntryId(getFileEntryId());
		clone.setGrantType(getGrantType());
		clone.setAmount(getAmount());
		clone.setCurrencyCode(getCurrencyCode());
		clone.setDate(getDate());
		clone.setNote(getNote());
		clone.setNumber(getNumber());
		clone.setBankBICCode(getBankBICCode());
		clone.setBankIBANCode(getBankIBANCode());
		clone.setBankName(getBankName());
		clone.setPurposeOfUse(getPurposeOfUse());

		return clone;
	}

	@Override
	public int compareTo(EVPGrantTransaction evpGrantTransaction) {
		long primaryKey = evpGrantTransaction.getPrimaryKey();

		if (getPrimaryKey() < primaryKey) {
			return -1;
		}
		else if (getPrimaryKey() > primaryKey) {
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPGrantTransactionClp)) {
			return false;
		}

		EVPGrantTransactionClp evpGrantTransaction = (EVPGrantTransactionClp)obj;

		long primaryKey = evpGrantTransaction.getPrimaryKey();

		if (getPrimaryKey() == primaryKey) {
			return true;
		}
		else {
			return false;
		}
	}

	public Class<?> getClpSerializerClass() {
		return _clpSerializerClass;
	}

	@Override
	public int hashCode() {
		return (int)getPrimaryKey();
	}

	@Override
	public String toString() {
		StringBundler sb = new StringBundler(37);

		sb.append("{evpGrantTransactionId=");
		sb.append(getEvpGrantTransactionId());
		sb.append(", companyId=");
		sb.append(getCompanyId());
		sb.append(", userId=");
		sb.append(getUserId());
		sb.append(", userName=");
		sb.append(getUserName());
		sb.append(", createDate=");
		sb.append(getCreateDate());
		sb.append(", modifiedDate=");
		sb.append(getModifiedDate());
		sb.append(", evpGrantRequestId=");
		sb.append(getEvpGrantRequestId());
		sb.append(", fileEntryId=");
		sb.append(getFileEntryId());
		sb.append(", grantType=");
		sb.append(getGrantType());
		sb.append(", amount=");
		sb.append(getAmount());
		sb.append(", currencyCode=");
		sb.append(getCurrencyCode());
		sb.append(", date=");
		sb.append(getDate());
		sb.append(", note=");
		sb.append(getNote());
		sb.append(", number=");
		sb.append(getNumber());
		sb.append(", bankBICCode=");
		sb.append(getBankBICCode());
		sb.append(", bankIBANCode=");
		sb.append(getBankIBANCode());
		sb.append(", bankName=");
		sb.append(getBankName());
		sb.append(", purposeOfUse=");
		sb.append(getPurposeOfUse());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(58);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPGrantTransaction");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpGrantTransactionId</column-name><column-value><![CDATA[");
		sb.append(getEvpGrantTransactionId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>companyId</column-name><column-value><![CDATA[");
		sb.append(getCompanyId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>userId</column-name><column-value><![CDATA[");
		sb.append(getUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>userName</column-name><column-value><![CDATA[");
		sb.append(getUserName());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>createDate</column-name><column-value><![CDATA[");
		sb.append(getCreateDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>modifiedDate</column-name><column-value><![CDATA[");
		sb.append(getModifiedDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>evpGrantRequestId</column-name><column-value><![CDATA[");
		sb.append(getEvpGrantRequestId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>fileEntryId</column-name><column-value><![CDATA[");
		sb.append(getFileEntryId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>grantType</column-name><column-value><![CDATA[");
		sb.append(getGrantType());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>amount</column-name><column-value><![CDATA[");
		sb.append(getAmount());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>currencyCode</column-name><column-value><![CDATA[");
		sb.append(getCurrencyCode());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>date</column-name><column-value><![CDATA[");
		sb.append(getDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>note</column-name><column-value><![CDATA[");
		sb.append(getNote());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>number</column-name><column-value><![CDATA[");
		sb.append(getNumber());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>bankBICCode</column-name><column-value><![CDATA[");
		sb.append(getBankBICCode());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>bankIBANCode</column-name><column-value><![CDATA[");
		sb.append(getBankIBANCode());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>bankName</column-name><column-value><![CDATA[");
		sb.append(getBankName());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>purposeOfUse</column-name><column-value><![CDATA[");
		sb.append(getPurposeOfUse());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _evpGrantTransactionId;
	private long _companyId;
	private long _userId;
	private String _userUuid;
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
	private BaseModel<?> _evpGrantTransactionRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
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
import com.liferay.evp.service.EVPRequestOrganizationLocalServiceUtil;

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
public class EVPRequestOrganizationClp extends BaseModelImpl<EVPRequestOrganization>
	implements EVPRequestOrganization {
	public EVPRequestOrganizationClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return EVPRequestOrganization.class;
	}

	@Override
	public String getModelClassName() {
		return EVPRequestOrganization.class.getName();
	}

	@Override
	public long getPrimaryKey() {
		return _evpRequestOrganizationId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpRequestOrganizationId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpRequestOrganizationId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpRequestOrganizationId", getEvpRequestOrganizationId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("organizationId", getOrganizationId());
		attributes.put("subsidiaryGroupId", getSubsidiaryGroupId());
		attributes.put("description", getDescription());
		attributes.put("taxIdentificationNumber", getTaxIdentificationNumber());
		attributes.put("nonprofitType", getNonprofitType());
		attributes.put("verified", getVerified());
		attributes.put("shared", getShared());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpRequestOrganizationId = (Long)attributes.get(
				"evpRequestOrganizationId");

		if (evpRequestOrganizationId != null) {
			setEvpRequestOrganizationId(evpRequestOrganizationId);
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

		Long organizationId = (Long)attributes.get("organizationId");

		if (organizationId != null) {
			setOrganizationId(organizationId);
		}

		Long subsidiaryGroupId = (Long)attributes.get("subsidiaryGroupId");

		if (subsidiaryGroupId != null) {
			setSubsidiaryGroupId(subsidiaryGroupId);
		}

		String description = (String)attributes.get("description");

		if (description != null) {
			setDescription(description);
		}

		String taxIdentificationNumber = (String)attributes.get(
				"taxIdentificationNumber");

		if (taxIdentificationNumber != null) {
			setTaxIdentificationNumber(taxIdentificationNumber);
		}

		Integer nonprofitType = (Integer)attributes.get("nonprofitType");

		if (nonprofitType != null) {
			setNonprofitType(nonprofitType);
		}

		Boolean verified = (Boolean)attributes.get("verified");

		if (verified != null) {
			setVerified(verified);
		}

		Boolean shared = (Boolean)attributes.get("shared");

		if (shared != null) {
			setShared(shared);
		}
	}

	@Override
	public long getEvpRequestOrganizationId() {
		return _evpRequestOrganizationId;
	}

	@Override
	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpRequestOrganizationId = evpRequestOrganizationId;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpRequestOrganizationId",
						long.class);

				method.invoke(_evpRequestOrganizationRemoteModel,
					evpRequestOrganizationId);
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

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpRequestOrganizationRemoteModel, companyId);
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

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpRequestOrganizationRemoteModel, userId);
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

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpRequestOrganizationRemoteModel, userName);
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

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpRequestOrganizationRemoteModel, createDate);
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

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpRequestOrganizationRemoteModel, modifiedDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getOrganizationId() {
		return _organizationId;
	}

	@Override
	public void setOrganizationId(long organizationId) {
		_organizationId = organizationId;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setOrganizationId", long.class);

				method.invoke(_evpRequestOrganizationRemoteModel, organizationId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getSubsidiaryGroupId() {
		return _subsidiaryGroupId;
	}

	@Override
	public void setSubsidiaryGroupId(long subsidiaryGroupId) {
		_subsidiaryGroupId = subsidiaryGroupId;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setSubsidiaryGroupId",
						long.class);

				method.invoke(_evpRequestOrganizationRemoteModel,
					subsidiaryGroupId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getDescription() {
		return _description;
	}

	@Override
	public void setDescription(String description) {
		_description = description;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setDescription", String.class);

				method.invoke(_evpRequestOrganizationRemoteModel, description);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getTaxIdentificationNumber() {
		return _taxIdentificationNumber;
	}

	@Override
	public void setTaxIdentificationNumber(String taxIdentificationNumber) {
		_taxIdentificationNumber = taxIdentificationNumber;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setTaxIdentificationNumber",
						String.class);

				method.invoke(_evpRequestOrganizationRemoteModel,
					taxIdentificationNumber);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getNonprofitType() {
		return _nonprofitType;
	}

	@Override
	public void setNonprofitType(int nonprofitType) {
		_nonprofitType = nonprofitType;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setNonprofitType", int.class);

				method.invoke(_evpRequestOrganizationRemoteModel, nonprofitType);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public boolean getVerified() {
		return _verified;
	}

	@Override
	public boolean isVerified() {
		return _verified;
	}

	@Override
	public void setVerified(boolean verified) {
		_verified = verified;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setVerified", boolean.class);

				method.invoke(_evpRequestOrganizationRemoteModel, verified);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public boolean getShared() {
		return _shared;
	}

	@Override
	public boolean isShared() {
		return _shared;
	}

	@Override
	public void setShared(boolean shared) {
		_shared = shared;

		if (_evpRequestOrganizationRemoteModel != null) {
			try {
				Class<?> clazz = _evpRequestOrganizationRemoteModel.getClass();

				Method method = clazz.getMethod("setShared", boolean.class);

				method.invoke(_evpRequestOrganizationRemoteModel, shared);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getEVPRequestOrganizationRemoteModel() {
		return _evpRequestOrganizationRemoteModel;
	}

	public void setEVPRequestOrganizationRemoteModel(
		BaseModel<?> evpRequestOrganizationRemoteModel) {
		_evpRequestOrganizationRemoteModel = evpRequestOrganizationRemoteModel;
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

		Class<?> remoteModelClass = _evpRequestOrganizationRemoteModel.getClass();

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

		Object returnValue = method.invoke(_evpRequestOrganizationRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPRequestOrganizationLocalServiceUtil.addEVPRequestOrganization(this);
		}
		else {
			EVPRequestOrganizationLocalServiceUtil.updateEVPRequestOrganization(this);
		}
	}

	@Override
	public EVPRequestOrganization toEscapedModel() {
		return (EVPRequestOrganization)ProxyUtil.newProxyInstance(EVPRequestOrganization.class.getClassLoader(),
			new Class[] { EVPRequestOrganization.class },
			new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPRequestOrganizationClp clone = new EVPRequestOrganizationClp();

		clone.setEvpRequestOrganizationId(getEvpRequestOrganizationId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setOrganizationId(getOrganizationId());
		clone.setSubsidiaryGroupId(getSubsidiaryGroupId());
		clone.setDescription(getDescription());
		clone.setTaxIdentificationNumber(getTaxIdentificationNumber());
		clone.setNonprofitType(getNonprofitType());
		clone.setVerified(getVerified());
		clone.setShared(getShared());

		return clone;
	}

	@Override
	public int compareTo(EVPRequestOrganization evpRequestOrganization) {
		long primaryKey = evpRequestOrganization.getPrimaryKey();

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

		if (!(obj instanceof EVPRequestOrganizationClp)) {
			return false;
		}

		EVPRequestOrganizationClp evpRequestOrganization = (EVPRequestOrganizationClp)obj;

		long primaryKey = evpRequestOrganization.getPrimaryKey();

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
		StringBundler sb = new StringBundler(27);

		sb.append("{evpRequestOrganizationId=");
		sb.append(getEvpRequestOrganizationId());
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
		sb.append(", organizationId=");
		sb.append(getOrganizationId());
		sb.append(", subsidiaryGroupId=");
		sb.append(getSubsidiaryGroupId());
		sb.append(", description=");
		sb.append(getDescription());
		sb.append(", taxIdentificationNumber=");
		sb.append(getTaxIdentificationNumber());
		sb.append(", nonprofitType=");
		sb.append(getNonprofitType());
		sb.append(", verified=");
		sb.append(getVerified());
		sb.append(", shared=");
		sb.append(getShared());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(43);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPRequestOrganization");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpRequestOrganizationId</column-name><column-value><![CDATA[");
		sb.append(getEvpRequestOrganizationId());
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
			"<column><column-name>organizationId</column-name><column-value><![CDATA[");
		sb.append(getOrganizationId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>subsidiaryGroupId</column-name><column-value><![CDATA[");
		sb.append(getSubsidiaryGroupId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>description</column-name><column-value><![CDATA[");
		sb.append(getDescription());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>taxIdentificationNumber</column-name><column-value><![CDATA[");
		sb.append(getTaxIdentificationNumber());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>nonprofitType</column-name><column-value><![CDATA[");
		sb.append(getNonprofitType());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>verified</column-name><column-value><![CDATA[");
		sb.append(getVerified());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>shared</column-name><column-value><![CDATA[");
		sb.append(getShared());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _evpRequestOrganizationId;
	private long _companyId;
	private long _userId;
	private String _userUuid;
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
	private BaseModel<?> _evpRequestOrganizationRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
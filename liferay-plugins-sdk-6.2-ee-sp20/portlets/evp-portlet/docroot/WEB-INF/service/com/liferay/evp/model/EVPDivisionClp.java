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
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;

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
public class EVPDivisionClp extends BaseModelImpl<EVPDivision>
	implements EVPDivision {
	public EVPDivisionClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return EVPDivision.class;
	}

	@Override
	public String getModelClassName() {
		return EVPDivision.class.getName();
	}

	@Override
	public long getPrimaryKey() {
		return _evpDivisionId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpDivisionId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpDivisionId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpDivisionId", getEvpDivisionId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("organizationId", getOrganizationId());
		attributes.put("parentEVPDivisionId", getParentEVPDivisionId());
		attributes.put("abbreviation", getAbbreviation());
		attributes.put("type", getType());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpDivisionId = (Long)attributes.get("evpDivisionId");

		if (evpDivisionId != null) {
			setEvpDivisionId(evpDivisionId);
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

		Long parentEVPDivisionId = (Long)attributes.get("parentEVPDivisionId");

		if (parentEVPDivisionId != null) {
			setParentEVPDivisionId(parentEVPDivisionId);
		}

		String abbreviation = (String)attributes.get("abbreviation");

		if (abbreviation != null) {
			setAbbreviation(abbreviation);
		}

		Integer type = (Integer)attributes.get("type");

		if (type != null) {
			setType(type);
		}
	}

	@Override
	public long getEvpDivisionId() {
		return _evpDivisionId;
	}

	@Override
	public void setEvpDivisionId(long evpDivisionId) {
		_evpDivisionId = evpDivisionId;

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpDivisionId", long.class);

				method.invoke(_evpDivisionRemoteModel, evpDivisionId);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpDivisionRemoteModel, companyId);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpDivisionRemoteModel, userId);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpDivisionRemoteModel, userName);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpDivisionRemoteModel, createDate);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpDivisionRemoteModel, modifiedDate);
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

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setOrganizationId", long.class);

				method.invoke(_evpDivisionRemoteModel, organizationId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getParentEVPDivisionId() {
		return _parentEVPDivisionId;
	}

	@Override
	public void setParentEVPDivisionId(long parentEVPDivisionId) {
		_parentEVPDivisionId = parentEVPDivisionId;

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setParentEVPDivisionId",
						long.class);

				method.invoke(_evpDivisionRemoteModel, parentEVPDivisionId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getAbbreviation() {
		return _abbreviation;
	}

	@Override
	public void setAbbreviation(String abbreviation) {
		_abbreviation = abbreviation;

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setAbbreviation", String.class);

				method.invoke(_evpDivisionRemoteModel, abbreviation);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getType() {
		return _type;
	}

	@Override
	public void setType(int type) {
		_type = type;

		if (_evpDivisionRemoteModel != null) {
			try {
				Class<?> clazz = _evpDivisionRemoteModel.getClass();

				Method method = clazz.getMethod("setType", int.class);

				method.invoke(_evpDivisionRemoteModel, type);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getOrganizationGroupId() {
		try {
			String methodName = "getOrganizationGroupId";

			Class<?>[] parameterTypes = new Class<?>[] {  };

			Object[] parameterValues = new Object[] {  };

			Long returnObj = (Long)invokeOnRemoteModel(methodName,
					parameterTypes, parameterValues);

			return returnObj;
		}
		catch (Exception e) {
			throw new UnsupportedOperationException(e);
		}
	}

	public BaseModel<?> getEVPDivisionRemoteModel() {
		return _evpDivisionRemoteModel;
	}

	public void setEVPDivisionRemoteModel(BaseModel<?> evpDivisionRemoteModel) {
		_evpDivisionRemoteModel = evpDivisionRemoteModel;
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

		Class<?> remoteModelClass = _evpDivisionRemoteModel.getClass();

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

		Object returnValue = method.invoke(_evpDivisionRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPDivisionLocalServiceUtil.addEVPDivision(this);
		}
		else {
			EVPDivisionLocalServiceUtil.updateEVPDivision(this);
		}
	}

	@Override
	public EVPDivision toEscapedModel() {
		return (EVPDivision)ProxyUtil.newProxyInstance(EVPDivision.class.getClassLoader(),
			new Class[] { EVPDivision.class }, new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPDivisionClp clone = new EVPDivisionClp();

		clone.setEvpDivisionId(getEvpDivisionId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setOrganizationId(getOrganizationId());
		clone.setParentEVPDivisionId(getParentEVPDivisionId());
		clone.setAbbreviation(getAbbreviation());
		clone.setType(getType());

		return clone;
	}

	@Override
	public int compareTo(EVPDivision evpDivision) {
		long primaryKey = evpDivision.getPrimaryKey();

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

		if (!(obj instanceof EVPDivisionClp)) {
			return false;
		}

		EVPDivisionClp evpDivision = (EVPDivisionClp)obj;

		long primaryKey = evpDivision.getPrimaryKey();

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
		StringBundler sb = new StringBundler(21);

		sb.append("{evpDivisionId=");
		sb.append(getEvpDivisionId());
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
		sb.append(", parentEVPDivisionId=");
		sb.append(getParentEVPDivisionId());
		sb.append(", abbreviation=");
		sb.append(getAbbreviation());
		sb.append(", type=");
		sb.append(getType());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(34);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPDivision");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpDivisionId</column-name><column-value><![CDATA[");
		sb.append(getEvpDivisionId());
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
			"<column><column-name>parentEVPDivisionId</column-name><column-value><![CDATA[");
		sb.append(getParentEVPDivisionId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>abbreviation</column-name><column-value><![CDATA[");
		sb.append(getAbbreviation());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>type</column-name><column-value><![CDATA[");
		sb.append(getType());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _evpDivisionId;
	private long _companyId;
	private long _userId;
	private String _userUuid;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _organizationId;
	private long _parentEVPDivisionId;
	private String _abbreviation;
	private int _type;
	private BaseModel<?> _evpDivisionRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
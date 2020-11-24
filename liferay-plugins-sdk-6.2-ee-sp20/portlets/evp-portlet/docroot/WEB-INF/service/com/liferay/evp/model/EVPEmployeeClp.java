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
import com.liferay.evp.service.EVPEmployeeLocalServiceUtil;

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
public class EVPEmployeeClp extends BaseModelImpl<EVPEmployee>
	implements EVPEmployee {
	public EVPEmployeeClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return EVPEmployee.class;
	}

	@Override
	public String getModelClassName() {
		return EVPEmployee.class.getName();
	}

	@Override
	public long getPrimaryKey() {
		return _evpEmployeeId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpEmployeeId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpEmployeeId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpEmployeeId", getEvpEmployeeId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("employeeUserId", getEmployeeUserId());
		attributes.put("managerUserId", getManagerUserId());
		attributes.put("subsidiaryEVPDivisionId", getSubsidiaryEVPDivisionId());
		attributes.put("employmentType", getEmploymentType());
		attributes.put("hireDate", getHireDate());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpEmployeeId = (Long)attributes.get("evpEmployeeId");

		if (evpEmployeeId != null) {
			setEvpEmployeeId(evpEmployeeId);
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

		Long employeeUserId = (Long)attributes.get("employeeUserId");

		if (employeeUserId != null) {
			setEmployeeUserId(employeeUserId);
		}

		Long managerUserId = (Long)attributes.get("managerUserId");

		if (managerUserId != null) {
			setManagerUserId(managerUserId);
		}

		Long subsidiaryEVPDivisionId = (Long)attributes.get(
				"subsidiaryEVPDivisionId");

		if (subsidiaryEVPDivisionId != null) {
			setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
		}

		Integer employmentType = (Integer)attributes.get("employmentType");

		if (employmentType != null) {
			setEmploymentType(employmentType);
		}

		Date hireDate = (Date)attributes.get("hireDate");

		if (hireDate != null) {
			setHireDate(hireDate);
		}
	}

	@Override
	public long getEvpEmployeeId() {
		return _evpEmployeeId;
	}

	@Override
	public void setEvpEmployeeId(long evpEmployeeId) {
		_evpEmployeeId = evpEmployeeId;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpEmployeeId", long.class);

				method.invoke(_evpEmployeeRemoteModel, evpEmployeeId);
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

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpEmployeeRemoteModel, companyId);
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

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpEmployeeRemoteModel, userId);
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

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpEmployeeRemoteModel, userName);
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

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpEmployeeRemoteModel, createDate);
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

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpEmployeeRemoteModel, modifiedDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getEmployeeUserId() {
		return _employeeUserId;
	}

	@Override
	public void setEmployeeUserId(long employeeUserId) {
		_employeeUserId = employeeUserId;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setEmployeeUserId", long.class);

				method.invoke(_evpEmployeeRemoteModel, employeeUserId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getEmployeeUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getEmployeeUserId(), "uuid",
			_employeeUserUuid);
	}

	@Override
	public void setEmployeeUserUuid(String employeeUserUuid) {
		_employeeUserUuid = employeeUserUuid;
	}

	@Override
	public long getManagerUserId() {
		return _managerUserId;
	}

	@Override
	public void setManagerUserId(long managerUserId) {
		_managerUserId = managerUserId;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setManagerUserId", long.class);

				method.invoke(_evpEmployeeRemoteModel, managerUserId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getManagerUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getManagerUserId(), "uuid",
			_managerUserUuid);
	}

	@Override
	public void setManagerUserUuid(String managerUserUuid) {
		_managerUserUuid = managerUserUuid;
	}

	@Override
	public long getSubsidiaryEVPDivisionId() {
		return _subsidiaryEVPDivisionId;
	}

	@Override
	public void setSubsidiaryEVPDivisionId(long subsidiaryEVPDivisionId) {
		_subsidiaryEVPDivisionId = subsidiaryEVPDivisionId;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setSubsidiaryEVPDivisionId",
						long.class);

				method.invoke(_evpEmployeeRemoteModel, subsidiaryEVPDivisionId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getEmploymentType() {
		return _employmentType;
	}

	@Override
	public void setEmploymentType(int employmentType) {
		_employmentType = employmentType;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setEmploymentType", int.class);

				method.invoke(_evpEmployeeRemoteModel, employmentType);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getHireDate() {
		return _hireDate;
	}

	@Override
	public void setHireDate(Date hireDate) {
		_hireDate = hireDate;

		if (_evpEmployeeRemoteModel != null) {
			try {
				Class<?> clazz = _evpEmployeeRemoteModel.getClass();

				Method method = clazz.getMethod("setHireDate", Date.class);

				method.invoke(_evpEmployeeRemoteModel, hireDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getEVPEmployeeRemoteModel() {
		return _evpEmployeeRemoteModel;
	}

	public void setEVPEmployeeRemoteModel(BaseModel<?> evpEmployeeRemoteModel) {
		_evpEmployeeRemoteModel = evpEmployeeRemoteModel;
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

		Class<?> remoteModelClass = _evpEmployeeRemoteModel.getClass();

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

		Object returnValue = method.invoke(_evpEmployeeRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPEmployeeLocalServiceUtil.addEVPEmployee(this);
		}
		else {
			EVPEmployeeLocalServiceUtil.updateEVPEmployee(this);
		}
	}

	@Override
	public EVPEmployee toEscapedModel() {
		return (EVPEmployee)ProxyUtil.newProxyInstance(EVPEmployee.class.getClassLoader(),
			new Class[] { EVPEmployee.class }, new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPEmployeeClp clone = new EVPEmployeeClp();

		clone.setEvpEmployeeId(getEvpEmployeeId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setEmployeeUserId(getEmployeeUserId());
		clone.setManagerUserId(getManagerUserId());
		clone.setSubsidiaryEVPDivisionId(getSubsidiaryEVPDivisionId());
		clone.setEmploymentType(getEmploymentType());
		clone.setHireDate(getHireDate());

		return clone;
	}

	@Override
	public int compareTo(EVPEmployee evpEmployee) {
		long primaryKey = evpEmployee.getPrimaryKey();

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

		if (!(obj instanceof EVPEmployeeClp)) {
			return false;
		}

		EVPEmployeeClp evpEmployee = (EVPEmployeeClp)obj;

		long primaryKey = evpEmployee.getPrimaryKey();

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
		StringBundler sb = new StringBundler(23);

		sb.append("{evpEmployeeId=");
		sb.append(getEvpEmployeeId());
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
		sb.append(", employeeUserId=");
		sb.append(getEmployeeUserId());
		sb.append(", managerUserId=");
		sb.append(getManagerUserId());
		sb.append(", subsidiaryEVPDivisionId=");
		sb.append(getSubsidiaryEVPDivisionId());
		sb.append(", employmentType=");
		sb.append(getEmploymentType());
		sb.append(", hireDate=");
		sb.append(getHireDate());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(37);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPEmployee");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpEmployeeId</column-name><column-value><![CDATA[");
		sb.append(getEvpEmployeeId());
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
			"<column><column-name>employeeUserId</column-name><column-value><![CDATA[");
		sb.append(getEmployeeUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>managerUserId</column-name><column-value><![CDATA[");
		sb.append(getManagerUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>subsidiaryEVPDivisionId</column-name><column-value><![CDATA[");
		sb.append(getSubsidiaryEVPDivisionId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>employmentType</column-name><column-value><![CDATA[");
		sb.append(getEmploymentType());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>hireDate</column-name><column-value><![CDATA[");
		sb.append(getHireDate());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _evpEmployeeId;
	private long _companyId;
	private long _userId;
	private String _userUuid;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _employeeUserId;
	private String _employeeUserUuid;
	private long _managerUserId;
	private String _managerUserUuid;
	private long _subsidiaryEVPDivisionId;
	private int _employmentType;
	private Date _hireDate;
	private BaseModel<?> _evpEmployeeRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
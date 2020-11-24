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
import com.liferay.evp.service.EVPGrantRequestLocalServiceUtil;

import com.liferay.portal.kernel.bean.AutoEscapeBeanHandler;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ProxyUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
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
public class EVPGrantRequestClp extends BaseModelImpl<EVPGrantRequest>
	implements EVPGrantRequest {
	public EVPGrantRequestClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return EVPGrantRequest.class;
	}

	@Override
	public String getModelClassName() {
		return EVPGrantRequest.class.getName();
	}

	@Override
	public long getPrimaryKey() {
		return _evpGrantRequestId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpGrantRequestId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpGrantRequestId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpGrantRequestId", getEvpGrantRequestId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("contactEmailAddressId", getContactEmailAddressId());
		attributes.put("contactPhoneId", getContactPhoneId());
		attributes.put("contactUserId", getContactUserId());
		attributes.put("evpRequestOrganizationId", getEvpRequestOrganizationId());
		attributes.put("parentEVPGrantRequestId", getParentEVPGrantRequestId());
		attributes.put("requestOrganizationAddressId",
			getRequestOrganizationAddressId());
		attributes.put("requestOrganizationWebsiteId",
			getRequestOrganizationWebsiteId());
		attributes.put("subsidiaryGroupId", getSubsidiaryGroupId());
		attributes.put("description", getDescription());
		attributes.put("employmentType", getEmploymentType());
		attributes.put("employmentHoursPerWeek", getEmploymentHoursPerWeek());
		attributes.put("purpose", getPurpose());
		attributes.put("purposeOther", getPurposeOther());
		attributes.put("behalfOf", getBehalfOf());
		attributes.put("behalfOfOther", getBehalfOfOther());
		attributes.put("status", getStatus());
		attributes.put("statusByUserId", getStatusByUserId());
		attributes.put("statusByUserName", getStatusByUserName());
		attributes.put("statusDate", getStatusDate());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpGrantRequestId = (Long)attributes.get("evpGrantRequestId");

		if (evpGrantRequestId != null) {
			setEvpGrantRequestId(evpGrantRequestId);
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

		Long contactEmailAddressId = (Long)attributes.get(
				"contactEmailAddressId");

		if (contactEmailAddressId != null) {
			setContactEmailAddressId(contactEmailAddressId);
		}

		Long contactPhoneId = (Long)attributes.get("contactPhoneId");

		if (contactPhoneId != null) {
			setContactPhoneId(contactPhoneId);
		}

		Long contactUserId = (Long)attributes.get("contactUserId");

		if (contactUserId != null) {
			setContactUserId(contactUserId);
		}

		Long evpRequestOrganizationId = (Long)attributes.get(
				"evpRequestOrganizationId");

		if (evpRequestOrganizationId != null) {
			setEvpRequestOrganizationId(evpRequestOrganizationId);
		}

		Long parentEVPGrantRequestId = (Long)attributes.get(
				"parentEVPGrantRequestId");

		if (parentEVPGrantRequestId != null) {
			setParentEVPGrantRequestId(parentEVPGrantRequestId);
		}

		Long requestOrganizationAddressId = (Long)attributes.get(
				"requestOrganizationAddressId");

		if (requestOrganizationAddressId != null) {
			setRequestOrganizationAddressId(requestOrganizationAddressId);
		}

		Long requestOrganizationWebsiteId = (Long)attributes.get(
				"requestOrganizationWebsiteId");

		if (requestOrganizationWebsiteId != null) {
			setRequestOrganizationWebsiteId(requestOrganizationWebsiteId);
		}

		Long subsidiaryGroupId = (Long)attributes.get("subsidiaryGroupId");

		if (subsidiaryGroupId != null) {
			setSubsidiaryGroupId(subsidiaryGroupId);
		}

		String description = (String)attributes.get("description");

		if (description != null) {
			setDescription(description);
		}

		Integer employmentType = (Integer)attributes.get("employmentType");

		if (employmentType != null) {
			setEmploymentType(employmentType);
		}

		Integer employmentHoursPerWeek = (Integer)attributes.get(
				"employmentHoursPerWeek");

		if (employmentHoursPerWeek != null) {
			setEmploymentHoursPerWeek(employmentHoursPerWeek);
		}

		String purpose = (String)attributes.get("purpose");

		if (purpose != null) {
			setPurpose(purpose);
		}

		String purposeOther = (String)attributes.get("purposeOther");

		if (purposeOther != null) {
			setPurposeOther(purposeOther);
		}

		String behalfOf = (String)attributes.get("behalfOf");

		if (behalfOf != null) {
			setBehalfOf(behalfOf);
		}

		String behalfOfOther = (String)attributes.get("behalfOfOther");

		if (behalfOfOther != null) {
			setBehalfOfOther(behalfOfOther);
		}

		Integer status = (Integer)attributes.get("status");

		if (status != null) {
			setStatus(status);
		}

		Long statusByUserId = (Long)attributes.get("statusByUserId");

		if (statusByUserId != null) {
			setStatusByUserId(statusByUserId);
		}

		String statusByUserName = (String)attributes.get("statusByUserName");

		if (statusByUserName != null) {
			setStatusByUserName(statusByUserName);
		}

		Date statusDate = (Date)attributes.get("statusDate");

		if (statusDate != null) {
			setStatusDate(statusDate);
		}
	}

	@Override
	public long getEvpGrantRequestId() {
		return _evpGrantRequestId;
	}

	@Override
	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantRequestId = evpGrantRequestId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpGrantRequestId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel, evpGrantRequestId);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpGrantRequestRemoteModel, companyId);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpGrantRequestRemoteModel, userId);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpGrantRequestRemoteModel, userName);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpGrantRequestRemoteModel, createDate);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpGrantRequestRemoteModel, modifiedDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getContactEmailAddressId() {
		return _contactEmailAddressId;
	}

	@Override
	public void setContactEmailAddressId(long contactEmailAddressId) {
		_contactEmailAddressId = contactEmailAddressId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactEmailAddressId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel, contactEmailAddressId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getContactPhoneId() {
		return _contactPhoneId;
	}

	@Override
	public void setContactPhoneId(long contactPhoneId) {
		_contactPhoneId = contactPhoneId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactPhoneId", long.class);

				method.invoke(_evpGrantRequestRemoteModel, contactPhoneId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getContactUserId() {
		return _contactUserId;
	}

	@Override
	public void setContactUserId(long contactUserId) {
		_contactUserId = contactUserId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactUserId", long.class);

				method.invoke(_evpGrantRequestRemoteModel, contactUserId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getContactUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getContactUserId(), "uuid",
			_contactUserUuid);
	}

	@Override
	public void setContactUserUuid(String contactUserUuid) {
		_contactUserUuid = contactUserUuid;
	}

	@Override
	public long getEvpRequestOrganizationId() {
		return _evpRequestOrganizationId;
	}

	@Override
	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpRequestOrganizationId = evpRequestOrganizationId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpRequestOrganizationId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel,
					evpRequestOrganizationId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getParentEVPGrantRequestId() {
		return _parentEVPGrantRequestId;
	}

	@Override
	public void setParentEVPGrantRequestId(long parentEVPGrantRequestId) {
		_parentEVPGrantRequestId = parentEVPGrantRequestId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setParentEVPGrantRequestId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel,
					parentEVPGrantRequestId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getRequestOrganizationAddressId() {
		return _requestOrganizationAddressId;
	}

	@Override
	public void setRequestOrganizationAddressId(
		long requestOrganizationAddressId) {
		_requestOrganizationAddressId = requestOrganizationAddressId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestOrganizationAddressId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel,
					requestOrganizationAddressId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getRequestOrganizationWebsiteId() {
		return _requestOrganizationWebsiteId;
	}

	@Override
	public void setRequestOrganizationWebsiteId(
		long requestOrganizationWebsiteId) {
		_requestOrganizationWebsiteId = requestOrganizationWebsiteId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestOrganizationWebsiteId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel,
					requestOrganizationWebsiteId);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setSubsidiaryGroupId",
						long.class);

				method.invoke(_evpGrantRequestRemoteModel, subsidiaryGroupId);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setDescription", String.class);

				method.invoke(_evpGrantRequestRemoteModel, description);
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

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEmploymentType", int.class);

				method.invoke(_evpGrantRequestRemoteModel, employmentType);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getEmploymentHoursPerWeek() {
		return _employmentHoursPerWeek;
	}

	@Override
	public void setEmploymentHoursPerWeek(int employmentHoursPerWeek) {
		_employmentHoursPerWeek = employmentHoursPerWeek;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEmploymentHoursPerWeek",
						int.class);

				method.invoke(_evpGrantRequestRemoteModel,
					employmentHoursPerWeek);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getPurpose() {
		return _purpose;
	}

	@Override
	public void setPurpose(String purpose) {
		_purpose = purpose;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setPurpose", String.class);

				method.invoke(_evpGrantRequestRemoteModel, purpose);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getPurposeOther() {
		return _purposeOther;
	}

	@Override
	public void setPurposeOther(String purposeOther) {
		_purposeOther = purposeOther;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setPurposeOther", String.class);

				method.invoke(_evpGrantRequestRemoteModel, purposeOther);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getBehalfOf() {
		return _behalfOf;
	}

	@Override
	public void setBehalfOf(String behalfOf) {
		_behalfOf = behalfOf;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setBehalfOf", String.class);

				method.invoke(_evpGrantRequestRemoteModel, behalfOf);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getBehalfOfOther() {
		return _behalfOfOther;
	}

	@Override
	public void setBehalfOfOther(String behalfOfOther) {
		_behalfOfOther = behalfOfOther;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setBehalfOfOther", String.class);

				method.invoke(_evpGrantRequestRemoteModel, behalfOfOther);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getStatus() {
		return _status;
	}

	@Override
	public void setStatus(int status) {
		_status = status;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatus", int.class);

				method.invoke(_evpGrantRequestRemoteModel, status);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getStatusByUserId() {
		return _statusByUserId;
	}

	@Override
	public void setStatusByUserId(long statusByUserId) {
		_statusByUserId = statusByUserId;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusByUserId", long.class);

				method.invoke(_evpGrantRequestRemoteModel, statusByUserId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getStatusByUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getStatusByUserId(), "uuid",
			_statusByUserUuid);
	}

	@Override
	public void setStatusByUserUuid(String statusByUserUuid) {
		_statusByUserUuid = statusByUserUuid;
	}

	@Override
	public String getStatusByUserName() {
		return _statusByUserName;
	}

	@Override
	public void setStatusByUserName(String statusByUserName) {
		_statusByUserName = statusByUserName;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusByUserName",
						String.class);

				method.invoke(_evpGrantRequestRemoteModel, statusByUserName);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getStatusDate() {
		return _statusDate;
	}

	@Override
	public void setStatusDate(Date statusDate) {
		_statusDate = statusDate;

		if (_evpGrantRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpGrantRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusDate", Date.class);

				method.invoke(_evpGrantRequestRemoteModel, statusDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #isApproved}
	 */
	@Override
	public boolean getApproved() {
		return isApproved();
	}

	@Override
	public boolean isApproved() {
		if (getStatus() == WorkflowConstants.STATUS_APPROVED) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isDenied() {
		if (getStatus() == WorkflowConstants.STATUS_DENIED) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isDraft() {
		if (getStatus() == WorkflowConstants.STATUS_DRAFT) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isExpired() {
		if (getStatus() == WorkflowConstants.STATUS_EXPIRED) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isInactive() {
		if (getStatus() == WorkflowConstants.STATUS_INACTIVE) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isIncomplete() {
		if (getStatus() == WorkflowConstants.STATUS_INCOMPLETE) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isPending() {
		if (getStatus() == WorkflowConstants.STATUS_PENDING) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean isScheduled() {
		if (getStatus() == WorkflowConstants.STATUS_SCHEDULED) {
			return true;
		}
		else {
			return false;
		}
	}

	public BaseModel<?> getEVPGrantRequestRemoteModel() {
		return _evpGrantRequestRemoteModel;
	}

	public void setEVPGrantRequestRemoteModel(
		BaseModel<?> evpGrantRequestRemoteModel) {
		_evpGrantRequestRemoteModel = evpGrantRequestRemoteModel;
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

		Class<?> remoteModelClass = _evpGrantRequestRemoteModel.getClass();

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

		Object returnValue = method.invoke(_evpGrantRequestRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPGrantRequestLocalServiceUtil.addEVPGrantRequest(this);
		}
		else {
			EVPGrantRequestLocalServiceUtil.updateEVPGrantRequest(this);
		}
	}

	@Override
	public EVPGrantRequest toEscapedModel() {
		return (EVPGrantRequest)ProxyUtil.newProxyInstance(EVPGrantRequest.class.getClassLoader(),
			new Class[] { EVPGrantRequest.class },
			new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPGrantRequestClp clone = new EVPGrantRequestClp();

		clone.setEvpGrantRequestId(getEvpGrantRequestId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setContactEmailAddressId(getContactEmailAddressId());
		clone.setContactPhoneId(getContactPhoneId());
		clone.setContactUserId(getContactUserId());
		clone.setEvpRequestOrganizationId(getEvpRequestOrganizationId());
		clone.setParentEVPGrantRequestId(getParentEVPGrantRequestId());
		clone.setRequestOrganizationAddressId(getRequestOrganizationAddressId());
		clone.setRequestOrganizationWebsiteId(getRequestOrganizationWebsiteId());
		clone.setSubsidiaryGroupId(getSubsidiaryGroupId());
		clone.setDescription(getDescription());
		clone.setEmploymentType(getEmploymentType());
		clone.setEmploymentHoursPerWeek(getEmploymentHoursPerWeek());
		clone.setPurpose(getPurpose());
		clone.setPurposeOther(getPurposeOther());
		clone.setBehalfOf(getBehalfOf());
		clone.setBehalfOfOther(getBehalfOfOther());
		clone.setStatus(getStatus());
		clone.setStatusByUserId(getStatusByUserId());
		clone.setStatusByUserName(getStatusByUserName());
		clone.setStatusDate(getStatusDate());

		return clone;
	}

	@Override
	public int compareTo(EVPGrantRequest evpGrantRequest) {
		long primaryKey = evpGrantRequest.getPrimaryKey();

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

		if (!(obj instanceof EVPGrantRequestClp)) {
			return false;
		}

		EVPGrantRequestClp evpGrantRequest = (EVPGrantRequestClp)obj;

		long primaryKey = evpGrantRequest.getPrimaryKey();

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
		StringBundler sb = new StringBundler(51);

		sb.append("{evpGrantRequestId=");
		sb.append(getEvpGrantRequestId());
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
		sb.append(", contactEmailAddressId=");
		sb.append(getContactEmailAddressId());
		sb.append(", contactPhoneId=");
		sb.append(getContactPhoneId());
		sb.append(", contactUserId=");
		sb.append(getContactUserId());
		sb.append(", evpRequestOrganizationId=");
		sb.append(getEvpRequestOrganizationId());
		sb.append(", parentEVPGrantRequestId=");
		sb.append(getParentEVPGrantRequestId());
		sb.append(", requestOrganizationAddressId=");
		sb.append(getRequestOrganizationAddressId());
		sb.append(", requestOrganizationWebsiteId=");
		sb.append(getRequestOrganizationWebsiteId());
		sb.append(", subsidiaryGroupId=");
		sb.append(getSubsidiaryGroupId());
		sb.append(", description=");
		sb.append(getDescription());
		sb.append(", employmentType=");
		sb.append(getEmploymentType());
		sb.append(", employmentHoursPerWeek=");
		sb.append(getEmploymentHoursPerWeek());
		sb.append(", purpose=");
		sb.append(getPurpose());
		sb.append(", purposeOther=");
		sb.append(getPurposeOther());
		sb.append(", behalfOf=");
		sb.append(getBehalfOf());
		sb.append(", behalfOfOther=");
		sb.append(getBehalfOfOther());
		sb.append(", status=");
		sb.append(getStatus());
		sb.append(", statusByUserId=");
		sb.append(getStatusByUserId());
		sb.append(", statusByUserName=");
		sb.append(getStatusByUserName());
		sb.append(", statusDate=");
		sb.append(getStatusDate());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(79);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPGrantRequest");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpGrantRequestId</column-name><column-value><![CDATA[");
		sb.append(getEvpGrantRequestId());
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
			"<column><column-name>contactEmailAddressId</column-name><column-value><![CDATA[");
		sb.append(getContactEmailAddressId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>contactPhoneId</column-name><column-value><![CDATA[");
		sb.append(getContactPhoneId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>contactUserId</column-name><column-value><![CDATA[");
		sb.append(getContactUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>evpRequestOrganizationId</column-name><column-value><![CDATA[");
		sb.append(getEvpRequestOrganizationId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>parentEVPGrantRequestId</column-name><column-value><![CDATA[");
		sb.append(getParentEVPGrantRequestId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>requestOrganizationAddressId</column-name><column-value><![CDATA[");
		sb.append(getRequestOrganizationAddressId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>requestOrganizationWebsiteId</column-name><column-value><![CDATA[");
		sb.append(getRequestOrganizationWebsiteId());
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
			"<column><column-name>employmentType</column-name><column-value><![CDATA[");
		sb.append(getEmploymentType());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>employmentHoursPerWeek</column-name><column-value><![CDATA[");
		sb.append(getEmploymentHoursPerWeek());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>purpose</column-name><column-value><![CDATA[");
		sb.append(getPurpose());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>purposeOther</column-name><column-value><![CDATA[");
		sb.append(getPurposeOther());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>behalfOf</column-name><column-value><![CDATA[");
		sb.append(getBehalfOf());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>behalfOfOther</column-name><column-value><![CDATA[");
		sb.append(getBehalfOfOther());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>status</column-name><column-value><![CDATA[");
		sb.append(getStatus());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>statusByUserId</column-name><column-value><![CDATA[");
		sb.append(getStatusByUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>statusByUserName</column-name><column-value><![CDATA[");
		sb.append(getStatusByUserName());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>statusDate</column-name><column-value><![CDATA[");
		sb.append(getStatusDate());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _evpGrantRequestId;
	private long _companyId;
	private long _userId;
	private String _userUuid;
	private String _userName;
	private Date _createDate;
	private Date _modifiedDate;
	private long _contactEmailAddressId;
	private long _contactPhoneId;
	private long _contactUserId;
	private String _contactUserUuid;
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
	private String _statusByUserUuid;
	private String _statusByUserName;
	private Date _statusDate;
	private BaseModel<?> _evpGrantRequestRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
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

import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.ModelWrapper;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link EVPKaleoForkInstance}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstance
 * @generated
 */
public class EVPKaleoForkInstanceWrapper implements EVPKaleoForkInstance,
	ModelWrapper<EVPKaleoForkInstance> {
	public EVPKaleoForkInstanceWrapper(
		EVPKaleoForkInstance evpKaleoForkInstance) {
		_evpKaleoForkInstance = evpKaleoForkInstance;
	}

	@Override
	public Class<?> getModelClass() {
		return EVPKaleoForkInstance.class;
	}

	@Override
	public String getModelClassName() {
		return EVPKaleoForkInstance.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpKaleoForkInstanceId", getEvpKaleoForkInstanceId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("classNameId", getClassNameId());
		attributes.put("classPK", getClassPK());
		attributes.put("type", getType());
		attributes.put("status", getStatus());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpKaleoForkInstanceId = (Long)attributes.get(
				"evpKaleoForkInstanceId");

		if (evpKaleoForkInstanceId != null) {
			setEvpKaleoForkInstanceId(evpKaleoForkInstanceId);
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

		Long classNameId = (Long)attributes.get("classNameId");

		if (classNameId != null) {
			setClassNameId(classNameId);
		}

		Long classPK = (Long)attributes.get("classPK");

		if (classPK != null) {
			setClassPK(classPK);
		}

		Integer type = (Integer)attributes.get("type");

		if (type != null) {
			setType(type);
		}

		Integer status = (Integer)attributes.get("status");

		if (status != null) {
			setStatus(status);
		}
	}

	/**
	* Returns the primary key of this e v p kaleo fork instance.
	*
	* @return the primary key of this e v p kaleo fork instance
	*/
	@Override
	public long getPrimaryKey() {
		return _evpKaleoForkInstance.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p kaleo fork instance.
	*
	* @param primaryKey the primary key of this e v p kaleo fork instance
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpKaleoForkInstance.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp kaleo fork instance ID of this e v p kaleo fork instance.
	*
	* @return the evp kaleo fork instance ID of this e v p kaleo fork instance
	*/
	@Override
	public long getEvpKaleoForkInstanceId() {
		return _evpKaleoForkInstance.getEvpKaleoForkInstanceId();
	}

	/**
	* Sets the evp kaleo fork instance ID of this e v p kaleo fork instance.
	*
	* @param evpKaleoForkInstanceId the evp kaleo fork instance ID of this e v p kaleo fork instance
	*/
	@Override
	public void setEvpKaleoForkInstanceId(long evpKaleoForkInstanceId) {
		_evpKaleoForkInstance.setEvpKaleoForkInstanceId(evpKaleoForkInstanceId);
	}

	/**
	* Returns the company ID of this e v p kaleo fork instance.
	*
	* @return the company ID of this e v p kaleo fork instance
	*/
	@Override
	public long getCompanyId() {
		return _evpKaleoForkInstance.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p kaleo fork instance.
	*
	* @param companyId the company ID of this e v p kaleo fork instance
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpKaleoForkInstance.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p kaleo fork instance.
	*
	* @return the user ID of this e v p kaleo fork instance
	*/
	@Override
	public long getUserId() {
		return _evpKaleoForkInstance.getUserId();
	}

	/**
	* Sets the user ID of this e v p kaleo fork instance.
	*
	* @param userId the user ID of this e v p kaleo fork instance
	*/
	@Override
	public void setUserId(long userId) {
		_evpKaleoForkInstance.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p kaleo fork instance.
	*
	* @return the user uuid of this e v p kaleo fork instance
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpKaleoForkInstance.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p kaleo fork instance.
	*
	* @param userUuid the user uuid of this e v p kaleo fork instance
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpKaleoForkInstance.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p kaleo fork instance.
	*
	* @return the user name of this e v p kaleo fork instance
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpKaleoForkInstance.getUserName();
	}

	/**
	* Sets the user name of this e v p kaleo fork instance.
	*
	* @param userName the user name of this e v p kaleo fork instance
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpKaleoForkInstance.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p kaleo fork instance.
	*
	* @return the create date of this e v p kaleo fork instance
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpKaleoForkInstance.getCreateDate();
	}

	/**
	* Sets the create date of this e v p kaleo fork instance.
	*
	* @param createDate the create date of this e v p kaleo fork instance
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpKaleoForkInstance.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p kaleo fork instance.
	*
	* @return the modified date of this e v p kaleo fork instance
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpKaleoForkInstance.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p kaleo fork instance.
	*
	* @param modifiedDate the modified date of this e v p kaleo fork instance
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpKaleoForkInstance.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the fully qualified class name of this e v p kaleo fork instance.
	*
	* @return the fully qualified class name of this e v p kaleo fork instance
	*/
	@Override
	public java.lang.String getClassName() {
		return _evpKaleoForkInstance.getClassName();
	}

	@Override
	public void setClassName(java.lang.String className) {
		_evpKaleoForkInstance.setClassName(className);
	}

	/**
	* Returns the class name ID of this e v p kaleo fork instance.
	*
	* @return the class name ID of this e v p kaleo fork instance
	*/
	@Override
	public long getClassNameId() {
		return _evpKaleoForkInstance.getClassNameId();
	}

	/**
	* Sets the class name ID of this e v p kaleo fork instance.
	*
	* @param classNameId the class name ID of this e v p kaleo fork instance
	*/
	@Override
	public void setClassNameId(long classNameId) {
		_evpKaleoForkInstance.setClassNameId(classNameId);
	}

	/**
	* Returns the class p k of this e v p kaleo fork instance.
	*
	* @return the class p k of this e v p kaleo fork instance
	*/
	@Override
	public long getClassPK() {
		return _evpKaleoForkInstance.getClassPK();
	}

	/**
	* Sets the class p k of this e v p kaleo fork instance.
	*
	* @param classPK the class p k of this e v p kaleo fork instance
	*/
	@Override
	public void setClassPK(long classPK) {
		_evpKaleoForkInstance.setClassPK(classPK);
	}

	/**
	* Returns the type of this e v p kaleo fork instance.
	*
	* @return the type of this e v p kaleo fork instance
	*/
	@Override
	public int getType() {
		return _evpKaleoForkInstance.getType();
	}

	/**
	* Sets the type of this e v p kaleo fork instance.
	*
	* @param type the type of this e v p kaleo fork instance
	*/
	@Override
	public void setType(int type) {
		_evpKaleoForkInstance.setType(type);
	}

	/**
	* Returns the status of this e v p kaleo fork instance.
	*
	* @return the status of this e v p kaleo fork instance
	*/
	@Override
	public int getStatus() {
		return _evpKaleoForkInstance.getStatus();
	}

	/**
	* Sets the status of this e v p kaleo fork instance.
	*
	* @param status the status of this e v p kaleo fork instance
	*/
	@Override
	public void setStatus(int status) {
		_evpKaleoForkInstance.setStatus(status);
	}

	@Override
	public boolean isNew() {
		return _evpKaleoForkInstance.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpKaleoForkInstance.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpKaleoForkInstance.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpKaleoForkInstance.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpKaleoForkInstance.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpKaleoForkInstance.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpKaleoForkInstance.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpKaleoForkInstance.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpKaleoForkInstance.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpKaleoForkInstance.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpKaleoForkInstance.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPKaleoForkInstanceWrapper((EVPKaleoForkInstance)_evpKaleoForkInstance.clone());
	}

	@Override
	public int compareTo(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance) {
		return _evpKaleoForkInstance.compareTo(evpKaleoForkInstance);
	}

	@Override
	public int hashCode() {
		return _evpKaleoForkInstance.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPKaleoForkInstance> toCacheModel() {
		return _evpKaleoForkInstance.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPKaleoForkInstance toEscapedModel() {
		return new EVPKaleoForkInstanceWrapper(_evpKaleoForkInstance.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPKaleoForkInstance toUnescapedModel() {
		return new EVPKaleoForkInstanceWrapper(_evpKaleoForkInstance.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpKaleoForkInstance.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpKaleoForkInstance.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpKaleoForkInstance.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPKaleoForkInstanceWrapper)) {
			return false;
		}

		EVPKaleoForkInstanceWrapper evpKaleoForkInstanceWrapper = (EVPKaleoForkInstanceWrapper)obj;

		if (Validator.equals(_evpKaleoForkInstance,
					evpKaleoForkInstanceWrapper._evpKaleoForkInstance)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPKaleoForkInstance getWrappedEVPKaleoForkInstance() {
		return _evpKaleoForkInstance;
	}

	@Override
	public EVPKaleoForkInstance getWrappedModel() {
		return _evpKaleoForkInstance;
	}

	@Override
	public void resetOriginalValues() {
		_evpKaleoForkInstance.resetOriginalValues();
	}

	private EVPKaleoForkInstance _evpKaleoForkInstance;
}
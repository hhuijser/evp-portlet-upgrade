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
 * This class is a wrapper for {@link EVPDivision}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPDivision
 * @generated
 */
public class EVPDivisionWrapper implements EVPDivision,
	ModelWrapper<EVPDivision> {
	public EVPDivisionWrapper(EVPDivision evpDivision) {
		_evpDivision = evpDivision;
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

	/**
	* Returns the primary key of this e v p division.
	*
	* @return the primary key of this e v p division
	*/
	@Override
	public long getPrimaryKey() {
		return _evpDivision.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p division.
	*
	* @param primaryKey the primary key of this e v p division
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpDivision.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp division ID of this e v p division.
	*
	* @return the evp division ID of this e v p division
	*/
	@Override
	public long getEvpDivisionId() {
		return _evpDivision.getEvpDivisionId();
	}

	/**
	* Sets the evp division ID of this e v p division.
	*
	* @param evpDivisionId the evp division ID of this e v p division
	*/
	@Override
	public void setEvpDivisionId(long evpDivisionId) {
		_evpDivision.setEvpDivisionId(evpDivisionId);
	}

	/**
	* Returns the company ID of this e v p division.
	*
	* @return the company ID of this e v p division
	*/
	@Override
	public long getCompanyId() {
		return _evpDivision.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p division.
	*
	* @param companyId the company ID of this e v p division
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpDivision.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p division.
	*
	* @return the user ID of this e v p division
	*/
	@Override
	public long getUserId() {
		return _evpDivision.getUserId();
	}

	/**
	* Sets the user ID of this e v p division.
	*
	* @param userId the user ID of this e v p division
	*/
	@Override
	public void setUserId(long userId) {
		_evpDivision.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p division.
	*
	* @return the user uuid of this e v p division
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpDivision.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p division.
	*
	* @param userUuid the user uuid of this e v p division
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpDivision.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p division.
	*
	* @return the user name of this e v p division
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpDivision.getUserName();
	}

	/**
	* Sets the user name of this e v p division.
	*
	* @param userName the user name of this e v p division
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpDivision.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p division.
	*
	* @return the create date of this e v p division
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpDivision.getCreateDate();
	}

	/**
	* Sets the create date of this e v p division.
	*
	* @param createDate the create date of this e v p division
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpDivision.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p division.
	*
	* @return the modified date of this e v p division
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpDivision.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p division.
	*
	* @param modifiedDate the modified date of this e v p division
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpDivision.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the organization ID of this e v p division.
	*
	* @return the organization ID of this e v p division
	*/
	@Override
	public long getOrganizationId() {
		return _evpDivision.getOrganizationId();
	}

	/**
	* Sets the organization ID of this e v p division.
	*
	* @param organizationId the organization ID of this e v p division
	*/
	@Override
	public void setOrganizationId(long organizationId) {
		_evpDivision.setOrganizationId(organizationId);
	}

	/**
	* Returns the parent e v p division ID of this e v p division.
	*
	* @return the parent e v p division ID of this e v p division
	*/
	@Override
	public long getParentEVPDivisionId() {
		return _evpDivision.getParentEVPDivisionId();
	}

	/**
	* Sets the parent e v p division ID of this e v p division.
	*
	* @param parentEVPDivisionId the parent e v p division ID of this e v p division
	*/
	@Override
	public void setParentEVPDivisionId(long parentEVPDivisionId) {
		_evpDivision.setParentEVPDivisionId(parentEVPDivisionId);
	}

	/**
	* Returns the abbreviation of this e v p division.
	*
	* @return the abbreviation of this e v p division
	*/
	@Override
	public java.lang.String getAbbreviation() {
		return _evpDivision.getAbbreviation();
	}

	/**
	* Sets the abbreviation of this e v p division.
	*
	* @param abbreviation the abbreviation of this e v p division
	*/
	@Override
	public void setAbbreviation(java.lang.String abbreviation) {
		_evpDivision.setAbbreviation(abbreviation);
	}

	/**
	* Returns the type of this e v p division.
	*
	* @return the type of this e v p division
	*/
	@Override
	public int getType() {
		return _evpDivision.getType();
	}

	/**
	* Sets the type of this e v p division.
	*
	* @param type the type of this e v p division
	*/
	@Override
	public void setType(int type) {
		_evpDivision.setType(type);
	}

	@Override
	public boolean isNew() {
		return _evpDivision.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpDivision.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpDivision.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpDivision.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpDivision.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpDivision.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpDivision.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpDivision.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpDivision.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpDivision.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpDivision.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPDivisionWrapper((EVPDivision)_evpDivision.clone());
	}

	@Override
	public int compareTo(com.liferay.evp.model.EVPDivision evpDivision) {
		return _evpDivision.compareTo(evpDivision);
	}

	@Override
	public int hashCode() {
		return _evpDivision.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPDivision> toCacheModel() {
		return _evpDivision.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPDivision toEscapedModel() {
		return new EVPDivisionWrapper(_evpDivision.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPDivision toUnescapedModel() {
		return new EVPDivisionWrapper(_evpDivision.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpDivision.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpDivision.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpDivision.persist();
	}

	@Override
	public long getOrganizationGroupId() {
		return _evpDivision.getOrganizationGroupId();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPDivisionWrapper)) {
			return false;
		}

		EVPDivisionWrapper evpDivisionWrapper = (EVPDivisionWrapper)obj;

		if (Validator.equals(_evpDivision, evpDivisionWrapper._evpDivision)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPDivision getWrappedEVPDivision() {
		return _evpDivision;
	}

	@Override
	public EVPDivision getWrappedModel() {
		return _evpDivision;
	}

	@Override
	public void resetOriginalValues() {
		_evpDivision.resetOriginalValues();
	}

	private EVPDivision _evpDivision;
}
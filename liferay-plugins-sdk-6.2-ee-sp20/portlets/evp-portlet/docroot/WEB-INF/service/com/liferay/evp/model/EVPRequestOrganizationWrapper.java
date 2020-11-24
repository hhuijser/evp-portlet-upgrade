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
 * This class is a wrapper for {@link EVPRequestOrganization}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPRequestOrganization
 * @generated
 */
public class EVPRequestOrganizationWrapper implements EVPRequestOrganization,
	ModelWrapper<EVPRequestOrganization> {
	public EVPRequestOrganizationWrapper(
		EVPRequestOrganization evpRequestOrganization) {
		_evpRequestOrganization = evpRequestOrganization;
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

	/**
	* Returns the primary key of this e v p request organization.
	*
	* @return the primary key of this e v p request organization
	*/
	@Override
	public long getPrimaryKey() {
		return _evpRequestOrganization.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p request organization.
	*
	* @param primaryKey the primary key of this e v p request organization
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpRequestOrganization.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp request organization ID of this e v p request organization.
	*
	* @return the evp request organization ID of this e v p request organization
	*/
	@Override
	public long getEvpRequestOrganizationId() {
		return _evpRequestOrganization.getEvpRequestOrganizationId();
	}

	/**
	* Sets the evp request organization ID of this e v p request organization.
	*
	* @param evpRequestOrganizationId the evp request organization ID of this e v p request organization
	*/
	@Override
	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpRequestOrganization.setEvpRequestOrganizationId(evpRequestOrganizationId);
	}

	/**
	* Returns the company ID of this e v p request organization.
	*
	* @return the company ID of this e v p request organization
	*/
	@Override
	public long getCompanyId() {
		return _evpRequestOrganization.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p request organization.
	*
	* @param companyId the company ID of this e v p request organization
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpRequestOrganization.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p request organization.
	*
	* @return the user ID of this e v p request organization
	*/
	@Override
	public long getUserId() {
		return _evpRequestOrganization.getUserId();
	}

	/**
	* Sets the user ID of this e v p request organization.
	*
	* @param userId the user ID of this e v p request organization
	*/
	@Override
	public void setUserId(long userId) {
		_evpRequestOrganization.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p request organization.
	*
	* @return the user uuid of this e v p request organization
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpRequestOrganization.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p request organization.
	*
	* @param userUuid the user uuid of this e v p request organization
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpRequestOrganization.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p request organization.
	*
	* @return the user name of this e v p request organization
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpRequestOrganization.getUserName();
	}

	/**
	* Sets the user name of this e v p request organization.
	*
	* @param userName the user name of this e v p request organization
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpRequestOrganization.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p request organization.
	*
	* @return the create date of this e v p request organization
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpRequestOrganization.getCreateDate();
	}

	/**
	* Sets the create date of this e v p request organization.
	*
	* @param createDate the create date of this e v p request organization
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpRequestOrganization.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p request organization.
	*
	* @return the modified date of this e v p request organization
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpRequestOrganization.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p request organization.
	*
	* @param modifiedDate the modified date of this e v p request organization
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpRequestOrganization.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the organization ID of this e v p request organization.
	*
	* @return the organization ID of this e v p request organization
	*/
	@Override
	public long getOrganizationId() {
		return _evpRequestOrganization.getOrganizationId();
	}

	/**
	* Sets the organization ID of this e v p request organization.
	*
	* @param organizationId the organization ID of this e v p request organization
	*/
	@Override
	public void setOrganizationId(long organizationId) {
		_evpRequestOrganization.setOrganizationId(organizationId);
	}

	/**
	* Returns the subsidiary group ID of this e v p request organization.
	*
	* @return the subsidiary group ID of this e v p request organization
	*/
	@Override
	public long getSubsidiaryGroupId() {
		return _evpRequestOrganization.getSubsidiaryGroupId();
	}

	/**
	* Sets the subsidiary group ID of this e v p request organization.
	*
	* @param subsidiaryGroupId the subsidiary group ID of this e v p request organization
	*/
	@Override
	public void setSubsidiaryGroupId(long subsidiaryGroupId) {
		_evpRequestOrganization.setSubsidiaryGroupId(subsidiaryGroupId);
	}

	/**
	* Returns the description of this e v p request organization.
	*
	* @return the description of this e v p request organization
	*/
	@Override
	public java.lang.String getDescription() {
		return _evpRequestOrganization.getDescription();
	}

	/**
	* Sets the description of this e v p request organization.
	*
	* @param description the description of this e v p request organization
	*/
	@Override
	public void setDescription(java.lang.String description) {
		_evpRequestOrganization.setDescription(description);
	}

	/**
	* Returns the tax identification number of this e v p request organization.
	*
	* @return the tax identification number of this e v p request organization
	*/
	@Override
	public java.lang.String getTaxIdentificationNumber() {
		return _evpRequestOrganization.getTaxIdentificationNumber();
	}

	/**
	* Sets the tax identification number of this e v p request organization.
	*
	* @param taxIdentificationNumber the tax identification number of this e v p request organization
	*/
	@Override
	public void setTaxIdentificationNumber(
		java.lang.String taxIdentificationNumber) {
		_evpRequestOrganization.setTaxIdentificationNumber(taxIdentificationNumber);
	}

	/**
	* Returns the nonprofit type of this e v p request organization.
	*
	* @return the nonprofit type of this e v p request organization
	*/
	@Override
	public int getNonprofitType() {
		return _evpRequestOrganization.getNonprofitType();
	}

	/**
	* Sets the nonprofit type of this e v p request organization.
	*
	* @param nonprofitType the nonprofit type of this e v p request organization
	*/
	@Override
	public void setNonprofitType(int nonprofitType) {
		_evpRequestOrganization.setNonprofitType(nonprofitType);
	}

	/**
	* Returns the verified of this e v p request organization.
	*
	* @return the verified of this e v p request organization
	*/
	@Override
	public boolean getVerified() {
		return _evpRequestOrganization.getVerified();
	}

	/**
	* Returns <code>true</code> if this e v p request organization is verified.
	*
	* @return <code>true</code> if this e v p request organization is verified; <code>false</code> otherwise
	*/
	@Override
	public boolean isVerified() {
		return _evpRequestOrganization.isVerified();
	}

	/**
	* Sets whether this e v p request organization is verified.
	*
	* @param verified the verified of this e v p request organization
	*/
	@Override
	public void setVerified(boolean verified) {
		_evpRequestOrganization.setVerified(verified);
	}

	/**
	* Returns the shared of this e v p request organization.
	*
	* @return the shared of this e v p request organization
	*/
	@Override
	public boolean getShared() {
		return _evpRequestOrganization.getShared();
	}

	/**
	* Returns <code>true</code> if this e v p request organization is shared.
	*
	* @return <code>true</code> if this e v p request organization is shared; <code>false</code> otherwise
	*/
	@Override
	public boolean isShared() {
		return _evpRequestOrganization.isShared();
	}

	/**
	* Sets whether this e v p request organization is shared.
	*
	* @param shared the shared of this e v p request organization
	*/
	@Override
	public void setShared(boolean shared) {
		_evpRequestOrganization.setShared(shared);
	}

	@Override
	public boolean isNew() {
		return _evpRequestOrganization.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpRequestOrganization.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpRequestOrganization.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpRequestOrganization.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpRequestOrganization.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpRequestOrganization.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpRequestOrganization.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpRequestOrganization.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpRequestOrganization.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpRequestOrganization.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpRequestOrganization.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPRequestOrganizationWrapper((EVPRequestOrganization)_evpRequestOrganization.clone());
	}

	@Override
	public int compareTo(
		com.liferay.evp.model.EVPRequestOrganization evpRequestOrganization) {
		return _evpRequestOrganization.compareTo(evpRequestOrganization);
	}

	@Override
	public int hashCode() {
		return _evpRequestOrganization.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPRequestOrganization> toCacheModel() {
		return _evpRequestOrganization.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPRequestOrganization toEscapedModel() {
		return new EVPRequestOrganizationWrapper(_evpRequestOrganization.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPRequestOrganization toUnescapedModel() {
		return new EVPRequestOrganizationWrapper(_evpRequestOrganization.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpRequestOrganization.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpRequestOrganization.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpRequestOrganization.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPRequestOrganizationWrapper)) {
			return false;
		}

		EVPRequestOrganizationWrapper evpRequestOrganizationWrapper = (EVPRequestOrganizationWrapper)obj;

		if (Validator.equals(_evpRequestOrganization,
					evpRequestOrganizationWrapper._evpRequestOrganization)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPRequestOrganization getWrappedEVPRequestOrganization() {
		return _evpRequestOrganization;
	}

	@Override
	public EVPRequestOrganization getWrappedModel() {
		return _evpRequestOrganization;
	}

	@Override
	public void resetOriginalValues() {
		_evpRequestOrganization.resetOriginalValues();
	}

	private EVPRequestOrganization _evpRequestOrganization;
}
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
 * This class is a wrapper for {@link EVPGrantRequest}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPGrantRequest
 * @generated
 */
public class EVPGrantRequestWrapper implements EVPGrantRequest,
	ModelWrapper<EVPGrantRequest> {
	public EVPGrantRequestWrapper(EVPGrantRequest evpGrantRequest) {
		_evpGrantRequest = evpGrantRequest;
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

	/**
	* Returns the primary key of this e v p grant request.
	*
	* @return the primary key of this e v p grant request
	*/
	@Override
	public long getPrimaryKey() {
		return _evpGrantRequest.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p grant request.
	*
	* @param primaryKey the primary key of this e v p grant request
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpGrantRequest.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp grant request ID of this e v p grant request.
	*
	* @return the evp grant request ID of this e v p grant request
	*/
	@Override
	public long getEvpGrantRequestId() {
		return _evpGrantRequest.getEvpGrantRequestId();
	}

	/**
	* Sets the evp grant request ID of this e v p grant request.
	*
	* @param evpGrantRequestId the evp grant request ID of this e v p grant request
	*/
	@Override
	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantRequest.setEvpGrantRequestId(evpGrantRequestId);
	}

	/**
	* Returns the company ID of this e v p grant request.
	*
	* @return the company ID of this e v p grant request
	*/
	@Override
	public long getCompanyId() {
		return _evpGrantRequest.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p grant request.
	*
	* @param companyId the company ID of this e v p grant request
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpGrantRequest.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p grant request.
	*
	* @return the user ID of this e v p grant request
	*/
	@Override
	public long getUserId() {
		return _evpGrantRequest.getUserId();
	}

	/**
	* Sets the user ID of this e v p grant request.
	*
	* @param userId the user ID of this e v p grant request
	*/
	@Override
	public void setUserId(long userId) {
		_evpGrantRequest.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p grant request.
	*
	* @return the user uuid of this e v p grant request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequest.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p grant request.
	*
	* @param userUuid the user uuid of this e v p grant request
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpGrantRequest.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p grant request.
	*
	* @return the user name of this e v p grant request
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpGrantRequest.getUserName();
	}

	/**
	* Sets the user name of this e v p grant request.
	*
	* @param userName the user name of this e v p grant request
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpGrantRequest.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p grant request.
	*
	* @return the create date of this e v p grant request
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpGrantRequest.getCreateDate();
	}

	/**
	* Sets the create date of this e v p grant request.
	*
	* @param createDate the create date of this e v p grant request
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpGrantRequest.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p grant request.
	*
	* @return the modified date of this e v p grant request
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpGrantRequest.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p grant request.
	*
	* @param modifiedDate the modified date of this e v p grant request
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpGrantRequest.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the contact email address ID of this e v p grant request.
	*
	* @return the contact email address ID of this e v p grant request
	*/
	@Override
	public long getContactEmailAddressId() {
		return _evpGrantRequest.getContactEmailAddressId();
	}

	/**
	* Sets the contact email address ID of this e v p grant request.
	*
	* @param contactEmailAddressId the contact email address ID of this e v p grant request
	*/
	@Override
	public void setContactEmailAddressId(long contactEmailAddressId) {
		_evpGrantRequest.setContactEmailAddressId(contactEmailAddressId);
	}

	/**
	* Returns the contact phone ID of this e v p grant request.
	*
	* @return the contact phone ID of this e v p grant request
	*/
	@Override
	public long getContactPhoneId() {
		return _evpGrantRequest.getContactPhoneId();
	}

	/**
	* Sets the contact phone ID of this e v p grant request.
	*
	* @param contactPhoneId the contact phone ID of this e v p grant request
	*/
	@Override
	public void setContactPhoneId(long contactPhoneId) {
		_evpGrantRequest.setContactPhoneId(contactPhoneId);
	}

	/**
	* Returns the contact user ID of this e v p grant request.
	*
	* @return the contact user ID of this e v p grant request
	*/
	@Override
	public long getContactUserId() {
		return _evpGrantRequest.getContactUserId();
	}

	/**
	* Sets the contact user ID of this e v p grant request.
	*
	* @param contactUserId the contact user ID of this e v p grant request
	*/
	@Override
	public void setContactUserId(long contactUserId) {
		_evpGrantRequest.setContactUserId(contactUserId);
	}

	/**
	* Returns the contact user uuid of this e v p grant request.
	*
	* @return the contact user uuid of this e v p grant request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getContactUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequest.getContactUserUuid();
	}

	/**
	* Sets the contact user uuid of this e v p grant request.
	*
	* @param contactUserUuid the contact user uuid of this e v p grant request
	*/
	@Override
	public void setContactUserUuid(java.lang.String contactUserUuid) {
		_evpGrantRequest.setContactUserUuid(contactUserUuid);
	}

	/**
	* Returns the evp request organization ID of this e v p grant request.
	*
	* @return the evp request organization ID of this e v p grant request
	*/
	@Override
	public long getEvpRequestOrganizationId() {
		return _evpGrantRequest.getEvpRequestOrganizationId();
	}

	/**
	* Sets the evp request organization ID of this e v p grant request.
	*
	* @param evpRequestOrganizationId the evp request organization ID of this e v p grant request
	*/
	@Override
	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpGrantRequest.setEvpRequestOrganizationId(evpRequestOrganizationId);
	}

	/**
	* Returns the parent e v p grant request ID of this e v p grant request.
	*
	* @return the parent e v p grant request ID of this e v p grant request
	*/
	@Override
	public long getParentEVPGrantRequestId() {
		return _evpGrantRequest.getParentEVPGrantRequestId();
	}

	/**
	* Sets the parent e v p grant request ID of this e v p grant request.
	*
	* @param parentEVPGrantRequestId the parent e v p grant request ID of this e v p grant request
	*/
	@Override
	public void setParentEVPGrantRequestId(long parentEVPGrantRequestId) {
		_evpGrantRequest.setParentEVPGrantRequestId(parentEVPGrantRequestId);
	}

	/**
	* Returns the request organization address ID of this e v p grant request.
	*
	* @return the request organization address ID of this e v p grant request
	*/
	@Override
	public long getRequestOrganizationAddressId() {
		return _evpGrantRequest.getRequestOrganizationAddressId();
	}

	/**
	* Sets the request organization address ID of this e v p grant request.
	*
	* @param requestOrganizationAddressId the request organization address ID of this e v p grant request
	*/
	@Override
	public void setRequestOrganizationAddressId(
		long requestOrganizationAddressId) {
		_evpGrantRequest.setRequestOrganizationAddressId(requestOrganizationAddressId);
	}

	/**
	* Returns the request organization website ID of this e v p grant request.
	*
	* @return the request organization website ID of this e v p grant request
	*/
	@Override
	public long getRequestOrganizationWebsiteId() {
		return _evpGrantRequest.getRequestOrganizationWebsiteId();
	}

	/**
	* Sets the request organization website ID of this e v p grant request.
	*
	* @param requestOrganizationWebsiteId the request organization website ID of this e v p grant request
	*/
	@Override
	public void setRequestOrganizationWebsiteId(
		long requestOrganizationWebsiteId) {
		_evpGrantRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsiteId);
	}

	/**
	* Returns the subsidiary group ID of this e v p grant request.
	*
	* @return the subsidiary group ID of this e v p grant request
	*/
	@Override
	public long getSubsidiaryGroupId() {
		return _evpGrantRequest.getSubsidiaryGroupId();
	}

	/**
	* Sets the subsidiary group ID of this e v p grant request.
	*
	* @param subsidiaryGroupId the subsidiary group ID of this e v p grant request
	*/
	@Override
	public void setSubsidiaryGroupId(long subsidiaryGroupId) {
		_evpGrantRequest.setSubsidiaryGroupId(subsidiaryGroupId);
	}

	/**
	* Returns the description of this e v p grant request.
	*
	* @return the description of this e v p grant request
	*/
	@Override
	public java.lang.String getDescription() {
		return _evpGrantRequest.getDescription();
	}

	/**
	* Sets the description of this e v p grant request.
	*
	* @param description the description of this e v p grant request
	*/
	@Override
	public void setDescription(java.lang.String description) {
		_evpGrantRequest.setDescription(description);
	}

	/**
	* Returns the employment type of this e v p grant request.
	*
	* @return the employment type of this e v p grant request
	*/
	@Override
	public int getEmploymentType() {
		return _evpGrantRequest.getEmploymentType();
	}

	/**
	* Sets the employment type of this e v p grant request.
	*
	* @param employmentType the employment type of this e v p grant request
	*/
	@Override
	public void setEmploymentType(int employmentType) {
		_evpGrantRequest.setEmploymentType(employmentType);
	}

	/**
	* Returns the employment hours per week of this e v p grant request.
	*
	* @return the employment hours per week of this e v p grant request
	*/
	@Override
	public int getEmploymentHoursPerWeek() {
		return _evpGrantRequest.getEmploymentHoursPerWeek();
	}

	/**
	* Sets the employment hours per week of this e v p grant request.
	*
	* @param employmentHoursPerWeek the employment hours per week of this e v p grant request
	*/
	@Override
	public void setEmploymentHoursPerWeek(int employmentHoursPerWeek) {
		_evpGrantRequest.setEmploymentHoursPerWeek(employmentHoursPerWeek);
	}

	/**
	* Returns the purpose of this e v p grant request.
	*
	* @return the purpose of this e v p grant request
	*/
	@Override
	public java.lang.String getPurpose() {
		return _evpGrantRequest.getPurpose();
	}

	/**
	* Sets the purpose of this e v p grant request.
	*
	* @param purpose the purpose of this e v p grant request
	*/
	@Override
	public void setPurpose(java.lang.String purpose) {
		_evpGrantRequest.setPurpose(purpose);
	}

	/**
	* Returns the purpose other of this e v p grant request.
	*
	* @return the purpose other of this e v p grant request
	*/
	@Override
	public java.lang.String getPurposeOther() {
		return _evpGrantRequest.getPurposeOther();
	}

	/**
	* Sets the purpose other of this e v p grant request.
	*
	* @param purposeOther the purpose other of this e v p grant request
	*/
	@Override
	public void setPurposeOther(java.lang.String purposeOther) {
		_evpGrantRequest.setPurposeOther(purposeOther);
	}

	/**
	* Returns the behalf of of this e v p grant request.
	*
	* @return the behalf of of this e v p grant request
	*/
	@Override
	public java.lang.String getBehalfOf() {
		return _evpGrantRequest.getBehalfOf();
	}

	/**
	* Sets the behalf of of this e v p grant request.
	*
	* @param behalfOf the behalf of of this e v p grant request
	*/
	@Override
	public void setBehalfOf(java.lang.String behalfOf) {
		_evpGrantRequest.setBehalfOf(behalfOf);
	}

	/**
	* Returns the behalf of other of this e v p grant request.
	*
	* @return the behalf of other of this e v p grant request
	*/
	@Override
	public java.lang.String getBehalfOfOther() {
		return _evpGrantRequest.getBehalfOfOther();
	}

	/**
	* Sets the behalf of other of this e v p grant request.
	*
	* @param behalfOfOther the behalf of other of this e v p grant request
	*/
	@Override
	public void setBehalfOfOther(java.lang.String behalfOfOther) {
		_evpGrantRequest.setBehalfOfOther(behalfOfOther);
	}

	/**
	* Returns the status of this e v p grant request.
	*
	* @return the status of this e v p grant request
	*/
	@Override
	public int getStatus() {
		return _evpGrantRequest.getStatus();
	}

	/**
	* Sets the status of this e v p grant request.
	*
	* @param status the status of this e v p grant request
	*/
	@Override
	public void setStatus(int status) {
		_evpGrantRequest.setStatus(status);
	}

	/**
	* Returns the status by user ID of this e v p grant request.
	*
	* @return the status by user ID of this e v p grant request
	*/
	@Override
	public long getStatusByUserId() {
		return _evpGrantRequest.getStatusByUserId();
	}

	/**
	* Sets the status by user ID of this e v p grant request.
	*
	* @param statusByUserId the status by user ID of this e v p grant request
	*/
	@Override
	public void setStatusByUserId(long statusByUserId) {
		_evpGrantRequest.setStatusByUserId(statusByUserId);
	}

	/**
	* Returns the status by user uuid of this e v p grant request.
	*
	* @return the status by user uuid of this e v p grant request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getStatusByUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequest.getStatusByUserUuid();
	}

	/**
	* Sets the status by user uuid of this e v p grant request.
	*
	* @param statusByUserUuid the status by user uuid of this e v p grant request
	*/
	@Override
	public void setStatusByUserUuid(java.lang.String statusByUserUuid) {
		_evpGrantRequest.setStatusByUserUuid(statusByUserUuid);
	}

	/**
	* Returns the status by user name of this e v p grant request.
	*
	* @return the status by user name of this e v p grant request
	*/
	@Override
	public java.lang.String getStatusByUserName() {
		return _evpGrantRequest.getStatusByUserName();
	}

	/**
	* Sets the status by user name of this e v p grant request.
	*
	* @param statusByUserName the status by user name of this e v p grant request
	*/
	@Override
	public void setStatusByUserName(java.lang.String statusByUserName) {
		_evpGrantRequest.setStatusByUserName(statusByUserName);
	}

	/**
	* Returns the status date of this e v p grant request.
	*
	* @return the status date of this e v p grant request
	*/
	@Override
	public java.util.Date getStatusDate() {
		return _evpGrantRequest.getStatusDate();
	}

	/**
	* Sets the status date of this e v p grant request.
	*
	* @param statusDate the status date of this e v p grant request
	*/
	@Override
	public void setStatusDate(java.util.Date statusDate) {
		_evpGrantRequest.setStatusDate(statusDate);
	}

	/**
	* @deprecated As of 6.1.0, replaced by {@link #isApproved()}
	*/
	@Override
	public boolean getApproved() {
		return _evpGrantRequest.getApproved();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is approved.
	*
	* @return <code>true</code> if this e v p grant request is approved; <code>false</code> otherwise
	*/
	@Override
	public boolean isApproved() {
		return _evpGrantRequest.isApproved();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is denied.
	*
	* @return <code>true</code> if this e v p grant request is denied; <code>false</code> otherwise
	*/
	@Override
	public boolean isDenied() {
		return _evpGrantRequest.isDenied();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is a draft.
	*
	* @return <code>true</code> if this e v p grant request is a draft; <code>false</code> otherwise
	*/
	@Override
	public boolean isDraft() {
		return _evpGrantRequest.isDraft();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is expired.
	*
	* @return <code>true</code> if this e v p grant request is expired; <code>false</code> otherwise
	*/
	@Override
	public boolean isExpired() {
		return _evpGrantRequest.isExpired();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is inactive.
	*
	* @return <code>true</code> if this e v p grant request is inactive; <code>false</code> otherwise
	*/
	@Override
	public boolean isInactive() {
		return _evpGrantRequest.isInactive();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is incomplete.
	*
	* @return <code>true</code> if this e v p grant request is incomplete; <code>false</code> otherwise
	*/
	@Override
	public boolean isIncomplete() {
		return _evpGrantRequest.isIncomplete();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is pending.
	*
	* @return <code>true</code> if this e v p grant request is pending; <code>false</code> otherwise
	*/
	@Override
	public boolean isPending() {
		return _evpGrantRequest.isPending();
	}

	/**
	* Returns <code>true</code> if this e v p grant request is scheduled.
	*
	* @return <code>true</code> if this e v p grant request is scheduled; <code>false</code> otherwise
	*/
	@Override
	public boolean isScheduled() {
		return _evpGrantRequest.isScheduled();
	}

	@Override
	public boolean isNew() {
		return _evpGrantRequest.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpGrantRequest.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpGrantRequest.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpGrantRequest.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpGrantRequest.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpGrantRequest.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpGrantRequest.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpGrantRequest.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpGrantRequest.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpGrantRequest.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpGrantRequest.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPGrantRequestWrapper((EVPGrantRequest)_evpGrantRequest.clone());
	}

	@Override
	public int compareTo(com.liferay.evp.model.EVPGrantRequest evpGrantRequest) {
		return _evpGrantRequest.compareTo(evpGrantRequest);
	}

	@Override
	public int hashCode() {
		return _evpGrantRequest.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPGrantRequest> toCacheModel() {
		return _evpGrantRequest.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPGrantRequest toEscapedModel() {
		return new EVPGrantRequestWrapper(_evpGrantRequest.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPGrantRequest toUnescapedModel() {
		return new EVPGrantRequestWrapper(_evpGrantRequest.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpGrantRequest.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpGrantRequest.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpGrantRequest.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPGrantRequestWrapper)) {
			return false;
		}

		EVPGrantRequestWrapper evpGrantRequestWrapper = (EVPGrantRequestWrapper)obj;

		if (Validator.equals(_evpGrantRequest,
					evpGrantRequestWrapper._evpGrantRequest)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPGrantRequest getWrappedEVPGrantRequest() {
		return _evpGrantRequest;
	}

	@Override
	public EVPGrantRequest getWrappedModel() {
		return _evpGrantRequest;
	}

	@Override
	public void resetOriginalValues() {
		_evpGrantRequest.resetOriginalValues();
	}

	private EVPGrantRequest _evpGrantRequest;
}
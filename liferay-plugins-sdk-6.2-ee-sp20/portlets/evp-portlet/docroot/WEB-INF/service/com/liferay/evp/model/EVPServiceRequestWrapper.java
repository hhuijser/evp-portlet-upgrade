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
 * This class is a wrapper for {@link EVPServiceRequest}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPServiceRequest
 * @generated
 */
public class EVPServiceRequestWrapper implements EVPServiceRequest,
	ModelWrapper<EVPServiceRequest> {
	public EVPServiceRequestWrapper(EVPServiceRequest evpServiceRequest) {
		_evpServiceRequest = evpServiceRequest;
	}

	@Override
	public Class<?> getModelClass() {
		return EVPServiceRequest.class;
	}

	@Override
	public String getModelClassName() {
		return EVPServiceRequest.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpServiceRequestId", getEvpServiceRequestId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("contactEmailAddressId", getContactEmailAddressId());
		attributes.put("contactPhoneId", getContactPhoneId());
		attributes.put("contactUserId", getContactUserId());
		attributes.put("evpRequestOrganizationId", getEvpRequestOrganizationId());
		attributes.put("managerUserId", getManagerUserId());
		attributes.put("parentEVPServiceRequestId",
			getParentEVPServiceRequestId());
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
		attributes.put("requestedStartDate", getRequestedStartDate());
		attributes.put("requestedEndDate", getRequestedEndDate());
		attributes.put("requestedTotalHours", getRequestedTotalHours());
		attributes.put("promoteTrip", getPromoteTrip());
		attributes.put("confirmedStartDate", getConfirmedStartDate());
		attributes.put("confirmedEndDate", getConfirmedEndDate());
		attributes.put("confirmedTotalHours", getConfirmedTotalHours());
		attributes.put("contactBenefit", getContactBenefit());
		attributes.put("contactComments", getContactComments());
		attributes.put("hash", getHash());
		attributes.put("feedbackDescription", getFeedbackDescription());
		attributes.put("employeeBenefit", getEmployeeBenefit());
		attributes.put("recipientBenefit", getRecipientBenefit());
		attributes.put("shareStory", getShareStory());
		attributes.put("status", getStatus());
		attributes.put("statusByUserId", getStatusByUserId());
		attributes.put("statusByUserName", getStatusByUserName());
		attributes.put("statusDate", getStatusDate());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpServiceRequestId = (Long)attributes.get("evpServiceRequestId");

		if (evpServiceRequestId != null) {
			setEvpServiceRequestId(evpServiceRequestId);
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

		Long managerUserId = (Long)attributes.get("managerUserId");

		if (managerUserId != null) {
			setManagerUserId(managerUserId);
		}

		Long parentEVPServiceRequestId = (Long)attributes.get(
				"parentEVPServiceRequestId");

		if (parentEVPServiceRequestId != null) {
			setParentEVPServiceRequestId(parentEVPServiceRequestId);
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

		Date requestedStartDate = (Date)attributes.get("requestedStartDate");

		if (requestedStartDate != null) {
			setRequestedStartDate(requestedStartDate);
		}

		Date requestedEndDate = (Date)attributes.get("requestedEndDate");

		if (requestedEndDate != null) {
			setRequestedEndDate(requestedEndDate);
		}

		Integer requestedTotalHours = (Integer)attributes.get(
				"requestedTotalHours");

		if (requestedTotalHours != null) {
			setRequestedTotalHours(requestedTotalHours);
		}

		Boolean promoteTrip = (Boolean)attributes.get("promoteTrip");

		if (promoteTrip != null) {
			setPromoteTrip(promoteTrip);
		}

		Date confirmedStartDate = (Date)attributes.get("confirmedStartDate");

		if (confirmedStartDate != null) {
			setConfirmedStartDate(confirmedStartDate);
		}

		Date confirmedEndDate = (Date)attributes.get("confirmedEndDate");

		if (confirmedEndDate != null) {
			setConfirmedEndDate(confirmedEndDate);
		}

		Integer confirmedTotalHours = (Integer)attributes.get(
				"confirmedTotalHours");

		if (confirmedTotalHours != null) {
			setConfirmedTotalHours(confirmedTotalHours);
		}

		String contactBenefit = (String)attributes.get("contactBenefit");

		if (contactBenefit != null) {
			setContactBenefit(contactBenefit);
		}

		String contactComments = (String)attributes.get("contactComments");

		if (contactComments != null) {
			setContactComments(contactComments);
		}

		String hash = (String)attributes.get("hash");

		if (hash != null) {
			setHash(hash);
		}

		String feedbackDescription = (String)attributes.get(
				"feedbackDescription");

		if (feedbackDescription != null) {
			setFeedbackDescription(feedbackDescription);
		}

		String employeeBenefit = (String)attributes.get("employeeBenefit");

		if (employeeBenefit != null) {
			setEmployeeBenefit(employeeBenefit);
		}

		String recipientBenefit = (String)attributes.get("recipientBenefit");

		if (recipientBenefit != null) {
			setRecipientBenefit(recipientBenefit);
		}

		Boolean shareStory = (Boolean)attributes.get("shareStory");

		if (shareStory != null) {
			setShareStory(shareStory);
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
	* Returns the primary key of this e v p service request.
	*
	* @return the primary key of this e v p service request
	*/
	@Override
	public long getPrimaryKey() {
		return _evpServiceRequest.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p service request.
	*
	* @param primaryKey the primary key of this e v p service request
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpServiceRequest.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp service request ID of this e v p service request.
	*
	* @return the evp service request ID of this e v p service request
	*/
	@Override
	public long getEvpServiceRequestId() {
		return _evpServiceRequest.getEvpServiceRequestId();
	}

	/**
	* Sets the evp service request ID of this e v p service request.
	*
	* @param evpServiceRequestId the evp service request ID of this e v p service request
	*/
	@Override
	public void setEvpServiceRequestId(long evpServiceRequestId) {
		_evpServiceRequest.setEvpServiceRequestId(evpServiceRequestId);
	}

	/**
	* Returns the company ID of this e v p service request.
	*
	* @return the company ID of this e v p service request
	*/
	@Override
	public long getCompanyId() {
		return _evpServiceRequest.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p service request.
	*
	* @param companyId the company ID of this e v p service request
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpServiceRequest.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p service request.
	*
	* @return the user ID of this e v p service request
	*/
	@Override
	public long getUserId() {
		return _evpServiceRequest.getUserId();
	}

	/**
	* Sets the user ID of this e v p service request.
	*
	* @param userId the user ID of this e v p service request
	*/
	@Override
	public void setUserId(long userId) {
		_evpServiceRequest.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p service request.
	*
	* @return the user uuid of this e v p service request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpServiceRequest.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p service request.
	*
	* @param userUuid the user uuid of this e v p service request
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpServiceRequest.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p service request.
	*
	* @return the user name of this e v p service request
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpServiceRequest.getUserName();
	}

	/**
	* Sets the user name of this e v p service request.
	*
	* @param userName the user name of this e v p service request
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpServiceRequest.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p service request.
	*
	* @return the create date of this e v p service request
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpServiceRequest.getCreateDate();
	}

	/**
	* Sets the create date of this e v p service request.
	*
	* @param createDate the create date of this e v p service request
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpServiceRequest.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p service request.
	*
	* @return the modified date of this e v p service request
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpServiceRequest.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p service request.
	*
	* @param modifiedDate the modified date of this e v p service request
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpServiceRequest.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the contact email address ID of this e v p service request.
	*
	* @return the contact email address ID of this e v p service request
	*/
	@Override
	public long getContactEmailAddressId() {
		return _evpServiceRequest.getContactEmailAddressId();
	}

	/**
	* Sets the contact email address ID of this e v p service request.
	*
	* @param contactEmailAddressId the contact email address ID of this e v p service request
	*/
	@Override
	public void setContactEmailAddressId(long contactEmailAddressId) {
		_evpServiceRequest.setContactEmailAddressId(contactEmailAddressId);
	}

	/**
	* Returns the contact phone ID of this e v p service request.
	*
	* @return the contact phone ID of this e v p service request
	*/
	@Override
	public long getContactPhoneId() {
		return _evpServiceRequest.getContactPhoneId();
	}

	/**
	* Sets the contact phone ID of this e v p service request.
	*
	* @param contactPhoneId the contact phone ID of this e v p service request
	*/
	@Override
	public void setContactPhoneId(long contactPhoneId) {
		_evpServiceRequest.setContactPhoneId(contactPhoneId);
	}

	/**
	* Returns the contact user ID of this e v p service request.
	*
	* @return the contact user ID of this e v p service request
	*/
	@Override
	public long getContactUserId() {
		return _evpServiceRequest.getContactUserId();
	}

	/**
	* Sets the contact user ID of this e v p service request.
	*
	* @param contactUserId the contact user ID of this e v p service request
	*/
	@Override
	public void setContactUserId(long contactUserId) {
		_evpServiceRequest.setContactUserId(contactUserId);
	}

	/**
	* Returns the contact user uuid of this e v p service request.
	*
	* @return the contact user uuid of this e v p service request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getContactUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpServiceRequest.getContactUserUuid();
	}

	/**
	* Sets the contact user uuid of this e v p service request.
	*
	* @param contactUserUuid the contact user uuid of this e v p service request
	*/
	@Override
	public void setContactUserUuid(java.lang.String contactUserUuid) {
		_evpServiceRequest.setContactUserUuid(contactUserUuid);
	}

	/**
	* Returns the evp request organization ID of this e v p service request.
	*
	* @return the evp request organization ID of this e v p service request
	*/
	@Override
	public long getEvpRequestOrganizationId() {
		return _evpServiceRequest.getEvpRequestOrganizationId();
	}

	/**
	* Sets the evp request organization ID of this e v p service request.
	*
	* @param evpRequestOrganizationId the evp request organization ID of this e v p service request
	*/
	@Override
	public void setEvpRequestOrganizationId(long evpRequestOrganizationId) {
		_evpServiceRequest.setEvpRequestOrganizationId(evpRequestOrganizationId);
	}

	/**
	* Returns the manager user ID of this e v p service request.
	*
	* @return the manager user ID of this e v p service request
	*/
	@Override
	public long getManagerUserId() {
		return _evpServiceRequest.getManagerUserId();
	}

	/**
	* Sets the manager user ID of this e v p service request.
	*
	* @param managerUserId the manager user ID of this e v p service request
	*/
	@Override
	public void setManagerUserId(long managerUserId) {
		_evpServiceRequest.setManagerUserId(managerUserId);
	}

	/**
	* Returns the manager user uuid of this e v p service request.
	*
	* @return the manager user uuid of this e v p service request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getManagerUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpServiceRequest.getManagerUserUuid();
	}

	/**
	* Sets the manager user uuid of this e v p service request.
	*
	* @param managerUserUuid the manager user uuid of this e v p service request
	*/
	@Override
	public void setManagerUserUuid(java.lang.String managerUserUuid) {
		_evpServiceRequest.setManagerUserUuid(managerUserUuid);
	}

	/**
	* Returns the parent e v p service request ID of this e v p service request.
	*
	* @return the parent e v p service request ID of this e v p service request
	*/
	@Override
	public long getParentEVPServiceRequestId() {
		return _evpServiceRequest.getParentEVPServiceRequestId();
	}

	/**
	* Sets the parent e v p service request ID of this e v p service request.
	*
	* @param parentEVPServiceRequestId the parent e v p service request ID of this e v p service request
	*/
	@Override
	public void setParentEVPServiceRequestId(long parentEVPServiceRequestId) {
		_evpServiceRequest.setParentEVPServiceRequestId(parentEVPServiceRequestId);
	}

	/**
	* Returns the request organization address ID of this e v p service request.
	*
	* @return the request organization address ID of this e v p service request
	*/
	@Override
	public long getRequestOrganizationAddressId() {
		return _evpServiceRequest.getRequestOrganizationAddressId();
	}

	/**
	* Sets the request organization address ID of this e v p service request.
	*
	* @param requestOrganizationAddressId the request organization address ID of this e v p service request
	*/
	@Override
	public void setRequestOrganizationAddressId(
		long requestOrganizationAddressId) {
		_evpServiceRequest.setRequestOrganizationAddressId(requestOrganizationAddressId);
	}

	/**
	* Returns the request organization website ID of this e v p service request.
	*
	* @return the request organization website ID of this e v p service request
	*/
	@Override
	public long getRequestOrganizationWebsiteId() {
		return _evpServiceRequest.getRequestOrganizationWebsiteId();
	}

	/**
	* Sets the request organization website ID of this e v p service request.
	*
	* @param requestOrganizationWebsiteId the request organization website ID of this e v p service request
	*/
	@Override
	public void setRequestOrganizationWebsiteId(
		long requestOrganizationWebsiteId) {
		_evpServiceRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsiteId);
	}

	/**
	* Returns the subsidiary group ID of this e v p service request.
	*
	* @return the subsidiary group ID of this e v p service request
	*/
	@Override
	public long getSubsidiaryGroupId() {
		return _evpServiceRequest.getSubsidiaryGroupId();
	}

	/**
	* Sets the subsidiary group ID of this e v p service request.
	*
	* @param subsidiaryGroupId the subsidiary group ID of this e v p service request
	*/
	@Override
	public void setSubsidiaryGroupId(long subsidiaryGroupId) {
		_evpServiceRequest.setSubsidiaryGroupId(subsidiaryGroupId);
	}

	/**
	* Returns the description of this e v p service request.
	*
	* @return the description of this e v p service request
	*/
	@Override
	public java.lang.String getDescription() {
		return _evpServiceRequest.getDescription();
	}

	/**
	* Sets the description of this e v p service request.
	*
	* @param description the description of this e v p service request
	*/
	@Override
	public void setDescription(java.lang.String description) {
		_evpServiceRequest.setDescription(description);
	}

	/**
	* Returns the employment type of this e v p service request.
	*
	* @return the employment type of this e v p service request
	*/
	@Override
	public int getEmploymentType() {
		return _evpServiceRequest.getEmploymentType();
	}

	/**
	* Sets the employment type of this e v p service request.
	*
	* @param employmentType the employment type of this e v p service request
	*/
	@Override
	public void setEmploymentType(int employmentType) {
		_evpServiceRequest.setEmploymentType(employmentType);
	}

	/**
	* Returns the employment hours per week of this e v p service request.
	*
	* @return the employment hours per week of this e v p service request
	*/
	@Override
	public int getEmploymentHoursPerWeek() {
		return _evpServiceRequest.getEmploymentHoursPerWeek();
	}

	/**
	* Sets the employment hours per week of this e v p service request.
	*
	* @param employmentHoursPerWeek the employment hours per week of this e v p service request
	*/
	@Override
	public void setEmploymentHoursPerWeek(int employmentHoursPerWeek) {
		_evpServiceRequest.setEmploymentHoursPerWeek(employmentHoursPerWeek);
	}

	/**
	* Returns the purpose of this e v p service request.
	*
	* @return the purpose of this e v p service request
	*/
	@Override
	public java.lang.String getPurpose() {
		return _evpServiceRequest.getPurpose();
	}

	/**
	* Sets the purpose of this e v p service request.
	*
	* @param purpose the purpose of this e v p service request
	*/
	@Override
	public void setPurpose(java.lang.String purpose) {
		_evpServiceRequest.setPurpose(purpose);
	}

	/**
	* Returns the purpose other of this e v p service request.
	*
	* @return the purpose other of this e v p service request
	*/
	@Override
	public java.lang.String getPurposeOther() {
		return _evpServiceRequest.getPurposeOther();
	}

	/**
	* Sets the purpose other of this e v p service request.
	*
	* @param purposeOther the purpose other of this e v p service request
	*/
	@Override
	public void setPurposeOther(java.lang.String purposeOther) {
		_evpServiceRequest.setPurposeOther(purposeOther);
	}

	/**
	* Returns the behalf of of this e v p service request.
	*
	* @return the behalf of of this e v p service request
	*/
	@Override
	public java.lang.String getBehalfOf() {
		return _evpServiceRequest.getBehalfOf();
	}

	/**
	* Sets the behalf of of this e v p service request.
	*
	* @param behalfOf the behalf of of this e v p service request
	*/
	@Override
	public void setBehalfOf(java.lang.String behalfOf) {
		_evpServiceRequest.setBehalfOf(behalfOf);
	}

	/**
	* Returns the behalf of other of this e v p service request.
	*
	* @return the behalf of other of this e v p service request
	*/
	@Override
	public java.lang.String getBehalfOfOther() {
		return _evpServiceRequest.getBehalfOfOther();
	}

	/**
	* Sets the behalf of other of this e v p service request.
	*
	* @param behalfOfOther the behalf of other of this e v p service request
	*/
	@Override
	public void setBehalfOfOther(java.lang.String behalfOfOther) {
		_evpServiceRequest.setBehalfOfOther(behalfOfOther);
	}

	/**
	* Returns the requested start date of this e v p service request.
	*
	* @return the requested start date of this e v p service request
	*/
	@Override
	public java.util.Date getRequestedStartDate() {
		return _evpServiceRequest.getRequestedStartDate();
	}

	/**
	* Sets the requested start date of this e v p service request.
	*
	* @param requestedStartDate the requested start date of this e v p service request
	*/
	@Override
	public void setRequestedStartDate(java.util.Date requestedStartDate) {
		_evpServiceRequest.setRequestedStartDate(requestedStartDate);
	}

	/**
	* Returns the requested end date of this e v p service request.
	*
	* @return the requested end date of this e v p service request
	*/
	@Override
	public java.util.Date getRequestedEndDate() {
		return _evpServiceRequest.getRequestedEndDate();
	}

	/**
	* Sets the requested end date of this e v p service request.
	*
	* @param requestedEndDate the requested end date of this e v p service request
	*/
	@Override
	public void setRequestedEndDate(java.util.Date requestedEndDate) {
		_evpServiceRequest.setRequestedEndDate(requestedEndDate);
	}

	/**
	* Returns the requested total hours of this e v p service request.
	*
	* @return the requested total hours of this e v p service request
	*/
	@Override
	public int getRequestedTotalHours() {
		return _evpServiceRequest.getRequestedTotalHours();
	}

	/**
	* Sets the requested total hours of this e v p service request.
	*
	* @param requestedTotalHours the requested total hours of this e v p service request
	*/
	@Override
	public void setRequestedTotalHours(int requestedTotalHours) {
		_evpServiceRequest.setRequestedTotalHours(requestedTotalHours);
	}

	/**
	* Returns the promote trip of this e v p service request.
	*
	* @return the promote trip of this e v p service request
	*/
	@Override
	public boolean getPromoteTrip() {
		return _evpServiceRequest.getPromoteTrip();
	}

	/**
	* Returns <code>true</code> if this e v p service request is promote trip.
	*
	* @return <code>true</code> if this e v p service request is promote trip; <code>false</code> otherwise
	*/
	@Override
	public boolean isPromoteTrip() {
		return _evpServiceRequest.isPromoteTrip();
	}

	/**
	* Sets whether this e v p service request is promote trip.
	*
	* @param promoteTrip the promote trip of this e v p service request
	*/
	@Override
	public void setPromoteTrip(boolean promoteTrip) {
		_evpServiceRequest.setPromoteTrip(promoteTrip);
	}

	/**
	* Returns the confirmed start date of this e v p service request.
	*
	* @return the confirmed start date of this e v p service request
	*/
	@Override
	public java.util.Date getConfirmedStartDate() {
		return _evpServiceRequest.getConfirmedStartDate();
	}

	/**
	* Sets the confirmed start date of this e v p service request.
	*
	* @param confirmedStartDate the confirmed start date of this e v p service request
	*/
	@Override
	public void setConfirmedStartDate(java.util.Date confirmedStartDate) {
		_evpServiceRequest.setConfirmedStartDate(confirmedStartDate);
	}

	/**
	* Returns the confirmed end date of this e v p service request.
	*
	* @return the confirmed end date of this e v p service request
	*/
	@Override
	public java.util.Date getConfirmedEndDate() {
		return _evpServiceRequest.getConfirmedEndDate();
	}

	/**
	* Sets the confirmed end date of this e v p service request.
	*
	* @param confirmedEndDate the confirmed end date of this e v p service request
	*/
	@Override
	public void setConfirmedEndDate(java.util.Date confirmedEndDate) {
		_evpServiceRequest.setConfirmedEndDate(confirmedEndDate);
	}

	/**
	* Returns the confirmed total hours of this e v p service request.
	*
	* @return the confirmed total hours of this e v p service request
	*/
	@Override
	public int getConfirmedTotalHours() {
		return _evpServiceRequest.getConfirmedTotalHours();
	}

	/**
	* Sets the confirmed total hours of this e v p service request.
	*
	* @param confirmedTotalHours the confirmed total hours of this e v p service request
	*/
	@Override
	public void setConfirmedTotalHours(int confirmedTotalHours) {
		_evpServiceRequest.setConfirmedTotalHours(confirmedTotalHours);
	}

	/**
	* Returns the contact benefit of this e v p service request.
	*
	* @return the contact benefit of this e v p service request
	*/
	@Override
	public java.lang.String getContactBenefit() {
		return _evpServiceRequest.getContactBenefit();
	}

	/**
	* Sets the contact benefit of this e v p service request.
	*
	* @param contactBenefit the contact benefit of this e v p service request
	*/
	@Override
	public void setContactBenefit(java.lang.String contactBenefit) {
		_evpServiceRequest.setContactBenefit(contactBenefit);
	}

	/**
	* Returns the contact comments of this e v p service request.
	*
	* @return the contact comments of this e v p service request
	*/
	@Override
	public java.lang.String getContactComments() {
		return _evpServiceRequest.getContactComments();
	}

	/**
	* Sets the contact comments of this e v p service request.
	*
	* @param contactComments the contact comments of this e v p service request
	*/
	@Override
	public void setContactComments(java.lang.String contactComments) {
		_evpServiceRequest.setContactComments(contactComments);
	}

	/**
	* Returns the hash of this e v p service request.
	*
	* @return the hash of this e v p service request
	*/
	@Override
	public java.lang.String getHash() {
		return _evpServiceRequest.getHash();
	}

	/**
	* Sets the hash of this e v p service request.
	*
	* @param hash the hash of this e v p service request
	*/
	@Override
	public void setHash(java.lang.String hash) {
		_evpServiceRequest.setHash(hash);
	}

	/**
	* Returns the feedback description of this e v p service request.
	*
	* @return the feedback description of this e v p service request
	*/
	@Override
	public java.lang.String getFeedbackDescription() {
		return _evpServiceRequest.getFeedbackDescription();
	}

	/**
	* Sets the feedback description of this e v p service request.
	*
	* @param feedbackDescription the feedback description of this e v p service request
	*/
	@Override
	public void setFeedbackDescription(java.lang.String feedbackDescription) {
		_evpServiceRequest.setFeedbackDescription(feedbackDescription);
	}

	/**
	* Returns the employee benefit of this e v p service request.
	*
	* @return the employee benefit of this e v p service request
	*/
	@Override
	public java.lang.String getEmployeeBenefit() {
		return _evpServiceRequest.getEmployeeBenefit();
	}

	/**
	* Sets the employee benefit of this e v p service request.
	*
	* @param employeeBenefit the employee benefit of this e v p service request
	*/
	@Override
	public void setEmployeeBenefit(java.lang.String employeeBenefit) {
		_evpServiceRequest.setEmployeeBenefit(employeeBenefit);
	}

	/**
	* Returns the recipient benefit of this e v p service request.
	*
	* @return the recipient benefit of this e v p service request
	*/
	@Override
	public java.lang.String getRecipientBenefit() {
		return _evpServiceRequest.getRecipientBenefit();
	}

	/**
	* Sets the recipient benefit of this e v p service request.
	*
	* @param recipientBenefit the recipient benefit of this e v p service request
	*/
	@Override
	public void setRecipientBenefit(java.lang.String recipientBenefit) {
		_evpServiceRequest.setRecipientBenefit(recipientBenefit);
	}

	/**
	* Returns the share story of this e v p service request.
	*
	* @return the share story of this e v p service request
	*/
	@Override
	public boolean getShareStory() {
		return _evpServiceRequest.getShareStory();
	}

	/**
	* Returns <code>true</code> if this e v p service request is share story.
	*
	* @return <code>true</code> if this e v p service request is share story; <code>false</code> otherwise
	*/
	@Override
	public boolean isShareStory() {
		return _evpServiceRequest.isShareStory();
	}

	/**
	* Sets whether this e v p service request is share story.
	*
	* @param shareStory the share story of this e v p service request
	*/
	@Override
	public void setShareStory(boolean shareStory) {
		_evpServiceRequest.setShareStory(shareStory);
	}

	/**
	* Returns the status of this e v p service request.
	*
	* @return the status of this e v p service request
	*/
	@Override
	public int getStatus() {
		return _evpServiceRequest.getStatus();
	}

	/**
	* Sets the status of this e v p service request.
	*
	* @param status the status of this e v p service request
	*/
	@Override
	public void setStatus(int status) {
		_evpServiceRequest.setStatus(status);
	}

	/**
	* Returns the status by user ID of this e v p service request.
	*
	* @return the status by user ID of this e v p service request
	*/
	@Override
	public long getStatusByUserId() {
		return _evpServiceRequest.getStatusByUserId();
	}

	/**
	* Sets the status by user ID of this e v p service request.
	*
	* @param statusByUserId the status by user ID of this e v p service request
	*/
	@Override
	public void setStatusByUserId(long statusByUserId) {
		_evpServiceRequest.setStatusByUserId(statusByUserId);
	}

	/**
	* Returns the status by user uuid of this e v p service request.
	*
	* @return the status by user uuid of this e v p service request
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getStatusByUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpServiceRequest.getStatusByUserUuid();
	}

	/**
	* Sets the status by user uuid of this e v p service request.
	*
	* @param statusByUserUuid the status by user uuid of this e v p service request
	*/
	@Override
	public void setStatusByUserUuid(java.lang.String statusByUserUuid) {
		_evpServiceRequest.setStatusByUserUuid(statusByUserUuid);
	}

	/**
	* Returns the status by user name of this e v p service request.
	*
	* @return the status by user name of this e v p service request
	*/
	@Override
	public java.lang.String getStatusByUserName() {
		return _evpServiceRequest.getStatusByUserName();
	}

	/**
	* Sets the status by user name of this e v p service request.
	*
	* @param statusByUserName the status by user name of this e v p service request
	*/
	@Override
	public void setStatusByUserName(java.lang.String statusByUserName) {
		_evpServiceRequest.setStatusByUserName(statusByUserName);
	}

	/**
	* Returns the status date of this e v p service request.
	*
	* @return the status date of this e v p service request
	*/
	@Override
	public java.util.Date getStatusDate() {
		return _evpServiceRequest.getStatusDate();
	}

	/**
	* Sets the status date of this e v p service request.
	*
	* @param statusDate the status date of this e v p service request
	*/
	@Override
	public void setStatusDate(java.util.Date statusDate) {
		_evpServiceRequest.setStatusDate(statusDate);
	}

	/**
	* @deprecated As of 6.1.0, replaced by {@link #isApproved()}
	*/
	@Override
	public boolean getApproved() {
		return _evpServiceRequest.getApproved();
	}

	/**
	* Returns <code>true</code> if this e v p service request is approved.
	*
	* @return <code>true</code> if this e v p service request is approved; <code>false</code> otherwise
	*/
	@Override
	public boolean isApproved() {
		return _evpServiceRequest.isApproved();
	}

	/**
	* Returns <code>true</code> if this e v p service request is denied.
	*
	* @return <code>true</code> if this e v p service request is denied; <code>false</code> otherwise
	*/
	@Override
	public boolean isDenied() {
		return _evpServiceRequest.isDenied();
	}

	/**
	* Returns <code>true</code> if this e v p service request is a draft.
	*
	* @return <code>true</code> if this e v p service request is a draft; <code>false</code> otherwise
	*/
	@Override
	public boolean isDraft() {
		return _evpServiceRequest.isDraft();
	}

	/**
	* Returns <code>true</code> if this e v p service request is expired.
	*
	* @return <code>true</code> if this e v p service request is expired; <code>false</code> otherwise
	*/
	@Override
	public boolean isExpired() {
		return _evpServiceRequest.isExpired();
	}

	/**
	* Returns <code>true</code> if this e v p service request is inactive.
	*
	* @return <code>true</code> if this e v p service request is inactive; <code>false</code> otherwise
	*/
	@Override
	public boolean isInactive() {
		return _evpServiceRequest.isInactive();
	}

	/**
	* Returns <code>true</code> if this e v p service request is incomplete.
	*
	* @return <code>true</code> if this e v p service request is incomplete; <code>false</code> otherwise
	*/
	@Override
	public boolean isIncomplete() {
		return _evpServiceRequest.isIncomplete();
	}

	/**
	* Returns <code>true</code> if this e v p service request is pending.
	*
	* @return <code>true</code> if this e v p service request is pending; <code>false</code> otherwise
	*/
	@Override
	public boolean isPending() {
		return _evpServiceRequest.isPending();
	}

	/**
	* Returns <code>true</code> if this e v p service request is scheduled.
	*
	* @return <code>true</code> if this e v p service request is scheduled; <code>false</code> otherwise
	*/
	@Override
	public boolean isScheduled() {
		return _evpServiceRequest.isScheduled();
	}

	@Override
	public boolean isNew() {
		return _evpServiceRequest.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpServiceRequest.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpServiceRequest.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpServiceRequest.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpServiceRequest.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpServiceRequest.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpServiceRequest.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpServiceRequest.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpServiceRequest.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpServiceRequest.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpServiceRequest.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPServiceRequestWrapper((EVPServiceRequest)_evpServiceRequest.clone());
	}

	@Override
	public int compareTo(
		com.liferay.evp.model.EVPServiceRequest evpServiceRequest) {
		return _evpServiceRequest.compareTo(evpServiceRequest);
	}

	@Override
	public int hashCode() {
		return _evpServiceRequest.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPServiceRequest> toCacheModel() {
		return _evpServiceRequest.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPServiceRequest toEscapedModel() {
		return new EVPServiceRequestWrapper(_evpServiceRequest.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPServiceRequest toUnescapedModel() {
		return new EVPServiceRequestWrapper(_evpServiceRequest.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpServiceRequest.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpServiceRequest.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpServiceRequest.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPServiceRequestWrapper)) {
			return false;
		}

		EVPServiceRequestWrapper evpServiceRequestWrapper = (EVPServiceRequestWrapper)obj;

		if (Validator.equals(_evpServiceRequest,
					evpServiceRequestWrapper._evpServiceRequest)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPServiceRequest getWrappedEVPServiceRequest() {
		return _evpServiceRequest;
	}

	@Override
	public EVPServiceRequest getWrappedModel() {
		return _evpServiceRequest;
	}

	@Override
	public void resetOriginalValues() {
		_evpServiceRequest.resetOriginalValues();
	}

	private EVPServiceRequest _evpServiceRequest;
}
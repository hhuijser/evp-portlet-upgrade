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
import com.liferay.evp.service.EVPServiceRequestLocalServiceUtil;

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
public class EVPServiceRequestClp extends BaseModelImpl<EVPServiceRequest>
	implements EVPServiceRequest {
	public EVPServiceRequestClp() {
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
	public long getPrimaryKey() {
		return _evpServiceRequestId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setEvpServiceRequestId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _evpServiceRequestId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
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

	@Override
	public long getEvpServiceRequestId() {
		return _evpServiceRequestId;
	}

	@Override
	public void setEvpServiceRequestId(long evpServiceRequestId) {
		_evpServiceRequestId = evpServiceRequestId;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpServiceRequestId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel, evpServiceRequestId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, companyId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, userId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setUserName", String.class);

				method.invoke(_evpServiceRequestRemoteModel, userName);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_evpServiceRequestRemoteModel, createDate);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_evpServiceRequestRemoteModel, modifiedDate);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactEmailAddressId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel,
					contactEmailAddressId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactPhoneId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, contactPhoneId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactUserId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, contactUserId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEvpRequestOrganizationId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel,
					evpRequestOrganizationId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getManagerUserId() {
		return _managerUserId;
	}

	@Override
	public void setManagerUserId(long managerUserId) {
		_managerUserId = managerUserId;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setManagerUserId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, managerUserId);
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
	public long getParentEVPServiceRequestId() {
		return _parentEVPServiceRequestId;
	}

	@Override
	public void setParentEVPServiceRequestId(long parentEVPServiceRequestId) {
		_parentEVPServiceRequestId = parentEVPServiceRequestId;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setParentEVPServiceRequestId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel,
					parentEVPServiceRequestId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestOrganizationAddressId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel,
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestOrganizationWebsiteId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel,
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setSubsidiaryGroupId",
						long.class);

				method.invoke(_evpServiceRequestRemoteModel, subsidiaryGroupId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setDescription", String.class);

				method.invoke(_evpServiceRequestRemoteModel, description);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEmploymentType", int.class);

				method.invoke(_evpServiceRequestRemoteModel, employmentType);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEmploymentHoursPerWeek",
						int.class);

				method.invoke(_evpServiceRequestRemoteModel,
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setPurpose", String.class);

				method.invoke(_evpServiceRequestRemoteModel, purpose);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setPurposeOther", String.class);

				method.invoke(_evpServiceRequestRemoteModel, purposeOther);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setBehalfOf", String.class);

				method.invoke(_evpServiceRequestRemoteModel, behalfOf);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setBehalfOfOther", String.class);

				method.invoke(_evpServiceRequestRemoteModel, behalfOfOther);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getRequestedStartDate() {
		return _requestedStartDate;
	}

	@Override
	public void setRequestedStartDate(Date requestedStartDate) {
		_requestedStartDate = requestedStartDate;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestedStartDate",
						Date.class);

				method.invoke(_evpServiceRequestRemoteModel, requestedStartDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getRequestedEndDate() {
		return _requestedEndDate;
	}

	@Override
	public void setRequestedEndDate(Date requestedEndDate) {
		_requestedEndDate = requestedEndDate;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestedEndDate",
						Date.class);

				method.invoke(_evpServiceRequestRemoteModel, requestedEndDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getRequestedTotalHours() {
		return _requestedTotalHours;
	}

	@Override
	public void setRequestedTotalHours(int requestedTotalHours) {
		_requestedTotalHours = requestedTotalHours;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRequestedTotalHours",
						int.class);

				method.invoke(_evpServiceRequestRemoteModel, requestedTotalHours);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public boolean getPromoteTrip() {
		return _promoteTrip;
	}

	@Override
	public boolean isPromoteTrip() {
		return _promoteTrip;
	}

	@Override
	public void setPromoteTrip(boolean promoteTrip) {
		_promoteTrip = promoteTrip;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setPromoteTrip", boolean.class);

				method.invoke(_evpServiceRequestRemoteModel, promoteTrip);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getConfirmedStartDate() {
		return _confirmedStartDate;
	}

	@Override
	public void setConfirmedStartDate(Date confirmedStartDate) {
		_confirmedStartDate = confirmedStartDate;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setConfirmedStartDate",
						Date.class);

				method.invoke(_evpServiceRequestRemoteModel, confirmedStartDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getConfirmedEndDate() {
		return _confirmedEndDate;
	}

	@Override
	public void setConfirmedEndDate(Date confirmedEndDate) {
		_confirmedEndDate = confirmedEndDate;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setConfirmedEndDate",
						Date.class);

				method.invoke(_evpServiceRequestRemoteModel, confirmedEndDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public int getConfirmedTotalHours() {
		return _confirmedTotalHours;
	}

	@Override
	public void setConfirmedTotalHours(int confirmedTotalHours) {
		_confirmedTotalHours = confirmedTotalHours;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setConfirmedTotalHours",
						int.class);

				method.invoke(_evpServiceRequestRemoteModel, confirmedTotalHours);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getContactBenefit() {
		return _contactBenefit;
	}

	@Override
	public void setContactBenefit(String contactBenefit) {
		_contactBenefit = contactBenefit;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactBenefit",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, contactBenefit);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getContactComments() {
		return _contactComments;
	}

	@Override
	public void setContactComments(String contactComments) {
		_contactComments = contactComments;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setContactComments",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, contactComments);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getHash() {
		return _hash;
	}

	@Override
	public void setHash(String hash) {
		_hash = hash;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setHash", String.class);

				method.invoke(_evpServiceRequestRemoteModel, hash);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getFeedbackDescription() {
		return _feedbackDescription;
	}

	@Override
	public void setFeedbackDescription(String feedbackDescription) {
		_feedbackDescription = feedbackDescription;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setFeedbackDescription",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, feedbackDescription);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getEmployeeBenefit() {
		return _employeeBenefit;
	}

	@Override
	public void setEmployeeBenefit(String employeeBenefit) {
		_employeeBenefit = employeeBenefit;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setEmployeeBenefit",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, employeeBenefit);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getRecipientBenefit() {
		return _recipientBenefit;
	}

	@Override
	public void setRecipientBenefit(String recipientBenefit) {
		_recipientBenefit = recipientBenefit;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setRecipientBenefit",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, recipientBenefit);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public boolean getShareStory() {
		return _shareStory;
	}

	@Override
	public boolean isShareStory() {
		return _shareStory;
	}

	@Override
	public void setShareStory(boolean shareStory) {
		_shareStory = shareStory;

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setShareStory", boolean.class);

				method.invoke(_evpServiceRequestRemoteModel, shareStory);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatus", int.class);

				method.invoke(_evpServiceRequestRemoteModel, status);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusByUserId", long.class);

				method.invoke(_evpServiceRequestRemoteModel, statusByUserId);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusByUserName",
						String.class);

				method.invoke(_evpServiceRequestRemoteModel, statusByUserName);
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

		if (_evpServiceRequestRemoteModel != null) {
			try {
				Class<?> clazz = _evpServiceRequestRemoteModel.getClass();

				Method method = clazz.getMethod("setStatusDate", Date.class);

				method.invoke(_evpServiceRequestRemoteModel, statusDate);
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

	public BaseModel<?> getEVPServiceRequestRemoteModel() {
		return _evpServiceRequestRemoteModel;
	}

	public void setEVPServiceRequestRemoteModel(
		BaseModel<?> evpServiceRequestRemoteModel) {
		_evpServiceRequestRemoteModel = evpServiceRequestRemoteModel;
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

		Class<?> remoteModelClass = _evpServiceRequestRemoteModel.getClass();

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

		Object returnValue = method.invoke(_evpServiceRequestRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			EVPServiceRequestLocalServiceUtil.addEVPServiceRequest(this);
		}
		else {
			EVPServiceRequestLocalServiceUtil.updateEVPServiceRequest(this);
		}
	}

	@Override
	public EVPServiceRequest toEscapedModel() {
		return (EVPServiceRequest)ProxyUtil.newProxyInstance(EVPServiceRequest.class.getClassLoader(),
			new Class[] { EVPServiceRequest.class },
			new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		EVPServiceRequestClp clone = new EVPServiceRequestClp();

		clone.setEvpServiceRequestId(getEvpServiceRequestId());
		clone.setCompanyId(getCompanyId());
		clone.setUserId(getUserId());
		clone.setUserName(getUserName());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setContactEmailAddressId(getContactEmailAddressId());
		clone.setContactPhoneId(getContactPhoneId());
		clone.setContactUserId(getContactUserId());
		clone.setEvpRequestOrganizationId(getEvpRequestOrganizationId());
		clone.setManagerUserId(getManagerUserId());
		clone.setParentEVPServiceRequestId(getParentEVPServiceRequestId());
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
		clone.setRequestedStartDate(getRequestedStartDate());
		clone.setRequestedEndDate(getRequestedEndDate());
		clone.setRequestedTotalHours(getRequestedTotalHours());
		clone.setPromoteTrip(getPromoteTrip());
		clone.setConfirmedStartDate(getConfirmedStartDate());
		clone.setConfirmedEndDate(getConfirmedEndDate());
		clone.setConfirmedTotalHours(getConfirmedTotalHours());
		clone.setContactBenefit(getContactBenefit());
		clone.setContactComments(getContactComments());
		clone.setHash(getHash());
		clone.setFeedbackDescription(getFeedbackDescription());
		clone.setEmployeeBenefit(getEmployeeBenefit());
		clone.setRecipientBenefit(getRecipientBenefit());
		clone.setShareStory(getShareStory());
		clone.setStatus(getStatus());
		clone.setStatusByUserId(getStatusByUserId());
		clone.setStatusByUserName(getStatusByUserName());
		clone.setStatusDate(getStatusDate());

		return clone;
	}

	@Override
	public int compareTo(EVPServiceRequest evpServiceRequest) {
		long primaryKey = evpServiceRequest.getPrimaryKey();

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

		if (!(obj instanceof EVPServiceRequestClp)) {
			return false;
		}

		EVPServiceRequestClp evpServiceRequest = (EVPServiceRequestClp)obj;

		long primaryKey = evpServiceRequest.getPrimaryKey();

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
		StringBundler sb = new StringBundler(81);

		sb.append("{evpServiceRequestId=");
		sb.append(getEvpServiceRequestId());
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
		sb.append(", managerUserId=");
		sb.append(getManagerUserId());
		sb.append(", parentEVPServiceRequestId=");
		sb.append(getParentEVPServiceRequestId());
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
		sb.append(", requestedStartDate=");
		sb.append(getRequestedStartDate());
		sb.append(", requestedEndDate=");
		sb.append(getRequestedEndDate());
		sb.append(", requestedTotalHours=");
		sb.append(getRequestedTotalHours());
		sb.append(", promoteTrip=");
		sb.append(getPromoteTrip());
		sb.append(", confirmedStartDate=");
		sb.append(getConfirmedStartDate());
		sb.append(", confirmedEndDate=");
		sb.append(getConfirmedEndDate());
		sb.append(", confirmedTotalHours=");
		sb.append(getConfirmedTotalHours());
		sb.append(", contactBenefit=");
		sb.append(getContactBenefit());
		sb.append(", contactComments=");
		sb.append(getContactComments());
		sb.append(", hash=");
		sb.append(getHash());
		sb.append(", feedbackDescription=");
		sb.append(getFeedbackDescription());
		sb.append(", employeeBenefit=");
		sb.append(getEmployeeBenefit());
		sb.append(", recipientBenefit=");
		sb.append(getRecipientBenefit());
		sb.append(", shareStory=");
		sb.append(getShareStory());
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
		StringBundler sb = new StringBundler(124);

		sb.append("<model><model-name>");
		sb.append("com.liferay.evp.model.EVPServiceRequest");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>evpServiceRequestId</column-name><column-value><![CDATA[");
		sb.append(getEvpServiceRequestId());
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
			"<column><column-name>managerUserId</column-name><column-value><![CDATA[");
		sb.append(getManagerUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>parentEVPServiceRequestId</column-name><column-value><![CDATA[");
		sb.append(getParentEVPServiceRequestId());
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
			"<column><column-name>requestedStartDate</column-name><column-value><![CDATA[");
		sb.append(getRequestedStartDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>requestedEndDate</column-name><column-value><![CDATA[");
		sb.append(getRequestedEndDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>requestedTotalHours</column-name><column-value><![CDATA[");
		sb.append(getRequestedTotalHours());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>promoteTrip</column-name><column-value><![CDATA[");
		sb.append(getPromoteTrip());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>confirmedStartDate</column-name><column-value><![CDATA[");
		sb.append(getConfirmedStartDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>confirmedEndDate</column-name><column-value><![CDATA[");
		sb.append(getConfirmedEndDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>confirmedTotalHours</column-name><column-value><![CDATA[");
		sb.append(getConfirmedTotalHours());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>contactBenefit</column-name><column-value><![CDATA[");
		sb.append(getContactBenefit());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>contactComments</column-name><column-value><![CDATA[");
		sb.append(getContactComments());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>hash</column-name><column-value><![CDATA[");
		sb.append(getHash());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>feedbackDescription</column-name><column-value><![CDATA[");
		sb.append(getFeedbackDescription());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>employeeBenefit</column-name><column-value><![CDATA[");
		sb.append(getEmployeeBenefit());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>recipientBenefit</column-name><column-value><![CDATA[");
		sb.append(getRecipientBenefit());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>shareStory</column-name><column-value><![CDATA[");
		sb.append(getShareStory());
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

	private long _evpServiceRequestId;
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
	private long _managerUserId;
	private String _managerUserUuid;
	private long _parentEVPServiceRequestId;
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
	private Date _requestedStartDate;
	private Date _requestedEndDate;
	private int _requestedTotalHours;
	private boolean _promoteTrip;
	private Date _confirmedStartDate;
	private Date _confirmedEndDate;
	private int _confirmedTotalHours;
	private String _contactBenefit;
	private String _contactComments;
	private String _hash;
	private String _feedbackDescription;
	private String _employeeBenefit;
	private String _recipientBenefit;
	private boolean _shareStory;
	private int _status;
	private long _statusByUserId;
	private String _statusByUserUuid;
	private String _statusByUserName;
	private Date _statusDate;
	private BaseModel<?> _evpServiceRequestRemoteModel;
	private Class<?> _clpSerializerClass = com.liferay.evp.service.ClpSerializer.class;
}
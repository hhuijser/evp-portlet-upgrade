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

package com.liferay.evp.hook.upgrade.v1_4_0;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.compat.portal.kernel.util.StringUtil;
import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPRequestOrganization;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.service.EVPRequestOrganizationLocalServiceUtil;
import com.liferay.evp.service.EVPServiceRequestLocalServiceUtil;
import com.liferay.evp.util.EVPDivisionUtil;
import com.liferay.evp.util.EVPWorkflowConstants;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.Address;
import com.liferay.portal.model.EmailAddress;
import com.liferay.portal.model.Organization;
import com.liferay.portal.model.Phone;
import com.liferay.portal.model.User;
import com.liferay.portal.model.Website;
import com.liferay.portal.service.AddressLocalServiceUtil;
import com.liferay.portal.service.ResourceLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.WebsiteLocalServiceUtil;
import com.liferay.portal.service.WorkflowInstanceLinkLocalServiceUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Ethan Bustad
 */
public class UpgradeEVPServiceRequest extends UpgradeProcess {

	protected EVPServiceRequest addEVPServiceRequest(
			long requestId, long companyId, long userId, Date createDate,
			long requestOrganizationId, long managerUserId, String description,
			int employmentType, int employmentHoursPerWeek, String purpose,
			String purposeOther, String behalfOf, String behalfOfOther,
			Date requestedStartDate, Date requestedEndDate,
			int requestedTotalHours, Date confirmedStartDate,
			Date confirmedEndDate, int confirmedTotalHours,
			String contactBenefit, String contactComments,
			String feedbackDescription, String employeeBenefit,
			String recipientBenefit)
		throws Exception {

		EVPServiceRequest evpServiceRequest =
			EVPServiceRequestLocalServiceUtil.createEVPServiceRequest(
				CounterLocalServiceUtil.increment());

		evpServiceRequest.setCompanyId(companyId);

		User user = UserLocalServiceUtil.getUser(userId);

		evpServiceRequest.setUserId(user.getUserId());
		evpServiceRequest.setUserName(user.getFullName());

		evpServiceRequest.setCreateDate(createDate);
		evpServiceRequest.setModifiedDate(new Date());

		if (!contactUserIdsMap.containsKey(requestId)) {
			_log.error("No contact user found for request " + requestId);

			return null;
		}

		long contactUserId = contactUserIdsMap.get(requestId);

		User contactUser = UserLocalServiceUtil.getUser(contactUserId);

		List<EmailAddress> emailAddresses = contactUser.getEmailAddresses();

		if (emailAddresses.isEmpty()) {
			_log.error(
				"No email address found for contact user " +
					contactUser.getFullName());

			return null;
		}

		EmailAddress emailAddress = emailAddresses.get(0);

		evpServiceRequest.setContactEmailAddressId(
			emailAddress.getEmailAddressId());

		List<Phone> phones = contactUser.getPhones();

		if (!phones.isEmpty()) {
			Phone phone = phones.get(0);

			evpServiceRequest.setContactPhoneId(phone.getPhoneId());
		}

		evpServiceRequest.setContactUserId(contactUserId);

		if (!evpRequestOrganizationsMap.containsKey(requestOrganizationId)) {
			_log.error(
				"No organization for request organization ID " +
					requestOrganizationId);

			return null;
		}

		long evpRequestOrganizationId = evpRequestOrganizationsMap.get(
			requestOrganizationId);

		evpServiceRequest.setEvpRequestOrganizationId(evpRequestOrganizationId);

		EVPRequestOrganization evpRequestOrganization =
			EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(
				evpRequestOrganizationId);

		List<Address> addresses = AddressLocalServiceUtil.getAddresses(
			companyId, Organization.class.getName(),
			evpRequestOrganization.getOrganizationId());

		Address address = addresses.get(0);

		evpServiceRequest.setRequestOrganizationAddressId(
			address.getAddressId());

		List<Website> websites = WebsiteLocalServiceUtil.getWebsites(
			companyId, Organization.class.getName(),
			evpRequestOrganization.getOrganizationId());

		Website website = websites.get(0);

		evpServiceRequest.setRequestOrganizationWebsiteId(
			website.getWebsiteId());

		EVPDivision subsidiaryEVPDivision =
			EVPDivisionUtil.getSubsidiaryEVPDivision(user.getUserId());

		evpServiceRequest.setSubsidiaryGroupId(
			subsidiaryEVPDivision.getOrganizationGroupId());

		evpServiceRequest.setDescription(description);
		evpServiceRequest.setEmploymentType(employmentType);
		evpServiceRequest.setEmploymentHoursPerWeek(employmentHoursPerWeek);
		evpServiceRequest.setPurpose(purpose);
		evpServiceRequest.setPurposeOther(purposeOther);
		evpServiceRequest.setBehalfOf(behalfOf);
		evpServiceRequest.setBehalfOfOther(behalfOfOther);
		evpServiceRequest.setRequestedStartDate(requestedStartDate);
		evpServiceRequest.setRequestedEndDate(requestedEndDate);
		evpServiceRequest.setRequestedTotalHours(requestedTotalHours);
		evpServiceRequest.setConfirmedStartDate(confirmedStartDate);
		evpServiceRequest.setConfirmedEndDate(confirmedEndDate);
		evpServiceRequest.setConfirmedTotalHours(confirmedTotalHours);
		evpServiceRequest.setContactBenefit(contactBenefit);
		evpServiceRequest.setContactComments(contactComments);
		evpServiceRequest.setFeedbackDescription(feedbackDescription);
		evpServiceRequest.setEmployeeBenefit(employeeBenefit);
		evpServiceRequest.setRecipientBenefit(recipientBenefit);
		evpServiceRequest.setStatus(
			EVPWorkflowConstants.SERVICE_STATUS_COMPLETED);
		evpServiceRequest.setStatusByUserId(user.getUserId());
		evpServiceRequest.setStatusByUserName(user.getFullName());
		evpServiceRequest.setStatusDate(new Date());

		return EVPServiceRequestLocalServiceUtil.addEVPServiceRequest(
			evpServiceRequest);
	}

	@Override
	protected void doUpgrade() throws Exception {
		updateEVPServiceRequests();
	}

	protected int getNewStatus(int status) {
		if (status == EVPWorkflowConstants.SERVICE_STATUS_PROOF_FORM_APPROVED) {
			return EVPWorkflowConstants.SERVICE_STATUS_COMPLETED;
		}
		else if (status ==
					EVPWorkflowConstants.SERVICE_STATUS_PROOF_FORM_REJECTED) {

			return EVPWorkflowConstants.SERVICE_STATUS_DISQUALIFIED;
		}
		else {
			return status;
		}
	}

	protected Object[] getStatusFields(long requestId) throws Exception {
		Connection con = null;

		String[] tableNames = new String[] {
			"evp_USServiceRequest", "evp_ChinaServiceRequest",
			"evp_SpainServiceRequest", "evp_BrazilServiceRequest",
			"evp_GermanyServiceRequest"
		};

		StringBundler sb = new StringBundler(5);

		sb.append(
			"select status, statusByUserId, statusByUserName, statusDate ");
		sb.append("from ");
		sb.append(StringPool.NULL);
		sb.append(" where requestId = ");
		sb.append(requestId);

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			for (String tableName : tableNames) {
				sb.setStringAt(tableName, 2);

				PreparedStatement ps = null;
				ResultSet rs = null;

				try {
					ps = con.prepareStatement(sb.toString());

					rs = ps.executeQuery();

					if (rs.next()) {
						int status = rs.getInt("status");
						long statusByUserId = rs.getLong("statusByUserId");
						String statusByUserName = rs.getString(
							"statusByUserName");
						Date statusDate = rs.getTimestamp("statusDate");

						return new Object[] {
							status, statusByUserId, statusByUserName, statusDate
						};
					}
				}
				finally {
					DataAccess.cleanUp(ps);
					DataAccess.cleanUp(rs);
				}
			}
		}
		finally {
			DataAccess.cleanUp(con);
		}

		return new Object[0];
	}

	protected void updateEVPServiceRequests() throws Exception {
		ServiceContext serviceContext =
			ServiceContextThreadLocal.getServiceContext();

		evpRequestOrganizationsMap =
			(Map<Long, Long>)serviceContext.getAttribute(
				"evpRequestOrganizationsMap");

		contactUserIdsMap = (Map<Long, Long>)serviceContext.getAttribute(
			"contactUserIdsMap");

		HashMap<Long, Long> evpServiceRequestMap = new HashMap<Long, Long>();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		PreparedStatement ps2 = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps2 = con.prepareStatement(
				"select * from evp_GeneralVolunteerServiceCompletion where " +
					"requestId = ?");

			ps = con.prepareStatement(
				"select * from evp_GeneralServiceRequest where requestId in (" +
					StringUtil.merge(_RECREATE_REQUEST_IDS) + ")");

			rs = ps.executeQuery();

			while (rs.next()) {
				long requestId = rs.getLong("requestId");
				long companyId = rs.getLong("companyId");
				long userId = rs.getLong("userId");
				Date createDate = rs.getTimestamp("createDate");
				long requestOrganizationId = rs.getLong(
					"requestOrganizationId");
				long managerUserId = rs.getLong("managerUserId");
				String description = rs.getString("description");
				int employmentType = rs.getInt("employmentType");
				int employmentHoursPerWeek = rs.getInt(
					"employmentHoursPerWeek");
				String purpose = rs.getString("purpose");
				String purposeOther = rs.getString("purposeOther");
				String behalfOf = rs.getString("behalfOf");
				String behalfOfOther = rs.getString("behalfOfOther");
				Date requestedStartDate = rs.getTimestamp("requestedStartDate");
				Date requestedEndDate = rs.getTimestamp("requestedEndDate");
				int requestedTotalHours = rs.getInt("requestedTotalHours");
				Date confirmedStartDate = rs.getTimestamp("confirmedStartDate");
				Date confirmedEndDate = rs.getTimestamp("confirmedEndDate");
				int confirmedTotalHours = rs.getInt("confirmedTotalHours");
				String contactBenefit = rs.getString(
					"organizationContactBenefited");
				String contactComments = rs.getString(
					"organizationContactComments");

				String feedbackDescription = null;
				String employeeBenefit = null;
				String recipientBenefit = null;

				ResultSet rs2 = null;

				try {
					ps2.setLong(1, requestId);

					rs2 = ps2.executeQuery();

					if (rs2.next()) {
						feedbackDescription = rs2.getString("whatDidYouDo");
						employeeBenefit = rs2.getString(
							"howYouWerePositivelyAffected");
						recipientBenefit = rs2.getString(
							"howPeopleWerePositivelyAffected");
					}
				}
				finally {
					DataAccess.cleanUp(rs2);
				}

				EVPServiceRequest evpServiceRequest = addEVPServiceRequest(
					requestId, companyId, userId, createDate,
					requestOrganizationId, managerUserId, description,
					employmentType, employmentHoursPerWeek, purpose,
					purposeOther, behalfOf, behalfOfOther, requestedStartDate,
					requestedEndDate, requestedTotalHours, confirmedStartDate,
					confirmedEndDate, confirmedTotalHours, contactBenefit,
					contactComments, feedbackDescription, employeeBenefit,
					recipientBenefit);

				if (evpServiceRequest == null) {
					_log.error("Skipping invalid service request " + requestId);

					continue;
				}

				WorkflowInstanceLinkLocalServiceUtil.addWorkflowInstanceLink(
					evpServiceRequest.getUserId(),
					evpServiceRequest.getCompanyId(),
					evpServiceRequest.getSubsidiaryGroupId(),
					EVPServiceRequest.class.getName(),
					evpServiceRequest.getEvpServiceRequestId(), increment());

				EVPDivision subsidiaryEVPDivision =
					EVPDivisionUtil.getSubsidiaryEVPDivision(userId);

				ResourceLocalServiceUtil.addResources(
					evpServiceRequest.getCompanyId(),
					subsidiaryEVPDivision.getOrganizationGroupId(), userId,
					EVPServiceRequest.class.getName(),
					evpServiceRequest.getEvpServiceRequestId(), false, true,
					true);

				evpServiceRequestMap.put(
					requestId, evpServiceRequest.getEvpServiceRequestId());
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
			DataAccess.cleanUp(ps2);
		}

		serviceContext.setAttribute(
			"evpServiceRequestMap", evpServiceRequestMap);
	}

	protected Map<Long, Long> contactUserIdsMap;
	protected Map<Long, Long> evpRequestOrganizationsMap;

	private static final int[] _RECREATE_REQUEST_IDS = {
		9639, 9764, 9771, 9775, 9778, 9788, 9799, 9817, 9818, 9819, 9821, 9822,
		9825, 9826, 9828, 9829, 9836, 9887, 9892, 9893, 9895, 9896, 9897, 9906,
		9907, 9909
	};

	private static Log _log = LogFactoryUtil.getLog(
		UpgradeEVPServiceRequest.class);

}
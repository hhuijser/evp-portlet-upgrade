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
import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPGrantTransaction;
import com.liferay.evp.model.EVPRequestOrganization;
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.evp.service.EVPGrantRequestLocalServiceUtil;
import com.liferay.evp.service.EVPGrantTransactionLocalServiceUtil;
import com.liferay.evp.service.EVPRequestOrganizationLocalServiceUtil;
import com.liferay.evp.util.EVPDivisionUtil;
import com.liferay.evp.util.EVPGrantRequestUtil;
import com.liferay.evp.util.EVPGrantTransactionConstants;
import com.liferay.evp.util.EVPWorkflowConstants;
import com.liferay.evp.util.PortletPropsKeys;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.Address;
import com.liferay.portal.model.EmailAddress;
import com.liferay.portal.model.Organization;
import com.liferay.portal.model.Phone;
import com.liferay.portal.model.User;
import com.liferay.portal.model.Website;
import com.liferay.portal.security.permission.ResourceActionsUtil;
import com.liferay.portal.service.AddressLocalServiceUtil;
import com.liferay.portal.service.ResourceLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.WebsiteLocalServiceUtil;
import com.liferay.portal.service.WorkflowInstanceLinkLocalServiceUtil;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppLocalServiceUtil;

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
public class UpgradeEVPGrantRequest extends UpgradeProcess {

	protected EVPGrantRequest addEVPGrantRequest(
			long requestId, long companyId, long userId, Date createDate,
			long requestOrganizationId, String description, int employmentType,
			int employmentHoursPerWeek, String purpose, String purposeOther,
			String behalfOf, String behalfOfOther)
		throws Exception {

		EVPGrantRequest evpGrantRequest =
			EVPGrantRequestLocalServiceUtil.createEVPGrantRequest(
				CounterLocalServiceUtil.increment());

		evpGrantRequest.setCompanyId(companyId);

		User user = UserLocalServiceUtil.getUser(userId);

		evpGrantRequest.setUserId(user.getUserId());
		evpGrantRequest.setUserName(user.getFullName());

		evpGrantRequest.setCreateDate(createDate);
		evpGrantRequest.setModifiedDate(new Date());

		if (contactUserIdsMap.containsKey(requestId)) {
			long contactUserId = contactUserIdsMap.get(requestId);

			User contactUser = UserLocalServiceUtil.getUser(contactUserId);

			List<EmailAddress> emailAddresses = contactUser.getEmailAddresses();

			if (!emailAddresses.isEmpty()) {
				EmailAddress emailAddress = emailAddresses.get(0);

				evpGrantRequest.setContactEmailAddressId(
					emailAddress.getEmailAddressId());
			}

			List<Phone> phones = contactUser.getPhones();

			if (!phones.isEmpty()) {
				Phone phone = phones.get(0);

				evpGrantRequest.setContactPhoneId(phone.getPhoneId());
			}

			evpGrantRequest.setContactUserId(contactUserId);
		}

		if (!evpRequestOrganizationsMap.containsKey(requestOrganizationId)) {
			_log.error(
				"No organization for request organization ID " +
					requestOrganizationId);

			return null;
		}

		long evpRequestOrganizationId = evpRequestOrganizationsMap.get(
			requestOrganizationId);

		evpGrantRequest.setEvpRequestOrganizationId(evpRequestOrganizationId);

		EVPRequestOrganization evpRequestOrganization =
			EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(
				evpRequestOrganizationId);

		List<Address> addresses = AddressLocalServiceUtil.getAddresses(
			companyId, Organization.class.getName(),
			evpRequestOrganization.getOrganizationId());

		Address address = addresses.get(0);

		evpGrantRequest.setRequestOrganizationAddressId(address.getAddressId());

		List<Website> websites = WebsiteLocalServiceUtil.getWebsites(
			companyId, Organization.class.getName(),
			evpRequestOrganization.getOrganizationId());

		Website website = websites.get(0);

		evpGrantRequest.setRequestOrganizationWebsiteId(website.getWebsiteId());

		EVPDivision subsidiaryEVPDivision =
			EVPDivisionUtil.getSubsidiaryEVPDivision(user.getUserId());

		evpGrantRequest.setSubsidiaryGroupId(
			subsidiaryEVPDivision.getOrganizationGroupId());

		evpGrantRequest.setDescription(description);
		evpGrantRequest.setEmploymentType(employmentType);
		evpGrantRequest.setEmploymentHoursPerWeek(employmentHoursPerWeek);
		evpGrantRequest.setPurpose(purpose);
		evpGrantRequest.setPurposeOther(purposeOther);
		evpGrantRequest.setBehalfOf(behalfOf);
		evpGrantRequest.setBehalfOfOther(behalfOfOther);
		evpGrantRequest.setStatus(EVPWorkflowConstants.GRANT_STATUS_COMPLETED);
		evpGrantRequest.setStatusByUserId(user.getUserId());
		evpGrantRequest.setStatusByUserName(user.getFullName());
		evpGrantRequest.setStatusDate(new Date());

		return EVPGrantRequestLocalServiceUtil.addEVPGrantRequest(
			evpGrantRequest);
	}

	protected EVPGrantTransaction addEVPGrantTransaction(
			long requestId, long companyId, long userId, Date createDate,
			EVPGrantRequest evpGrantRequest, int grantType, double amount,
			String currencyCode, Date date, String note, String number,
			String bankBICCode, String bankIBANCode, String bankName,
			String purposeOfUse)
		throws Exception {

		long fileEntryId = 0;

		if (grantType == EVPGrantTransactionConstants.GRANT_TYPE_MATCHING) {
			fileEntryId = getFileEntryId(requestId);
		}

		EVPGrantTransaction evpGrantTransaction =
			EVPGrantTransactionLocalServiceUtil.addEVPGrantTransaction(
				companyId, userId, createDate,
				evpGrantRequest.getEvpGrantRequestId(), fileEntryId, grantType,
				amount, currencyCode, date, note, number, bankBICCode,
				bankIBANCode, bankName, purposeOfUse);

		if (fileEntryId > 0) {
			Folder parentFolder = EVPGrantRequestUtil.getFolder(
				companyId, userId, evpGrantRequest.getSubsidiaryGroupId(),
				DLFolderConstants.DEFAULT_PARENT_FOLDER_ID,
				EVPGrantTransactionConstants.
					FOLDER_NAME_GRANT_REQUEST_RECEIPTS);

			Folder folder = EVPGrantRequestUtil.getFolder(
				companyId, userId, evpGrantRequest.getSubsidiaryGroupId(),
				parentFolder.getFolderId(),
				String.valueOf(evpGrantTransaction.getEvpGrantRequestId()));

			try {
				DLAppLocalServiceUtil.moveFileEntry(
					userId, fileEntryId, folder.getFolderId(),
					new ServiceContext());
			}
			catch (Exception e) {
			}
		}

		return evpGrantTransaction;
	}

	@Override
	protected void doUpgrade() throws Exception {
		updateEVPGrantRequests();
	}

	protected String[] getBankFields(long requestId) throws Exception {
		Connection con = null;

		String[] tableNames = new String[] {
			"evp_SpainGrantRequest", "evp_GermanyGrantRequest"
		};

		StringBundler sb = new StringBundler(4);

		sb.append(
			"select bankBICCode, bankIBANCode, bankName, purposeOfUse from ");
		sb.append(StringPool.NULL);
		sb.append(" where requestId = ");
		sb.append(requestId);

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			for (String tableName : tableNames) {
				sb.setStringAt(tableName, 1);

				PreparedStatement ps = null;
				ResultSet rs = null;

				try {
					ps = con.prepareStatement(sb.toString());

					rs = ps.executeQuery();

					if (rs.next()) {
						String bankBICCode = rs.getString("bankBICCode");
						String bankIBANCode = rs.getString("bankIBANCode");
						String bankName = rs.getString("bankName");
						String purposeOfUse = rs.getString("purposeOfUse");

						return new String[] {
							bankBICCode, bankIBANCode, bankName, purposeOfUse
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

		return GetterUtil.DEFAULT_STRING_VALUES;
	}

	protected long getFileEntryId(long requestId) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement(
				"select fileEntryId from evp_RequestFile where requestId = " +
					requestId);

			rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getLong("fileEntryId");
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
		}

		_log.error(
			"The matching grant receipt could not be found for request " +
				requestId);

		return 0;
	}

	protected String getGrantTypeAmountFieldName(int grantType) {
		if (grantType == EVPGrantTransactionConstants.GRANT_TYPE_MATCHING) {
			return "amountMatching";
		}
		else if (grantType ==
					EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED) {

			return "amountProposed";
		}
		else if (grantType ==
					EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP) {

			return "amountSponsorship";
		}
		else {
			throw new IllegalArgumentException(
				grantType + " is not a valid grant type");
		}
	}

	protected Object[] getStatusFields(long requestId) throws Exception {
		Connection con = null;

		String[] tableNames = new String[] {
			"evp_USGrantRequest", "evp_ChinaGrantRequest",
			"evp_SpainGrantRequest", "evp_BrazilGrantRequest",
			"evp_GermanyGrantRequest"
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

	protected void registerDependencies() throws Exception {
		ResourceActionsUtil.read(
			"evpportlet", UpgradeEVPGrantRequest.class.getClassLoader(),
			"resource-actions/default.xml");
	}

	protected void updateEVPGrantRequests() throws Exception {
		registerDependencies();

		ServiceContext serviceContext =
			ServiceContextThreadLocal.getServiceContext();

		evpRequestOrganizationsMap =
			(Map<Long, Long>)serviceContext.getAttribute(
				"evpRequestOrganizationsMap");

		contactUserIdsMap = (Map<Long, Long>)serviceContext.getAttribute(
			"contactUserIdsMap");

		HashMap<Long, Long> evpGrantRequestMap = new HashMap<Long, Long>();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		PreparedStatement ps2 = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps2 = con.prepareStatement(
				"select * from evp_GrantTransaction where requestId = ?");

			ps = con.prepareStatement(
				"select * from evp_GeneralGrantRequest where requestId = 9761");

			rs = ps.executeQuery();

			while (rs.next()) {
				long requestId = rs.getLong("requestId");
				long companyId = rs.getLong("companyId");
				long userId = rs.getLong("userId");
				Date createDate = rs.getTimestamp("createDate");
				long requestOrganizationId = rs.getLong(
					"requestOrganizationId");
				String description = rs.getString("description");
				int employmentType = rs.getInt("employmentType");
				int employmentHoursPerWeek = rs.getInt(
					"employmentHoursPerWeek");
				String purpose = rs.getString("purpose");
				String purposeOther = rs.getString("purposeOther");
				String behalfOf = rs.getString("behalfOf");
				String behalfOfOther = rs.getString("behalfOfOther");

				EVPGrantRequest evpGrantRequest = addEVPGrantRequest(
					requestId, companyId, userId, createDate,
					requestOrganizationId, description, employmentType,
					employmentHoursPerWeek, purpose, purposeOther, behalfOf,
					behalfOfOther);

				if (evpGrantRequest == null) {
					_log.error("Skipping invalid grant request "  + requestId);

					continue;
				}

				EVPDivision subsidiaryEVPDivision =
					EVPDivisionUtil.getSubsidiaryEVPDivision(userId);

				ResultSet rs2 = null;

				try {
					String bankBICCode = StringPool.BLANK;
					String bankIBANCode = StringPool.BLANK;
					String bankName = StringPool.BLANK;
					String purposeOfUse = StringPool.BLANK;

					String[] bankFields = getBankFields(requestId);

					if (bankFields.length > 0) {
						bankBICCode = bankFields[0];
						bankIBANCode = bankFields[1];
						bankName = bankFields[2];
						purposeOfUse = bankFields[3];
					}

					ps2.setLong(1, requestId);

					rs2 = ps2.executeQuery();

					while (rs2.next()) {
						int oldGrantType = rs2.getInt("grantType");

						int grantType = oldGrantType - 1;

						String grantTypeAmountFieldName =
							getGrantTypeAmountFieldName(grantType);

						double amount = rs.getInt(grantTypeAmountFieldName);

						String currencyCode =
							EVPDivisionLocalServiceUtil.
								fetchSubsidiaryPortletPropsValue(
									companyId,
									subsidiaryEVPDivision.
										getOrganizationGroupId(),
									PortletPropsKeys.
										SUBSIDIARY_CONFIGURATION_CURRENCY_CODE);

						Date date = rs2.getTimestamp("date_");
						String note = rs2.getString("note");
						String number = rs2.getString("number_");

						addEVPGrantTransaction(
							requestId, companyId, userId, createDate,
							evpGrantRequest, grantType, amount, currencyCode,
							date, note, number, bankBICCode, bankIBANCode,
							bankName, purposeOfUse);
					}
				}
				finally {
					DataAccess.cleanUp(rs2);
				}

				WorkflowInstanceLinkLocalServiceUtil.addWorkflowInstanceLink(
					evpGrantRequest.getUserId(), evpGrantRequest.getCompanyId(),
					evpGrantRequest.getSubsidiaryGroupId(),
					EVPGrantRequest.class.getName(),
					evpGrantRequest.getEvpGrantRequestId(), increment());

				ResourceLocalServiceUtil.addResources(
					evpGrantRequest.getCompanyId(),
					subsidiaryEVPDivision.getOrganizationGroupId(), userId,
					EVPGrantRequest.class.getName(),
					evpGrantRequest.getEvpGrantRequestId(), false, true, true);

				evpGrantRequestMap.put(
					requestId, evpGrantRequest.getEvpGrantRequestId());
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
			DataAccess.cleanUp(ps2);
		}

		serviceContext.setAttribute("evpGrantRequestMap", evpGrantRequestMap);
	}

	protected Map<Long, Long> contactUserIdsMap;
	protected Map<Long, Long> evpRequestOrganizationsMap;

	private static Log _log = LogFactoryUtil.getLog(
		UpgradeEVPGrantRequest.class);

}
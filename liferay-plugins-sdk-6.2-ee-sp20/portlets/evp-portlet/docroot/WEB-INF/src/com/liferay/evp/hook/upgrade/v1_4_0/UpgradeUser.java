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
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPRequestOrganization;
import com.liferay.evp.service.EVPRequestOrganizationLocalServiceUtil;
import com.liferay.evp.util.EVPDivisionUtil;
import com.liferay.evp.util.EVPPortalUtil;
import com.liferay.evp.util.EVPRoleConstants;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.util.CalendarFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StreamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.Contact;
import com.liferay.portal.model.EmailAddress;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.ListTypeConstants;
import com.liferay.portal.model.Organization;
import com.liferay.portal.model.Phone;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.EmailAddressLocalServiceUtil;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.service.PhoneLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portal.service.UserGroupRoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;

import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * @author Ethan Bustad
 */
public class UpgradeUser extends UpgradeProcess {

	protected EmailAddress addEmailAddress(
			long userId, String className, long classPK, String address)
		throws Exception {

		EmailAddress emailAddress =
			EmailAddressLocalServiceUtil.createEmailAddress(increment());

		User user = UserLocalServiceUtil.getUser(userId);

		emailAddress.setCompanyId(user.getCompanyId());
		emailAddress.setUserId(user.getUserId());
		emailAddress.setUserName(user.getFullName());

		Date now = new Date();

		emailAddress.setCreateDate(now);
		emailAddress.setModifiedDate(now);

		emailAddress.setClassName(className);
		emailAddress.setClassPK(classPK);
		emailAddress.setAddress(address);
		emailAddress.setTypeId(ListTypeConstants.CONTACT_EMAIL_ADDRESS_DEFAULT);

		return EmailAddressLocalServiceUtil.addEmailAddress(emailAddress);
	}

	protected Phone addPhone(
			long userId, String className, long classPK, String number)
		throws Exception {

		Phone phone = PhoneLocalServiceUtil.createPhone(increment());

		User user = UserLocalServiceUtil.getUser(userId);

		phone.setCompanyId(user.getCompanyId());
		phone.setUserId(user.getUserId());
		phone.setUserName(user.getFullName());

		Date now = new Date();

		phone.setCreateDate(now);
		phone.setModifiedDate(now);

		phone.setClassName(className);
		phone.setClassPK(classPK);
		phone.setNumber(number);
		phone.setTypeId(
			EVPPortalUtil.getListTypeId(
				ListTypeConstants.CONTACT_PHONE, "personal"));

		return PhoneLocalServiceUtil.addPhone(phone);
	}

	protected boolean containsAny(Set<Long> set, long[] array) {
		for (long element : array) {
			if (set.contains(element)) {
				return true;
			}
		}

		return false;
	}

	@Override
	protected void doUpgrade() throws Exception {
		long companyId = PortalUtil.getDefaultCompanyId();

		Set<Long> validRequestIds = getValidRequestIds();

		updateUsers(companyId, validRequestIds);
	}

	protected String getCellValue(Row row, int index) {
		Cell cell = row.getCell(index);

		if (cell == null) {
			return null;
		}

		DataFormatter dataFormatter = new DataFormatter();

		String value = dataFormatter.formatCellValue(cell);

		if (StringUtil.equalsIgnoreCase(value, StringPool.NULL)) {
			return null;
		}

		return value;
	}

	protected EVPRequestOrganization getEVPRequestOrganization(
			long requestOrganizationId,
			Map<Long, Long> evpRequestOrganizationsMap)
		throws Exception {

		long evpRequestOrganizationId = evpRequestOrganizationsMap.get(
			requestOrganizationId);

		return EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(
			evpRequestOrganizationId);
	}

	protected Set<Long> getRequestIds(String tableName) throws Exception {
		Set<Long> requestIds = new HashSet<Long>();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement("select requestId from " + tableName);

			rs = ps.executeQuery();

			while (rs.next()) {
				long requestId = rs.getLong("requestId");

				requestIds.add(requestId);
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
		}

		return requestIds;
	}

	protected Set<Long> getValidRequestIds() throws Exception {
		Set<Long> validRequestIds = getRequestIds("evp_GeneralGrantRequest");

		validRequestIds.addAll(getRequestIds("evp_GeneralServiceRequest"));

		return validRequestIds;
	}

	protected void updateUsers(long companyId, Set<Long> validRequestIds)
		throws Exception {

		ServiceContext serviceContext =
			ServiceContextThreadLocal.getServiceContext();

		Map<Long, Long> evpRequestOrganizationsMap =
			(HashMap<Long, Long>)serviceContext.getAttribute(
				"evpRequestOrganizationsMap");

		Group guestSiteGroup = GroupLocalServiceUtil.getGroup(
			companyId, GroupConstants.GUEST);

		HashMap<Long, Long> contactUserIdsMap = new HashMap<Long, Long>();

		InputStream inputStream = null;

		try {
			ClassLoader classLoader =
				UpgradeEVPRequestOrganization.class.getClassLoader();

			inputStream = classLoader.getResourceAsStream(
				"com/liferay/evp/hook/upgrade/v1_4_0/dependencies/" +
					"ContactUsers.xlsx");

			XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);

			Sheet sheet = xssfWorkbook.getSheetAt(0);

			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				Row row = sheet.getRow(i);

				String requestIdsString = getCellValue(row, 0);

				long[] requestIds = StringUtil.split(
					requestIdsString, StringPool.COMMA,
					GetterUtil.DEFAULT_LONG);

				if (!containsAny(validRequestIds, requestIds)) {
					continue;
				}

				String name = getCellValue(row, 1);

				String firstName = StringPool.NULL_CHAR;
				String lastName = StringPool.BLANK;

				if (Validator.isNotNull(name)) {
					String[] nameElements = name.split(StringPool.SPACE, 2);

					if (nameElements.length == 2) {
						firstName = nameElements[0];
						lastName = nameElements[1];
					}
					else {
						firstName = name;
					}
				}

				String emailAddressString = getCellValue(row, 2);

				if ((emailAddressString == null) ||
					!Validator.isEmailAddress(emailAddressString)) {

					emailAddressString = StringPool.NULL_CHAR;
				}

				long requestOrganizationId = GetterUtil.getLong(
					getCellValue(row, 5));

				EVPRequestOrganization evpRequestOrganization =
					getEVPRequestOrganization(
						requestOrganizationId, evpRequestOrganizationsMap);

				User creatorUser = UserLocalServiceUtil.getUser(
					evpRequestOrganization.getUserId());

				EVPDivision subsidiaryEVPDivision =
					EVPDivisionUtil.getSubsidiaryEVPDivision(
						creatorUser.getUserId());

				User contactUser = EVPPortalUtil.fetchContactUser(
					firstName, lastName, emailAddressString);

				if (contactUser == null) {
					Calendar calendar = CalendarFactoryUtil.getCalendar();

					contactUser = UserLocalServiceUtil.addUser(
						creatorUser.getUserId(), companyId, true, null, null,
						true, null, StringPool.BLANK, 0, StringPool.BLANK,
						creatorUser.getLocale(), firstName, StringPool.BLANK,
						lastName, 0, 0, true, calendar.get(Calendar.MONTH),
						calendar.get(Calendar.DAY_OF_MONTH),
						calendar.get(Calendar.YEAR), StringPool.BLANK,
						new long[0], new long[0], new long[0], new long[0],
						false, new ServiceContext());

					addEmailAddress(
						creatorUser.getUserId(), Contact.class.getName(),
						contactUser.getContactId(), emailAddressString);

					String phoneNumber = getCellValue(row, 3);

					if ((phoneNumber == null) ||
						!Validator.isPhoneNumber(phoneNumber)) {

						phoneNumber = StringPool.NULL_CHAR;
					}

					addPhone(
						creatorUser.getUserId(), Contact.class.getName(),
						contactUser.getContactId(), phoneNumber);
				}

				Organization organization =
					OrganizationLocalServiceUtil.getOrganization(
						evpRequestOrganization.getOrganizationId());

				Role organizationContactRole = RoleLocalServiceUtil.getRole(
					companyId, EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

				UserGroupRoleLocalServiceUtil.addUserGroupRoles(
					contactUser.getUserId(), organization.getGroupId(),
					new long[] {organizationContactRole.getRoleId()});

				UserGroupRoleLocalServiceUtil.addUserGroupRoles(
					contactUser.getUserId(),
					subsidiaryEVPDivision.getOrganizationGroupId(),
					new long[] {organizationContactRole.getRoleId()});

				for (long requestId : requestIds) {
					contactUserIdsMap.put(requestId, contactUser.getUserId());
				}
			}
		}
		finally {
			StreamUtil.cleanUp(inputStream);
		}

		serviceContext.setAttribute("contactUserIdsMap", contactUserIdsMap);
	}

}
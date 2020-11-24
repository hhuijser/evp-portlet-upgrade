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

package com.liferay.evp.hook.upgrade.v1_1_0;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.model.EVPRequestOrganization;
import com.liferay.evp.service.EVPRequestOrganizationLocalServiceUtil;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.util.DateFormatFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StreamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.Country;
import com.liferay.portal.model.Region;
import com.liferay.portal.model.User;
import com.liferay.portal.service.CountryServiceUtil;
import com.liferay.portal.service.RegionServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;

import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.text.DateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * @author Ethan Bustad
 */
public class UpgradeEVPRequestOrganization extends UpgradeProcess {

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

		Set<Long> validRequestOrganizationIds =
			getValidRequestOrganizationIds();

		updateEVPRequestOrganizations(companyId, validRequestOrganizationIds);
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

	protected Date getDate(String dateString) throws Exception {
		DateFormat dateFormat = DateFormatFactoryUtil.getSimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

		return dateFormat.parse(dateString);
	}

	protected Set<Long> getRequestOrganizationIds(String tableName)
		throws Exception {

		Set<Long> requestOrganizationIds = new HashSet<Long>();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement(
				"select requestOrganizationId from " + tableName);

			rs = ps.executeQuery();

			while (rs.next()) {
				long requestOrganizationId = rs.getLong(
					"requestOrganizationId");

				requestOrganizationIds.add(requestOrganizationId);
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
		}

		return requestOrganizationIds;
	}

	protected Set<Long> getValidRequestOrganizationIds() throws Exception {
		Set<Long> validRequestOrganizationIds = getRequestOrganizationIds(
			"evp_GeneralGrantRequest");

		validRequestOrganizationIds.addAll(
			getRequestOrganizationIds("evp_GeneralServiceRequest"));

		return validRequestOrganizationIds;
	}

	protected void updateEVPRequestOrganizations(
			long companyId, Set<Long> validRequestOrganizationIds)
		throws Exception {

		HashMap<Long, Long> evpRequestOrganizationsMap =
			new HashMap<Long, Long>();

		InputStream inputStream = null;

		try {
			ClassLoader classLoader =
				UpgradeEVPRequestOrganization.class.getClassLoader();

			inputStream = classLoader.getResourceAsStream(
				"com/liferay/evp/hook/upgrade/v1_1_0/dependencies/" +
					"EVPRequestOrganizations.xlsx");

			XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);

			Sheet sheet = xssfWorkbook.getSheetAt(0);

			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				Row row = sheet.getRow(i);

				String requestOrganizationIdsString = getCellValue(row, 0);

				long[] requestOrganizationIds = GetterUtil.getLongValues(
					StringUtil.split(requestOrganizationIdsString));

				if (!containsAny(
						validRequestOrganizationIds, requestOrganizationIds)) {

					continue;
				}

				String creatorEmailAddressString = getCellValue(row, 3);

				User user = UserLocalServiceUtil.getUserByEmailAddress(
					companyId, creatorEmailAddressString);

				String createDateString = getCellValue(row, 4);

				Date createDate = getDate(createDateString);

				String organizationName = getCellValue(row, 5);

				String street1 = getCellValue(row, 6);

				street1 = StringUtil.replace(
					street1, StringPool.NEW_LINE, StringPool.SPACE);
				street1 = StringUtil.shorten(street1, 75);

				String city = getCellValue(row, 7);
				String zip = getCellValue(row, 8);

				String countryName = getCellValue(row, 11);

				Country country = CountryServiceUtil.getCountryByName(
					countryName);

				long regionId = 0;

				String regionCode = getCellValue(row, 10);

				if (Validator.isNotNull(regionCode)) {
					Region region = RegionServiceUtil.getRegion(
						country.getCountryId(), regionCode);

					regionId = region.getRegionId();
				}

				String url = getCellValue(row, 12);

				String taxIdentificationNumber = getCellValue(row, 13);

				EVPRequestOrganization evpRequestOrganization =
					EVPRequestOrganizationLocalServiceUtil.
						addEVPRequestOrganization(
							companyId, user.getUserId(), createDate,
							organizationName, taxIdentificationNumber, street1,
							city, zip, regionId, country.getCountryId(), url);

				for (long requestOrganizationId : requestOrganizationIds) {
					evpRequestOrganizationsMap.put(
						requestOrganizationId,
						evpRequestOrganization.getEvpRequestOrganizationId());
				}
			}
		}
		finally {
			StreamUtil.cleanUp(inputStream);
		}

		ServiceContext serviceContext =
			ServiceContextThreadLocal.getServiceContext();

		serviceContext.setAttribute(
			"evpRequestOrganizationsMap", evpRequestOrganizationsMap);
	}

}
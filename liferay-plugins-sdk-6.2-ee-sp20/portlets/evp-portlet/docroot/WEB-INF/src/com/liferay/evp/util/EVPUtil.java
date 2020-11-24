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

package com.liferay.evp.util;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.util.HttpUtil;
import com.liferay.compat.portal.kernel.util.MapUtil;
import com.liferay.compat.portal.kernel.util.StringUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPEmployee;
import com.liferay.evp.service.EVPEmployeeLocalServiceUtil;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.util.Base64;
import com.liferay.portal.kernel.util.DateFormatFactoryUtil;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.User;
import com.liferay.portal.security.ldap.PortalLDAPImporterUtil;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;

import java.text.DateFormat;
import java.text.MessageFormat;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author Val Nagy
 */
public class EVPUtil {

	public static User importLDAPUser(long companyId, String emailAddressString)
		throws Exception {

		return importLDAPUser(
			companyId, emailAddressString, _LDAP_IMPORT_LIMIT_DEFAULT);
	}

	public static User importLDAPUser(
			long companyId, String emailAddressString, int limit)
		throws Exception {

		for (int i = 0; i < limit; i++) {
			try {
				return PortalLDAPImporterUtil.importLDAPUser(
					companyId, emailAddressString, StringPool.BLANK);
			}
			catch (Exception e) {
			}
		}

		return null;
	}

	public static void updateEVPEmployee(long companyId, long userId)
		throws Exception {

		int employmentType = 0;

		User user = UserLocalServiceUtil.getUser(userId);

		String baseLoopAPIUrl = MessageFormat.format(
			PortletPropsValues.EVP_LOOP_API_URL,
			new Object[] {user.getScreenName()});

		try {
			employmentType = getEmploymentType(baseLoopAPIUrl);
		}
		catch (Exception e) {
			throw new Exception(
				"Unable to retrieve employment type for user " +
				user.getFullName(), e);
		}

		Date hireDate = null;

		try {
			hireDate = getHireDate(baseLoopAPIUrl);
		}
		catch (Exception e) {
			throw new Exception(
				"Unable to retrieve hire date for user " + user.getFullName(),
				e);
		}

		long managerUserId = 0;

		try {
			managerUserId = getManagerUserId(companyId, baseLoopAPIUrl);
		}
		catch (Exception e) {
			throw new Exception(
				"Unable to retrieve manager for user " + user.getFullName(), e);
		}

		long subsidiaryEVPDivisionId = 0;

		try {
			subsidiaryEVPDivisionId = getSubsidiaryEVPDivisionId(
				companyId, baseLoopAPIUrl);
		}
		catch (Exception e) {
			throw new Exception(
				"Unable to retrieve subsidiary for user " + user.getFullName(),
				e);
		}

		EVPEmployee evpEmployee =
			EVPEmployeeLocalServiceUtil.fetchEVPEmployeeByEmployeeUserId(
				user.getUserId());

		if (evpEmployee == null) {
			EVPEmployeeLocalServiceUtil.addEVPEmployee(
				user.getUserId(), user.getUserId(), managerUserId,
				subsidiaryEVPDivisionId, employmentType, hireDate);
		}
		else {
			evpEmployee.setManagerUserId(managerUserId);
			evpEmployee.setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
			evpEmployee.setEmploymentType(employmentType);
			evpEmployee.setHireDate(hireDate);

			EVPEmployeeLocalServiceUtil.updateEVPEmployee(evpEmployee);
		}
	}

	protected static int getEmploymentType(String baseLoopAPIUrl)
		throws Exception {

		JSONObject employeeDataJSONObject = getLoopPersonJSONObject(
			baseLoopAPIUrl);

		String employmentType = employeeDataJSONObject.getString(
			"employmentType");

		String[] loopEVPEmploymentTypeMappings = StringUtil.split(
			PortletPropsValues.LOOP_EVP_EMPLOYMENT_TYPE_MAPPINGS,
			StringPool.SEMICOLON);

		Map<String, String> loopEVPEmploymentTypeMap = MapUtil.toLinkedHashMap(
			loopEVPEmploymentTypeMappings, StringPool.EQUAL);

		if (!loopEVPEmploymentTypeMap.containsKey(employmentType)) {
			throw new Exception("Invalid employment type " + employmentType);
		}

		return GetterUtil.getInteger(
			loopEVPEmploymentTypeMap.get(employmentType));
	}

	protected static Date getHireDate(String baseLoopAPIUrl) throws Exception {
		JSONObject employeeDataJSONObject = getLoopPersonJSONObject(
			baseLoopAPIUrl);

		String hireDateString = employeeDataJSONObject.getString("hireDate");

		DateFormat dateFormat = DateFormatFactoryUtil.getSimpleDateFormat(
			"MMM dd, yyyy");

		return dateFormat.parse(hireDateString);
	}

	protected static JSONObject getLoopPersonJSONObject(String baseLoopAPIUrl)
		throws Exception {

		String urlString =
			baseLoopAPIUrl +
				PortletPropsValues.EVP_LOOP_API_URL_LOOP_PERSON_SUFFIX;

		JSONObject employeeJSONObject = JSONFactoryUtil.createJSONObject(
			urlToString(urlString));

		return employeeJSONObject.getJSONObject("data");
	}

	protected static long getManagerUserId(
			long companyId, String baseLoopAPIUrl)
		throws Exception {

		String urlString =
			baseLoopAPIUrl +
				PortletPropsValues.EVP_LOOP_API_URL_MANAGER_ID_SUFFIX;

		JSONObject managersResponseJSONObject =
			JSONFactoryUtil.createJSONObject(urlToString(urlString));

		JSONObject managersDataJSONObject =
			managersResponseJSONObject.getJSONObject("data");

		JSONArray managersJSONArray = managersDataJSONObject.getJSONArray(
			"results");

		JSONObject managerJSONObject = managersJSONArray.getJSONObject(0);

		String managerEmailAddress = managerJSONObject.getString(
			"emailAddress");

		User managerUser = null;

		try {
			managerUser = UserLocalServiceUtil.getUserByEmailAddress(
				companyId, managerEmailAddress);
		}
		catch (Exception e) {
			managerUser = importLDAPUser(companyId, managerEmailAddress);
		}

		if (managerUser == null) {
			throw new Exception(
				"No manager associated with the email address " +
					managerEmailAddress);
		}

		return managerUser.getUserId();
	}

	protected static long getSubsidiaryEVPDivisionId(
			long companyId, String baseLoopAPIUrl)
		throws Exception {

		String urlString =
			baseLoopAPIUrl +
				PortletPropsValues.EVP_LOOP_API_URL_SUBSIDIARY_SUFFIX;

		JSONObject divisionsResponseJSONObject =
			JSONFactoryUtil.createJSONObject(urlToString(urlString));

		JSONObject divisionsDataJSONObject =
			divisionsResponseJSONObject.getJSONObject("data");

		JSONArray divisionsJSONArray = divisionsDataJSONObject.getJSONArray(
			"results");

		for (int i = 0; i < divisionsJSONArray.length(); i++) {
			JSONObject divisionJSONObject = divisionsJSONArray.getJSONObject(i);

			if (divisionJSONObject.getInt("type") != 4) {
				continue;
			}

			String loopDivisionMappingsString = HttpUtil.decodeURL(
				PortletPropsValues.LOOP_DIVISION_SUBSIDIARY_MAPPINGS);

			String[] loopDivisionMappings = StringUtil.split(
				loopDivisionMappingsString, StringPool.SEMICOLON);

			Map<String, String> loopEVPDivisionsMap = MapUtil.toLinkedHashMap(
				loopDivisionMappings, StringPool.EQUAL);

			String divisionName = divisionJSONObject.getString("name");

			if (!loopEVPDivisionsMap.containsKey(divisionName)) {
				continue;
			}

			AlloyServiceInvoker evpDivisionAlloyServiceInvoker =
				new AlloyServiceInvoker(EVPDivision.class.getName());

			List<EVPDivision> subsidiaryEVPDivisions =
				evpDivisionAlloyServiceInvoker.executeDynamicQuery(
					new Object[] {
						"companyId", companyId, "abbreviation",
						loopEVPDivisionsMap.get(divisionName)
					});

			if (!subsidiaryEVPDivisions.isEmpty()) {
				EVPDivision subsidiaryEVPDivision = subsidiaryEVPDivisions.get(
					0);

				return subsidiaryEVPDivision.getEvpDivisionId();
			}
		}

		throw new Exception("No subsidiary returned from Loop");
	}

	protected static String urlToString(String urlString) throws Exception {
		URL url = new URL(urlString);

		URLConnection urlConnection = url.openConnection();

		urlConnection.setConnectTimeout(
			PortletPropsValues.EVP_GLOBAL_API_TIMEOUT);
		urlConnection.setDoOutput(true);

		String credentials =
			PortletPropsValues.EVP_LOOP_API_USERNAME + StringPool.COLON +
				PortletPropsValues.EVP_LOOP_API_PASSWORD;

		urlConnection.setRequestProperty(
			"Authorization", "Basic " + Base64.encode(credentials.getBytes()));
		urlConnection.setRequestProperty("Content-Type", "application/json");

		try {
			return new String(
				FileUtil.getBytes(urlConnection.getInputStream()));
		}
		catch (SocketTimeoutException ste) {
			throw new Exception("Connection timed out on " + urlString, ste);
		}
	}

	private static final int _LDAP_IMPORT_LIMIT_DEFAULT = 5;

}
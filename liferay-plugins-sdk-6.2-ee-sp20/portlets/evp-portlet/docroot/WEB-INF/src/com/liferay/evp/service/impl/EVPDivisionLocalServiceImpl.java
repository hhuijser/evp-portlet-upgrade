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

package com.liferay.evp.service.impl;

import com.liferay.compat.portal.kernel.util.ArrayUtil;
import com.liferay.compat.portal.kernel.util.HttpUtil;
import com.liferay.compat.portal.kernel.util.StringUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPEmployee;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPGrantTransaction;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.service.base.EVPDivisionLocalServiceBaseImpl;
import com.liferay.evp.util.EVPDivisionConstants;
import com.liferay.evp.util.EVPWorkflowConstants;
import com.liferay.evp.util.PortletKeys;
import com.liferay.evp.util.PortletPropsValues;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.util.BigDecimalUtil;
import com.liferay.portal.kernel.util.CalendarFactoryUtil;
import com.liferay.portal.kernel.util.DateUtil;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.xml.Document;
import com.liferay.portal.kernel.xml.Element;
import com.liferay.portal.kernel.xml.SAXReaderUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.PortletPreferencesLocalServiceUtil;
import com.liferay.util.portlet.PortletProps;

import java.io.InputStream;

import java.math.RoundingMode;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletPreferences;

/**
 * @author Val Nagy
 */
public class EVPDivisionLocalServiceImpl
	extends EVPDivisionLocalServiceBaseImpl {

	public String fetchSubsidiaryPortletPropsValue(
			long companyId, long groupId, String portletPropsKey)
		throws SystemException {

		PortletPreferences preferences =
			PortletPreferencesLocalServiceUtil.getPreferences(
				companyId, groupId, PortletKeys.PREFS_OWNER_TYPE_GROUP, 0,
				PortletKeys.EVP);

		String value = preferences.getValue(portletPropsKey, null);

		if (Validator.isNull(value)) {
			value = PortletProps.get(portletPropsKey);
		}

		return value;
	}

	public Map<String, Object> getEVPStats(long companyId, long userId)
		throws PortalException, SystemException {

		Map<String, Object> evpStats = new HashMap<String, Object>();

		boolean evpStatsUpdate = false;

		if (_evpStatsUpdatedDate == null) {
			evpStatsUpdate = true;

			_evpStatsUpdatedDate = new Date();
		}
		else {
			Date now = new Date();

			long timeDifference =
				now.getTime() - _evpStatsUpdatedDate.getTime();

			if (timeDifference >=
					(PortletPropsValues.EVP_STATS_UPDATE_MINUTES * 60000)) {

				evpStatsUpdate = true;

				_evpStatsUpdatedDate = now;
			}
		}

		long organizationGroupId = 0;

		try {
			EVPDivision subsidiaryEVPDivision = getSubsidiaryEVPDivision(
				userId);

			organizationGroupId =
				subsidiaryEVPDivision.getOrganizationGroupId();
		}
		catch (Exception e) {
		}

		String userCurrencyCode = StringUtil.toUpperCase(
			fetchSubsidiaryPortletPropsValue(
				companyId, organizationGroupId,
				_SUBSIDIARY_PORTLET_PROPS_KEY_CURRENCY_CODE));

		evpStats.put("evpStatCurrencyCode", userCurrencyCode);
		evpStats.put(
			"evpStatGrantMoneyDistributed",
			getGrantMoneyDistributed(
				companyId, userCurrencyCode, evpStatsUpdate));

		evpStats.put(
			"evpStatEmployeesParticipated",
			getEmployeesParticipated(companyId, evpStatsUpdate));
		evpStats.put(
			"evpStatNonprofitsServed",
			getNonprofitsServed(companyId, evpStatsUpdate));
		evpStats.put(
			"evpStatServiceHoursCompleted",
			getServiceHoursCompleted(companyId, evpStatsUpdate));

		Calendar calendar = CalendarFactoryUtil.getCalendar();

		evpStats.put(
			"evpStatYearsActive",
			calendar.get(Calendar.YEAR) - _YEAR_EVP_ESTABLISHED);

		return evpStats;
	}

	public EVPDivision getSubsidiaryEVPDivision(long userId)
		throws PortalException, SystemException {

		EVPEmployee evpEmployee =
			evpEmployeeLocalService.getEVPEmployeeByEmployeeUserId(userId);

		return evpDivisionPersistence.findByPrimaryKey(
			evpEmployee.getSubsidiaryEVPDivisionId());
	}

	public String getSubsidiaryPortletPropsValue(
			long companyId, long subsidiaryGroupId, String portletPropsKey)
		throws SystemException {

		String subsidiaryPortletPropsValue = fetchSubsidiaryPortletPropsValue(
			companyId, subsidiaryGroupId, portletPropsKey);

		if (subsidiaryPortletPropsValue == null) {
			throw new SystemException(
				"Subsidiary portlet props value is null for key " +
					portletPropsKey);
		}

		return subsidiaryPortletPropsValue;
	}

	public Map<String, Object> getSubsidiaryPortletPropsValues(
			long companyId, long groupId)
		throws SystemException {

		Map<String, Object> portletPropsValues = new HashMap<String, Object>();

		for (String portletPropsKey : getSubsidiaryPortletPropsKeys()) {
			Object subsidiaryPortletPropsValue =
				fetchSubsidiaryPortletPropsValue(
					companyId, groupId, portletPropsKey);

			if (portletPropsKey.equals(
					_SUBSIDIARY_PORTLET_PROPS_KEY_ABBREVIATION)) {

				portletPropsValues.put(
					_IS_SUBSIDIARY_KEY_PREFIX +
						StringUtil.toUpperCase(
							subsidiaryPortletPropsValue.toString()),
					StringPool.TRUE);
			}

			portletPropsValues.put(
				portletPropsKey, subsidiaryPortletPropsValue);
		}

		return portletPropsValues;
	}

	protected int getEmployeesParticipated(long companyId, boolean update)
		throws PortalException, SystemException {

		if (!_employeesParticipated.isEmpty() && !update) {
			return _employeesParticipated.size();
		}

		if (_employeesParticipatedLegacy.isEmpty()) {
			try {
				Class<?> clazz = getClass();

				ClassLoader classLoader = clazz.getClassLoader();

				InputStream inputStream = classLoader.getResourceAsStream(
					_EMPLOYEES_PARTICIPATED_2010_2013_FILE_NAME);

				String xml = new String(FileUtil.getBytes(inputStream));

				Document document = SAXReaderUtil.read(xml);

				Element rootElement = document.getRootElement();

				List<Element> screenNameElements = rootElement.elements();

				for (Element screenNameElement : screenNameElements) {
					_employeesParticipatedLegacy.add(
						screenNameElement.getStringValue());
				}
			}
			catch (Exception e) {
				throw new SystemException(e);
			}
		}

		_employeesParticipated = new HashSet<String>(
			_employeesParticipatedLegacy);

		List<EVPGrantRequest> evpGrantRequests =
			evpGrantRequestPersistence.findByC_S(
				companyId, EVPWorkflowConstants.GRANT_STATUSES_EXCLUDABLE);

		for (EVPGrantRequest evpGrantRequest : evpGrantRequests) {
			User user = userPersistence.fetchByPrimaryKey(
				evpGrantRequest.getUserId());

			if (user == null) {
				continue;
			}

			_employeesParticipated.add(user.getScreenName());
		}

		List<EVPServiceRequest> evpServiceRequests =
			evpServiceRequestPersistence.findByC_S(
				companyId, EVPWorkflowConstants.SERVICE_STATUSES_EXCLUDABLE);

		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			User user = userPersistence.fetchByPrimaryKey(
				evpServiceRequest.getUserId());

			if (user == null) {
				continue;
			}

			_employeesParticipated.add(user.getScreenName());
		}

		return _employeesParticipated.size();
	}

	protected double getGrantMoneyDistributed(
			long companyId, String currencyCode, boolean update)
		throws PortalException, SystemException {

		if (_usdFixingRateUpdatedDate == null) {
			try {
				setUSDFixingRates();

				_usdFixingRateUpdatedDate = new Date();
			}
			catch (Exception e) {
			}
		}
		else {
			Date now = new Date();

			int daysBetween = DateUtil.getDaysBetween(
				now, _usdFixingRateUpdatedDate);

			if (_usdFixingRates.isEmpty() ||
				(daysBetween >= PortletPropsValues.FIXING_RATE_UPDATE_DAYS)) {

				try {
					setUSDFixingRates();

					_usdFixingRateUpdatedDate = now;
				}
				catch (Exception e) {
				}
			}
		}

		if (_grantMoneyDistributed.isEmpty() || update) {
			setGrantMoneyDistributed(companyId);
		}

		if (!_grantMoneyDistributed.containsKey(currencyCode)) {
			return -1;
		}

		return _grantMoneyDistributed.get(currencyCode);
	}

	protected int getNonprofitsServed(long companyId, boolean update)
		throws SystemException {

		if (!update) {
			return _nonProfitsServed;
		}

		_nonProfitsServed =
			evpRequestOrganizationPersistence.countByCompanyId(companyId) +
				_NONPROFITS_SERVED_2010_2013;

		return _nonProfitsServed;
	}

	protected int getServiceHoursCompleted(long companyId, boolean update)
		throws SystemException {

		if (!update) {
			return _serviceHoursCompleted;
		}

		_serviceHoursCompleted = _SERVICE_HOURS_COMPLETED_2010_2013;

		List<EVPServiceRequest> evpServiceRequests =
			evpServiceRequestPersistence.findByC_S(
				companyId, EVPWorkflowConstants.SERVICE_STATUSES_EXCLUDABLE);

		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			_serviceHoursCompleted +=
				evpServiceRequest.getRequestedTotalHours();
		}

		return _serviceHoursCompleted;
	}

	protected String[] getSubsidiaryPortletPropsKeys() {
		if (_subsidiaryPortletPropsKeys != null) {
			return _subsidiaryPortletPropsKeys;
		}

		List<String> portletPropsKeys = new ArrayList<String>();

		Properties properties = PortletProps.getProperties();

		for (Map.Entry<Object, Object> entry : properties.entrySet()) {
			String key = String.valueOf(entry.getKey());

			if (key.startsWith(_SUBSIDIARY_PORTLET_PROPS_KEYS_PREFIX)) {
				portletPropsKeys.add(key);
			}
		}

		_subsidiaryPortletPropsKeys = ArrayUtil.toStringArray(
			portletPropsKeys.toArray());

		return _subsidiaryPortletPropsKeys;
	}

	protected void setGrantMoneyDistributed(long companyId)
		throws SystemException {

		double grantMoneyDistributed = _GRANT_MONEY_DISTRIBUTED_2010_2013;

		List<EVPGrantTransaction> evpGrantTransactions =
			evpGrantTransactionPersistence.findAll();

		for (EVPGrantTransaction evpGrantTransaction : evpGrantTransactions) {
			String currencyCode = StringUtil.toUpperCase(
				evpGrantTransaction.getCurrencyCode());

			if (!_usdFixingRates.containsKey(currencyCode)) {
				continue;
			}

			double grantTransactionAmount = BigDecimalUtil.divide(
				evpGrantTransaction.getAmount(),
				_usdFixingRates.get(currencyCode), 2, RoundingMode.HALF_EVEN);

			grantMoneyDistributed = BigDecimalUtil.add(
				grantMoneyDistributed, grantTransactionAmount);
		}

		List<EVPDivision> evpDivisions = evpDivisionPersistence.findByC_T(
			companyId, EVPDivisionConstants.TYPE_SUBSIDIARY);

		for (EVPDivision evpDivision : evpDivisions) {
			String subsidiaryCurrencyCode = StringUtil.toUpperCase(
				fetchSubsidiaryPortletPropsValue(
					companyId, evpDivision.getOrganizationGroupId(),
					_SUBSIDIARY_PORTLET_PROPS_KEY_CURRENCY_CODE));

			if (!_usdFixingRates.containsKey(subsidiaryCurrencyCode)) {
				_grantMoneyDistributed.put(subsidiaryCurrencyCode, -1.0);

				continue;
			}

			double convertedGrantMoneyDistributed = BigDecimalUtil.multiply(
				grantMoneyDistributed,
				_usdFixingRates.get(subsidiaryCurrencyCode));

			_grantMoneyDistributed.put(
				subsidiaryCurrencyCode,
				BigDecimalUtil.scale(
					convertedGrantMoneyDistributed, 2, RoundingMode.HALF_EVEN));
		}
	}

	protected void setUSDFixingRates() throws Exception {
		String fixingRateURL = String.format(
			PortletPropsValues.FIXING_RATE_API_URL, new Date());

		String response = HttpUtil.URLtoString(fixingRateURL);

		JSONObject jsonObject = JSONFactoryUtil.createJSONObject(response);

		JSONObject ratesJSONObject = jsonObject.getJSONObject("rates");

		if (ratesJSONObject == null) {
			return;
		}

		_usdFixingRates = (Map<String, Double>)JSONFactoryUtil.looseDeserialize(
			ratesJSONObject.toString());
	}

	private static final String _EMPLOYEES_PARTICIPATED_2010_2013_FILE_NAME =
		"/com/liferay/evp/dependencies/employees-participated-2010-2013.xml";

	private static final double _GRANT_MONEY_DISTRIBUTED_2010_2013 = 50000;

	private static final String _IS_SUBSIDIARY_KEY_PREFIX = "isSubsidiary";

	private static final int _NONPROFITS_SERVED_2010_2013 = 40;

	private static final int _SERVICE_HOURS_COMPLETED_2010_2013 = 4550;

	private static final String _SUBSIDIARY_PORTLET_PROPS_KEY_ABBREVIATION =
		"subsidiary.configuration.abbreviation";

	private static final String _SUBSIDIARY_PORTLET_PROPS_KEY_CURRENCY_CODE =
		"subsidiary.configuration.currency.code";

	private static final String _SUBSIDIARY_PORTLET_PROPS_KEYS_PREFIX =
		"subsidiary.configuration";

	private static final int _YEAR_EVP_ESTABLISHED = 2010;

	private Set<String> _employeesParticipated = new HashSet<String>();
	private Set<String> _employeesParticipatedLegacy = new HashSet<String>();
	private Date _evpStatsUpdatedDate;
	private Map<String, Double> _grantMoneyDistributed =
		new HashMap<String, Double>();
	private int _nonProfitsServed;
	private int _serviceHoursCompleted;
	private String[] _subsidiaryPortletPropsKeys;
	private Map<String, Double> _usdFixingRates = new HashMap<String, Double>();
	private Date _usdFixingRateUpdatedDate;

}
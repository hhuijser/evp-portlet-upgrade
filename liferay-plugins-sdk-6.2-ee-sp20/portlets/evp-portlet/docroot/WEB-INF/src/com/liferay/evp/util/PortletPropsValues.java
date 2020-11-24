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

import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.util.portlet.PortletProps;

/**
 * @author Val Nagy
 */
public class PortletPropsValues {

	public static final String AUTO_EMPLOYEE_EMAIL_DOMAIN = PortletProps.get(
		PortletPropsKeys.AUTO_EMPLOYEE_EMAIL_DOMAIN);

	public static final int EVP_GLOBAL_API_TIMEOUT = GetterUtil.getInteger(
		PortletProps.get(PortletPropsKeys.EVP_GLOBAL_API_TIMEOUT));

	public static final String EVP_LOOP_API_PASSWORD = PortletProps.get(
		PortletPropsKeys.EVP_LOOP_API_PASSWORD);

	public static final String EVP_LOOP_API_URL = PortletProps.get(
		PortletPropsKeys.EVP_LOOP_API_URL);

	public static final String EVP_LOOP_API_URL_LOOP_PERSON_SUFFIX =
		PortletProps.get(PortletPropsKeys.EVP_LOOP_API_URL_LOOP_PERSON_SUFFIX);

	public static final String EVP_LOOP_API_URL_MANAGER_ID_SUFFIX =
		PortletProps.get(PortletPropsKeys.EVP_LOOP_API_URL_MANAGER_ID_SUFFIX);

	public static final String EVP_LOOP_API_URL_SUBSIDIARY_SUFFIX =
		PortletProps.get(PortletPropsKeys.EVP_LOOP_API_URL_SUBSIDIARY_SUFFIX);

	public static final String EVP_LOOP_API_USERNAME = PortletProps.get(
		PortletPropsKeys.EVP_LOOP_API_USERNAME);

	public static final int EVP_STATS_UPDATE_MINUTES = GetterUtil.getInteger(
		PortletProps.get(PortletPropsKeys.EVP_STATS_UPDATE_MINUTES));

	public static final String FIXING_RATE_API_URL = PortletProps.get(
		PortletPropsKeys.FIXING_RATE_API_URL);

	public static final int FIXING_RATE_UPDATE_DAYS = GetterUtil.getInteger(
		PortletProps.get(PortletPropsKeys.FIXING_RATE_UPDATE_DAYS));

	public static final String[] JOURNAL_ARTICLE_PARSE_CONTENT_ARTICLE_IDS =
		PortletProps.getArray(
			PortletPropsKeys.JOURNAL_ARTICLE_PARSE_CONTENT_ARTICLE_IDS);

	public static final String LOOP_DIVISION_SUBSIDIARY_MAPPINGS =
		PortletProps.get(PortletPropsKeys.LOOP_DIVISION_SUBSIDIARY_MAPPINGS);

	public static final String LOOP_EVP_EMPLOYMENT_TYPE_MAPPINGS =
		PortletProps.get(PortletPropsKeys.LOOP_EVP_EMPLOYMENT_TYPE_MAPPINGS);

}
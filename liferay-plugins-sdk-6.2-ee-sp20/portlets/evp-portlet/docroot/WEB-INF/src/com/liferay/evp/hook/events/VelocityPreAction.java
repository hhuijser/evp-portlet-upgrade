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

package com.liferay.evp.hook.events;

import com.liferay.compat.portal.util.PortalUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.evp.util.PortletKeys;
import com.liferay.portal.kernel.events.Action;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.WebKeys;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Wesley Gong
 */
public class VelocityPreAction extends Action {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response)
		throws ActionException {

		try {
			doRun(request);
		}
		catch (Exception e) {
			throw new ActionException(e);
		}
	}

	protected void doRun(HttpServletRequest request) throws Exception {
		long userId = PortalUtil.getUserId(request);

		try {
			Map<String, Object> evpStats =
				EVPDivisionLocalServiceUtil.getEVPStats(
					PortalUtil.getCompanyId(request), userId);

			processMap(request, evpStats);
		}
		catch (Exception e) {
			_log.error(e, e);
		}

		if (userId == 0) {
			return;
		}

		EVPDivision subsidiaryEVPDivision = null;

		try {
			subsidiaryEVPDivision =
				EVPDivisionLocalServiceUtil.getSubsidiaryEVPDivision(userId);
		}
		catch (Exception e) {
		}

		if (subsidiaryEVPDivision == null) {
			return;
		}

		Map<String, Object> evpSubsidiaryPortletPropsValues =
			EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValues(
				subsidiaryEVPDivision.getCompanyId(),
				subsidiaryEVPDivision.getOrganizationGroupId());

		String controllerPath = ParamUtil.getString(
			request, StringPool.UNDERLINE + PortletKeys.EVP + "_controller",
			_CONTROLLER_PATH_GRANT_REQUESTS);

		if (controllerPath.equals(_CONTROLLER_PATH_GRANT_REQUESTS)) {
			evpSubsidiaryPortletPropsValues.put(
				_IS_CONTROLLER_KEY_PREFIX +
					_IS_CONTROLLER_KEY_POSTFIX_GRANT_REQUESTS,
				StringPool.TRUE);
		}
		else if (controllerPath.equals(_CONTROLLER_PATH_SERVICE_REQUESTS)) {
			evpSubsidiaryPortletPropsValues.put(
				_IS_CONTROLLER_KEY_PREFIX +
					_IS_CONTROLLER_KEY_POSTFIX_SERVICE_REQUESTS,
				StringPool.TRUE);
		}

		processMap(request, evpSubsidiaryPortletPropsValues);
	}

	protected void processMap(
		HttpServletRequest request, Map<String, Object> map) {

		Map<String, Object> vmVariables =
			(Map<String, Object>)request.getAttribute(WebKeys.VM_VARIABLES);

		if (vmVariables == null) {
			vmVariables = new HashMap<String, Object>();
		}

		for (Map.Entry<String, Object> entry : map.entrySet()) {
			vmVariables.put(
				entry.getKey(),
				StringPool.QUOTE + String.valueOf(entry.getValue()) +
					StringPool.QUOTE);
		}

		request.setAttribute(WebKeys.VM_VARIABLES, vmVariables);
	}

	private static final String _CONTROLLER_PATH_GRANT_REQUESTS =
		"grant_requests";

	private static final String _CONTROLLER_PATH_SERVICE_REQUESTS =
		"service_requests";

	private static final String _IS_CONTROLLER_KEY_POSTFIX_GRANT_REQUESTS =
		"GrantRequests";

	private static final String _IS_CONTROLLER_KEY_POSTFIX_SERVICE_REQUESTS =
		"ServiceRequests";

	private static final String _IS_CONTROLLER_KEY_PREFIX = "isController";

	private static Log _log = LogFactoryUtil.getLog(VelocityPreAction.class);

}
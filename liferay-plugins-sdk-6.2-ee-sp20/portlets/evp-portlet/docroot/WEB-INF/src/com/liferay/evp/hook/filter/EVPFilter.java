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

package com.liferay.evp.hook.filter;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.util.EVPConstants;
import com.liferay.evp.util.PortletKeys;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.LiferayWindowState;
import com.liferay.portal.kernel.servlet.BaseFilter;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;

import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Val Nagy
 */
public class EVPFilter extends BaseFilter {

	@Override
	public boolean isFilterEnabled(
		HttpServletRequest request, HttpServletResponse response) {

		String ppid = request.getParameter("p_p_id");

		if (Validator.equals(ppid, PortletKeys.FAST_LOGIN) ||
			Validator.equals(ppid, PortletKeys.LOGIN)) {

			return false;
		}

		String contactUserHash = request.getParameter(
			EVPConstants.REQUEST_PARAMETER_NAME_CONTACT_USER_HASH);

		if (Validator.isNotNull(contactUserHash)) {
			long companyId = PortalUtil.getCompanyId(request);

			try {
				AlloyServiceInvoker evpServiceRequestAlloyServiceInvoker =
					new AlloyServiceInvoker(EVPServiceRequest.class.getName());

				long evpServiceRequestsCount =
					evpServiceRequestAlloyServiceInvoker.
						executeDynamicQueryCount(
							new Object[] {
								"companyId", companyId, "hash", contactUserHash
							});

				if (evpServiceRequestsCount > 0) {
					return false;
				}
			}
			catch (Exception e) {
				_log.error(e, e);
			}
		}

		return true;
	}

	@Override
	protected Log getLog() {
		return _log;
	}

	@Override
	protected void processFilter(
			HttpServletRequest request, HttpServletResponse response,
			FilterChain filterChain)
		throws Exception {

		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(
			WebKeys.THEME_DISPLAY);

		if (themeDisplay != null) {
			User currentUser = PortalUtil.getUser(request);

			if (currentUser == null) {
				PortletURL portletURL = PortletURLFactoryUtil.create(
					request, PortletKeys.LOGIN, themeDisplay.getPlid(),
					PortletRequest.RENDER_PHASE);

				portletURL.setParameter(
					"saveLastPath", Boolean.FALSE.toString());
				portletURL.setParameter("struts_action", "/login/login");
				portletURL.setWindowState(LiferayWindowState.MAXIMIZED);

				response.sendRedirect(portletURL.toString());
			}
		}

		filterChain.doFilter(request, response);
	}

	private static Log _log = LogFactoryUtil.getLog(EVPFilter.class);

}
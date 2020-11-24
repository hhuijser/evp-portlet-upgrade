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

package com.liferay.evp.hook.auth;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.util.PortalUtil;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.util.EVPConstants;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.BaseAutoLogin;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Danny Situ
 */
public class EVPContactUserAutoLogin extends BaseAutoLogin {

	@Override
	protected String[] doLogin(
			HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		long companyId = PortalUtil.getCompanyId(request);

		User user = fetchUser(request, companyId);

		if (user == null) {
			return null;
		}

		String[] credentials = new String[3];

		credentials[0] = String.valueOf(user.getUserId());
		credentials[1] = user.getPassword();
		credentials[2] = Boolean.TRUE.toString();

		return credentials;
	}

	protected User fetchUser(HttpServletRequest request, long companyId)
		throws Exception {

		String contactUserHash = request.getParameter(
			EVPConstants.REQUEST_PARAMETER_NAME_CONTACT_USER_HASH);

		if (Validator.isNotNull(contactUserHash)) {
			AlloyServiceInvoker evpServiceRequestAlloyServiceInvoker =
				new AlloyServiceInvoker(EVPServiceRequest.class.getName());

			List<EVPServiceRequest> evpServiceRequests =
				evpServiceRequestAlloyServiceInvoker.executeDynamicQuery(
					new Object[] {
						"companyId", companyId, "hash", contactUserHash
					});

			if (!evpServiceRequests.isEmpty()) {
				EVPServiceRequest evpServiceRequest = evpServiceRequests.get(0);

				return UserLocalServiceUtil.fetchUser(
					evpServiceRequest.getContactUserId());
			}
		}

		return null;
	}

}
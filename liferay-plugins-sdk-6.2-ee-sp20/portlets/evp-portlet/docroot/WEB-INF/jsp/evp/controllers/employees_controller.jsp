<%--
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
--%>

<%@ include file="/WEB-INF/jsp/evp/controllers/init.jspf" %>

<%!
public class AlloyControllerImpl extends EVPAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPEmployee.class);
		setPermissioned(true);
	}

	public void importEmployee() throws Exception {
		String emailAddressString = ParamUtil.getString(request, "emailAddress");

		User ldapUser = _importUser(themeDisplay, emailAddressString);

		EVPEmployee evpEmployee = EVPEmployeeLocalServiceUtil.fetchEVPEmployeeByEmployeeUserId(ldapUser.getUserId());

		if (evpEmployee == null) {
			evpEmployee = EVPEmployeeLocalServiceUtil.createEVPEmployee(0);

			evpEmployee.setEmployeeUserId(ldapUser.getUserId());

			updateModel(evpEmployee);
		}

		EVPUtil.updateEVPEmployee(themeDisplay.getCompanyId(), ldapUser.getUserId());

		addSuccessMessage();

		PortletURL portletURL = getPortletURL(controllerPath, "view", PortletMode.VIEW, PortletRequest.RENDER_PHASE, "id", evpEmployee.getEvpEmployeeId());

		redirectTo(portletURL.toString());
	}

	public void view() throws Exception {
		EVPEmployee evpEmployee = _fetchEVPEmployee();

		if (evpEmployee != null) {
			renderRequest.setAttribute("evpEmployeeComposite", new EVPEmployeeComposite(evpEmployee));
		}
	}

	private EVPEmployee _fetchEVPEmployee() throws Exception {
		long evpEmployeeId = ParamUtil.getLong(request, "id");

		return EVPEmployeeLocalServiceUtil.fetchEVPEmployee(evpEmployeeId);
	}

	private User _importUser(ThemeDisplay themeDisplay, String emailAddressString) throws AlloyException {
		User ldapUser = null;

		try {
			ldapUser = EVPPortalUtil.fetchUser(themeDisplay, emailAddressString);
		}
		catch (Exception e) {
		}

		if (ldapUser == null) {
			throw new AlloyException(translate("the-system-was-unable-to-import-a-user-with-email-address-x-via-ldap", emailAddressString));
		}

		return ldapUser;
	}

	private void _setConstantsMaps() throws Exception {
		renderRequest.setAttribute("employmentTypeMap", EVPUtil.getEmploymentTypeMap());
	}

}
%>
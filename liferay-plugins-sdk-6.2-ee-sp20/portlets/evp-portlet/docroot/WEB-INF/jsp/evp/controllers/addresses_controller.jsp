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
		setAlloyServiceInvokerClass(Address.class);
		setPermissioned(true);
	}

	public void index() throws Exception {
		long evpRequestOrganizationId = ParamUtil.getLong(request, "evpRequestOrganizationId");

		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(evpRequestOrganizationId);

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("Address", "street1", true);

		List<Address> addresses = alloyServiceInvoker.executeDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class), "classPK", evpRequestOrganization.getOrganizationId()}, QueryUtil.ALL_POS, QueryUtil.ALL_POS, obc);

		renderRequest.setAttribute("addressComposites", EVPCompositeUtil.getComposites(addresses, AddressComposite.class));

		renderRequest.setAttribute("addressesCount", addresses.size());
	}

	public void replace() throws Exception {
		long duplicateAddressId = ParamUtil.getLong(request, "duplicateAddressId");

		long mainAddressId = ParamUtil.getLong(request, "mainAddressId");

		Address duplicateAddress = AddressLocalServiceUtil.getAddress(duplicateAddressId);

		if (duplicateAddress.isPrimary()) {
			Address mainAddress = AddressLocalServiceUtil.getAddress(mainAddressId);

			mainAddress.setPrimary(true);

			updateModelIgnoreRequest(mainAddress);
		}

		EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"requestOrganizationAddressId", duplicateAddressId}, "requestOrganizationAddressId", mainAddressId);

		EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"requestOrganizationAddressId", duplicateAddressId}, "requestOrganizationAddressId", mainAddressId);

		AddressLocalServiceUtil.deleteAddress(duplicateAddressId);

		setOpenerSuccessMessage();

		render("../close");
	}

	public void selectReplacement() throws Exception {
		long duplicateAddressId = ParamUtil.getLong(request, "id");

		Address duplicateAddress = AddressLocalServiceUtil.getAddress(duplicateAddressId);

		renderRequest.setAttribute("duplicateAddress", duplicateAddress);

		DynamicQuery addressDynamicQuery = alloyServiceInvoker.buildDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class), "classPK", duplicateAddress.getClassPK()});

		Property addressIdProperty = PropertyFactoryUtil.forName("addressId");

		addressDynamicQuery.add(addressIdProperty.ne(duplicateAddressId));

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("Address", "street1", true);

		List<Address> addresses = alloyServiceInvoker.executeDynamicQuery(addressDynamicQuery, QueryUtil.ALL_POS, QueryUtil.ALL_POS, obc);

		renderRequest.setAttribute("addressComposites", EVPCompositeUtil.getComposites(addresses, AddressComposite.class));

		renderRequest.setAttribute("addressesCount", addresses.size());

		render("select_replacement");
	}

}
%>
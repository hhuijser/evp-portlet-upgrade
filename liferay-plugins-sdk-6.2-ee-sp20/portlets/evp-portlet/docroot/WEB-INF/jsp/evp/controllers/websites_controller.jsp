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
		setAlloyServiceInvokerClass(Website.class);
		setPermissioned(true);
	}

	public void index() throws Exception {
		long evpRequestOrganizationId = ParamUtil.getLong(request, "evpRequestOrganizationId");

		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(evpRequestOrganizationId);

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("Website", "url", true);

		List<Website> websites = alloyServiceInvoker.executeDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class), "classPK", evpRequestOrganization.getOrganizationId()}, QueryUtil.ALL_POS, QueryUtil.ALL_POS, obc);

		renderRequest.setAttribute("websiteComposites", EVPCompositeUtil.getComposites(websites, WebsiteComposite.class));

		renderRequest.setAttribute("websitesCount", websites.size());
	}

	public void replace() throws Exception {
		long duplicateWebsiteid = ParamUtil.getLong(request, "duplicateWebsiteId");

		long mainWebsiteId = ParamUtil.getLong(request, "mainWebsiteId");

		Website duplicateWebsite = WebsiteLocalServiceUtil.getWebsite(duplicateWebsiteid);

		if (duplicateWebsite.isPrimary()) {
			Website mainWebsite = WebsiteLocalServiceUtil.getWebsite(mainWebsiteId);

			mainWebsite.setPrimary(true);

			updateModelIgnoreRequest(mainWebsite);
		}

		EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"requestOrganizationWebsiteId", duplicateWebsiteid}, "requestOrganizationWebsiteId", mainWebsiteId);

		EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"requestOrganizationWebsiteId", duplicateWebsiteid}, "requestOrganizationWebsiteId", mainWebsiteId);

		WebsiteLocalServiceUtil.deleteWebsite(duplicateWebsiteid);

		setOpenerSuccessMessage();

		render("../close");
	}

	public void selectReplacement() throws Exception {
		long duplicateWebsiteId = ParamUtil.getLong(request, "id");

		Website duplicateWebsite = WebsiteLocalServiceUtil.getWebsite(duplicateWebsiteId);

		renderRequest.setAttribute("duplicateWebsite", duplicateWebsite);

		DynamicQuery websiteDynamicQuery = alloyServiceInvoker.buildDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class), "classPK", duplicateWebsite.getClassPK()});

		Property websiteIdProperty = PropertyFactoryUtil.forName("websiteId");

		websiteDynamicQuery.add(websiteIdProperty.ne(duplicateWebsiteId));

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("Website", "url", true);

		List<Website> websites = alloyServiceInvoker.executeDynamicQuery(websiteDynamicQuery, QueryUtil.ALL_POS, QueryUtil.ALL_POS, obc);

		renderRequest.setAttribute("websiteComposites", EVPCompositeUtil.getComposites(websites, WebsiteComposite.class));

		renderRequest.setAttribute("websitesCount", websites.size());

		render("select_replacement");
	}

}
%>
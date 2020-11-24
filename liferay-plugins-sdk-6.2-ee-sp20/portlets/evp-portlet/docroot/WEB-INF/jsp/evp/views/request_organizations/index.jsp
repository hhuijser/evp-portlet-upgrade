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

<%@ include file="/WEB-INF/jsp/evp/views/init.jsp" %>

<liferay-util:include page="/WEB-INF/jsp/evp/views/toolbar.jsp" servletContext="<%= application %>">
	<liferay-util:param name="tabs1" value="organizations" />
</liferay-util:include>

<liferay-ui:header title="request-organizations" />

<aui:button-row>
	<portlet:renderURL var="createEVPRequestOrganizationURL">
		<portlet:param name="controller" value="request_organizations" />
		<portlet:param name="action" value="create" />
	</portlet:renderURL>

	<aui:button href="${createEVPRequestOrganizationURL}" value="create-request-organization" />
</aui:button-row>

<portlet:renderURL var="viewEVPRequestOrganizationsURL">
	<portlet:param name="controller" value="request_organizations" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<aui:form action="${viewEVPRequestOrganizationsURL}" cssClass="dashboard evp-form ${cssClassReviewer}" method="get" name="fm">
	<aui:fieldset>
		<aui:row fluid="${true}">
			<div class="search-request">
				<aui:input cssClass="span12" inlineField="${true}" label="keywords" name="keywords" size="30" title="search-organizations" type="text" wrapperCssClass="span6" />

				<aui:button cssClass="search-btn span2" type="submit" value="search" />
			</div>
		</aui:row>
	</aui:fieldset>
</aui:form>

<liferay-util:include page="/WEB-INF/jsp/evp/views/request_organizations/search_container.jsp" servletContext="<%= application %>">
	<liferay-util:param name="alloySearchResultParam" value="alloySearchResult" />
	<liferay-util:param name="resultsParam" value="evpRequestOrganizationComposites" />
</liferay-util:include>
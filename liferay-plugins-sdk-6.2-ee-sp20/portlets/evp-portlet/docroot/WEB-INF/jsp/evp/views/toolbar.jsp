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

<portlet:renderURL var="viewEVPGrantRequestsURL">
	<portlet:param name="controller" value="grant_requests" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<portlet:renderURL var="viewEVPServiceRequestsURL">
	<portlet:param name="controller" value="service_requests" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<portlet:renderURL var="viewEVPDivisionsURL">
	<portlet:param name="controller" value="divisions" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<portlet:renderURL var="viewEVPEmployeesURL">
	<portlet:param name="controller" value="employees" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<portlet:renderURL var="viewEVPRequestOrganizationsURL">
	<portlet:param name="controller" value="request_organizations" />
	<portlet:param name="action" value="index" />
</portlet:renderURL>

<portlet:renderURL var="viewReviewerDashboardURL">
	<portlet:param name="controller" value="reviewer_dashboard" />
	<portlet:param name="action" value="indexGrant" />
</portlet:renderURL>

<%
List<String> tabsNames = new ArrayList<String>();
List<String> tabsValuesList = new ArrayList<String>();

if (EVPPermission.contains(themeDisplay, "grant_requests", "index")) {
	tabsNames.add("grant");
	tabsValuesList.add(viewEVPGrantRequestsURL);
}

if (EVPPermission.contains(themeDisplay, "service_requests", "index")) {
	tabsNames.add("service");
	tabsValuesList.add(viewEVPServiceRequestsURL);
}

if (EVPPermission.contains(themeDisplay, "divisions", "index")) {
	tabsNames.add("divisions");
	tabsValuesList.add(viewEVPDivisionsURL);
}

if (EVPPermission.contains(themeDisplay, "employees", "index")) {
	tabsNames.add("employees");
	tabsValuesList.add(viewEVPEmployeesURL);
}

if (EVPPermission.contains(themeDisplay, "organizations", "index")) {
	tabsNames.add("organizations");
	tabsValuesList.add(viewEVPRequestOrganizationsURL);
}

if (EVPPermission.contains(themeDisplay, "reviewer_dashboard", "access")) {
	tabsNames.add("reviewer");
	tabsValuesList.add(viewReviewerDashboardURL);
}

String[] tabsValuesArray = new String[6];

tabsValuesList.toArray(tabsValuesArray);
%>

<liferay-ui:tabs
	names="<%= StringUtil.merge(tabsNames) %>"
	url0="<%= tabsValuesArray[0] %>"
	url1="<%= tabsValuesArray[1] %>"
	url2="<%= tabsValuesArray[2] %>"
	url3="<%= tabsValuesArray[3] %>"
	url4="<%= tabsValuesArray[4] %>"
	url5="<%= tabsValuesArray[5] %>"
/>

<c:if test='${controllerPath == "reviewer_dashboard"}'>
	<portlet:renderURL var="viewReviewerDashboardEVPGrantRequestsURL">
		<portlet:param name="controller" value="reviewer_dashboard" />
		<portlet:param name="action" value="indexGrant" />
	</portlet:renderURL>

	<portlet:renderURL var="viewReviewerDashboardEVPServiceRequestsURL">
		<portlet:param name="controller" value="reviewer_dashboard" />
		<portlet:param name="action" value="indexService" />
	</portlet:renderURL>

	<aui:field-wrapper cssClass="review-tabs">
		<liferay-ui:tabs
			names="grant,service"
			param="tabs2"
			url0="${viewReviewerDashboardEVPGrantRequestsURL}"
			url1="${viewReviewerDashboardEVPServiceRequestsURL}"
		/>
	</aui:field-wrapper>
</c:if>
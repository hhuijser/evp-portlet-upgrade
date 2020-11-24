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
	<liferay-util:param name="tabs1" value="divisions" />
</liferay-util:include>

<c:forEach items="${EVPDivisionConstants.TYPES}" var="type">
	<liferay-ui:header title="${EVPDivisionConstantsMethods.getDivisionTypeTitle(type)}" />

	<c:if test='${AlloyPermission.contains(themeDisplay, "divisions", "create")}'>
		<aui:button-row>
			<portlet:renderURL var="createEVPDivisionURL">
				<portlet:param name="controller" value="divisions" />
				<portlet:param name="action" value="create" />
				<portlet:param name="type" value="${type}" />
			</portlet:renderURL>

			<aui:button href="${createEVPDivisionURL}" value='${(type == EVPDivisionConstants.TYPE_REGION) ? "create-region" : "create-subsidiary"}' />
		</aui:button-row>
	</c:if>

	<liferay-util:include page="/WEB-INF/jsp/evp/views/divisions/search_container.jsp" servletContext="<%= application %>">
		<liferay-util:param name="curParam" value="cur${type}" />
		<liferay-util:param name="resultsParam" value="evpDivisionComposites${type}" />
		<liferay-util:param name="totalParam" value="evpDivisionsCount${type}" />
		<liferay-util:param name="type" value="${type}" />
	</liferay-util:include>
</c:forEach>
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

<portlet:actionURL var="setUserURL">
	<portlet:param name="controller" value="divisions" />
	<portlet:param name="action" value="setUser" />
</portlet:actionURL>

<aui:form action="${setUserURL}" method="post">
	<portlet:renderURL var="importUserURL">
		<portlet:param name="controller" value="divisions" />
		<portlet:param name="action" value="importUser" />
		<portlet:param name="id" value="${evpDivision.evpDivisionId}" />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${importUserURL}" />
	<aui:input name="id" type="hidden" value="${evpDivision.evpDivisionId}" />

	<aui:input name="emailAddress" type="text">
		<aui:validator name="email" />
	</aui:input>

	<c:if test='${AlloyPermission.contains(themeDisplay, "divisions", "setUser", divisionGroupId)}'>
		<aui:button-row>
			<aui:button type="submit" />
		</aui:button-row>
	</c:if>
</aui:form>
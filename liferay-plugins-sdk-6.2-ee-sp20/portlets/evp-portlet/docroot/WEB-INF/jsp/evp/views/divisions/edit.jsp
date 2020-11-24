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

<liferay-util:include page="/WEB-INF/jsp/evp/views/header.jsp" servletContext="<%= application %>">
	<liferay-util:param name="title" value="${evpDivisionComposite.name}" />
	<liferay-util:param name="controller" value="divisions" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<aui:model-context bean="${evpDivisionComposite}" model="<%= EVPDivision.class %>" />

<portlet:actionURL var="updateEVPDivisionURL">
	<portlet:param name="controller" value="divisions" />
	<portlet:param name="action" value="update" />
</portlet:actionURL>

<aui:form action="${updateEVPDivisionURL}" method="post">
	<portlet:renderURL var="viewEVPDivisionsURL">
		<portlet:param name="controller" value="divisions" />
		<portlet:param name="action" value="index" />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPDivisionsURL}" />
	<aui:input name="id" type="hidden" value="${evpDivisionComposite.evpDivisionId}" />
	<aui:input name="type" type="hidden" value="${evpDivisionComposite.type}" />

	<aui:input name="abbreviation" />

	<aui:input model="<%= Organization.class %>" name="name" />

	<c:choose>
		<c:when test="${evpDivisionComposite.region}">
			<aui:input name="parentEVPDivisionId" type="hidden" value="${evpDivisionComposite.parentEVPDivisionId}" />
		</c:when>
		<c:when test="${evpDivisionComposite.subsidiary}">
			<aui:select label="region" name="parentEVPDivisionId">
				<c:forEach items="${regionEVPDivisionComposites}" var="regionEVPDivisionComposite">
					<aui:option label="${regionEVPDivisionComposite.name}" selected="${evpDivisionComposite.parentEVPDivisionId == regionEVPDivisionComposite.evpDivisionId}" value="${regionEVPDivisionComposite.evpDivisionId}" />
				</c:forEach>
			</aui:select>
		</c:when>
	</c:choose>

	<c:if test='${AlloyPermission.contains(themeDisplay, evpDivisionComposite, "update")}'>
		<aui:button-row>
			<aui:button type="submit" />

			<aui:button href="${viewEVPDivisionsURL}" value="cancel" />
		</aui:button-row>
	</c:if>
</aui:form>
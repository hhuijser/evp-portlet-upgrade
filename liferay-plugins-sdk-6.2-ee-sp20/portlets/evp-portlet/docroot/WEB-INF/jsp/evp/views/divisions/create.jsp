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
	<liferay-util:param name="title" value='${(param.type == EVPDivisionConstants.TYPE_REGION) ? "new-region" : "new-subsidiary"}' />
	<liferay-util:param name="controller" value="divisions" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<aui:model-context bean="${evpDivisionComposite}" model="<%= EVPDivision.class %>" />

<portlet:actionURL var="addEVPDivisionURL">
	<portlet:param name="controller" value="divisions" />
	<portlet:param name="action" value="add" />
</portlet:actionURL>

<aui:form action="${addEVPDivisionURL}" method="post">
	<portlet:renderURL var="viewEVPDivisionsURL">
		<portlet:param name="controller" value="divisions" />
		<portlet:param name="action" value="index" />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPDivisionsURL}" />
	<aui:input name="type" type="hidden" value="${param.type}" />

	<aui:input name="abbreviation" />

	<aui:input model="<%= Organization.class %>" name="name" />

	<c:choose>
		<c:when test="${param.type == EVPDivisionConstants.TYPE_REGION}">
			<aui:input name="parentEVPDivisionId" type="hidden" value="${rootEVPDivisionId}" />
		</c:when>
		<c:when test="${param.type == EVPDivisionConstants.TYPE_SUBSIDIARY}">
			<aui:select label="region" name="parentEVPDivisionId">
				<c:forEach items="${regionEVPDivisionComposites}" var="regionEVPDivisionComposite">
					<aui:option label="${regionEVPDivisionComposite.name}" selected="${evpDivisionComposite.parentEVPDivisionId == regionEVPDivisionComposite.evpDivisionId}" value="${regionEVPDivisionComposite.evpDivisionId}" />
				</c:forEach>
			</aui:select>
		</c:when>
	</c:choose>

	<c:if test='${AlloyPermission.contains(themeDisplay, "divisions", "add")}'>
		<aui:button-row>
			<aui:button type="submit" />

			<aui:button href="${viewEVPDivisionsURL}" value="cancel" />
		</aui:button-row>
	</c:if>
</aui:form>
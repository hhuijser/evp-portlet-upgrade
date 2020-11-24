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

<c:if test="${not empty param.title}">
	<c:set value="<%= windowState.equals(LiferayWindowState.POP_UP) %>" var="popUpWindow" />

	<c:choose>
		<c:when test="${(empty param.redirect) && (empty param.cloneableEVPServiceRequestId) && (not popUpWindow)}">
			<portlet:renderURL var="backURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
				<portlet:param name="controller" value="${param.controller}" />
				<portlet:param name="action" value="${param.action}" />

				<c:if test='${param.action != "index"}'>
					<portlet:param name="id" value="${param.id}" />
				</c:if>
			</portlet:renderURL>
		</c:when>
		<c:otherwise>
			<c:set value="javascript:history.go(-1);" var="backURL" />
		</c:otherwise>
	</c:choose>

	<liferay-ui:header
		backURL="${backURL}"
		cssClass="${param.cssClass}"
		title="${param.title}"
	/>
</c:if>
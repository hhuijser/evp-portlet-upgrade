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
	<liferay-util:param name="title" value="import-employee" />
	<liferay-util:param name="controller" value="employees" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<portlet:actionURL var="importEmployeeURL">
	<portlet:param name="controller" value="employees" />
	<portlet:param name="action" value="importEmployee" />
</portlet:actionURL>

<aui:model-context bean="${evpEmployeeComposite}" model="<%= EVPEmployeeComposite.class %>" />

<aui:form action="${importEmployeeURL}" method="post">
	<aui:input name="emailAddress" type="text" value="${evpEmployeeComposite.employeeUser.emailAddress}">
		<aui:validator name="email" />
	</aui:input>

	<c:if test='${AlloyPermission.contains(themeDisplay, "employees", "update")}'>
		<aui:button-row>
			<aui:button type="submit" value="import" />
		</aui:button-row>
	</c:if>
</aui:form>

<dl>
	<dt title='<liferay-ui:message key="hire-date" />'>
		<liferay-ui:message key="hire-date" />:
	</dt>
	<dd>
		<fmt:formatDate value="${evpEmployeeComposite.hireDate}" />
	</dd>

	<dt title='<liferay-ui:message key="employment-type" />'>
		<liferay-ui:message key="employment-type" />:
	</dt>
	<dd>
		<liferay-ui:message key="${evpEmployeeComposite.employmentTypeLabel}" />
	</dd>

	<dt title='<liferay-ui:message key="subsidiary" />'>
		<liferay-ui:message key="subsidiary" />:
	</dt>
	<dd>
		<c:out value="${evpEmployeeComposite.subsidiaryEVPDivisionComposite.name}" />
	</dd>

	<dt title='<liferay-ui:message key="manager-email-address" />'>
		<liferay-ui:message key="manager-email-address" />:
	</dt>
	<dd>
		<c:out value="${evpEmployeeComposite.managerUser.emailAddress}" />
	</dd>
</dl>
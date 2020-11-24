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
	<liferay-util:param name="title" value='${(evpGrantTransaction.evpGrantTransactionId > 0) ? evpGrantTransaction.name : "new-evp-grant-transaction"}' />
	<liferay-util:param name="controller" value="grant_transactions" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<aui:model-context bean="${evpGrantTransaction}" model="<%= EVPGrantTransaction.class %>" />

<portlet:actionURL var="updateEVPGrantTransactionURL">
	<portlet:param name="controller" value="grant_transactions" />
	<portlet:param name="action" value="update" />
</portlet:actionURL>

<aui:form action="${updateEVPGrantTransactionURL}" method="post">
	<portlet:renderURL var="viewEVPGrantTransactionsURL">
		<portlet:param name="controller" value="grant_transactions" />
		<portlet:param name="action" value="index" />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPGrantTransactionsURL}" />
	<aui:input name="id" type="hidden" value="${evpGrantTransaction.evpGrantTransactionId}" />

	<aui:input name="name" />

	<aui:button-row>
		<aui:button type="submit" />

		<aui:button href="${viewEVPGrantTransactionsURL}" value="cancel" />
	</aui:button-row>
</aui:form>
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
	<liferay-util:param name="title" value="${evpGrantTransaction.name}" />
	<liferay-util:param name="controller" value="grant_transactions" />
	<liferay-util:param name="action" value="index" />
	<liferay-util:param name="evpGrantTransactionId" value="${evpGrantTransaction.evpGrantTransactionId}" />
</liferay-util:include>

<aui:fieldset>
	<aui:field-wrapper name="description">
		${evpGrantTransaction.description}
	</aui:field-wrapper>
	<aui:field-wrapper name="createdBy">
		${evpGrantTransaction.userName}
	</aui:field-wrapper>
</aui:fieldset>
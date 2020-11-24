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
	<liferay-util:param name="title" value="addresses" />
	<liferay-util:param name="controller" value="request_organizations" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<liferay-util:include page="/WEB-INF/jsp/evp/views/addresses/search_container.jsp" servletContext="<%= application %>">
	<liferay-util:param name="resultsParam" value="addressComposites" />
	<liferay-util:param name="totalParam" value="addressesCount" />
</liferay-util:include>
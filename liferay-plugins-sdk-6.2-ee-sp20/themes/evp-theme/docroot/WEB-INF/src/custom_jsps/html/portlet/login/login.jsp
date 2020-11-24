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

<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<div class="evp-login evp-theme">
	<div class="masthead">
		<svg class="evp-icon" viewBox="0 0 1024 1024">
			<path class="path1" d="M938.667 213.333c0-47.147-38.187-85.333-85.333-85.333h-640c-47.147 0-85.333 38.187-85.333 85.333v640c0 47.147 38.187 85.333 85.333 85.333h640c47.147 0 85.333-38.187 85.333-85.333v-640zM341.333 682.667h-128v-128h128v128zM341.333 512h-128v-128h128v128zM341.333 341.333h-128v-128h128v128zM512 853.333h-128v-128h128v128zM512 512h-128v-128h128v128zM512 341.333h-128v-128h128v128zM682.667 853.333h-128v-128h128v128zM682.667 682.667h-128v-128h128v128zM682.667 341.333h-128v-128h128v128zM853.333 853.333h-128v-128h128v128zM853.333 682.667h-128v-128h128v128zM853.333 512h-128v-128h128v128z"></path>
		</svg>
	</div>

	<div class="message">
		<h3 class="header"><liferay-ui:message key="sign-in-to-liferay-evp" /></h3>
	</div>

	<%@ include file="/html/portlet/login/login.portal.jsp" %>
</div>
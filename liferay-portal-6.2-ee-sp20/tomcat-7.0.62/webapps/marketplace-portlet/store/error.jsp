<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the applicable 
 * Liferay software end user license agreement ("License Agreement")
 * found on www.liferay.com/legal/eulas. You may also contact Liferay, Inc.
 * for a copy of the License Agreement. You may not use this file except in
 * compliance with the License Agreement. 
 * See the License Agreement for the specific language governing
 * permissions and limitations under the License Agreement, including 
 * but not limited to distribution rights of the Software.
 *
 */
--%>

<%@ include file="/init.jsp" %>

<style type="text/css">
	body {
		font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		font-size: 16px;
	}

	p {
		background: #F1D1D8;
		border: 1px solid transparent;
		border-radius: 4px;
		color: #D77C8A;
		padding: 14px;
		margin: 2em 0;
	}

	.error {
		margin: 0 auto;
		max-width: 960px;
		padding: 6em 4em;
	}
</style>

<div class="error">
	<img src="<%= PortalUtil.getPathContext(request) %>/store/images/logo.svg" />

	<p>
		<liferay-ui:message key="could-not-connect-to-the-liferay-marketplace" />
	</p>

	<a href="http://www.liferay.com/marketplace" target="_blank"><liferay-ui:message key="browse-the-marketplace-on-liferay.com" /></a>
</div>
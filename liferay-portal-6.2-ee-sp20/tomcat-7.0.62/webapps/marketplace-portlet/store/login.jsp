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

<div class="authorize">
	<img src="<%= PortalUtil.getPathContext(request) %>/store/images/logo.svg" />

	<p>
		<liferay-ui:message key="liferay-marketplace-is-an-integral-part-of-the-liferay-platform-experience-for-all-users" />
	</p>

	<liferay-portlet:renderURL var="callbackURL" />

	<liferay-portlet:actionURL name="authorize" var="authorizeURL">
		<portlet:param name="callbackURL" value="<%= callbackURL %>" />
	</liferay-portlet:actionURL>

	<aui:button onClick="<%= authorizeURL %>" value="sign-in" />
</div>
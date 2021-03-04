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

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

OAuthApplication oAuthApplication = (OAuthApplication)row.getObject();
%>

<liferay-ui:icon-menu>
	<liferay-portlet:renderURL var="viewURL">
		<portlet:param name="mvcPath" value="/admin/view_application.jsp" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
		<portlet:param name="oAuthApplicationId" value="<%= String.valueOf(oAuthApplication.getOAuthApplicationId()) %>" />
	</liferay-portlet:renderURL>

	<liferay-ui:icon
		image="view"
		method="get"
		url="<%= viewURL %>"
	/>

	<c:if test="<%= OAuthApplicationPermission.contains(permissionChecker, oAuthApplication, ActionKeys.UPDATE) %>">
		<liferay-portlet:renderURL var="editURL">
			<portlet:param name="mvcPath" value="/admin/edit_application.jsp" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="oAuthApplicationId" value="<%= String.valueOf(oAuthApplication.getOAuthApplicationId()) %>" />
		</liferay-portlet:renderURL>

		<liferay-ui:icon
			image="edit"
			method="get"
			url="<%= editURL %>"
		/>
	</c:if>

	<c:if test="<%= OAuthApplicationPermission.contains(permissionChecker, oAuthApplication, ActionKeys.DELETE) %>">
		<liferay-portlet:actionURL name="deleteOAuthApplication" var="deleteURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="oAuthApplicationId" value="<%= String.valueOf(oAuthApplication.getOAuthApplicationId()) %>" />
		</liferay-portlet:actionURL>

		<liferay-ui:icon-delete
			url="<%= deleteURL %>"
		/>
	</c:if>
</liferay-ui:icon-menu>
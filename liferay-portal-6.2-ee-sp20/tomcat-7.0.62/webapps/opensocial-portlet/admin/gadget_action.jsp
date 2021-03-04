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

Gadget gadget = (Gadget)row.getObject();

Map<String, OAuthService> oAuthServices = null;

try {
	oAuthServices = ShindigUtil.getOAuthServices(gadget.getUrl());
}
catch (Exception e) {
	row.setRestricted(true);
}
%>

<liferay-ui:icon-menu>
	<c:if test="<%= GadgetPermission.contains(permissionChecker, themeDisplay.getScopeGroupId(), gadget.getGadgetId(), ActionKeys.UPDATE) %>">
		<portlet:renderURL var="updateGadgetURL">
			<portlet:param name="mvcPath" value="/admin/edit_gadget.jsp" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="gadgetId" value="<%= String.valueOf(gadget.getGadgetId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon image="edit" url="<%= updateGadgetURL %>" />

		<c:if test="<%= (oAuthServices != null) && (oAuthServices.size() > 0) %>">
			<portlet:renderURL var="configureOAuthURL">
				<portlet:param name="mvcPath" value="/admin/edit_oauth_consumers.jsp" />
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="gadgetId" value="<%= String.valueOf(gadget.getGadgetId()) %>" />
			</portlet:renderURL>

			<liferay-ui:icon image="portlet" message="manage-oauth" url="<%= configureOAuthURL %>" />
		</c:if>

		<portlet:actionURL name="refreshGadgets" var="refreshGadgetsURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="gadgetId" value="<%= String.valueOf(gadget.getGadgetId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon image="page" message="refresh" url="<%= refreshGadgetsURL %>" />
	</c:if>

	<c:if test="<%= GadgetPermission.contains(permissionChecker, themeDisplay.getScopeGroupId(), gadget.getGadgetId(), ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= Gadget.class.getName() %>"
			modelResourceDescription="<%= gadget.getName() %>"
			resourcePrimKey="<%= String.valueOf(gadget.getGadgetId()) %>"
			var="permissionsURL"
			windowState="<%= LiferayWindowState.POP_UP.toString() %>"
		/>

		<liferay-ui:icon
			image="permissions"
			method="get"
			url="<%= permissionsURL %>"
			useDialog="<%= true %>"
		/>
	</c:if>

	<c:if test="<%= GadgetPermission.contains(permissionChecker, themeDisplay.getScopeGroupId(), gadget.getGadgetId(), ActionKeys.DELETE) %>">
		<portlet:actionURL name="deleteGadget" var="deleteURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="gadgetId" value="<%= String.valueOf(gadget.getGadgetId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete url="<%= deleteURL %>" />
	</c:if>
</liferay-ui:icon-menu>
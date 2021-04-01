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

<%@ include file="/admin/init.jsp" %>

<%
String toolbarItem = ParamUtil.getString(request, "toolbarItem", "view-all");
%>

<aui:nav-bar>
	<aui:nav>
		<portlet:renderURL var="viewProcessURL" />

		<aui:nav-item href="<%= viewProcessURL %>" label="view-all" selected='<%= toolbarItem.equals("view-all") %>' />

		<c:if test="<%= KaleoFormsPermission.contains(permissionChecker, scopeGroupId, ActionKeys.ADD_PROCESS) %>">
			<portlet:renderURL var="addProcessURL">
				<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
				<portlet:param name="redirect" value="<%= currentURL %>" />
			</portlet:renderURL>

			<aui:nav-item href="<%= addProcessURL %>" iconClass="icon-plus" label="add" selected='<%= toolbarItem.equals("add") %>' />
		</c:if>
	</aui:nav>
</aui:nav-bar>
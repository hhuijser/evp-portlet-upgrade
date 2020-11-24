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
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

KaleoProcess kaleoProcess = (KaleoProcess)row.getObject();
%>

<liferay-ui:icon-menu>
	<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.VIEW) %>">
		<portlet:renderURL var="viewURL">
			<portlet:param name="mvcPath" value='<%= "/admin/view_kaleo_process.jsp" %>' />
			<portlet:param name="backURL" value="<%= currentURL %>" />
			<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			iconCssClass="icon-search"
			message="view"
			url="<%= viewURL %>"
		/>
	</c:if>

	<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.VIEW) %>">
		<portlet:resourceURL id="kaleoProcess" var="exportURL">
			<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>" />
		</portlet:resourceURL>

		<%
		StringBundler sb = new StringBundler(6);

		sb.append("javascript:");
		sb.append(renderResponse.getNamespace());
		sb.append("exportKaleoProcess");
		sb.append("('");
		sb.append(exportURL);
		sb.append("');");
		%>

		<liferay-ui:icon
			iconCssClass="icon-arrow-down"
			message="export"
			url="<%= sb.toString() %>"
		/>
	</c:if>

	<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.UPDATE) %>">
		<portlet:renderURL var="editURL">
			<portlet:param name="mvcPath" value='<%= "/admin/edit_kaleo_process.jsp" %>' />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="backURL" value="<%= currentURL %>" />
			<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			iconCssClass="icon-edit"
			message="edit"
			method="get"
			url="<%= editURL %>"
		/>
	</c:if>

	<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= KaleoProcess.class.getName() %>"
			modelResourceDescription="<%= kaleoProcess.getName(locale) %>"
			resourcePrimKey="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>"
			var="permissionsURL"
			windowState="<%= LiferayWindowState.POP_UP.toString() %>"
		/>

		<liferay-ui:icon
			iconCssClass="icon-lock"
			message="permissions"
			method="get"
			url="<%= permissionsURL %>"
			useDialog="<%= true %>"
		/>
	</c:if>

	<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.DELETE) %>">
		<portlet:actionURL name="deleteKaleoProcess" var="deleteURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete
			url="<%= deleteURL %>"
		/>
	</c:if>
</liferay-ui:icon-menu>
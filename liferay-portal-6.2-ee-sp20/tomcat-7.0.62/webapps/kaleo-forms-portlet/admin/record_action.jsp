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
SearchContainer searchContainer = (SearchContainer)request.getAttribute("liferay-ui:search:searchContainer");

String redirect = searchContainer.getIteratorURL().toString();

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

DDLRecord ddlRecord = (DDLRecord)row.getObject();

long kaleoProcessId = GetterUtil.getLong((String)row.getParameter("kaleoProcessId"));

DDLRecordVersion ddlRecordVersion = ddlRecord.getLatestRecordVersion();
%>

<liferay-ui:icon-menu icon="<%= StringPool.BLANK %>" message="<%= StringPool.BLANK %>">
	<portlet:renderURL var="viewDDLRecordURL" windowState="<%= WindowState.MAXIMIZED.toString() %>">
		<portlet:param name="mvcPath" value="/admin/view_record.jsp" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
		<portlet:param name="ddlRecordId" value="<%= String.valueOf(ddlRecord.getRecordId()) %>" />
		<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
		<portlet:param name="version" value="<%= ddlRecordVersion.getVersion() %>" />
	</portlet:renderURL>

	<liferay-ui:icon
		iconCssClass="icon-search"
		message="view[action]"
		url="<%= viewDDLRecordURL %>"
	/>

	<portlet:actionURL name="deleteDDLRecord" var="deleteDDLRecordURL">
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="ddlRecordId" value="<%= String.valueOf(ddlRecord.getRecordId()) %>" />
	</portlet:actionURL>

	<liferay-ui:icon-delete url="<%= deleteDDLRecordURL %>" />
</liferay-ui:icon-menu>
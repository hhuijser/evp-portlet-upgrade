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

<liferay-util:include page="/admin/toolbar.jsp" servletContext="<%= application %>">
	<liferay-util:param name="toolbarItem" value="view-all" />
</liferay-util:include>

<liferay-portlet:renderURL varImpl="iteratorURL" />

<liferay-ui:search-container
	searchContainer="<%= new KaleoProcessSearch(renderRequest, iteratorURL) %>"
	total="<%= KaleoProcessServiceUtil.getKaleoProcessesCount(scopeGroupId) %>"
>
	<liferay-ui:search-container-results
		results="<%= KaleoProcessServiceUtil.getKaleoProcesses(scopeGroupId, searchContainer.getStart(), searchContainer.getEnd(), searchContainer.getOrderByComparator()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess"
		modelVar="process"
	>
		<portlet:renderURL var="rowURL">
			<portlet:param name="mvcPath" value='<%= "/admin/view_kaleo_process.jsp" %>' />
			<portlet:param name="backURL" value="<%= currentURL %>" />
			<portlet:param name="kaleoProcessId" value="<%= String.valueOf(process.getKaleoProcessId()) %>" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			buffer="buffer"
			href="<%= rowURL %>"
			name="name"
		>

			<%
			buffer.append(HtmlUtil.escape(process.getName(locale)));
			%>

		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/admin/kaleo_process_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<%@ include file="/admin/export_kaleo_process.jspf" %>

<%
KaleoFormsUtil.cleanUpPortletSession(portletSession);
%>
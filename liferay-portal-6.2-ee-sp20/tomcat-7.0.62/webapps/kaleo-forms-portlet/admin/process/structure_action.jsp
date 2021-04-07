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

DDMStructure ddmStructure = (DDMStructure)row.getObject();

String redirect = (String)row.getParameter("redirect");
%>

<liferay-ui:icon-menu>
	<portlet:renderURL var="editURL">
		<portlet:param name="mvcPath" value='<%= "/admin/process/edit_structure.jsp" %>' />
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="classNameId" value="<%= String.valueOf(PortalUtil.getClassNameId(DDMStructure.class)) %>" />
		<portlet:param name="classPK" value="<%= String.valueOf(ddmStructure.getStructureId()) %>" />
	</portlet:renderURL>

	<liferay-ui:icon
		iconCssClass="icon-edit"
		message="edit"
		url="<%= editURL %>"
	/>

	<%
	String taglibOnClick = "Liferay.fire('" + renderResponse.getNamespace() + "chooseDefinition', {ddmstructureid: " + ddmStructure.getStructureId() + ", name: '" + HtmlUtil.escapeJS(ddmStructure.getName(locale)) + "', node: this});";
	%>

	<liferay-ui:icon
		iconCssClass="icon-check"
		message="choose"
		onClick="<%= taglibOnClick %>"
		url="javascript:;"
	/>

	<portlet:actionURL name="deleteDDMStructure" var="deleteDDMStructureURL">
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="ddmStructureId" value="<%= String.valueOf(ddmStructure.getStructureId()) %>" />
	</portlet:actionURL>

	<liferay-ui:icon-delete url="<%= deleteDDMStructureURL %>" />
</liferay-ui:icon-menu>
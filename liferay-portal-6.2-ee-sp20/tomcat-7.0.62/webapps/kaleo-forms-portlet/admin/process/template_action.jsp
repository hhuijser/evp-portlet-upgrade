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

DDMTemplate ddmTemplate = (DDMTemplate)row.getObject();
%>

<liferay-ui:icon-menu>

	<%
	String taglibOnClick = "javascript:" + renderResponse.getNamespace() + "openDDMPortlet('"+ ddmTemplate.getTemplateId() +"');";
	%>

	<liferay-ui:icon
		iconCssClass="icon-edit"
		message="edit"
		onClick="<%= taglibOnClick %>"
		url="javascript:;"
	/>

	<%
	taglibOnClick = "Liferay.fire('" + renderResponse.getNamespace() + "chooseTemplate', {ddmtemplateid: " + ddmTemplate.getTemplateId() + ", name: '" + HtmlUtil.escapeJS(ddmTemplate.getName(locale)) + "'});";
	%>

	<liferay-ui:icon
		iconCssClass="icon-check"
		message="choose"
		onClick="<%= taglibOnClick %>"
		url="javascript:;"
	/>

	<liferay-portlet:actionURL portletName="<%= PortletKeys.DYNAMIC_DATA_MAPPING %>" var="deleteURL">
		<portlet:param name="struts_action" value="/dynamic_data_mapping/edit_template" />
		<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.DELETE %>" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
		<portlet:param name="templateId" value="<%= String.valueOf(ddmTemplate.getTemplateId()) %>" />
	</liferay-portlet:actionURL>

	<liferay-ui:icon-delete url="<%= deleteURL %>" />
</liferay-ui:icon-menu>
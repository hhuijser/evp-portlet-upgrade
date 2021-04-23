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

WorkflowDefinition workflowDefinition = (WorkflowDefinition)row.getObject();

String backURL = (String)row.getParameter("backURL");
%>

<liferay-ui:icon-menu>
	<portlet:renderURL var="editURL">
		<portlet:param name="mvcPath" value='<%= "/admin/process/edit_workflow.jsp" %>' />
		<portlet:param name="backURL" value="<%= backURL %>" />
		<portlet:param name="name" value="<%= workflowDefinition.getName() %>" />
		<portlet:param name="version" value="<%= String.valueOf(workflowDefinition.getVersion()) %>" />
	</portlet:renderURL>

	<liferay-ui:icon
		iconCssClass="icon-edit"
		message="edit"
		url="<%= editURL %>"
	/>

	<%
	String taglibOnClick = "Liferay.fire('" + renderResponse.getNamespace() + "chooseWorkflow', {name: '" + HtmlUtil.escapeJS(workflowDefinition.getName()) + "', title: '" + HtmlUtil.escapeJS(workflowDefinition.getTitle(themeDisplay.getLanguageId())) + "', version: '" + workflowDefinition.getVersion() + "'});";
	%>

	<liferay-ui:icon
		iconCssClass="icon-check"
		message="choose"
		onClick="<%= taglibOnClick %>"
		url="javascript:;"
	/>

	<portlet:actionURL name="deactivateWorkflowDefinition" var="deactivateWorkflowDefinition">
		<portlet:param name="redirect" value="<%= backURL %>" />
		<portlet:param name="name" value="<%= workflowDefinition.getName() %>" />
		<portlet:param name="version" value="<%= String.valueOf(workflowDefinition.getVersion()) %>" />
	</portlet:actionURL>

	<liferay-ui:icon-deactivate
		url="<%= deactivateWorkflowDefinition %>"
	/>
</liferay-ui:icon-menu>
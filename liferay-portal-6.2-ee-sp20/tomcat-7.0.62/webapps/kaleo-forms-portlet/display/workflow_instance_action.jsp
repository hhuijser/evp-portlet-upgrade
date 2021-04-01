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

<%@ include file="/display/init.jsp" %>

<%
String randomId = StringUtil.randomId();

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

WorkflowInstance workflowInstance = null;

if (row != null) {
	workflowInstance = (WorkflowInstance)row.getObject();
}
else {
	workflowInstance = (WorkflowInstance)request.getAttribute(WebKeys.WORKFLOW_INSTANCE);
}
%>

<liferay-ui:icon-menu showExpanded="<%= row == null %>" showWhenSingleIcon="<%= true %>">
	<portlet:renderURL var="redirectURL">
		<portlet:param name="tabs2" value="my-pending-requests" />
	</portlet:renderURL>

	<portlet:actionURL name="deleteWorkflowInstance" var="deleteURL">
		<portlet:param name="redirect" value="<%= redirectURL %>" />
		<portlet:param name="workflowInstanceId" value="<%= StringUtil.valueOf(workflowInstance.getWorkflowInstanceId()) %>" />
	</portlet:actionURL>

	<liferay-ui:icon
		iconCssClass="icon-undo"
		message="withdraw-submission"
		url="<%= deleteURL %>"
	/>
</liferay-ui:icon-menu>
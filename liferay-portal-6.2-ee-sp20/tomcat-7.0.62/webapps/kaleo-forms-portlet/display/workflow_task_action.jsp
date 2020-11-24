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
String randomId = StringPool.BLANK;

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

WorkflowTask workflowTask = null;

long kaleoProcessId = 0;

long ddlRecordId = 0;

if (row != null) {
	randomId = StringUtil.randomId();

	workflowTask = (WorkflowTask)row.getObject();

	kaleoProcessId = (Long)row.getParameter("kaleoProcessId");

	ddlRecordId = (Long)row.getParameter("ddlRecordId");
}
else {
	workflowTask = (WorkflowTask)request.getAttribute(WebKeys.WORKFLOW_TASK);

	kaleoProcessId = ParamUtil.getLong(request, "kaleoProcessId");

	ddlRecordId = ParamUtil.getLong(request, "ddlRecordId");
}

KaleoProcessLink kaleoProcessLink = KaleoProcessLinkLocalServiceUtil.fetchKaleoProcessLink(kaleoProcessId, workflowTask.getName());

long kaleoProcessLinkId = 0;

if (kaleoProcessLink != null) {
	kaleoProcessLinkId = kaleoProcessLink.getKaleoProcessLinkId();
}

List<String> transitionNames = WorkflowTaskManagerUtil.getNextTransitionNames(company.getCompanyId(), user.getUserId(), workflowTask.getWorkflowTaskId());

boolean showCompleteFormButton = false;

if ((kaleoProcessLinkId > 0) && !workflowTask.isCompleted() && _isAssignedToUser(workflowTask, user) && KaleoProcessPermission.contains(permissionChecker, kaleoProcessId, ActionKeys.COMPLETE_FORM)) {
	showCompleteFormButton = true;
}

long[] pooledActorsIds = WorkflowTaskManagerUtil.getPooledActorsIds(company.getCompanyId(), workflowTask.getWorkflowTaskId());
%>

<liferay-ui:icon-menu showExpanded="<%= row == null %>" showWhenSingleIcon="<%= row == null %>">
	<c:if test="<%= showCompleteFormButton %>">
		<liferay-ui:icon
			cssClass='<%= "workflow-task-" + randomId + " task-change-status-link" %>'
			iconCssClass="icon-file-text"
			message="complete-form"
			url='<%= "javascript:" + renderResponse.getNamespace() + randomId + "openCompleteForm();" %>'
		/>
	</c:if>

	<c:if test="<%= !workflowTask.isCompleted() && _isAssignedToUser(workflowTask, user) %>">

		<%
		for (String transitionName : transitionNames) {
		%>

			<portlet:actionURL name="completeWorkflowTask" var="completeWorkflowTaskURL">
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="workflowTaskId" value="<%= StringUtil.valueOf(workflowTask.getWorkflowTaskId()) %>" />
				<portlet:param name="assigneeUserId" value="<%= StringUtil.valueOf(workflowTask.getAssigneeUserId()) %>" />
				<portlet:param name="transitionName" value="<%= transitionName %>" />
			</portlet:actionURL>

			<liferay-ui:icon
				cssClass='<%= "workflow-task-" + randomId + " task-change-status-link" %>'
				iconCssClass="icon-random"
				id='<%= randomId + HtmlUtil.escapeAttribute(transitionName) + "taskChangeStatusLink" %>'
				message="<%= HtmlUtil.escape(transitionName) %>"
				method="get"
				url="<%= completeWorkflowTaskURL %>"
			/>

		<%
		}
		%>

	</c:if>

	<c:if test="<%= !workflowTask.isCompleted() && !_isAssignedToUser(workflowTask, user) %>">
		<portlet:actionURL name="assignWorkflowTask" var="assignToMeURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="workflowTaskId" value="<%= String.valueOf(workflowTask.getWorkflowTaskId()) %>" />
			<portlet:param name="assigneeUserId" value="<%= String.valueOf(user.getUserId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon
			cssClass='<%= "workflow-task-" + randomId + " task-assign-to-me-link" %>'
			iconCssClass="icon-signin"
			id='<%= randomId + "taskAssignToMeLink" %>'
			message="assign-to-me"
			method="get"
			url="<%= assignToMeURL %>"
		/>
	</c:if>

	<c:if test="<%= _hasOtherAssignees(pooledActorsIds, workflowTask, user) %>">
		<portlet:actionURL name="assignWorkflowTask" var="assignURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="workflowTaskId" value="<%= String.valueOf(workflowTask.getWorkflowTaskId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon
			cssClass='<%= "workflow-task-" + randomId + " task-assign-link" %>'
			iconCssClass="icon-signin"
			id='<%= randomId + "taskAssignLink" %>'
			message="assign-to-..."
			method="get"
			url="<%= assignURL %>"
		/>
	</c:if>

	<c:if test="<%= !workflowTask.isCompleted() %>">
		<portlet:actionURL name="updateWorkflowTask" var="updateDueDateURL">
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="workflowTaskId" value="<%= StringUtil.valueOf(workflowTask.getWorkflowTaskId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon
			cssClass='<%= "workflow-task-" + randomId + " task-due-date-link" %>'
			iconCssClass="icon-time"
			id='<%= randomId + "taskDueDateLink" %>'
			message="update-due-date"
			method="get"
			url="<%= updateDueDateURL %>"
		/>
	</c:if>
</liferay-ui:icon-menu>

<div class="hide" id="<%= randomId %>updateAsignee">
	<c:if test="<%= _hasOtherAssignees(pooledActorsIds, workflowTask, user) %>">
		<aui:select label="assign-to" name="assigneeUserId">

			<%
			for (long pooledActorId : pooledActorsIds) {
				if (pooledActorId == user.getUserId()) {
					continue;
				}
			%>

				<aui:option label="<%= HtmlUtil.escape(PortalUtil.getUserName(pooledActorId, StringPool.BLANK)) %>" selected="<%= workflowTask.getAssigneeUserId() == pooledActorId %>" value="<%= String.valueOf(pooledActorId) %>" />

			<%
			}
			%>

		</aui:select>
	</c:if>
</div>

<div class="hide" id="<%= randomId %>updateAsigneeToMe">
	<aui:input name="asigneeUserId" type="hidden" value="<%= user.getUserId() %>" />
</div>

<div class="hide" id="<%= randomId %>updateDueDate">
	<aui:input bean="<%= workflowTask %>" model="<%= WorkflowTask.class %>" name="dueDate" />
</div>

<div class="hide" id="<%= randomId %>updateComments">
	<aui:input cols="55" name="comment" rows="10" type="textarea" />
</div>

<aui:script use="liferay-kaleo-forms,liferay-workflow-tasks">
	var onTaskClickFn = A.rbind(Liferay.WorkflowTasks.onTaskClick, Liferay.WorkflowTasks, '<%= randomId %>');

	<c:if test="<%= !workflowTask.isCompleted() && _isAssignedToUser(workflowTask, user) %>">

		<%
		for (String transitionName : transitionNames) {
		%>

			Liferay.delegateClick('<portlet:namespace /><%= randomId + HtmlUtil.escapeJS(transitionName) %>taskChangeStatusLink', onTaskClickFn);

		<%
		}
		%>

	</c:if>

	Liferay.delegateClick('<portlet:namespace /><%= randomId %>taskAssignToMeLink', onTaskClickFn);
	Liferay.delegateClick('<portlet:namespace /><%= randomId %>taskAssignLink', onTaskClickFn);
	Liferay.delegateClick('<portlet:namespace /><%= randomId %>taskDueDateLink', onTaskClickFn);
</aui:script>

<aui:script>
	<c:if test="<%= showCompleteFormButton %>">

		function <portlet:namespace /><%= randomId %>openCompleteForm() {

			<portlet:renderURL var="completeFormURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
				<portlet:param name="mvcPath" value="/display/edit_form.jsp" />
				<portlet:param name="workflowTaskId" value="<%= StringUtil.valueOf(workflowTask.getWorkflowTaskId()) %>" />
				<portlet:param name="kaleoProcessLinkId" value="<%= StringUtil.valueOf(kaleoProcessLink.getKaleoProcessLinkId()) %>" />
				<portlet:param name="ddlRecordId" value="<%= String.valueOf(ddlRecordId) %>" />
				<portlet:param name="formName" value='<%= randomId + "fm" %>' />
			</portlet:renderURL>

			Liferay.Util.openWindow(
				{
					refreshWindow: window,
					title: Liferay.Language.get('complete-form'),
					uri: '<%= completeFormURL.toString() %>'
				}
			);
		}
	</c:if>
</aui:script>
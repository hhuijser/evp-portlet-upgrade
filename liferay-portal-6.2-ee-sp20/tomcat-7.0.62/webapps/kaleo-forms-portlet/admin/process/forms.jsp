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
String redirect = ParamUtil.getString(request, "redirect");

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

long ddmStructureId = KaleoFormsUtil.getKaleoProcessDDMStructureId(kaleoProcess, portletSession);

String workflowDefinition = KaleoFormsUtil.getWorkflowDefinition(kaleoProcess, portletSession);
%>

<h3 class="kaleo-process-header"><liferay-ui:message key="forms" /></h3>

<p class="kaleo-process-message"><liferay-ui:message key="please-select-or-create-one-form-for-each-workflow-task.-each-form-is-a-subset-of-the-field-set-defined-in-step-2" /></p>

<aui:field-wrapper>

	<%
	TaskFormPairs taskFormPairs = KaleoFormsUtil.getTaskFormPairs(company.getCompanyId(), kaleoProcessId, ddmStructureId, workflowDefinition, portletSession);
	%>

	<aui:input name="taskFormPairsData" type="hidden" value="<%= taskFormPairs.toString() %>" />
</aui:field-wrapper>

<portlet:renderURL var="currentSectionURL">
	<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
	<portlet:param name="redirect" value="<%= redirect %>" />
	<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
	<portlet:param name="historyKey" value="forms" />
</portlet:renderURL>

<div id="<portlet:namespace />resultsContainer">
	<liferay-util:include page="/admin/process/task_template_search_container.jsp" servletContext="<%= application %>">
		<liferay-util:param name="backURL" value="<%= currentSectionURL %>" />
		<liferay-util:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
		<liferay-util:param name="workflowDefinition" value="<%= workflowDefinition %>" />
	</liferay-util:include>
</div>
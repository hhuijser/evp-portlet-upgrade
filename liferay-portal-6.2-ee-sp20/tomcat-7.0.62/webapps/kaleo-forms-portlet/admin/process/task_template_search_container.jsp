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
String backURL = ParamUtil.getString(request, "backURL");

long kaleoProcessId = ParamUtil.getLong(request, "kaleoProcessId");
long ddmStructureId = KaleoFormsUtil.getKaleoProcessDDMStructureId(kaleoProcessId, portletSession);
String workflowDefinition = ParamUtil.getString(request, "workflowDefinition");
String initialStateName = KaleoFormsUtil.getInitialStateName(company.getCompanyId(), workflowDefinition);

TaskFormPair initialStateTaskFormPair = KaleoFormsUtil.getInitialStateTaskFormPair(kaleoProcessId, ddmStructureId, workflowDefinition, initialStateName, portletSession);
%>

<div id="<portlet:namespace />formsSearchContainer">
	<liferay-portlet:renderURL varImpl="portletURL" />

	<liferay-ui:search-container
		searchContainer='<%= new SearchContainer<Object>(renderRequest, portletURL, null, "no-tasks-were-found") %>'
	>

		<liferay-ui:search-container-results>

			<%
			TaskFormPairs taskFormPairs = KaleoFormsUtil.getTaskFormPairs(company.getCompanyId(), kaleoProcessId, ddmStructureId, workflowDefinition, portletSession);

			taskFormPairs.add(0, initialStateTaskFormPair);

			searchContainer.setResults(taskFormPairs.list());
			searchContainer.setTotal(taskFormPairs.size());
			%>

		</liferay-ui:search-container-results>

		<liferay-ui:search-container-row
			className="com.liferay.portal.workflow.kaleo.forms.util.TaskFormPair"
			modelVar="taskFormsPair"
		>

		<liferay-ui:search-container-column-text
			name="task"
			value="<%= HtmlUtil.escape(taskFormsPair.getWorkflowTaskName()) %>"
		/>

		<%
		long ddmTemplateId = taskFormsPair.getDDMTemplateId();

		String formName = StringPool.BLANK;

		if (ddmTemplateId > 0) {
			try {
				DDMTemplate ddmTemplate = DDMTemplateLocalServiceUtil.getTemplate(ddmTemplateId);

				formName = ddmTemplate.getName(locale);
			}
			catch (PortalException pe) {
			}
		}
		%>

		<liferay-util:buffer var="taskInputBuffer">
			<c:if test="<%= taskFormsPair.equals(initialStateTaskFormPair) %>">
				<aui:input name="ddmTemplateId" type="hidden" value="<%= Validator.isNull(formName) ? StringPool.BLANK : String.valueOf(ddmTemplateId) %>">
					<aui:validator name="required" />
				</aui:input>
			</c:if>
		</liferay-util:buffer>

		<liferay-ui:search-container-column-text
			name="form"
			value="<%= HtmlUtil.escape(formName) + taskInputBuffer %>"
		/>

		<portlet:renderURL var="selectFormURL">
			<portlet:param name="mvcPath" value="/admin/process/select_template.jsp" />
			<portlet:param name="backURL" value="<%= backURL %>" />
			<portlet:param name="ddmStructureId" value="<%= String.valueOf(ddmStructureId) %>" />
			<portlet:param name="workflowDefinition" value="<%= workflowDefinition %>" />
			<portlet:param name="workflowTaskName" value="<%= taskFormsPair.getWorkflowTaskName() %>" />
			<portlet:param name="mode" value="<%= taskFormsPair.getWorkflowTaskName().equals(initialStateName) ? DDMTemplateConstants.TEMPLATE_MODE_CREATE : DDMTemplateConstants.TEMPLATE_MODE_EDIT %>" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			cssClass="kaleo-process-assign-form-button"
		>
			<aui:button href="<%= selectFormURL %>" value="assign-form" />
		</liferay-ui:search-container-column-text>

		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator />
	</liferay-ui:search-container>
</div>
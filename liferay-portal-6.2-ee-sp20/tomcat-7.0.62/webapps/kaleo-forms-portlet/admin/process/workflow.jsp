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
String currentSectionURL = HttpUtil.setParameter(currentURL, renderResponse.getNamespace() + "historyKey", "workflow");

String tabs1 = ParamUtil.getString(request, "tabs1", "published");

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

String workflowDefinition = KaleoFormsUtil.getWorkflowDefinition(kaleoProcess, portletSession);

String workflowDefinitionName = StringPool.BLANK;
int workflowDefinitionVersion = 0;

if (Validator.isNotNull(workflowDefinition)) {
	String[] workflowDefinitionParts = StringUtil.split(workflowDefinition, CharPool.AT);

	workflowDefinitionName = workflowDefinitionParts[0];
	workflowDefinitionVersion = GetterUtil.getInteger(workflowDefinitionParts[1]);

	if (!KaleoFormsUtil.isWorkflowDefinitionActive(themeDisplay.getCompanyId(), workflowDefinitionName, workflowDefinitionVersion)) {
		workflowDefinition = StringPool.BLANK;
	}
}
%>

<h3 class="kaleo-process-header"><liferay-ui:message key="workflow" /></h3>

<p class="kaleo-process-message"><liferay-ui:message key="please-select-or-create-a-new-workflow-definition-to-guide-the-completion-of-forms.-you-can-associate-forms-to-workflow-tasks-in-the-next-step" /></p>

<aui:field-wrapper>
	<liferay-ui:message key="selected-workflow" />:

	<%
	String workflowDefinitionDisplay = StringPool.BLANK;

	if (Validator.isNotNull(workflowDefinitionName)) {
		WorkflowDefinition kaleoWorkflowDefinition = KaleoFormsUtil.getWorkflowDefinition(themeDisplay.getCompanyId(), workflowDefinitionName, workflowDefinitionVersion);

		if (kaleoWorkflowDefinition != null) {
			workflowDefinitionDisplay = kaleoWorkflowDefinition.getTitle(themeDisplay.getLanguageId()) + " (" + LanguageUtil.get(request, "version") + " " + workflowDefinitionVersion + ")";
		}
	}
	%>

	<span class="badge badge-info" id="<portlet:namespace />workflowDefinitionDisplay"><%= HtmlUtil.escape(workflowDefinitionDisplay) %></span>

	<aui:input name="workflowDefinition" type="hidden" value="<%= workflowDefinition %>">
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="workflowDefinitionName" type="hidden" value="<%= workflowDefinitionName %>" />
	<aui:input name="workflowDefinitionVersion" type="hidden" value="<%= workflowDefinitionVersion %>" />
</aui:field-wrapper>

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
	<portlet:param name="redirect" value="<%= redirect %>" />
	<portlet:param name="tabs1" value="<%= tabs1 %>" />
	<portlet:param name="historyKey" value="workflow" />
	<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
</liferay-portlet:renderURL>

<liferay-ui:search-container
	emptyResultsMessage='<%= tabs1.equals("published") ? "there-are-no-published-definitions" : "there-are-no-unpublished-definitions" %>'
	iteratorURL="<%= iteratorURL %>"
	total='<%= tabs1.equals("published") ? WorkflowDefinitionManagerUtil.getActiveWorkflowDefinitionCount(company.getCompanyId()) : KaleoDraftDefinitionLocalServiceUtil.getLatestKaleoDraftDefinitionsCount(company.getCompanyId(), 0) %>'
>
	<portlet:renderURL var="editWorkflowURL">
		<portlet:param name="mvcPath" value="/admin/process/edit_workflow.jsp" />
		<portlet:param name="backURL" value="<%= currentSectionURL %>" />
	</portlet:renderURL>

	<aui:button href="<%= editWorkflowURL.toString() %>" primary="<%= true %>" value="add-workflow" />

	<div class="separator"><!-- --></div>

	<liferay-portlet:renderURL varImpl="portletURL">
		<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="tabs1" value="<%= tabs1 %>" />
		<portlet:param name="historyKey" value="workflow" />
		<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
	</liferay-portlet:renderURL>

	<liferay-ui:tabs
		names="published,unpublished"
		url="<%= portletURL.toString() %>"
	/>

	<c:choose>
		<c:when test='<%= tabs1.equals("published") %>'>
			<liferay-ui:search-container-results
				results="<%= WorkflowDefinitionManagerUtil.getActiveWorkflowDefinitions(company.getCompanyId(), searchContainer.getStart(), searchContainer.getEnd(), null) %>"
			/>

			<liferay-ui:search-container-row
				className="com.liferay.portal.kernel.workflow.WorkflowDefinition"
				modelVar="workflowDefinitionVar"
			>
				<liferay-ui:search-container-row-parameter
					name="backURL"
					value="<%= currentSectionURL %>"
				/>

				<c:if test="<%= kaleoProcess != null %>">
					<liferay-ui:search-container-row-parameter
						name="kaleoProcessId"
						value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>"
					/>
				</c:if>

				<liferay-ui:search-container-column-text
					name="title"
					value="<%= HtmlUtil.escape(workflowDefinitionVar.getTitle(themeDisplay.getLanguageId())) %>"
				/>

				<liferay-ui:search-container-column-text
					name="version"
					value="<%= String.valueOf(workflowDefinitionVar.getVersion()) %>"
				/>

				<liferay-ui:search-container-column-jsp
					align="right"
					path="/admin/process/workflow_action.jsp"
				/>
			</liferay-ui:search-container-row>
		</c:when>
		<c:otherwise>
			<liferay-ui:search-container-results
				results="<%= KaleoDraftDefinitionLocalServiceUtil.getLatestKaleoDraftDefinitions(company.getCompanyId(), 0, searchContainer.getStart(), searchContainer.getEnd(), null) %>"
			/>

			<liferay-ui:search-container-row
				className="com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition"
				keyProperty="kaleoDraftDefinitionId"
				modelVar="kaleoDraftDefinition"
			>
				<liferay-ui:search-container-row-parameter
					name="backURL"
					value="<%= currentSectionURL %>"
				/>

				<c:if test="<%= kaleoProcess != null %>">
					<liferay-ui:search-container-row-parameter
						name="kaleoProcessId"
						value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>"
					/>
				</c:if>

				<liferay-ui:search-container-row-parameter
					name="name"
					value="<%= kaleoDraftDefinition.getName() %>"
				/>

				<liferay-ui:search-container-row-parameter
					name="version"
					value="<%= kaleoDraftDefinition.getVersion() %>"
				/>

				<liferay-ui:search-container-row-parameter
					name="draftVersion"
					value="<%= kaleoDraftDefinition.getDraftVersion() %>"
				/>

				<liferay-ui:search-container-column-text
					name="title"
					value="<%= HtmlUtil.escape(kaleoDraftDefinition.getTitle(themeDisplay.getLanguageId())) %>"
				/>

				<liferay-ui:search-container-column-text
					name="draft-version"
					value="<%= String.valueOf(kaleoDraftDefinition.getDraftVersion()) %>"
				/>

				<liferay-ui:search-container-column-jsp
					align="right"
					path="/admin/process/kaleo_draft_definition_action.jsp"
				/>
			</liferay-ui:search-container-row>
		</c:otherwise>
	</c:choose>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	Liferay.on(
		'<portlet:namespace />chooseWorkflow',
		function(event) {
			var A = AUI();

			var workflowDefinition = event.name + '@' + event.version;

			A.one('#<portlet:namespace />workflowDefinition').val(workflowDefinition);

			A.one('#<portlet:namespace />workflowDefinitionDisplay').html(
				A.Lang.sub(
					'{title} (<liferay-ui:message key="version" /> {version})',
					{
						title: Liferay.Util.escapeHTML(event.title),
						version: event.version
					}
				)
			);

			var kaleoFormsAdmin = Liferay.component('<portlet:namespace/>KaleoFormsAdmin');

			kaleoFormsAdmin.saveInPortletSession(
				{
					workflowDefinition: workflowDefinition
				}
			);

			kaleoFormsAdmin.updateNavigationControls();
		},
		['aui-base']
	);
</aui:script>
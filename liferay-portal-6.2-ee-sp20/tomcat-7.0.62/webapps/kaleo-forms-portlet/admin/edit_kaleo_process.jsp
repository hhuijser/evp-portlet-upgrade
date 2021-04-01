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

long groupId = BeanParamUtil.getLong(kaleoProcess, request, "groupId", scopeGroupId);

String kaleoProcessName = KaleoFormsUtil.getKaleoProcessName(kaleoProcess, portletSession, locale);

boolean kaleoProcessStarted = false;

if (kaleoProcess != null) {
	kaleoProcessStarted = (DDLRecordLocalServiceUtil.getRecordsCount(kaleoProcess.getDDLRecordSetId(), WorkflowConstants.STATUS_ANY) > 0);
}
%>

<liferay-ui:header
	backURL="<%= redirect %>"
	localizeTitle="<%= (kaleoProcess == null) %>"
	title='<%= Validator.isNull(kaleoProcessName) ? "new-process" : kaleoProcessName %>'
/>

<c:if test="<%= kaleoProcessStarted %>">
	<div class="alert alert-info">
		<liferay-ui:message key="updating-the-field-set-or-workflow-will-cause-loss-of-data" />
	</div>
</c:if>

<portlet:actionURL name="updateKaleoProcess" var="editKaleoProcessURL">
	<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
	<portlet:param name="redirect" value="<%= redirect %>" />
</portlet:actionURL>

<aui:form action="<%= editKaleoProcessURL %>" method="post" name="fm">
	<aui:input name="kaleoProcessId" type="hidden" value="<%= kaleoProcessId %>" />
	<aui:input name="groupId" type="hidden" value="<%= groupId %>" />
	<aui:input name="scope" type="hidden" value="1" />

	<liferay-ui:error exception="<%= KaleoProcessDDMTemplateIdException.class %>" message="please-enter-a-valid-initial-form" />
	<liferay-ui:error exception="<%= RequiredStructureException.class %>" message="unable-to-delete-field-set-with-forms-associated-with-it" />
	<liferay-ui:error exception="<%= RequiredWorkflowDefinitionException.class %>" message="unable-to-delete-the-worflow-definition-that-is-in-use" />

	<liferay-util:buffer var="htmlBottom">
		<aui:button-row cssClass="kaleo-process-buttons">
			<aui:button cssClass="hide kaleo-process-previous pull-left" icon="icon-circle-arrow-left" value="previous" />

			<aui:button cssClass="hide kaleo-process-submit pull-right" disabled="<%= true %>" primary="<%= true %>" type="submit" />

			<aui:button cssClass="kaleo-process-next pull-right" disabled="<%= true %>" icon="icon-circle-arrow-right" iconAlign="right" primary="<%= true %>" value="next" />

			<aui:button cssClass="kaleo-process-cancel pull-right" href="<%= redirect %>" value="cancel" />
		</aui:button-row>
	</liferay-util:buffer>

	<liferay-ui:form-navigator
		categoryNames="<%= _CATEGORY_NAMES %>"
		categorySections="<%= _CATEGORY_SECTIONS %>"
		displayStyle="steps"
		formName="fm"
		htmlBottom="<%= htmlBottom %>"
		jspPath="/admin/process/"
		showButtons="<%= false %>"
	/>

	<aui:script use="liferay-component,liferay-form,liferay-kaleo-forms-admin">
		Liferay.after(
			'form:registered',
			function(event) {
				var form = Liferay.Form.get('<portlet:namespace />fm');

				if (form === event.form) {
					Liferay.component(
						'<portlet:namespace />KaleoFormsAdmin',
						function() {
							return new Liferay.KaleoFormsAdmin(
								{
									currentURL: '<%= currentURL %>',
									form: form,
									kaleoProcessId: <%= kaleoProcessId %>,
									namespace: '<portlet:namespace />',
									portletId: '<%= PortalUtil.getPortletId(request) %>',
									saveInPortletSessionURL: '<portlet:resourceURL id="saveInPortletSession" />',
									tabView: Liferay.component('<portlet:namespace />fmTabview')
								}
							);
						}
					);

					Liferay.component('<portlet:namespace />KaleoFormsAdmin');
				}
			}
		);
	</aui:script>
</aui:form>

<%!
private static final String[] _CATEGORY_NAMES = {""};

private static final String[][] _CATEGORY_SECTIONS = {{"details", "fields", "workflow", "forms"}};
%>
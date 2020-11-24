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
long workflowTaskId = ParamUtil.getLong(request, "workflowTaskId");

long kaleoProcessLinkId = ParamUtil.getLong(request, "kaleoProcessLinkId");

KaleoProcessLink kaleoProcessLink = KaleoProcessLinkLocalServiceUtil.getKaleoProcessLink(kaleoProcessLinkId);

KaleoProcess kaleoProcess = kaleoProcessLink.getKaleoProcess();

long kaleoProcessId = kaleoProcess.getKaleoProcessId();

long groupId = BeanParamUtil.getLong(kaleoProcess, request, "groupId", scopeGroupId);

long ddlRecordId = ParamUtil.getLong(request, "ddlRecordId");

String formName = ParamUtil.getString(request, "formName");
%>

<portlet:actionURL name="completeForm" var="completeFormURL" />

<aui:form action="<%= completeFormURL %>" cssClass="lfr-dynamic-form" enctype="multipart/form-data" method="post" name="<%= HtmlUtil.escapeAttribute(formName) %>" onSubmit='<%= "event.preventDefault(); submitForm(event.target);" %>'>
	<aui:input name="redirect" type="hidden" value="<%= currentURL %>" />
	<aui:input name="groupId" type="hidden" value="<%= String.valueOf(groupId) %>" />
	<aui:input name="ddlRecordId" type="hidden" value="<%= String.valueOf(ddlRecordId) %>" />
	<aui:input name="ddlRecordSetId" type="hidden" value="<%= String.valueOf(kaleoProcess.getDDLRecordSetId()) %>" />
	<aui:input name="ddmTemplateId" type="hidden" value="<%= String.valueOf(kaleoProcessLink.getDDMTemplateId()) %>" />
	<aui:input name="defaultLanguageId" type="hidden" value="<%= themeDisplay.getLanguageId() %>" />
	<aui:input name="kaleoProcessId" type="hidden" value="<%= String.valueOf(kaleoProcessId) %>" />
	<aui:input name="workflowAction" type="hidden" value="<%= WorkflowConstants.ACTION_SAVE_DRAFT %>" />
	<aui:input name="workflowTaskId" type="hidden" value="<%= String.valueOf(workflowTaskId) %>" />

	<aui:fieldset>

		<%
		DDLRecord ddlRecord = DDLRecordLocalServiceUtil.getRecord(ddlRecordId);

		Fields fields = ddlRecord.getFields();

		long classNameId = 0;
		long classPK = 0;

		try {
			DDMTemplate ddmTemplate = DDMTemplateLocalServiceUtil.getTemplate(kaleoProcessLink.getDDMTemplateId());

			classNameId = PortalUtil.getClassNameId(DDMTemplate.class);
			classPK = ddmTemplate.getTemplateId();
		}
		catch (NoSuchTemplateException nste) {
			DDLRecordSet ddlRecordSet = kaleoProcess.getDDLRecordSet();

			DDMStructure ddmStructure = ddlRecordSet.getDDMStructure();

			classNameId = PortalUtil.getClassNameId(DDMStructure.class);
			classPK = ddmStructure.getStructureId();
		}
		%>

		<liferay-ddm:html
			classNameId="<%= classNameId %>"
			classPK="<%= classPK %>"
			fields="<%= fields %>"
			requestedLocale="<%= locale %>"
		/>
	</aui:fieldset>

	<aui:button name="saveButton" type="submit" value="save" />
</aui:form>
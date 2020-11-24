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

long ddlRecordId = ParamUtil.getLong(request, "ddlRecordId");

DDLRecord ddlRecord = DDLRecordServiceUtil.getRecord(ddlRecordId);

DDLRecordSet ddlRecordSet = ddlRecord.getRecordSet();

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

String version = ParamUtil.getString(request, "version", DDLRecordConstants.VERSION_DEFAULT);

DDLRecordVersion ddlRecordVersion = ddlRecord.getRecordVersion(version);
%>

<liferay-ui:header
	backURL="<%= redirect %>"
	title='<%= LanguageUtil.format(pageContext, "view-x", kaleoProcess.getName(locale), false) %>'
/>

<c:if test="<%= ddlRecordVersion != null %>">
	<aui:model-context bean="<%= ddlRecordVersion %>" model="<%= DDLRecordVersion.class %>" />

	<aui:workflow-status model="<%= DDLRecord.class %>" status="<%= ddlRecordVersion.getStatus() %>" version="<%= ddlRecordVersion.getVersion() %>" />
</c:if>

<aui:fieldset>

	<%
	DDMStructure ddmStructure = ddlRecordSet.getDDMStructure();

	Fields fields = null;

	if (ddlRecordVersion != null) {
		fields = StorageEngineUtil.getFields(ddlRecordVersion.getDDMStorageId());
	}
	%>

	<liferay-ddm:html
		classNameId="<%= PortalUtil.getClassNameId(DDMStructure.class) %>"
		classPK="<%= ddmStructure.getStructureId() %>"
		fields="<%= fields %>"
		readOnly="<%= true %>"
		requestedLocale="<%= locale %>"
	/>

	<aui:button-row>
		<aui:button href="<%= redirect %>" name="cancelButton" type="cancel" />
	</aui:button-row>
</aui:fieldset>
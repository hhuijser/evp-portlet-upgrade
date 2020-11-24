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

<%@ include file="/init.jsp" %>

<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms" %><%@
page import="com.liferay.portal.kernel.exception.PortalException" %><%@
page import="com.liferay.portal.kernel.language.UnicodeLanguageUtil" %><%@
page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %><%@
page import="com.liferay.portal.kernel.search.Hits" %><%@
page import="com.liferay.portal.kernel.search.SearchContext" %><%@
page import="com.liferay.portal.kernel.search.SearchContextFactory" %><%@
page import="com.liferay.portal.kernel.util.CharPool" %><%@
page import="com.liferay.portal.kernel.util.Constants" %><%@
page import="com.liferay.portal.kernel.util.HttpUtil" %><%@
page import="com.liferay.portal.kernel.util.StringBundler" %><%@
page import="com.liferay.portal.kernel.util.StringUtil" %><%@
page import="com.liferay.portal.kernel.workflow.RequiredWorkflowDefinitionException" %><%@
page import="com.liferay.portal.kernel.workflow.WorkflowDefinition" %><%@
page import="com.liferay.portal.kernel.workflow.WorkflowDefinitionManagerUtil" %><%@
page import="com.liferay.portal.kernel.workflow.WorkflowInstance" %><%@
page import="com.liferay.portal.model.Portlet" %><%@
page import="com.liferay.portal.service.PortletLocalServiceUtil" %><%@
page import="com.liferay.portal.service.WorkflowInstanceLinkLocalServiceUtil" %><%@
page import="com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition" %><%@
page import="com.liferay.portal.workflow.kaleo.designer.service.KaleoDraftDefinitionLocalServiceUtil" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.KaleoProcessDDMTemplateIdException" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.model.KaleoProcessLink" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.search.KaleoProcessSearch" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.service.KaleoProcessServiceUtil" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.service.permission.KaleoFormsPermission" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.util.KaleoFormsUtil" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.util.PortletKeys" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.util.TaskFormPair" %><%@
page import="com.liferay.portal.workflow.kaleo.forms.util.TaskFormPairs" %><%@
page import="com.liferay.portlet.PortletURLFactoryUtil" %><%@
page import="com.liferay.portlet.dynamicdatalists.RecordSetDDMStructureIdException" %><%@
page import="com.liferay.portlet.dynamicdatalists.RecordSetNameException" %><%@
page import="com.liferay.portlet.dynamicdatalists.model.DDLRecordConstants" %><%@
page import="com.liferay.portlet.dynamicdatalists.model.DDLRecordVersion" %><%@
page import="com.liferay.portlet.dynamicdatalists.service.DDLRecordServiceUtil" %><%@
page import="com.liferay.portlet.dynamicdatalists.util.DDLUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.RequiredStructureException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.model.DDMTemplateConstants" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.DDMStructureLocalServiceUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.DDMStructureServiceUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.storage.FieldConstants" %><%@
page import="com.liferay.portlet.dynamicdatamapping.storage.StorageEngineUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.storage.StorageType" %><%@
page import="com.liferay.portlet.dynamicdatamapping.util.DDMDisplay" %><%@
page import="com.liferay.portlet.dynamicdatamapping.util.DDMDisplayRegistryUtil" %>

<%@ page import="javax.portlet.PortletRequest" %><%@
page import="javax.portlet.WindowState" %>

<%
String refererPortletName = ParamUtil.getString(request, "refererPortletName", portletName);
String refererWebDAVToken = ParamUtil.getString(request, "refererWebDAVToken", portletConfig.getInitParameter("refererWebDAVToken"));
String scopeTitle = ParamUtil.getString(request, "scopeTitle");
boolean showGlobalScope = ParamUtil.getBoolean(request, "showGlobalScope");
boolean showManageTemplates = ParamUtil.getBoolean(request, "showManageTemplates", true);
boolean showToolbar = ParamUtil.getBoolean(request, "showToolbar", true);

DDMDisplay ddmDisplay = DDMDisplayRegistryUtil.getDDMDisplay(portletDisplay.getId());

long scopeClassNameId = PortalUtil.getClassNameId(ddmDisplay.getStructureType());

String scopeAvailableFields = ddmDisplay.getAvailableFields();
String scopeStorageType = ddmDisplay.getStorageType();
String scopeTemplateType = ddmDisplay.getTemplateType();

String storageTypeValue = StringPool.BLANK;

if (scopeStorageType.equals("expando")) {
	storageTypeValue = StorageType.EXPANDO.getValue();
}
else if (scopeStorageType.equals("xml")) {
	storageTypeValue = StorageType.XML.getValue();
}

String templateTypeValue = StringPool.BLANK;

if (scopeTemplateType.equals(DDMTemplateConstants.TEMPLATE_TYPE_DISPLAY)) {
	templateTypeValue = DDMTemplateConstants.TEMPLATE_TYPE_DISPLAY;
}
else if (scopeTemplateType.equals(DDMTemplateConstants.TEMPLATE_TYPE_FORM)) {
	templateTypeValue = DDMTemplateConstants.TEMPLATE_TYPE_FORM;
}
%>
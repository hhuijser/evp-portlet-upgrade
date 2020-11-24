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

String name = ParamUtil.getString(request, "name");
int version = ParamUtil.getInteger(request, "version");
int draftVersion = ParamUtil.getInteger(request, "draftVersion");

Portlet kaleoDesignerPortlet = PortletLocalServiceUtil.getPortletById(company.getCompanyId(), PortletKeys.KALEO_DESIGNER);
%>

<liferay-util:html-top>
	<link href="<%= PortalUtil.getStaticResourceURL(request, kaleoDesignerPortlet.getContextPath() + "/designer/css/main.css") %>" rel="stylesheet" type="text/css" />
</liferay-util:html-top>

<liferay-util:html-bottom>
	<script defer="defer" src="<%= PortalUtil.getStaticResourceURL(request, kaleoDesignerPortlet.getContextPath() + "/designer/js/main.js") %>" type="text/javascript"></script>
</liferay-util:html-bottom>

<liferay-util:include page="/designer/edit_kaleo_draft_definition.jsp" portletId="<%= PortletKeys.KALEO_DESIGNER %>">
	<portlet:param name="mvcPath" value="/admin/process/edit_workflow.jsp" />
	<portlet:param name="backURL" value="<%= backURL %>" />
	<portlet:param name="name" value="<%= name %>" />
	<portlet:param name="version" value="<%= String.valueOf(version) %>" />
	<portlet:param name="draftVersion" value="<%= String.valueOf(draftVersion) %>" />
</liferay-util:include>
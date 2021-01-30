<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/portlet/directory/init.jsp" %>

<%
PortletURL tabs1URL = renderResponse.createRenderURL();

tabs1URL.setParameter("struts_action", "/directory/view");

String tabs1Names = ParamUtil.getString(request, "tabs1Names", "users,organizations,user-groups");

tabs1Names = HtmlUtil.escape(tabs1Names);

String tabs1Values = tabs1Names;

String viewUsersRedirect = ParamUtil.getString(request, "viewUsersRedirect");

String redirect = ParamUtil.getString(request, "redirect", viewUsersRedirect);
%>

<liferay-ui:tabs
	backURL='<%= ParamUtil.getString(request, "backURL", redirect) %>'
	names="<%= tabs1Names %>"
	tabsValues="<%= tabs1Values %>"
	url="<%= tabs1URL.toString() %>"
/>
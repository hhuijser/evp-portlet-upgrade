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

<%@ include file="/app_manager/init.jsp" %>

<%
String toolbarItem = ParamUtil.getString(request, "toolbarItem", "manage");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("mvcPath", "/app_manager/view.jsp");
portletURL.setParameter("toolbarItem", toolbarItem);
%>

<aui:nav-bar>
	<aui:nav>

		<%
		portletURL.setParameter("toolbarItem", "manage");
		%>

		<aui:nav-item href="<%= portletURL.toString() %>" label="manage" selected='<%= toolbarItem.equals("manage") %>' />

		<%
		portletURL.setParameter("toolbarItem", "install");
		%>

		<aui:nav-item href="<%= portletURL.toString() %>" label="install" selected='<%= toolbarItem.equals("install") %>' />

		<%
		portletURL.setParameter("toolbarItem", toolbarItem);
		%>

	</aui:nav>
</aui:nav-bar>

<c:choose>
	<c:when test='<%= toolbarItem.equals("install") %>'>
		<%@ include file="/app_manager/install_apps.jspf" %>
	</c:when>
	<c:otherwise>
		<%@ include file="/app_manager/manage.jspf" %>
	</c:otherwise>
</c:choose>
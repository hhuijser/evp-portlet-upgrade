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

<%@ include file="/html/portlet/workflow_tasks/init.jsp" %>

<%
String tabs1 = ParamUtil.getString(request, "tabs1", "pending");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("tabs1", tabs1);
%>

<aui:form action="<%= portletURL.toString() %>" method="post" name="fm">
	<aui:nav-bar>
		<aui:nav-bar-search cssClass="pull-right" file="/html/portlet/workflow_tasks/workflow_search_tasks.jsp" />
	</aui:nav-bar>
</aui:form>
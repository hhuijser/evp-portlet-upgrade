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

<%@ include file="/html/taglib/ui/search/init.jsp" %>

<%
long groupId = ParamUtil.getLong(request, namespace + "groupId");

Group group = themeDisplay.getScopeGroup();

String keywords = ParamUtil.getString(request, namespace + "keywords");

PortletURL portletURL = null;

if (portletResponse != null) {
	LiferayPortletResponse liferayPortletResponse = (LiferayPortletResponse)portletResponse;

	portletURL = liferayPortletResponse.createLiferayPortletURL(PortletKeys.SEARCH, PortletRequest.RENDER_PHASE);
}
else {
	portletURL = new PortletURLImpl(request, PortletKeys.SEARCH, plid, PortletRequest.RENDER_PHASE);
}

portletURL.setParameter("struts_action", "/search/search");
portletURL.setParameter("redirect", currentURL);
portletURL.setPortletMode(PortletMode.VIEW);
portletURL.setWindowState(WindowState.MAXIMIZED);

pageContext.setAttribute("portletURL", portletURL);
%>

<form action="<%= HtmlUtil.escapeAttribute(portletURL.toString()) %>" method="get" name="<%= randomNamespace %><%= namespace %>fm" onSubmit="<%= randomNamespace %><%= namespace %>search(); return false;">
<liferay-portlet:renderURLParams varImpl="portletURL" />

<aui:fieldset>
	<aui:input inlineField="<%= true %>" label="" name='<%= namespace + "keywords" %>' size="30" title="search" type="text" useNamespace="<%= false %>" value="<%= HtmlUtil.escapeAttribute(keywords) %>" />

	<aui:select inlineField="<%= true %>" label="" name='<%= namespace + "groupId" %>' title="scope" useNamespace="<%= false %>">
		<c:if test="<%= !group.isStagingGroup() %>">
			<aui:option label="everything" selected="<%= (groupId == 0) %>" value="0" />
		</c:if>

		<aui:option label='<%= "this-" + (group.isOrganization() ? "organization" : "site") %>' selected="<%= (groupId != 0) %>" value="<%= group.getGroupId() %>" />
	</aui:select>

	<aui:input inlineField="<%= true %>" label="" name="search" src='<%= themeDisplay.getPathThemeImages() + "/common/search.png" %>' title="search" type="image" />
</aui:fieldset>

<aui:script>
	function <%= randomNamespace %><%= namespace %>search() {
		var keywords = document.<%= randomNamespace %><%= namespace %>fm.<%= namespace %>keywords.value;

		keywords = keywords.replace(/^\s+|\s+$/, '');

		if (keywords != '') {
			submitForm(document.<%= randomNamespace %><%= namespace %>fm);
		}
	}
</aui:script>
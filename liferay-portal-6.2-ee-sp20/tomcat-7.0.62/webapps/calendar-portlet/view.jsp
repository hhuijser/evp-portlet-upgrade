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

<%
String tabs1 = ParamUtil.getString(request, "tabs1", "calendar");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("tabs1", tabs1);
%>

<div class="alert alert-success hide" id="<portlet:namespace />alert">
	<button class="close" data-dismiss="alert" type="button">&times;</button>

	<span class="message-placeholder"></span>
</div>

<c:if test="<%= themeDisplay.isSignedIn() %>">
	<liferay-ui:tabs
		names="calendar,resources"
		url="<%= portletURL.toString() %>"
	/>
</c:if>

<c:choose>
	<c:when test='<%= tabs1.equals("calendar") %>'>
		<liferay-util:include page="/view_calendar.jsp" servletContext="<%= application %>" />
	</c:when>
	<c:when test='<%= tabs1.equals("resources") %>'>
		<liferay-util:include page="/view_calendar_resources.jsp" servletContext="<%= application %>" />
	</c:when>
</c:choose>
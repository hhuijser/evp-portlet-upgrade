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
String tabs2 = ParamUtil.getString(request, "tabs2", "general");

String redirect = ParamUtil.getString(request, "redirect");

if (Validator.isNull(redirect)) {
	redirect = PortalUtil.getCurrentURL(request);
}

String backURL = ParamUtil.getString(request, "backURL");

Calendar calendar = (Calendar)request.getAttribute(WebKeys.CALENDAR);

CalendarResource calendarResource = (CalendarResource)request.getAttribute(WebKeys.CALENDAR_RESOURCE);

if (calendarResource == null) {
	calendarResource = calendar.getCalendarResource();
}

String calendarName = null;

if (calendar != null) {
	calendarName = calendar.getName(locale);
}

String calendarResourceName = calendarResource.getName(locale);

if (Validator.isNotNull(calendarName) && !calendarResourceName.equals(calendarName)) {
	calendarName = calendarResourceName + StringPool.SPACE + StringPool.DASH + StringPool.SPACE + calendarName;
}
%>

<liferay-portlet:renderURL var="portletURL">
	<portlet:param name="mvcPath" value="/edit_calendar.jsp" />
	<portlet:param name="tabs2" value="<%= tabs2 %>" />
	<portlet:param name="redirect" value="<%= redirect %>" />
	<portlet:param name="backURL" value="<%= backURL %>" />
	<portlet:param name="calendarId" value="<%= (calendar != null) ? String.valueOf(calendar.getCalendarId()) : StringPool.BLANK %>" />
	<portlet:param name="calendarResourceId" value="<%= (calendarResource != null) ? String.valueOf(calendarResource.getCalendarResourceId()) : StringPool.BLANK %>" />
</liferay-portlet:renderURL>

<liferay-ui:tabs
	names='<%= (calendar == null) ? "general" : "general,notification-templates" %>'
	param="tabs2"
	url="<%= portletURL %>"
/>

<c:choose>
	<c:when test='<%= tabs2.equals("general") %>'>
		<%@ include file="/edit_calendar_general.jspf" %>
	</c:when>
	<c:when test='<%= tabs2.equals("notification-templates") %>'>
		<%@ include file="/edit_calendar_notification_templates.jspf" %>
	</c:when>
</c:choose>
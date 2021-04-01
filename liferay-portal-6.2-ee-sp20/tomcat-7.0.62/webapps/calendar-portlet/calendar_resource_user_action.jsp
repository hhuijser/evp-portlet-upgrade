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
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

User curUser = (User)row.getObject();
%>

<liferay-ui:icon-menu>
	<portlet:renderURL var="calendarsURL">
		<portlet:param name="mvcPath" value="/view_calendars.jsp" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
		<portlet:param name="classNameId" value="<%= String.valueOf(PortalUtil.getClassNameId(User.class)) %>" />
		<portlet:param name="classPK" value="<%= String.valueOf(curUser.getUserId()) %>" />
	</portlet:renderURL>

	<liferay-ui:icon
		image="calendar"
		message="view-calendars"
		url="<%= calendarsURL %>"
	/>
</liferay-ui:icon-menu>
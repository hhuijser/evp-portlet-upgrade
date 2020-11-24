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

CalendarResource calendarResource = (CalendarResource)row.getObject();
%>

<liferay-ui:icon-menu>
	<c:if test="<%= CalendarResourcePermission.contains(permissionChecker, calendarResource, ActionKeys.UPDATE) %>">
		<portlet:renderURL var="editURL">
			<portlet:param name="mvcPath" value="/edit_calendar_resource.jsp" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="calendarResourceId" value="<%= String.valueOf(calendarResource.getCalendarResourceId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="edit"
			url="<%= editURL %>"
		/>
	</c:if>

	<c:if test="<%= CalendarResourcePermission.contains(permissionChecker, calendarResource, ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= CalendarResource.class.getName() %>"
			modelResourceDescription="<%= calendarResource.getName(locale) %>"
			resourceGroupId="<%= calendarResource.getGroupId() %>"
			resourcePrimKey="<%= String.valueOf(calendarResource.getCalendarResourceId()) %>"
			var="permissionsURL"
			windowState="<%= LiferayWindowState.POP_UP.toString() %>"
		/>

		<liferay-ui:icon
			image="permissions"
			method="get"
			url="<%= permissionsURL %>"
			useDialog="<%= true %>"
		/>
	</c:if>

	<c:if test="<%= CalendarResourcePermission.contains(permissionChecker, calendarResource, ActionKeys.DELETE) %>">
		<portlet:actionURL name="deleteCalendarResource" var="deleteURL">
			<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.DELETE %>" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="calendarResourceId" value="<%= String.valueOf(calendarResource.getCalendarResourceId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete
			url="<%= deleteURL %>"
		/>
	</c:if>

	<portlet:renderURL var="calendarsURL">
		<portlet:param name="mvcPath" value="/view_calendars.jsp" />
		<portlet:param name="redirect" value="<%= currentURL %>" />
		<portlet:param name="calendarResourceId" value="<%= String.valueOf(calendarResource.getCalendarResourceId()) %>" />
	</portlet:renderURL>

	<liferay-ui:icon
		image="calendar"
		message="view-calendars"
		url="<%= calendarsURL %>"
	/>
</liferay-ui:icon-menu>
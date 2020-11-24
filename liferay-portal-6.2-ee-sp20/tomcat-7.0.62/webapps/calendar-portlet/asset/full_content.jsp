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

<div>
	<c:if test="<%= Validator.isNotNull(calendarBooking.getDescription(locale)) %>">
		<div>
			<%= calendarBooking.getDescription(locale) %>
		</div>
	</c:if>

	<p>
		<liferay-ui:icon
			image="../common/user_icon"
			message="owner"
		/>

		<%
		Calendar calendar = calendarBooking.getCalendar();
		%>

		<strong><%= HtmlUtil.escape(calendar.getName(locale)) %></strong>

		<%
		List<CalendarBooking> childCalendarBookings = calendarBooking.getChildCalendarBookings();
		%>

		<c:if test="<%= !childCalendarBookings.isEmpty() %>">
			<br />

			<liferay-ui:icon
				image="../common/organization_icon"
				message="resources"
			/>

			<liferay-ui:message key="resources" />:

			<%
			List<String> calendarResourcesNames = new ArrayList<String>();

			for (CalendarBooking childCalendarBooking : childCalendarBookings) {
				CalendarResource calendarResource = childCalendarBooking.getCalendarResource();

				calendarResourcesNames.add(calendarResource.getName(locale));
			}
			%>

			<%= HtmlUtil.escape(StringUtil.merge(calendarResourcesNames, ", ")) %>
		</c:if>

		<c:if test="<%= calendarBooking.isRecurring() %>">
			<br /><br />

			<liferay-ui:icon
				image="../common/site_template"
				message="recurring"
			/>

			<liferay-ui:message key="recurring" />
		</c:if>

		<br /><br />

		<liferay-ui:icon
			image="../common/revision"
			message="starts"
		/>

		<%
		java.util.Calendar startTimeJCalendar = JCalendarUtil.getJCalendar(calendarBooking.getStartTime(), user.getTimeZone());
		%>

		<liferay-ui:message key="starts" />: <%= dateFormatLongDate.format(startTimeJCalendar.getTime()) + ", " + dateFormatTime.format(startTimeJCalendar.getTime()) %>

		<br />

		<liferay-ui:icon
			image="../common/revision"
			message="ends"
		/>

		<%
		java.util.Calendar endTimeJCalendar = JCalendarUtil.getJCalendar(calendarBooking.getEndTime(), user.getTimeZone());
		%>

		<liferay-ui:message key="ends" />: <%= dateFormatLongDate.format(endTimeJCalendar.getTime()) + ", " + dateFormatTime.format(endTimeJCalendar.getTime()) %>

		<c:if test="<%= Validator.isNotNull(calendarBooking.getLocation()) %>">
			<br /><br />

			<liferay-ui:icon
				image="../common/view_locations"
				message="location"
			/>

			<liferay-ui:message key="location" />: <a href="https://maps.google.com.br/maps?q=<%= HtmlUtil.escapeHREF(calendarBooking.getLocation()) %>" target="_blank"><%= HtmlUtil.escape(calendarBooking.getLocation()) %></a>
		</c:if>

		<liferay-ui:custom-attributes-available className="<%= CalendarBooking.class.getName() %>">
			<liferay-ui:custom-attribute-list
				className="<%= CalendarBooking.class.getName() %>"
				classPK="<%= (calendarBooking != null) ? calendarBooking.getCalendarBookingId() : 0 %>"
				editable="<%= false %>"
				label="<%= true %>"
			/>
		</liferay-ui:custom-attributes-available>
	</p>
</div>

<br />
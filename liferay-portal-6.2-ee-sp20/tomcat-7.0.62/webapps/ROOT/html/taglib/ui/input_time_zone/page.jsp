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

<%@ include file="/html/taglib/ui/input_time_zone/init.jsp" %>

<%
boolean autoFocus = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:autoFocus"));
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-time-zone:cssClass"));
boolean disabled = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:disabled"));
int displayStyle = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-time-zone:displayStyle"));
String name = namespace + request.getAttribute("liferay-ui:input-time-zone:name");
boolean nullable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:nullable"));
String value = (String)request.getAttribute("liferay-ui:input-time-zone:value");

NumberFormat numberFormat = NumberFormat.getInstance(locale);

numberFormat.setMinimumIntegerDigits(2);
%>

<select class="<%= cssClass %>" <%= disabled ? "disabled=\"disabled\"" : "" %> id="<%= name %>" name="<%= name %>">
	<c:if test="<%= nullable %>">
		<option value=""></option>
	</c:if>

	<%
	long currentTime = System.currentTimeMillis();

	Set<TimeZone> timeZones = new TreeSet<TimeZone>(new TimeZoneComparator());

	for (String timeZoneId : PropsUtil.getArray(PropsKeys.TIME_ZONES)) {
		TimeZone curTimeZone = TimeZoneUtil.getTimeZone(timeZoneId);

		timeZones.add(curTimeZone);
	}

	for (TimeZone curTimeZone : timeZones) {
		String offset = StringPool.BLANK;

		boolean inDaylightTime = curTimeZone.inDaylightTime(new Date());

		int totalOffset = curTimeZone.getOffset(currentTime);

		if (totalOffset != 0) {
			String offsetHour = numberFormat.format(totalOffset / Time.HOUR);
			String offsetMinute = numberFormat.format(Math.abs(totalOffset % Time.HOUR) / Time.MINUTE);

			StringBundler sb = new StringBundler(5);

			sb.append(StringPool.SPACE);

			if (totalOffset > 0) {
				sb.append(StringPool.PLUS);
			}

			sb.append(offsetHour);
			sb.append(StringPool.COLON);
			sb.append(offsetMinute);

			offset = sb.toString();
		}
	%>

		<option <%= value.equals(curTimeZone.getID()) ? "selected" : "" %> value="<%= curTimeZone.getID() %>">(UTC<%= offset %>) <%= curTimeZone.getDisplayName(inDaylightTime, displayStyle, locale) %></option>

	<%
	}
	%>

</select>

<c:if test="<%= autoFocus %>">
	<aui:script>
		Liferay.Util.focusFormField('#<%= name %>');
	</aui:script>
</c:if>
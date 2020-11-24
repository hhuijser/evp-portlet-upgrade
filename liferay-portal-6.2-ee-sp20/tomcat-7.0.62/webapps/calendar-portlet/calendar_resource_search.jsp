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
CalendarResourceDisplayTerms displayTerms = new CalendarResourceDisplayTerms(renderRequest);
%>

<liferay-ui:search-toggle
	buttonLabel="search"
	displayTerms="<%= displayTerms %>"
	id="toggle_id_calendar_resource_search"
>
	<aui:fieldset>
		<aui:input name="<%= displayTerms.CODE %>" value="<%= displayTerms.getCode() %>" />

		<aui:input name="<%= displayTerms.NAME %>" value="<%= displayTerms.getName() %>" />

		<aui:input name="<%= displayTerms.DESCRIPTION %>" value="<%= displayTerms.getDescription() %>" />

		<aui:select name="<%= displayTerms.ACTIVE %>">
			<aui:option label="yes" selected="<%= displayTerms.isActive() %>" value="true" />
			<aui:option label="no" selected="<%= !displayTerms.isActive() %>" value="false" />
		</aui:select>

		<aui:select name="<%= displayTerms.SCOPE %>">
			<aui:option label="current" selected="<%= (displayTerms.getScope() == themeDisplay.getScopeGroupId()) %>" value="<%= themeDisplay.getScopeGroupId() %>" />
			<aui:option label="global" selected="<%= (displayTerms.getScope() == themeDisplay.getCompanyGroupId()) %>" value="<%= themeDisplay.getCompanyGroupId() %>" />
		</aui:select>
	</aui:fieldset>
</liferay-ui:search-toggle>

<c:if test="<%= CalendarPortletPermission.contains(permissionChecker, scopeGroupId, ActionKeys.ADD_RESOURCE) %>">
	<aui:button-row>
		<liferay-portlet:renderURL var="editCalendarResourceURL">
			<liferay-portlet:param name="mvcPath" value="/edit_calendar_resource.jsp" />
			<liferay-portlet:param name="redirect" value="<%= currentURL %>" />
		</liferay-portlet:renderURL>

		<aui:button onClick="<%= editCalendarResourceURL %>" value="add-calendar-resource" />
	</aui:button-row>
</c:if>
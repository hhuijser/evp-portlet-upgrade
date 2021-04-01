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

<liferay-portlet:renderURL varImpl="searchURL" />

<aui:form action="<%= searchURL %>" method="get" name="fm">
	<liferay-portlet:renderURLParams varImpl="searchURL" />
	<aui:input name="mvcPath" type="hidden" value="/view.jsp" />
	<aui:input name="tabs1" type="hidden" value="resources" />

	<liferay-ui:search-form
		page="/calendar_resource_search.jsp"
		servletContext="<%= application %>"
	/>
</aui:form>

<div class="separator"><!-- --></div>

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/view.jsp" />
	<portlet:param name="tabs1" value="resources" />
</liferay-portlet:renderURL>

<c:choose>
	<c:when test="<%= displayTerms.getScope() == themeDisplay.getCompanyGroupId() %>">
		<h3><liferay-ui:message key="users" /></h3>

		<%@ include file="/calendar_resource_user_search_container.jspf" %>

		<h3><liferay-ui:message key="sites" /></h3>

		<%@ include file="/calendar_resource_group_search_container.jspf" %>
	</c:when>
	<c:otherwise>
		<%@ include file="/calendar_resource_search_container.jspf" %>
	</c:otherwise>
</c:choose>
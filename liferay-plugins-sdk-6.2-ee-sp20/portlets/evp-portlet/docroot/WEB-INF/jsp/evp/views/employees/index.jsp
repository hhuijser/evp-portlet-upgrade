<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/WEB-INF/jsp/evp/views/init.jsp" %>

<liferay-util:include page="/WEB-INF/jsp/evp/views/toolbar.jsp" servletContext="<%= application %>">
	<liferay-util:param name="tabs1" value="employees" />
</liferay-util:include>

<liferay-ui:header title="employees" />

<div class="portlet-msg-info">
	<liferay-ui:message key="note-this-tool-is-only-used-to-import-employees-into-our-system-and-display-the-associated-loop-values-for-troubleshooting-data-issues-contact-loop-admin-to-resolve-issues.-however-to-override-an-employees-overall-evp-eligibility-go-to-control-panel-search-for-and-edit-user-custom-fields.-change-the-evpoverridestatus-drop-down-as-needed" />
</div>

<c:if test='${AlloyPermission.contains(themeDisplay, "employees", "edit")}'>
	<aui:button-row>
		<portlet:renderURL var="viewEVPEmployeeURL">
			<portlet:param name="controller" value="employees" />
			<portlet:param name="action" value="view" />
		</portlet:renderURL>

		<aui:button href="${viewEVPEmployeeURL}" value="import-user-from-ldap" />
	</aui:button-row>
</c:if>
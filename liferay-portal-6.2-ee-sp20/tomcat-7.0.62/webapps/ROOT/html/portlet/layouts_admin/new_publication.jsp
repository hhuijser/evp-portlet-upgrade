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

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>
<%@ include file="/html/portlet/layouts_admin/publish_layouts_init.jspf" %>

<aui:form action='<%= portletURL.toString() + "&etag=0&strip=0" %>' cssClass="lfr-export-dialog" method="post" name="exportPagesFm" onSubmit='<%= "event.preventDefault(); " + renderResponse.getNamespace() + "publishPages();" %>'>
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= cmd %>" />
	<aui:input name="originalCmd" type="hidden" value="<%= cmd %>" />
	<aui:input name="tabs1" type="hidden" value="<%= tabs1 %>" />
	<aui:input name="redirect" type="hidden" value="<%= renderURL.toString() %>" />
	<aui:input name="stagingGroupId" type="hidden" value="<%= stagingGroupId %>" />
	<aui:input name="layoutSetBranchName" type="hidden" value="<%= layoutSetBranchName %>" />
	<aui:input name="lastImportUserName" type="hidden" value="<%= user.getFullName() %>" />
	<aui:input name="lastImportUserUuid" type="hidden" value="<%= String.valueOf(user.getUserUuid()) %>" />

	<liferay-ui:error exception="<%= DuplicateLockException.class %>" message="another-publishing-process-is-in-progress,-please-try-again-later" />

	<liferay-ui:error exception="<%= LayoutPrototypeException.class %>">

		<%
		LayoutPrototypeException lpe = (LayoutPrototypeException)errorException;
		%>

		<liferay-ui:message key="the-pages-could-not-be-published-because-one-or-more-required-page-templates-could-not-be-found-on-the-remote-system.-please-import-the-following-templates-manually" />

		<ul>

			<%
			List<Tuple> missingLayoutPrototypes = lpe.getMissingLayoutPrototypes();

			for (Tuple missingLayoutPrototype : missingLayoutPrototypes) {
				String layoutPrototypeClassName = (String)missingLayoutPrototype.getObject(0);
				String layoutPrototypeUuid = (String)missingLayoutPrototype.getObject(1);
				String layoutPrototypeName = (String)missingLayoutPrototype.getObject(2);
			%>

			<li>
				<%= ResourceActionsUtil.getModelResource(locale, layoutPrototypeClassName) %>: <strong><%= HtmlUtil.escape(layoutPrototypeName) %></strong> (<%= HtmlUtil.escape(layoutPrototypeUuid) %>)
			</li>

			<%
			}
			%>

		</ul>
	</liferay-ui:error>

	<%@ include file="/html/portlet/layouts_admin/error_auth_exception.jspf" %>

	<%@ include file="/html/portlet/layouts_admin/error_remote_export_exception.jspf" %>

	<%@ include file="/html/portlet/layouts_admin/error_remote_options_exception.jspf" %>

	<liferay-ui:error exception="<%= SystemException.class %>">

		<%
		SystemException se = (SystemException)errorException;
		%>

		<liferay-ui:message key="<%= se.getMessage() %>" />
	</liferay-ui:error>

	<div id="<portlet:namespace />publishOptions">
		<div class="export-dialog-tree">

			<%
			String scheduleCMD = StringPool.BLANK;
			String unscheduleCMD = StringPool.BLANK;

			if (cmd.equals("copy_from_live")) {
				scheduleCMD = "schedule_copy_from_live";
				unscheduleCMD = "unschedule_copy_from_live";
			}
			else if (cmd.equals("publish_to_live")) {
				scheduleCMD = "schedule_publish_to_live";
				unscheduleCMD = "unschedule_publish_to_live";
			}
			else if (cmd.equals("publish_to_remote")) {
				scheduleCMD = "schedule_publish_to_remote";
				unscheduleCMD = "unschedule_publish_to_remote";
			}

			String taskExecutorClassName = localPublishing ? LayoutStagingBackgroundTaskExecutor.class.getName() : LayoutRemoteStagingBackgroundTaskExecutor.class.getName();

			int incompleteBackgroundTaskCount = BackgroundTaskLocalServiceUtil.getBackgroundTasksCount(stagingGroupId, taskExecutorClassName, false);

			incompleteBackgroundTaskCount += BackgroundTaskLocalServiceUtil.getBackgroundTasksCount(liveGroupId, taskExecutorClassName, false);
			%>

			<div class="<%= incompleteBackgroundTaskCount == 0 ? "hide" : "in-progress" %>" id="<portlet:namespace />incompleteProcessMessage">
				<liferay-util:include page="/html/portlet/layouts_admin/incomplete_processes_message.jsp">
					<liferay-util:param name="incompleteBackgroundTaskCount" value="<%= String.valueOf(incompleteBackgroundTaskCount) %>" />
				</liferay-util:include>
			</div>

			<aui:fieldset cssClass="options-group" label="date">
				<%@ include file="/html/portlet/layouts_admin/publish_layouts_scheduler.jspf" %>
			</aui:fieldset>

			<c:if test="<%= !selGroup.isCompany() %>">
				<aui:fieldset cssClass="options-group" label="pages">
					<%@ include file="/html/portlet/layouts_admin/publish_layouts_select_pages.jspf" %>
				</aui:fieldset>
			</c:if>

			<%
			List<Layout> exportLayouts = new ArrayList<Layout>();

			if (!selectedLayouts.isEmpty()) {
				exportLayouts = selectedLayouts;
			}
			else if ((selLayout != null) && !selectedLayouts.isEmpty()) {
				exportLayouts.add(selLayout);
			}
			else {
				exportLayouts = LayoutLocalServiceUtil.getLayouts(selGroup.getGroupId(), privateLayout);
			}

			List<Portlet> portletDataHandlerPortlets = LayoutExporter.getPortletDataHandlerPortlets(exportLayouts);
			%>

			<c:if test="<%= !portletDataHandlerPortlets.isEmpty() %>">
				<aui:fieldset cssClass="options-group" label="application-configuration">
					<%@ include file="/html/portlet/layouts_admin/publish_layouts_portlets_setup.jspf" %>
				</aui:fieldset>
			</c:if>

			<%
			List<Portlet> dataSiteLevelPortlets = LayoutExporter.getDataSiteLevelPortlets(company.getCompanyId());
			%>

			<c:if test="<%= !dataSiteLevelPortlets.isEmpty() %>">
				<aui:fieldset cssClass="options-group" label="content">
					<%@ include file="/html/portlet/layouts_admin/publish_layouts_portlets_data.jspf" %>
				</aui:fieldset>
			</c:if>

			<aui:fieldset cssClass="options-group" label="permissions">
				<%@ include file="/html/portlet/layouts_admin/publish_layouts_permissions.jspf" %>
			</aui:fieldset>

			<c:if test="<%= !localPublishing %>">
				<aui:fieldset cssClass="options-group" label="remote-live-connection-settings">
					<%@ include file="/html/portlet/layouts_admin/publish_layouts_remote_options.jspf" %>
				</aui:fieldset>
			</c:if>
		</div>

		<aui:button-row>
			<aui:button id="addButton" name="addButton" onClick='<%= renderResponse.getNamespace() + "schedulePublishEvent();" %>' value="add-event" />

			<aui:button id="publishButton" name="publishButton" type="submit" value="<%= publishActionKey %>" />
		</aui:button-row>
	</div>
</aui:form>
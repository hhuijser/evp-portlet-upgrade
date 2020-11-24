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

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>
<%@ include file="/html/portlet/layouts_admin/publish_layouts_init.jspf" %>

<c:if test='<%= SessionMessages.contains(renderRequest, "requestProcessed") %>'>

	<%
	String successMessage = (String)SessionMessages.get(renderRequest, "requestProcessed");
	%>

	<c:if test='<%= Validator.isNotNull(successMessage) && !successMessage.equals("request_processed") %>'>
		<div class="alert alert-success">
			<%= HtmlUtil.escape(successMessage) %>
		</div>
	</c:if>
</c:if>

<%
String tabs2Names = StringPool.BLANK;

if (cmd.equals("view_processes")) {
	tabs2Names = "current-and-previous";
}
else {
	tabs2Names = "new-publication-process,current-and-previous,scheduled";
}
%>

<liferay-ui:tabs
	names="<%= tabs2Names %>"
	param="tabs2"
	refresh="<%= false %>"
>
	<c:if test='<%= !cmd.equals("view_processes") %>'>
		<liferay-ui:section>
			<liferay-util:include page="/html/portlet/layouts_admin/new_publication.jsp" />
		</liferay-ui:section>
	</c:if>

	<liferay-ui:section>
		<div class="process-list" id="<portlet:namespace />publishProcesses">
			<liferay-util:include page="/html/portlet/layouts_admin/publish_layouts_processes.jsp">
				<liferay-util:param name="groupId" value="<%= String.valueOf(stagingGroupId) %>" />
				<liferay-util:param name="liveGroupId" value="<%= String.valueOf(liveGroupId) %>" />
				<liferay-util:param name="closeRedirect" value="<%= closeRedirect %>" />
				<liferay-util:param name="localPublishing" value="<%= String.valueOf(localPublishing) %>" />
			</liferay-util:include>
		</div>
	</liferay-ui:section>

	<c:if test='<%= !cmd.equals("view_processes") %>'>
		<liferay-ui:section>

			<%
			long targetGroupId = liveGroupId;

			if (cmd.equals("copy_from_live")) {
				targetGroupId = stagingGroupId;
			}
			%>

			<liferay-util:include page="/html/portlet/layouts_admin/scheduled_publishing_events.jsp">
				<liferay-util:param name="groupId" value="<%= String.valueOf(targetGroupId) %>" />
				<liferay-util:param name="privateLayout" value="<%= String.valueOf(privateLayout) %>" />
				<liferay-util:param name="destinationName" value="<%= localPublishing ? DestinationNames.LAYOUTS_LOCAL_PUBLISHER : DestinationNames.LAYOUTS_REMOTE_PUBLISHER %>" />
			</liferay-util:include>
		</liferay-ui:section>
	</c:if>

</liferay-ui:tabs>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />publishPages',
		function() {
			var exportImport = Liferay.component('<portlet:namespace />ExportImportComponent');

			var dateChecker = exportImport.getDateRangeChecker();

			var validRange = dateChecker.validRange;

			if (validRange && confirm('<%= UnicodeLanguageUtil.get(pageContext, "are-you-sure-you-want-to-" + publishActionKey + "-these-pages") %>')) {
				var A = AUI();

				var allContentRadioChecked = A.one('#<portlet:namespace />allContent').attr('checked');

				if (allContentRadioChecked) {
					var selectedContents = A.one('#<portlet:namespace />selectContents');

					var checkedNodes = selectedContents.all('input[type=checkbox]');

					checkedNodes.each(
						function(item, index, collection) {
							if (!item.attr('checked')) {
								item.attr('checked', true);

								Liferay.Util.updateCheckboxValue(item);
							}
						}
					);

					var portletDataControlDefault = A.one('#<portlet:namespace /><%= PortletDataHandlerKeys.PORTLET_DATA_CONTROL_DEFAULT %>');

					portletDataControlDefault.val(true);
				}

				submitForm(document.<portlet:namespace />exportPagesFm);
			}
			else if (!validRange) {
				exportImport.showNotification(dateChecker);
			}
		},
		['aui-base']
	);

	Liferay.Util.toggleRadio('<portlet:namespace />allApplications', '<portlet:namespace />showChangeGlobalConfiguration', ['<portlet:namespace />selectApplications']);
	Liferay.Util.toggleRadio('<portlet:namespace />allContent', '<portlet:namespace />showChangeGlobalContent', ['<portlet:namespace />selectContents']);
	Liferay.Util.toggleRadio('<portlet:namespace />chooseApplications', '<portlet:namespace />selectApplications', ['<portlet:namespace />showChangeGlobalConfiguration']);
	Liferay.Util.toggleRadio('<portlet:namespace />chooseContent', '<portlet:namespace />selectContents', ['<portlet:namespace />showChangeGlobalContent']);
	Liferay.Util.toggleRadio('<portlet:namespace />publishingEventNow', '<portlet:namespace />publishButton', ['<portlet:namespace />selectSchedule', '<portlet:namespace />addButton']);
	Liferay.Util.toggleRadio('<portlet:namespace />publishingEventSchedule', ['<portlet:namespace />selectSchedule', '<portlet:namespace />addButton'], '<portlet:namespace />publishButton');
	Liferay.Util.toggleRadio('<portlet:namespace />rangeAll', '', ['<portlet:namespace />startEndDate', '<portlet:namespace />rangeLastInputs']);
	Liferay.Util.toggleRadio('<portlet:namespace />rangeDateRange', '<portlet:namespace />startEndDate', '<portlet:namespace />rangeLastInputs');
	Liferay.Util.toggleRadio('<portlet:namespace />rangeLastPublish', '', ['<portlet:namespace />startEndDate', '<portlet:namespace />rangeLastInputs']);
	Liferay.Util.toggleRadio('<portlet:namespace />rangeLast', '<portlet:namespace />rangeLastInputs', ['<portlet:namespace />startEndDate']);
</aui:script>

<aui:script use="liferay-export-import">
	<liferay-portlet:resourceURL copyCurrentRenderParameters="<%= false %>" var="publishProcessesURL">
		<portlet:param name="struts_action" value="/layouts_admin/publish_layouts" />
		<portlet:param name="<%= SearchContainer.DEFAULT_CUR_PARAM %>" value="<%= ParamUtil.getString(request, SearchContainer.DEFAULT_CUR_PARAM) %>" />
		<portlet:param name="<%= SearchContainer.DEFAULT_DELTA_PARAM %>" value="<%= ParamUtil.getString(request, SearchContainer.DEFAULT_DELTA_PARAM) %>" />
		<portlet:param name="closeRedirect" value="<%= closeRedirect %>" />
		<portlet:param name="groupId" value="<%= String.valueOf(stagingGroupId) %>" />
		<portlet:param name="liveGroupId" value="<%= String.valueOf(liveGroupId) %>" />
		<portlet:param name="localPublishing" value="<%= String.valueOf(localPublishing) %>" />
	</liferay-portlet:resourceURL>

	var exportImport = new Liferay.ExportImport(
		{
			commentsNode: '#<%= PortletDataHandlerKeys.COMMENTS %>Checkbox',
			deleteMissingLayoutsNode: '#<%= PortletDataHandlerKeys.DELETE_MISSING_LAYOUTS %>Checkbox',
			deletePortletDataNode: '#<%= PortletDataHandlerKeys.DELETE_PORTLET_DATA %>Checkbox',
			deletionsNode: '#<%= PortletDataHandlerKeys.DELETIONS %>Checkbox',
			form: document.<portlet:namespace />exportPagesFm,
			incompleteProcessMessageNode: '#<portlet:namespace />incompleteProcessMessage',
			layoutSetSettingsNode: '#<%= PortletDataHandlerKeys.LAYOUT_SET_SETTINGS %>Checkbox',
			locale: '<%= LocaleUtil.toW3cLanguageId(locale) %>',
			logoNode: '#<%= PortletDataHandlerKeys.LOGO %>Checkbox',
			namespace: '<portlet:namespace />',
			pageTreeId: '<%= treeId %>',
			processesNode: '#publishProcesses',
			processesResourceURL: '<%= HtmlUtil.escapeJS(publishProcessesURL.toString()) %>',
			rangeAllNode: '#rangeAll',
			rangeDateRangeNode: '#rangeDateRange',
			rangeLastNode: '#rangeLast',
			rangeLastPublishNode: '#rangeLastPublish',
			ratingsNode: '#<%= PortletDataHandlerKeys.RATINGS %>Checkbox',
			remoteAddressNode: '#<portlet:namespace />remoteAddress',
			remoteDeletePortletDataNode: '#remoteDeletePortletDataCheckbox',
			remotePortNode: '#<portlet:namespace />remotePort',
			remotePathContextNode: '#<portlet:namespace />remotePathContext',
			remoteGroupIdNode: '#<portlet:namespace />remoteGroupId',
			secureConnectionNode: '#secureConnectionCheckbox',
			setupNode: '#<%= PortletDataHandlerKeys.PORTLET_SETUP_ALL %>Checkbox',
			themeReferenceNode: '#<%= PortletDataHandlerKeys.THEME_REFERENCE %>Checkbox',
			timeZone: '<%= timeZone.getID() %>',
			userPreferencesNode: '#<%= PortletDataHandlerKeys.PORTLET_USER_PREFERENCES_ALL %>Checkbox'
		}
	);

	Liferay.component('<portlet:namespace />ExportImportComponent', exportImport);
</aui:script>
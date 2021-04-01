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

Group group = (Group)row.getObject();

String groupId = String.valueOf(group.getGroupId());

PortletURL currentURLObj = PortletURLUtil.getCurrent(liferayPortletRequest, liferayPortletResponse);

String currentURL = currentURLObj.toString();
%>

<liferay-ui:icon-menu icon="<%= StringPool.BLANK %>" message="<%= StringPool.BLANK %>" showWhenSingleIcon="<%= true %>">
	<c:choose>
		<c:when test='<%= GetterUtil.getBoolean(group.getTypeSettingsProperty("syncEnabled"), !group.isCompany()) %>'>

			<%
			String editDefaultFilePermissionsDialogURL = "javascript:" + renderResponse.getNamespace() + "editDefaultFilePermissions(" + groupId + ");";
			%>

			<liferay-ui:icon
				iconCssClass="icon-lock"
				label="<%= true %>"
				message="default-file-permissions"
				url="<%= editDefaultFilePermissionsDialogURL %>"
			/>

			<portlet:actionURL name="updateSites" var="disableSiteURL">
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="enabled" value="false" />
				<portlet:param name="groupIds" value="<%= groupId %>" />
			</portlet:actionURL>

			<liferay-ui:icon-delete
				confirmation="disabling-a-sync-site-will-delete-all-associated-files-from-all-clients"
				label="<%= true %>"
				message="disable-sync-site"
				url="<%= disableSiteURL %>"
			/>
		</c:when>
		<c:otherwise>
			<portlet:actionURL name="updateSites" var="enableSiteURL">
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="enabled" value="true" />
				<portlet:param name="groupIds" value="<%= groupId %>" />
			</portlet:actionURL>

			<liferay-ui:icon
				iconCssClass="icon-ok-sign"
				label="<%= true %>"
				message="enable-sync-site"
				url="<%= enableSiteURL %>"
			/>
		</c:otherwise>
	</c:choose>
</liferay-ui:icon-menu>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />editDefaultFilePermissions',
		function(groupId) {
			var A = AUI();

			Liferay.Util.openWindow(
				{
					dialog: {
						destroyOnHide: true,
						on: {
							destroy: function() {
								Liferay.Portlet.refresh('#p_p_id<portlet:namespace />');
							}
						}
					},
					id: '<portlet:namespace />editDefaultFilePermissionsDialog',
					title: '<%= UnicodeLanguageUtil.get(pageContext, "default-file-permissions") %>',

					<portlet:renderURL var="editDefaultFilePermissionsURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
						<portlet:param name="groupId" value="{groupId}" />
						<portlet:param name="mvcPath" value="/edit_default_file_permissions.jsp" />
					</portlet:renderURL>

					uri: A.Lang.sub(
						decodeURIComponent('<%= editDefaultFilePermissionsURL %>'),
						{
							groupId: groupId
						}
					)
				}
			);
		},
		['liferay-util']
	);
</aui:script>
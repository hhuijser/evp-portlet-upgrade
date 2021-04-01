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
long groupId = ParamUtil.getLong(request, "groupId");

Group group = GroupLocalServiceUtil.fetchGroup(groupId);

int currentPermissions = GetterUtil.getInteger(group.getTypeSettingsProperty("syncSiteMemberFilePermissions"));
%>

<liferay-ui:header
	localizeTitle="<%= false %>"
	title="<%= group.getDescriptiveName() %>"
/>

<table class="table table-bordered table-hover table-striped">
	<thead class="table-columns">
		<tr>
			<th>
				<liferay-ui:message key="name" />
			</th>
			<th />
		</tr>
	</thead>

	<tbody>

		<%
		List<Integer> permissionsOptions = new ArrayList<Integer>(3);

		permissionsOptions.add(SyncPermissionsConstants.PERMISSIONS_VIEW_ONLY);
		permissionsOptions.add(SyncPermissionsConstants.PERMISSIONS_VIEW_AND_ADD_DISCUSSION);
		permissionsOptions.add(SyncPermissionsConstants.PERMISSIONS_VIEW_UPDATE_AND_ADD_DISCUSSION);
		permissionsOptions.add(SyncPermissionsConstants.PERMISSIONS_FULL_ACCESS);

		for (Integer permissions : permissionsOptions) {
		%>

			<tr class="record-row">
				<td>

					<%
					if (permissions == SyncPermissionsConstants.PERMISSIONS_FULL_ACCESS) {
						List<String> resourceActions = ListUtil.toList(SyncPermissionsConstants.getFileResourceActions(permissions));

						List<String> localizedResourceActions = new ArrayList<String>(resourceActions.size());

						for (String resourceAction : resourceActions) {
							localizedResourceActions.add(LanguageUtil.get(locale, ResourceActionsUtil.getActionNamePrefix() + resourceAction));
						}
					%>

						<liferay-ui:message arguments="<%= StringUtil.merge(localizedResourceActions, StringPool.COMMA_AND_SPACE) %>" key="full-access-x" />

						<liferay-ui:icon-help message="full-access-help" />

					<%
					}
					else if (permissions == SyncPermissionsConstants.PERMISSIONS_VIEW_AND_ADD_DISCUSSION) {
					%>

						<liferay-ui:message key="view-and-add-discussion" />

						<liferay-ui:icon-help message="view-and-add-discussion-help" />

					<%
					}
					else if (permissions == SyncPermissionsConstants.PERMISSIONS_VIEW_ONLY) {
					%>

						<liferay-ui:message key="view-only" />

						<liferay-ui:icon-help message="view-only-help" />

					<%
					}
					else if (permissions == SyncPermissionsConstants.PERMISSIONS_VIEW_UPDATE_AND_ADD_DISCUSSION) {
					%>

						<liferay-ui:message key="view-update-and-add-discussion" />

						<liferay-ui:icon-help message="view-update-and-add-discussion-help" />

					<%
					}
					%>

				</td>
				<td>
					<portlet:actionURL name="updateSites" var="setPermissionsURL">
						<portlet:param name="groupIds" value="<%= String.valueOf(groupId) %>" />
						<portlet:param name="permissions" value="<%= String.valueOf(permissions) %>" />
					</portlet:actionURL>

					<%
					String setPermissions = renderResponse.getNamespace() + "setPermissions('" + setPermissionsURL + "');";
					%>

					<aui:button disabled="<%= currentPermissions == permissions %>" onClick="<%= setPermissions %>" value="choose" />
				</td>
			</tr>

		<%
		}
		%>

	</tbody>
</table>

<aui:script use="aui-base,aui-io-request">
	Liferay.provide(
		window,
		'<portlet:namespace />setPermissions',
		function(uri) {
			A.io.request(
				uri,
				{
					method: 'post',
					on: {
						success: function() {
							Liferay.Util.getWindow('<portlet:namespace />editDefaultFilePermissionsDialog').destroy();
						}
					}
				}
			);
		},
		['liferay-util']
	);
</aui:script>
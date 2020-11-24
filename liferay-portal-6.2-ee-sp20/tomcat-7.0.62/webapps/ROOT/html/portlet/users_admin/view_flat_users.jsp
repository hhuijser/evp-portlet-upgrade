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

<%@ include file="/html/portlet/users_admin/init.jsp" %>

<%
String backURL = GetterUtil.getString(request.getAttribute("view.jsp-backURL"));
int inactiveUsersCount = GetterUtil.getInteger(request.getAttribute("view.jsp-inactiveUsersCount"));
boolean organizationContextView = GetterUtil.getBoolean(request.getAttribute("view.jsp-organizationContextView"));
long organizationGroupId = GetterUtil.getLong(request.getAttribute("view.jsp-organizationGroupId"));
int status = GetterUtil.getInteger(request.getAttribute("view.jsp-status"));
String toolbarItem = GetterUtil.getString(request.getAttribute("view.jsp-toolbarItem"));
int usersCount = GetterUtil.getInteger(request.getAttribute("view.jsp-usersCount"));
String usersListView = GetterUtil.getString(request.getAttribute("view.jsp-usersListView"));
String viewUsersRedirect = GetterUtil.getString(request.getAttribute("view.jsp-viewUsersRedirect"));
%>

<c:if test="<%= Validator.isNotNull(viewUsersRedirect) %>">
	<aui:input name="viewUsersRedirect" type="hidden" value="<%= viewUsersRedirect %>" />
</c:if>

<%
SearchContainer searchContainer = new UserSearch(renderRequest, "cur2", currentURLObj);

searchContainer.setRowChecker(new RowChecker(renderResponse));

if (!ParamUtil.getBoolean(renderRequest, "advancedSearch")) {
	currentURLObj.setParameter("status", String.valueOf(status));
}
%>

<liferay-ui:search-container
	searchContainer="<%= searchContainer %>"
	var="userSearchContainer"
>
	<aui:input disabled="<%= true %>" name="usersRedirect" type="hidden" value="<%= currentURLObj.toString() %>" />
	<aui:input name="deleteUserIds" type="hidden" />

	<%
	UserSearchTerms searchTerms = (UserSearchTerms)userSearchContainer.getSearchTerms();

	if ((searchTerms.getOrganizationId() > 0) && !OrganizationPermissionUtil.contains(permissionChecker, searchTerms.getOrganizationId(), ActionKeys.MANAGE_USERS)) {
		inactiveUsersCount = 0;

		status = WorkflowConstants.STATUS_APPROVED;
	}

	UserDisplayTerms displayTerms = (UserDisplayTerms)userSearchContainer.getDisplayTerms();

	if (!searchTerms.isAdvancedSearch()) {
		if (status == WorkflowConstants.STATUS_APPROVED) {
			displayTerms.setStatus(WorkflowConstants.STATUS_APPROVED);
			searchTerms.setStatus(WorkflowConstants.STATUS_APPROVED);
		}
		else {
			displayTerms.setStatus(WorkflowConstants.STATUS_INACTIVE);
			searchTerms.setStatus(WorkflowConstants.STATUS_INACTIVE);
		}
	}

	long userOrganizationId = searchTerms.getOrganizationId();
	long roleId = searchTerms.getRoleId();
	long userGroupId = searchTerms.getUserGroupId();

	Organization userOrganization = null;

	if (userOrganizationId > 0) {
		try {
			userOrganization = OrganizationLocalServiceUtil.getOrganization(userOrganizationId);

			userSearchContainer.setEmptyResultsMessage("this-organization-does-not-have-any-users");
		}
		catch (NoSuchOrganizationException nsoe) {
		}
	}

	Role role = null;

	if (roleId > 0) {
		try {
			role = RoleLocalServiceUtil.getRole(roleId);
		}
		catch (NoSuchRoleException nsre) {
		}
	}

	UserGroup userGroup = null;

	if (userGroupId > 0) {
		try {
			userGroup = UserGroupLocalServiceUtil.getUserGroup(userGroupId);
		}
		catch (NoSuchUserGroupException nsuge) {
		}
	}

	if (role != null) {
		PortalUtil.addPortletBreadcrumbEntry(request, role.getName(), null);
		PortalUtil.addPortletBreadcrumbEntry(request, LanguageUtil.get(pageContext, "all-users"), currentURL);
	}

	if (userGroup != null) {
		PortalUtil.addPortletBreadcrumbEntry(request, userGroup.getName(), null);
		PortalUtil.addPortletBreadcrumbEntry(request, LanguageUtil.get(pageContext, "all-users"), currentURL);
	}
	%>

	<c:if test="<%= usersListView.equals(UserConstants.LIST_VIEW_FLAT_USERS) && (role == null) && (userGroup == null) %>">

		<%
		if (userOrganization != null) {
			UsersAdminUtil.addPortletBreadcrumbEntries(userOrganization, request, renderResponse);

			PortalUtil.addPortletBreadcrumbEntry(request, LanguageUtil.get(pageContext, "all-users"), currentURL);
		}
		%>

		<c:if test="<%= layout.isTypeControlPanel() %>">
			<div id="breadcrumb">
				<liferay-ui:breadcrumb showCurrentGroup="<%= false %>" showCurrentPortlet="<%= false %>" showGuestGroup="<%= false %>" showLayout="<%= false %>" showPortletBreadcrumb="<%= true %>" />
			</div>
		</c:if>

		<aui:nav cssClass="nav-tabs">
			<portlet:renderURL var="viewUsersTreeURL">
				<portlet:param name="struts_action" value="/users_admin/view" />
				<portlet:param name="toolbarItem" value="browse" />
				<portlet:param name="usersListView" value="<%= UserConstants.LIST_VIEW_TREE %>" />
				<portlet:param name="saveUsersListView" value="<%= Boolean.TRUE.toString() %>" />
			</portlet:renderURL>

			<aui:nav-item href="<%= viewUsersTreeURL %>" label="browse" selected='<%= toolbarItem.equals("browse") %>' />

			<portlet:renderURL var="viewOrganizationsFlatURL">
				<portlet:param name="struts_action" value="/users_admin/view" />
				<portlet:param name="toolbarItem" value="view-all-organizations" />
				<portlet:param name="usersListView" value="<%= UserConstants.LIST_VIEW_FLAT_ORGANIZATIONS %>" />
				<portlet:param name="saveUsersListView" value="<%= Boolean.TRUE.toString() %>" />
			</portlet:renderURL>

			<aui:nav-item href="<%= viewOrganizationsFlatURL %>" label="all-organizations" selected='<%= toolbarItem.equals("view-all-organizations") %>' />

			<portlet:renderURL var="viewUsersFlatURL">
				<portlet:param name="struts_action" value="/users_admin/view" />
				<portlet:param name="toolbarItem" value="view-all-users" />
				<portlet:param name="usersListView" value="<%= UserConstants.LIST_VIEW_FLAT_USERS %>" />
				<portlet:param name="saveUsersListView" value="<%= Boolean.TRUE.toString() %>" />
			</portlet:renderURL>

			<aui:nav-item href="<%= viewUsersFlatURL %>" label="all-users" selected='<%= toolbarItem.equals("view-all-users") %>' />
		</aui:nav>

		<aui:nav-bar>
			<liferay-util:include page="/html/portlet/users_admin/toolbar.jsp" />

			<c:if test="<%= userOrganization == null %>">
				<aui:nav-bar-search cssClass="pull-right">
					<liferay-ui:search-form
						page="/html/portlet/users_admin/user_search.jsp"
					/>
				</aui:nav-bar-search>
			</c:if>
		</aui:nav-bar>
	</c:if>

	<c:if test="<%= userOrganization != null %>">
		<aui:input name="<%= UserDisplayTerms.ORGANIZATION_ID %>" type="hidden" value="<%= userOrganization.getOrganizationId() %>" />

		<c:if test="<%= usersListView.equals(UserConstants.LIST_VIEW_FLAT_USERS) %>">
			<liferay-ui:header
				backURL="<%= backURL %>"
				localizeTitle="<%= false %>"
				title="<%= userOrganization.getName() %>"
			/>
		</c:if>
	</c:if>

	<c:if test="<%= role != null %>">
		<aui:input name="<%= UserDisplayTerms.ROLE_ID %>" type="hidden" value="<%= role.getRoleId() %>" />

		<liferay-ui:header
			backURL="<%= backURL %>"
			localizeTitle="<%= false %>"
			title="<%= role.getTitle(locale) %>"
		/>
	</c:if>

	<c:if test="<%= userGroup != null %>">
		<aui:input name="<%= UserDisplayTerms.USER_GROUP_ID %>" type="hidden" value="<%= userGroup.getUserGroupId() %>" />

		<liferay-ui:header
			backURL="<%= backURL %>"
			localizeTitle="<%= false %>"
			title="<%= userGroup.getName() %>"
		/>
	</c:if>

	<%
	LinkedHashMap<String, Object> userParams = new LinkedHashMap<String, Object>();

	if (userOrganizationId > 0) {
		userParams.put("usersOrgs", new Long(userOrganizationId));
	}
	else if (usersListView.equals(UserConstants.LIST_VIEW_TREE) && Validator.isNull(searchTerms.getKeywords())) {
		userParams.put("noOrganizations", Boolean.TRUE);
		userParams.put("usersOrgsCount", 0);
	}
	else {
		if (filterManageableOrganizations && !UserPermissionUtil.contains(permissionChecker, ResourceConstants.PRIMKEY_DNE, ActionKeys.VIEW)) {
			Long[] organizationIds = UsersAdminUtil.getOrganizationIds(user.getOrganizations());

			userParams.put("usersOrgs", organizationIds);
		}
	}

	if (roleId > 0) {
		userParams.put("usersRoles", new Long(roleId));
	}

	if (userGroupId > 0) {
		userParams.put("usersUserGroups", new Long(userGroupId));
	}
	%>

	<liferay-ui:search-container-results>
		<c:choose>
			<c:when test="<%= PropsValues.USERS_INDEXER_ENABLED && PropsValues.USERS_SEARCH_WITH_INDEX %>">
				<%@ include file="/html/portlet/users_admin/user_search_results_index.jspf" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/html/portlet/users_admin/user_search_results_database.jspf" %>
			</c:otherwise>
		</c:choose>
	</liferay-ui:search-container-results>

	<liferay-ui:search-container-row
		className="com.liferay.portal.model.User"
		escapedModel="<%= true %>"
		keyProperty="userId"
		modelVar="user2"
		rowIdProperty="screenName"
	>
		<liferay-portlet:renderURL varImpl="rowURL">
			<portlet:param name="struts_action" value="/users_admin/edit_user" />
			<portlet:param name="redirect" value="<%= userSearchContainer.getIteratorURL().toString() %>" />
			<portlet:param name="p_u_i_d" value="<%= String.valueOf(user2.getUserId()) %>" />
		</liferay-portlet:renderURL>

		<%
		if (!UserPermissionUtil.contains(permissionChecker, user2.getUserId(), ActionKeys.UPDATE)) {
			rowURL = null;
		}
		%>

		<%@ include file="/html/portlet/users_admin/user/search_columns.jspf" %>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/html/portlet/users_admin/user_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<%
	boolean showDeleteButton = !results.isEmpty() && (searchTerms.getStatus() != WorkflowConstants.STATUS_ANY) && (searchTerms.isActive() || (!searchTerms.isActive() && PropsValues.USERS_DELETE));
	boolean showRestoreButton = !results.isEmpty() && (searchTerms.getStatus() != WorkflowConstants.STATUS_ANY) && !searchTerms.isActive();
	%>

	<c:if test="<%= showDeleteButton || showRestoreButton %>">
		<c:if test="<%= (usersListView.equals(UserConstants.LIST_VIEW_FLAT_USERS)) && (userOrganization == null) %>">
			<div class="separator"><!-- --></div>
		</c:if>

		<div class="control-group user-table">
			<c:if test="<%= showDeleteButton %>">

				<%
				String taglibOnClick = renderResponse.getNamespace() + "deleteUsers('" + (searchTerms.isActive() ? Constants.DEACTIVATE : Constants.DELETE) + "');";
				%>

				<aui:button disabled="<%= true %>" name="deactivate" onClick="<%= taglibOnClick %>" value="<%= searchTerms.isActive() ? Constants.DEACTIVATE : Constants.DELETE %>" />
			</c:if>

			<c:if test="<%= showRestoreButton %>">

				<%
				String taglibOnClick = renderResponse.getNamespace() + "deleteUsers('" + Constants.RESTORE + "');";
				%>

				<aui:button disabled="<%= true %>" name="restore" onClick="<%= taglibOnClick %>" value="restore" />
			</c:if>

			<c:if test="<%= (inactiveUsersCount > 0) && (usersCount > 0) %>">
				<div class="pull-right user-status-selector">
					<aui:select changesContext="<%= true %>" inlineLabel="left" label="show" name="userStatusSelect" onChange='<%= renderResponse.getNamespace() + "showUsers(this);" %>'>
						<aui:option label="active" selected="<%= status == WorkflowConstants.STATUS_APPROVED %>" value="<%= WorkflowConstants.STATUS_APPROVED %>" />
						<aui:option label="inactive" selected="<%= status == WorkflowConstants.STATUS_INACTIVE %>" value="<%= WorkflowConstants.STATUS_INACTIVE %>" />
					</aui:select>
				</div>
			</c:if>
		</div>
	</c:if>

	<%
	if (!showDeleteButton && !showRestoreButton) {
		userSearchContainer.setRowChecker(null);
	}
	%>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	Liferay.Util.toggleSearchContainerButton('#<portlet:namespace />deactivate', '#<portlet:namespace /><%= searchContainerReference.getId("userSearchContainer") %>SearchContainer', document.<portlet:namespace />fm, '<portlet:namespace />allRowIds');
	Liferay.Util.toggleSearchContainerButton('#<portlet:namespace />restore', '#<portlet:namespace /><%= searchContainerReference.getId("userSearchContainer") %>SearchContainer', document.<portlet:namespace />fm, '<portlet:namespace />allRowIds');
</aui:script>
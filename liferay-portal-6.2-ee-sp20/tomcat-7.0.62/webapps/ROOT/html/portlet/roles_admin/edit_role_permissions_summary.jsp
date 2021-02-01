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

<%@ include file="/html/portlet/roles_admin/init.jsp" %>

<h3><liferay-ui:message key="summary" /></h3>

<%
String redirect = ParamUtil.getString(request, "redirect");

String backURL = ParamUtil.getString(request, "backURL", redirect);

Role role = (Role)request.getAttribute("edit_role_permissions.jsp-role");

PortletURL permissionsAllURL = liferayPortletResponse.createRenderURL();

permissionsAllURL.setParameter("struts_action", "/roles_admin/edit_role_permissions");
permissionsAllURL.setParameter(Constants.CMD, Constants.VIEW);
permissionsAllURL.setParameter("tabs1", "roles");
permissionsAllURL.setParameter("backURL", backURL);
permissionsAllURL.setParameter("roleId", String.valueOf(role.getRoleId()));

List<String> headerNames = new ArrayList<String>();

headerNames.add("permissions");

if (role.getType() == RoleConstants.TYPE_REGULAR) {
	headerNames.add("sites");
}

headerNames.add(StringPool.BLANK);

SearchContainer searchContainer = new SearchContainer(liferayPortletRequest, null, null, SearchContainer.DEFAULT_CUR_PARAM, 50, permissionsAllURL, headerNames, "this-role-does-not-have-any-permissions");

List<Permission> permissions = PermissionConverterUtil.convertPermissions(role);

List<PermissionDisplay> permissionDisplays = new ArrayList<PermissionDisplay>(permissions.size());

for (int i = 0; i < permissions.size(); i++) {
	Permission permission = permissions.get(i);

	Resource resource = new ResourceImpl();

	resource.setCompanyId(themeDisplay.getCompanyId());
	resource.setName(permission.getName());
	resource.setScope(permission.getScope());
	resource.setPrimKey(permission.getPrimKey());

	String curPortletName = null;
	String curPortletLabel = null;
	String curModelName = null;
	String curModelLabel = null;
	String actionId = permission.getActionId();

	String actionLabel = _getActionLabel(pageContext, themeDisplay, resource.getName(), actionId);

	if (PortletLocalServiceUtil.hasPortlet(company.getCompanyId(), resource.getName())) {
		curPortletName = resource.getName();
		curModelName = StringPool.BLANK;
		curModelLabel = StringPool.BLANK;
	}
	else {
		curModelName = resource.getName();
		curModelLabel = ResourceActionsUtil.getModelResource(pageContext, curModelName);

		List portletResources = ResourceActionsUtil.getModelPortletResources(curModelName);

		if (!portletResources.isEmpty()) {
			curPortletName = (String)portletResources.get(0);
		}
	}

	if (curPortletName == null) {
		continue;
	}

	Portlet portlet = PortletLocalServiceUtil.getPortletById(company.getCompanyId(), curPortletName);

	curPortletLabel = PortalUtil.getPortletLongTitle(portlet, application, locale);

	PermissionDisplay permissionDisplay = new PermissionDisplay(permission, resource, curPortletName, curPortletLabel, curModelName, curModelLabel, actionId, actionLabel);

	if (!permissionDisplays.contains(permissionDisplay)) {
		permissionDisplays.add(permissionDisplay);
	}
}

permissionDisplays = ListUtil.sort(permissionDisplays);

searchContainer.setTotal(permissionDisplays.size());

List results = ListUtil.subList(permissionDisplays, searchContainer.getStart(), searchContainer.getEnd());

searchContainer.setResults(results);

List resultRows = searchContainer.getResultRows();

for (int i = 0; i < results.size(); i++) {
	PermissionDisplay permissionDisplay = (PermissionDisplay)results.get(i);

	Permission permission = permissionDisplay.getPermission();
	Resource resource = permissionDisplay.getResource();

	String curResource = resource.getName();
	String curPortletName = permissionDisplay.getPortletName();
	String curPortletLabel = permissionDisplay.getPortletLabel();
	String curModelLabel = permissionDisplay.getModelLabel();
	String actionId = permissionDisplay.getActionId();
	String actionLabel = permissionDisplay.getActionLabel();

	ResultRow row = new ResultRow(new Object[] {permission, role}, actionId, i);

	List groups = Collections.emptyList();

	int scope;

	if (role.getType() == RoleConstants.TYPE_REGULAR) {
		LinkedHashMap<String, Object> groupParams = new LinkedHashMap<String, Object>();

		List rolePermissions = new ArrayList();

		rolePermissions.add(curResource);
		rolePermissions.add(Integer.valueOf(ResourceConstants.SCOPE_GROUP));
		rolePermissions.add(actionId);
		rolePermissions.add(Long.valueOf(role.getRoleId()));

		groupParams.put("rolePermissions", rolePermissions);

		groups = GroupLocalServiceUtil.search(company.getCompanyId(), new long[] {PortalUtil.getClassNameId(Company.class), PortalUtil.getClassNameId(Group.class), PortalUtil.getClassNameId(Organization.class), PortalUtil.getClassNameId(UserPersonalSite.class)}, null, null, groupParams, true, QueryUtil.ALL_POS, QueryUtil.ALL_POS);

		if (groups.isEmpty()) {
			scope = ResourceConstants.SCOPE_COMPANY;
		}
		else {
			scope = ResourceConstants.SCOPE_GROUP;
		}
	}
	else {
		scope = ResourceConstants.SCOPE_GROUP_TEMPLATE;
	}

	boolean selected = false;

	if (ResourceBlockLocalServiceUtil.isSupported(curResource)) {
		selected = ResourceTypePermissionLocalServiceUtil.hasEitherScopePermission(company.getCompanyId(), curResource, role.getRoleId(), actionId);
	}
	else {
		selected = ResourcePermissionLocalServiceUtil.hasScopeResourcePermission(company.getCompanyId(), curResource, scope, role.getRoleId(), actionId);
	}

	if (!selected) {
		continue;
	}

	ResourceURL editPermissionsURL = liferayPortletResponse.createResourceURL();

	editPermissionsURL.setParameter("struts_action", "/roles_admin/edit_role_permissions");
	editPermissionsURL.setParameter(Constants.CMD, Constants.EDIT);
	editPermissionsURL.setParameter("tabs1", "roles");
	editPermissionsURL.setParameter("roleId", String.valueOf(role.getRoleId()));
	editPermissionsURL.setParameter("redirect", permissionsAllURL.toString());
	editPermissionsURL.setParameter("portletResource", curPortletName);

	StringBundler sb = new StringBundler();

	sb.append("<a class=\"permission-navigation-link\" href=\"");
	sb.append(editPermissionsURL);
	sb.append(StringPool.POUND);
	sb.append(_getResourceHtmlId(curResource));
	sb.append("\">");
	sb.append(curPortletLabel);

	if (Validator.isNotNull(curModelLabel)) {
		sb.append(StringPool.SPACE);
		sb.append(StringPool.GREATER_THAN);
		sb.append(StringPool.SPACE);
		sb.append(curModelLabel);
	}

	sb.append("</a>: <strong>");
	sb.append(actionLabel);
	sb.append("</strong>");

	row.addText(sb.toString());

	if (scope == ResourceConstants.SCOPE_COMPANY) {
		row.addText(LanguageUtil.get(pageContext, _isShowScope(role, curResource, curPortletName)? "all-sites" : StringPool.BLANK));
	}
	else if (scope == ResourceConstants.SCOPE_GROUP_TEMPLATE) {
	}
	else if (scope == ResourceConstants.SCOPE_GROUP) {
		sb = new StringBundler(groups.size() * 3 - 2);

		for (int j = 0; j < groups.size(); j++) {
			Group group = (Group)groups.get(j);

			sb.append(HtmlUtil.escape(group.getDescriptiveName(locale)));

			if (j < (groups.size() - 1)) {
				sb.append(StringPool.COMMA);
				sb.append(StringPool.SPACE);
			}
		}

		row.addText(sb.toString());
	}

	// Action

	row.addJSP("right", SearchEntry.DEFAULT_VALIGN, "/html/portlet/roles_admin/permission_action.jsp");

	resultRows.add(row);
}
%>

<liferay-ui:search-iterator searchContainer="<%= searchContainer %>" />
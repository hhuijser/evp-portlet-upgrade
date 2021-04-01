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

<%@ include file="/html/portlet/portlet_configuration/init.jsp" %>

<%
String tabs2 = ParamUtil.getString(request, "tabs2", "regular-roles");

int cur = ParamUtil.getInteger(request, SearchContainer.DEFAULT_CUR_PARAM);
int delta = ParamUtil.getInteger(request, SearchContainer.DEFAULT_DELTA_PARAM);

String redirect = ParamUtil.getString(request, "redirect");
String returnToFullPageURL = ParamUtil.getString(request, "returnToFullPageURL");

String modelResource = ParamUtil.getString(request, "modelResource");
String modelResourceDescription = ParamUtil.getString(request, "modelResourceDescription");

long resourceGroupId = ParamUtil.getLong(request, "resourceGroupId");

String resourcePrimKey = ParamUtil.getString(request, "resourcePrimKey");

if (Validator.isNull(resourcePrimKey)) {
	throw new ResourcePrimKeyException();
}

String keywords = ParamUtil.getString(request, "keywords");

String[] keywordsArray = ParamUtil.getParameterValues(request, "keywords");

if ((keywordsArray != null) && (keywordsArray.length > 1)) {
	keywords = keywordsArray[1];
}

String selResource = modelResource;
String selResourceDescription = modelResourceDescription;

if (Validator.isNull(modelResource)) {
	PortletURL portletURL = new PortletURLImpl(request, portletResource, plid, PortletRequest.ACTION_PHASE);

	portletURL.setPortletMode(PortletMode.VIEW);
	portletURL.setWindowState(WindowState.NORMAL);

	redirect = portletURL.toString();

	Portlet portlet = PortletLocalServiceUtil.getPortletById(company.getCompanyId(), portletResource);

	selResource = portlet.getRootPortletId();
	selResourceDescription = PortalUtil.getPortletTitle(portlet, application, locale);
}
else {
	PortalUtil.addPortletBreadcrumbEntry(request, HtmlUtil.unescape(selResourceDescription), null);
	PortalUtil.addPortletBreadcrumbEntry(request, LanguageUtil.get(pageContext, "permissions"), currentURL);
}

long groupId = themeDisplay.getScopeGroupId();

if (resourceGroupId > 0) {
	groupId = resourceGroupId;
}

Group group = GroupLocalServiceUtil.getGroup(groupId);

Layout selLayout = null;

if (modelResource.equals(Layout.class.getName())) {
	selLayout = LayoutLocalServiceUtil.getLayout(GetterUtil.getLong(resourcePrimKey));

	group = selLayout.getGroup();
	groupId = group.getGroupId();
}

Resource resource = null;

try {
	if (ResourceBlockLocalServiceUtil.isSupported(selResource)) {
		ResourceBlockLocalServiceUtil.verifyResourceBlockId(company.getCompanyId(), selResource, Long.valueOf(resourcePrimKey));
	}
	else {
		if (ResourcePermissionLocalServiceUtil.getResourcePermissionsCount(company.getCompanyId(), selResource, ResourceConstants.SCOPE_INDIVIDUAL, resourcePrimKey) == 0) {
			throw new NoSuchResourceException();
		}
	}
	resource = ResourceLocalServiceUtil.getResource(company.getCompanyId(), selResource, ResourceConstants.SCOPE_INDIVIDUAL, resourcePrimKey);
}
catch (NoSuchResourceException nsre) {
	boolean portletActions = Validator.isNull(modelResource);

	ResourceLocalServiceUtil.addResources(company.getCompanyId(), groupId, 0, selResource, resourcePrimKey, portletActions, true, true);

	resource = ResourceLocalServiceUtil.getResource(company.getCompanyId(), selResource, ResourceConstants.SCOPE_INDIVIDUAL, resourcePrimKey);
}

String roleTypesParam = ParamUtil.getString(request, "roleTypes");

int[] roleTypes = null;

if (Validator.isNotNull(roleTypesParam)) {
	roleTypes = StringUtil.split(roleTypesParam, 0);
}

PortletURL actionPortletURL = renderResponse.createActionURL();

actionPortletURL.setParameter("struts_action", "/portlet_configuration/edit_permissions");
actionPortletURL.setParameter("tabs2", tabs2);
actionPortletURL.setParameter("cur", String.valueOf(cur));
actionPortletURL.setParameter("delta", String.valueOf(delta));
actionPortletURL.setParameter("redirect", redirect);
actionPortletURL.setParameter("returnToFullPageURL", returnToFullPageURL);
actionPortletURL.setParameter("portletResource", portletResource);
actionPortletURL.setParameter("modelResource", modelResource);
actionPortletURL.setParameter("modelResourceDescription", modelResourceDescription);
actionPortletURL.setParameter("resourceGroupId", String.valueOf(resourceGroupId));
actionPortletURL.setParameter("resourcePrimKey", resourcePrimKey);
actionPortletURL.setParameter("roleTypes", roleTypesParam);

PortletURL renderPortletURL = renderResponse.createRenderURL();

renderPortletURL.setParameter("struts_action", "/portlet_configuration/edit_permissions");
renderPortletURL.setParameter("tabs2", tabs2);
renderPortletURL.setParameter("redirect", redirect);
renderPortletURL.setParameter("returnToFullPageURL", returnToFullPageURL);
renderPortletURL.setParameter("portletResource", portletResource);
renderPortletURL.setParameter("modelResource", modelResource);
renderPortletURL.setParameter("modelResourceDescription", modelResourceDescription);
renderPortletURL.setParameter("resourceGroupId", String.valueOf(resourceGroupId));
renderPortletURL.setParameter("resourcePrimKey", resourcePrimKey);
renderPortletURL.setParameter("roleTypes", roleTypesParam);

long controlPanelPlid = PortalUtil.getControlPanelPlid(company.getCompanyId());

PortletURLImpl definePermissionsURL = new PortletURLImpl(request, PortletKeys.ROLES_ADMIN, controlPanelPlid, PortletRequest.RENDER_PHASE);

definePermissionsURL.setParameter("struts_action", "/roles_admin/edit_role_permissions");
definePermissionsURL.setParameter(Constants.CMD, Constants.VIEW);
definePermissionsURL.setPortletMode(PortletMode.VIEW);
definePermissionsURL.setRefererPlid(plid);
definePermissionsURL.setWindowState(LiferayWindowState.POP_UP);

PortletURL iteratorURL = renderResponse.createActionURL();

iteratorURL.setParameter("struts_action", "/portlet_configuration/view_permissions");
iteratorURL.setParameter("tabs2", tabs2);
iteratorURL.setParameter("cur", String.valueOf(cur));
iteratorURL.setParameter("delta", String.valueOf(delta));
iteratorURL.setParameter("redirect", redirect);
iteratorURL.setParameter("returnToFullPageURL", returnToFullPageURL);
iteratorURL.setParameter("portletResource", portletResource);
iteratorURL.setParameter("modelResource", modelResource);
iteratorURL.setParameter("modelResourceDescription", modelResourceDescription);
iteratorURL.setParameter("resourceGroupId", String.valueOf(resourceGroupId));
iteratorURL.setParameter("resourcePrimKey", resourcePrimKey);
iteratorURL.setParameter("roleTypes", roleTypesParam);
%>

<div class="edit-permissions">
	<c:choose>
		<c:when test="<%= Validator.isNull(modelResource) %>">
			<liferay-util:include page="/html/portlet/portlet_configuration/tabs1.jsp">
				<liferay-util:param name="tabs1" value="permissions" />
			</liferay-util:include>
		</c:when>
		<c:otherwise>
			<liferay-ui:header
					backURL="<%= redirect %>"
					localizeTitle="<%= false %>"
					title="<%= HtmlUtil.unescape(selResourceDescription) %>"
					/>
		</c:otherwise>
	</c:choose>

	<%
	boolean filterGroupRoles = !ResourceActionsUtil.isPortalModelResource(modelResource);

	List<String> actions = ResourceActionsUtil.getResourceActions(portletResource, modelResource);

	if (modelResource.equals(Group.class.getName())) {
		long modelResourceGroupId = GetterUtil.getLong(resourcePrimKey);

		Group modelResourceGroup = GroupLocalServiceUtil.getGroup(modelResourceGroupId);

		if (modelResourceGroup.isLayoutPrototype() || modelResourceGroup.isLayoutSetPrototype() || modelResourceGroup.isUserGroup()) {
			actions = new ArrayList<String>(actions);

			actions.remove(ActionKeys.ADD_LAYOUT_BRANCH);
			actions.remove(ActionKeys.ADD_LAYOUT_SET_BRANCH);
			actions.remove(ActionKeys.ASSIGN_MEMBERS);
			actions.remove(ActionKeys.ASSIGN_USER_ROLES);
			actions.remove(ActionKeys.MANAGE_ANNOUNCEMENTS);
			actions.remove(ActionKeys.MANAGE_STAGING);
			actions.remove(ActionKeys.MANAGE_TEAMS);
			actions.remove(ActionKeys.PUBLISH_STAGING);
			actions.remove(ActionKeys.PUBLISH_TO_REMOTE);
			actions.remove(ActionKeys.VIEW_MEMBERS);
			actions.remove(ActionKeys.VIEW_STAGING);
		}
	}
	else if (modelResource.equals(Role.class.getName())) {
		long modelResourceRoleId = GetterUtil.getLong(resourcePrimKey);

		Role modelResourceRole = RoleLocalServiceUtil.getRole(modelResourceRoleId);

		String name = modelResourceRole.getName();

		if (name.equals(RoleConstants.GUEST) || name.equals(RoleConstants.USER)) {
			actions = new ArrayList<String>(actions);

			actions.remove(ActionKeys.ASSIGN_MEMBERS);
			actions.remove(ActionKeys.DEFINE_PERMISSIONS);
			actions.remove(ActionKeys.DELETE);
			actions.remove(ActionKeys.PERMISSIONS);
			actions.remove(ActionKeys.UPDATE);
			actions.remove(ActionKeys.VIEW);
		}

		if ((modelResourceRole.getType() == RoleConstants.TYPE_ORGANIZATION) || (modelResourceRole.getType() == RoleConstants.TYPE_SITE)) {
			filterGroupRoles = true;
		}
	}

	if (roleTypes == null) {
		roleTypes = RoleConstants.TYPES_REGULAR_AND_SITE;

		if (ResourceActionsUtil.isPortalModelResource(modelResource)) {
			if (modelResource.equals(Organization.class.getName()) ||
				modelResource.equals(User.class.getName())) {

				roleTypes = RoleConstants.TYPES_ORGANIZATION_AND_REGULAR;
			}
			else {
				roleTypes = RoleConstants.TYPES_REGULAR;
			}
		}
		else {
			if (group != null) {
				Group parentGroup = null;

				if (group.isLayout()) {
					parentGroup = GroupLocalServiceUtil.fetchGroup(
						group.getParentGroupId());
				}

				if (parentGroup == null) {
					if (group.isOrganization()) {
						roleTypes = RoleConstants.TYPES_ORGANIZATION_AND_REGULAR_AND_SITE;
					}
					else if (group.isUser()) {
						roleTypes = RoleConstants.TYPES_REGULAR;
					}
				}
				else {
					if (parentGroup.isOrganization()) {
						roleTypes = RoleConstants.TYPES_ORGANIZATION_AND_REGULAR_AND_SITE;
					}
					else if (parentGroup.isUser()) {
						roleTypes = RoleConstants.TYPES_REGULAR;
					}
				}
			}
		}
	}

	long modelResourceRoleId = 0;

	if (modelResource.equals(Role.class.getName())) {
		modelResourceRoleId = GetterUtil.getLong(resourcePrimKey);
	}

	boolean filterGuestRole = false;

	if (modelResource.equals(Layout.class.getName())) {
		Layout resourceLayout = LayoutLocalServiceUtil.getLayout(GetterUtil.getLong(resourcePrimKey));

		if (resourceLayout.isPrivateLayout()) {
			Group resourceLayoutGroup = resourceLayout.getGroup();

			if (!resourceLayoutGroup.isLayoutSetPrototype()) {
				filterGuestRole = true;
			}
		}
	}
	else if (Validator.isNotNull(portletResource)) {
		int pos = resourcePrimKey.indexOf(PortletConstants.LAYOUT_SEPARATOR);

		if (pos > 0) {
			long resourcePlid = GetterUtil.getLong(resourcePrimKey.substring(0, pos));

			Layout resourceLayout = LayoutLocalServiceUtil.getLayout(resourcePlid);

			if (resourceLayout.isPrivateLayout()) {
				Group resourceLayoutGroup = resourceLayout.getGroup();

				if (!resourceLayoutGroup.isLayoutPrototype() && !resourceLayoutGroup.isLayoutSetPrototype()) {
					filterGuestRole = true;
				}
			}
		}
	}

	List<String> excludedRoleNames = new ArrayList<String>();

	excludedRoleNames.add(RoleConstants.ADMINISTRATOR);

	if (filterGroupRoles) {
		excludedRoleNames.add(RoleConstants.ORGANIZATION_ADMINISTRATOR);

		excludedRoleNames.add(RoleConstants.ORGANIZATION_OWNER);

		excludedRoleNames.add(RoleConstants.SITE_ADMINISTRATOR);

		excludedRoleNames.add(RoleConstants.SITE_OWNER);
	}

	if (filterGuestRole) {
		excludedRoleNames.add(RoleConstants.GUEST);
	}

	long teamGroupId = group.getGroupId();

	if (group.isLayout()) {
		teamGroupId = group.getParentGroupId();
	}
	%>

	<liferay-ui:search-container
		iteratorURL="<%= currentURLObj %>"
		total="<%= RoleLocalServiceUtil.getGroupRolesAndTeamRolesCount(company.getCompanyId(), keywords, excludedRoleNames, roleTypes, modelResourceRoleId, teamGroupId) %>"
	>
		<aui:form action="<%= iteratorURL.toString() %>" method="post" name="searchFm">
			<liferay-ui:search-form
				page="/html/portlet/roles_admin/role_search.jsp"
			/>
		</aui:form>

		<aui:form action="<%= actionPortletURL.toString() %>" method="post" name="fm">
			<aui:input name="<%= Constants.CMD %>" type="hidden" value="role_permissions" />
			<aui:input name="resourceId" type="hidden" value="<%= resource.getResourceId() %>" />

			<liferay-ui:search-container-results
				results="<%= RoleLocalServiceUtil.getGroupRolesAndTeamRoles(company.getCompanyId(), keywords, excludedRoleNames, roleTypes, modelResourceRoleId, teamGroupId, searchContainer.getStart(), searchContainer.getResultEnd()) %>"
			/>

			<liferay-ui:search-container-row
				className="com.liferay.portal.model.Role"
				escapedModel="<%= true %>"
				keyProperty="roleId"
				modelVar="role"
			>
				<liferay-util:param name="className" value="<%= RolesAdminUtil.getCssClassName(role) %>" />
				<liferay-util:param name="classHoverName" value="<%= RolesAdminUtil.getCssClassName(role) %>" />

				<%
				String definePermissionsHREF = null;

				String name = role.getName();

				if (!name.equals(RoleConstants.ADMINISTRATOR) && !name.equals(RoleConstants.ORGANIZATION_ADMINISTRATOR) && !name.equals(RoleConstants.ORGANIZATION_OWNER) && !name.equals(RoleConstants.OWNER) && !name.equals(RoleConstants.SITE_ADMINISTRATOR) && !name.equals(RoleConstants.SITE_OWNER) && RolePermissionUtil.contains(permissionChecker, role.getRoleId(), ActionKeys.DEFINE_PERMISSIONS)) {
					definePermissionsURL.setParameter("roleId", String.valueOf(role.getRoleId()));

					definePermissionsHREF = definePermissionsURL.toString();
				}
				%>

				<liferay-ui:search-container-column-text
					href="<%= definePermissionsHREF %>"
					name="role"
					value="<%= role.getTitle(locale) %>"
				/>

				<%

				// Actions

				List<String> currentIndividualActions = new ArrayList<String>();
				List<String> currentGroupActions = new ArrayList<String>();
				List<String> currentGroupTemplateActions = new ArrayList<String>();
				List<String> currentCompanyActions = new ArrayList<String>();

				ResourcePermissionUtil.populateResourcePermissionActionIds(groupId, role, resource, actions, currentIndividualActions, currentGroupActions, currentGroupTemplateActions, currentCompanyActions);

				List<String> guestUnsupportedActions = ResourceActionsUtil.getResourceGuestUnsupportedActions(portletResource, modelResource);

				// LPS-32515

				if ((selLayout != null) && group.isGuest() && SitesUtil.isFirstLayout(selLayout.getGroupId(), selLayout.isPrivateLayout(), selLayout.getLayoutId())) {
					guestUnsupportedActions = new ArrayList<String>(guestUnsupportedActions);

					guestUnsupportedActions.add(ActionKeys.VIEW);
				}

				for (String action : actions) {
					boolean checked = false;
					boolean disabled = false;
					String preselectedMsg = StringPool.BLANK;

					if (currentIndividualActions.contains(action)) {
						checked = true;
					}

					if (currentGroupActions.contains(action) || currentGroupTemplateActions.contains(action)) {
						checked = true;
						preselectedMsg = "x-is-allowed-to-do-action-x-in-all-items-of-type-x-in-x";
					}

					if (currentCompanyActions.contains(action)) {
						checked = true;
						preselectedMsg = "x-is-allowed-to-do-action-x-in-all-items-of-type-x-in-this-portal-instance";
					}

					if (name.equals(RoleConstants.GUEST) && guestUnsupportedActions.contains(action)) {
						disabled = true;
					}

					if (action.equals(ActionKeys.ACCESS_IN_CONTROL_PANEL)) {
						disabled = true;
					}
				%>

					<liferay-ui:search-container-column-text
						buffer="buffer"
						name="<%= ResourceActionsUtil.getAction(pageContext, action) %>"
					>

						<%
						String actionSeparator = Validator.isNotNull(preselectedMsg) ? ActionUtil.PRESELECTED : ActionUtil.ACTION;

						if (checked && disabled) {
							buffer.append("<input ");

							buffer.append("name=\"");
							buffer.append(renderResponse.getNamespace());
							buffer.append(role.getRoleId());
							buffer.append(actionSeparator);
							buffer.append(action);
							buffer.append("\" ");

							buffer.append("type=\"hidden\" ");

							buffer.append("value=\"true\" />");
						}

						buffer.append("<input ");

						if (checked) {
							buffer.append("checked ");
						}

						if (disabled) {
							buffer.append("disabled ");
						}

						if (Validator.isNotNull(preselectedMsg)) {
							buffer.append("class=\"lfr-checkbox-preselected\" ");
						}

						buffer.append("id=\"");
						buffer.append(FriendlyURLNormalizerUtil.normalize(role.getName()));
						buffer.append(actionSeparator);
						buffer.append(action);
						buffer.append("\" ");

						buffer.append("name=\"");
						buffer.append(renderResponse.getNamespace());
						buffer.append(role.getRoleId());
						buffer.append(actionSeparator);
						buffer.append(action);
						buffer.append("\" ");

						if (Validator.isNotNull(preselectedMsg)) {
							buffer.append("onclick=\"return false;\" onmouseover=\"Liferay.Portal.ToolTip.show(this, '");
							buffer.append(UnicodeLanguageUtil.format(pageContext, preselectedMsg, new Object[] {role.getTitle(locale), ResourceActionsUtil.getAction(pageContext, action), Validator.isNull(modelResource) ? selResourceDescription : ResourceActionsUtil.getModelResource(locale, resource.getName()), HtmlUtil.escape(group.getDescriptiveName(locale))}, false));
							buffer.append("'); return false;\" ");
						}

						buffer.append("type=\"checkbox\" />");
						%>

					</liferay-ui:search-container-column-text>

				<%
				}
				%>

			</liferay-ui:search-container-row>

			<liferay-ui:search-iterator />

			<aui:button-row>
				<aui:button type="submit" />

				<aui:button type="cancel" />
			</aui:button-row>
		</aui:form>
	</liferay-ui:search-container>
</div>
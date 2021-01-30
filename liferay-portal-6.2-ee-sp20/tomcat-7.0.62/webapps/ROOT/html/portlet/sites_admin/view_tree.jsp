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

<%@ include file="/html/portlet/sites_admin/init.jsp" %>

<%
String toolbarItem = ParamUtil.getString(request, "toolbarItem", "browse");

long groupId = ParamUtil.getLong(request, "groupId", GroupConstants.DEFAULT_PARENT_GROUP_ID);

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("struts_action", "/sites_admin/view");
portletURL.setParameter("groupId", String.valueOf(groupId));
portletURL.setParameter("sitesListView", sitesListView);

Group group = null;

if (groupId > 0) {
	group = GroupServiceUtil.getGroup(groupId);
}

List<Group> groups = new ArrayList<Group>();

if (filterManageableGroups) {
	groups = user.getSiteGroups(true);
}

if (groupId != GroupConstants.DEFAULT_PARENT_GROUP_ID) {
	groups.clear();

	groups.add(GroupLocalServiceUtil.getGroup(groupId));
}

if (group != null) {
	SitesUtil.addPortletBreadcrumbEntries(group, request, renderResponse);
}
%>

<c:if test="<%= (group != null) %>">
	<c:if test="<%= layout.isTypeControlPanel() %>">
		<div id="breadcrumb">
			<liferay-ui:breadcrumb showCurrentGroup="<%= false %>" showCurrentPortlet="<%= false %>" showGuestGroup="<%= false %>" showLayout="<%= false %>" showPortletBreadcrumb="<%= true %>" />
		</div>
	</c:if>

	<%
	long parentGroupId = GroupConstants.DEFAULT_PARENT_GROUP_ID;
	String parentGroupName = LanguageUtil.get(pageContext, "sites-home");

	if (!group.isRoot()) {
		Group parentGroup = group.getParentGroup();

		if (GroupPermissionUtil.contains(permissionChecker, parentGroup, ActionKeys.VIEW)) {
			parentGroupId = parentGroup.getGroupId();
			parentGroupName = parentGroup.getDescriptiveName();
		}
	}
	%>

	<portlet:renderURL var="headerBackURL">
		<portlet:param name="struts_action" value="/sites_admin/view" />
		<portlet:param name="groupId" value="<%= String.valueOf(parentGroupId) %>" />
	</portlet:renderURL>

	<liferay-ui:header
		backLabel="<%= parentGroupName %>"
		backURL="<%= headerBackURL.toString() %>"
		localizeTitle="<%= false %>"
		title="<%= group.getDescriptiveName() %>"
	/>
</c:if>

<aui:row>
	<aui:col cssClass="lfr-asset-column lfr-asset-column-details" width="<%= (group != null) ? 75 : 100 %>">
		<c:if test="<%= group != null %>">
			<%@ include file="/html/portlet/sites_admin/view_site_info.jspf" %>

			<c:if test="<%= Validator.isNotNull(group.getDescription()) %>">
				<div class="description">
					<%= HtmlUtil.escape(group.getDescription()) %>
				</div>
			</c:if>

			<div class="site-categorization">
				<liferay-ui:asset-categories-summary
					className="<%= Group.class.getName() %>"
					classPK="<%= groupId %>"
				/>

				<liferay-ui:asset-tags-summary
					className="<%= Group.class.getName() %>"
					classPK="<%= groupId %>"
				/>
			</div>
		</c:if>

		<liferay-ui:search-container
			searchContainer="<%= new GroupSearch(renderRequest, portletURL) %>"
		>

			<%
			if (groupId != 0) {
				searchContainer.setEmptyResultsMessage(null);
			}

			searchContainer.setRowChecker(new SiteChecker(renderResponse));

			GroupSearchTerms searchTerms = (GroupSearchTerms)searchContainer.getSearchTerms();

			request.setAttribute("view_tree.jspf-searchTerms", searchTerms);
			%>

			<liferay-ui:search-container-results>

				<%
				long parentGroupId = _getParentGroupId(request, group, filterManageableGroups);

				if (group != null) {
					parentGroupId = group.getGroupId();
				}
				%>

				<c:choose>
					<c:when test="<%= !searchTerms.hasSearchTerms() && (parentGroupId <= 0) && (filterManageableGroups) %>">

						<%
						total = groups.size();

						searchContainer.setTotal(total);

						results = ListUtil.subList(groups, searchContainer.getStart(), searchContainer.getEnd());
						%>

					</c:when>
					<c:otherwise>

						<%
						LinkedHashMap<String, Object> groupParams = new LinkedHashMap<String, Object>();

						groupParams.put("site", Boolean.TRUE);
						//groupParams.put("active", Boolean.TRUE);

						if (searchTerms.hasSearchTerms()) {
							if (filterManageableGroups) {
								groupParams.put("groupsTree", groups);
							}
							else if (parentGroupId > 0) {
								List<Group> groupsTree = new ArrayList<Group>();

								Group parentGroup = GroupLocalServiceUtil.getGroup(parentGroupId);

								groupsTree.add(parentGroup);

								groupParams.put("groupsTree", groupsTree);
							}

							parentGroupId = GroupConstants.ANY_PARENT_GROUP_ID;
						}

						if (searchTerms.isAdvancedSearch()) {
							total = GroupLocalServiceUtil.searchCount(company.getCompanyId(), classNameIds, searchTerms.getName(), searchTerms.getDescription(), groupParams, searchTerms.isAndOperator());

							searchContainer.setTotal(total);

							results = GroupLocalServiceUtil.search(company.getCompanyId(), classNameIds, searchTerms.getName(), searchTerms.getDescription(), groupParams, searchTerms.isAndOperator(), searchContainer.getStart(), searchContainer.getEnd(), searchContainer.getOrderByComparator());
						}
						else {
							total = GroupLocalServiceUtil.searchCount(company.getCompanyId(), classNameIds, groupId, searchTerms.getKeywords(), groupParams);

							searchContainer.setTotal(total);

							results = GroupLocalServiceUtil.search(company.getCompanyId(), classNameIds, groupId, searchTerms.getKeywords(), groupParams, searchContainer.getStart(), searchContainer.getEnd(), searchContainer.getOrderByComparator());
						}
						%>

					</c:otherwise>
				</c:choose>

				<%
				searchContainer.setResults(results);
				%>

			</liferay-ui:search-container-results>

			<c:if test="<%= group == null %>">
				<%@ include file="/html/portlet/sites_admin/toolbar.jspf" %>
			</c:if>

			<c:if test="<%= !results.isEmpty() %>">
				<aui:button disabled="<%= true %>" name="delete" onClick='<%= renderResponse.getNamespace() + "deleteSites();" %>' value="delete" />
			</c:if>

			<liferay-ui:search-container-row
				className="com.liferay.portal.model.Group"
				escapedModel="<%= true %>"
				keyProperty="groupId"
				modelVar="curGroup"
				rowIdProperty="friendlyURL"
				rowVar="row"
			>

				<%
				String rowURL = null;

				ThemeDisplay siteThemeDisplay = (ThemeDisplay)themeDisplay.clone();

				siteThemeDisplay.setScopeGroupId(curGroup.getGroupId());

				PortletURL siteAdministrationURL = PortalUtil.getSiteAdministrationURL(renderResponse, siteThemeDisplay);

				if (siteAdministrationURL != null) {
					rowURL = siteAdministrationURL.toString();
				}
				%>

				<%@ include file="/html/portlet/sites_admin/site_columns.jspf" %>
			</liferay-ui:search-container-row>

			<liferay-ui:search-iterator />
		</liferay-ui:search-container>

		<aui:input disabled="<%= true %>" name="sitesRedirect" type="hidden" value="<%= portletURL.toString() %>" />
		<aui:input name="deleteGroupIds" type="hidden" />
	</aui:col>

	<c:if test="<%= group != null %>">

		<%
		LayoutSet layoutSet = group.getPublicLayoutSet();
		%>

		<aui:col cssClass="lfr-asset-column lfr-asset-column-actions" last="<%= true %>" width="<%= 25 %>">
			<div class="lfr-asset-summary">
				<img alt="<%= HtmlUtil.escape(group.getDescriptiveName()) %>" class="avatar" src="<%= themeDisplay.getPathImage() + "/layout_set_logo?img_id=" + layoutSet.getLogoId() + "&t=" + WebServerServletTokenUtil.getToken(layoutSet.getLogoId()) %>" />

				<div class="lfr-asset-name">
					<h4><%= HtmlUtil.escape(group.getDescriptiveName()) %></h4>
				</div>
			</div>

			<%
			request.removeAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

			request.setAttribute("view_tree.jspf-site", group);
			%>

			<liferay-util:include page="/html/portlet/sites_admin/site_action.jsp" />
		</aui:col>
	</c:if>
</aui:row>

<%!
private long _getParentGroupId(HttpServletRequest request, Group group, boolean filterManageableGroups) {
	if (group != null) {
		return group.getGroupId();
	}

	if (filterManageableGroups) {
		return GroupConstants.ANY_PARENT_GROUP_ID;
	}

	return GroupConstants.DEFAULT_PARENT_GROUP_ID;
}
%>
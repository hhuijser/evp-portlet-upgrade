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
%>

<liferay-ui:search-container
	rowChecker="<%= new SiteChecker(renderResponse) %>"
	searchContainer="<%= new GroupSearch(renderRequest, portletURL) %>"
>
	<aui:input disabled="<%= true %>" name="sitesRedirect" type="hidden" value="<%= portletURL.toString() %>" />
	<aui:input name="deleteGroupIds" type="hidden" />

	<%
	GroupSearchTerms searchTerms = (GroupSearchTerms)searchContainer.getSearchTerms();

	LinkedHashMap<String, Object> groupParams = new LinkedHashMap<String, Object>();

	groupParams.put("site", Boolean.TRUE);

	if (!permissionChecker.isCompanyAdmin() && !GroupPermissionUtil.contains(permissionChecker, ActionKeys.VIEW)) {
		groupParams.put("usersGroups", new Long(user.getUserId()));
		//groupParams.put("active", Boolean.TRUE);
	}
	%>

	<liferay-ui:search-container-results>

		<%
		if (searchTerms.isAdvancedSearch()) {
			total = GroupLocalServiceUtil.searchCount(company.getCompanyId(), classNameIds, searchTerms.getName(), searchTerms.getDescription(), groupParams, searchTerms.isAndOperator());

			searchContainer.setTotal(total);

			results = GroupLocalServiceUtil.search(company.getCompanyId(), classNameIds, searchTerms.getName(), searchTerms.getDescription(), groupParams, searchTerms.isAndOperator(), searchContainer.getStart(), searchContainer.getEnd(), searchContainer.getOrderByComparator());
		}
		else {
			total = GroupLocalServiceUtil.searchCount(company.getCompanyId(), classNameIds, searchTerms.getKeywords(), groupParams);

			searchContainer.setTotal(total);

			results = GroupLocalServiceUtil.search(company.getCompanyId(), classNameIds, searchTerms.getKeywords(), groupParams, searchContainer.getStart(), searchContainer.getEnd(), searchContainer.getOrderByComparator());
		}

		searchContainer.setResults(results);
		%>

	</liferay-ui:search-container-results>

	<%@ include file="/html/portlet/sites_admin/toolbar.jspf" %>

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
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

<%@ include file="/html/taglib/ui/sites_directory/init.jsp" %>

<c:if test="<%= layout != null %>">

	<%
	Group rootGroup = null;
	boolean hidden = false;

	List<Group> branchGroups = new ArrayList<Group>();

	branchGroups.add(group);
	branchGroups.addAll(group.getAncestors());

	if (sites.equals(SitesDirectoryTag.SITES_TOP_LEVEL)) {
	}
	else if (sites.equals(SitesDirectoryTag.SITES_CHILDREN) && (branchGroups.size() > 0)) {
		rootGroup = branchGroups.get(0);
	}
	else if (sites.equals(SitesDirectoryTag.SITES_SIBLINGS) && (branchGroups.size() > 1)) {
		rootGroup = branchGroups.get(1);
	}
	else if (sites.equals(SitesDirectoryTag.SITES_SIBLINGS) && group.isRoot()) {
	}
	else if (sites.equals(SitesDirectoryTag.SITES_PARENT_LEVEL) && (branchGroups.size() > 2)) {
		rootGroup = branchGroups.get(2);
	}
	else if (sites.equals(SitesDirectoryTag.SITES_PARENT_LEVEL) && (branchGroups.size() == 2)) {
	}
	else {
		hidden = true;
	}
	%>

	<div class="nav-menu sites-directory-taglib">
		<c:choose>
			<c:when test="<%= hidden %>">
				<div class="alert alert-info">
					<liferay-ui:message key="no-sites-were-found" />
				</div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test='<%= displayStyle.equals("descriptive") || displayStyle.equals("icon") %>'>
						<c:choose>
							<c:when test="<%= Validator.isNull(portletDisplay.getId()) %>">
								<div class="alert alert-info">
									<liferay-ui:message arguments="<%= displayStyle %>" key="the-display-style-x-cannot-be-used-in-this-context" />
								</div>
							</c:when>
							<c:otherwise>

								<%
								PortletURL portletURL = PortletURLFactoryUtil.create(request, portletDisplay.getId(), plid, PortletRequest.RENDER_PHASE);
								%>

								<liferay-ui:search-container emptyResultsMessage="no-sites-were-found" iteratorURL="<%= portletURL %>">

									<%
									List<Group> childGroups = null;

									if (rootGroup != null) {
										childGroups = rootGroup.getChildrenWithLayouts(true, QueryUtil.ALL_POS, QueryUtil.ALL_POS, new GroupNameComparator(true, locale));
									}
									else {
										childGroups = GroupLocalServiceUtil.getLayoutsGroups(group.getCompanyId(), GroupConstants.DEFAULT_LIVE_GROUP_ID, true, QueryUtil.ALL_POS, QueryUtil.ALL_POS, new GroupNameComparator(true, locale));
									}

									List<Group> visibleGroups = new UniqueList<Group>();

									for (Group childGroup : childGroups) {
										if (childGroup.hasPublicLayouts()) {
											visibleGroups.add(childGroup);
										}
										else if (GroupLocalServiceUtil.hasUserGroup(user.getUserId(), childGroup.getGroupId())) {
											visibleGroups.add(childGroup);
										}
									}

									total = visibleGroups.size();

									searchContainer.setTotal(total);
									%>

									<liferay-ui:search-container-results
										results="<%= ListUtil.subList(visibleGroups, searchContainer.getStart(), searchContainer.getEnd()) %>"
									/>

									<liferay-ui:search-container-row
										className="com.liferay.portal.model.Group"
										modelVar="childGroup"
									>

										<%
										LayoutSet layoutSet = null;

										if (childGroup.hasPublicLayouts()) {
											layoutSet = childGroup.getPublicLayoutSet();
										}
										else {
											layoutSet = childGroup.getPrivateLayoutSet();
										}
										%>

										<liferay-ui:app-view-entry
											assetCategoryClassName="<%= Group.class.getName() %>"
											assetCategoryClassPK="<%= childGroup.getGroupId() %>"
											assetTagClassName="<%= Group.class.getName() %>"
											assetTagClassPK="<%= childGroup.getGroupId() %>"
											description="<%= HtmlUtil.escape(childGroup.getDescription()) %>"
											displayStyle="<%= displayStyle %>"
											showCheckbox="<%= false %>"
											thumbnailSrc='<%= themeDisplay.getPathImage() + "/layout_set_logo?img_id=" + layoutSet.getLogoId() + "&t=" + WebServerServletTokenUtil.getToken(layoutSet.getLogoId()) %>'
											title="<%= HtmlUtil.escape(childGroup.getDescriptiveName(locale)) %>"
											url="<%= (childGroup.getGroupId() != scopeGroupId) ? PortalUtil.getDisplayURL(childGroup, themeDisplay) : null %>"
										/>
									</liferay-ui:search-container-row>

									<liferay-ui:search-paginator searchContainer="<%= searchContainer %>" />
								</liferay-ui:search-container>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>

						<%
						StringBundler sb = new StringBundler();

						_buildSitesList(rootGroup, group, branchGroups, themeDisplay, 1, displayStyle.equals("list-hierarchy"), true, sb);

						String content = sb.toString();
						%>

						<%= content %>

					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>

<%!
private void _buildSitesList(Group rootGroup, Group curGroup, List<Group> branchGroups, ThemeDisplay themeDisplay, int groupLevel, boolean showHierarchy, boolean nestedChildren, StringBundler sb) throws Exception {
	List<Group> childGroups = null;

	if (rootGroup != null) {
		childGroups = rootGroup.getChildrenWithLayouts(true, QueryUtil.ALL_POS, QueryUtil.ALL_POS, new GroupNameComparator(true));
	}
	else {
		childGroups = GroupLocalServiceUtil.getLayoutsGroups(curGroup.getCompanyId(), GroupConstants.DEFAULT_LIVE_GROUP_ID, true, QueryUtil.ALL_POS, QueryUtil.ALL_POS, new GroupNameComparator(true));
	}

	List<Group> visibleGroups = new UniqueList<Group>();

	for (Group childGroup : childGroups) {
		if (childGroup.hasPublicLayouts()) {
			visibleGroups.add(childGroup);
		}
		else {
			User user = themeDisplay.getUser();

			List<Group> mySiteGroups = user.getMySiteGroups(true, QueryUtil.ALL_POS);

			if (mySiteGroups.contains(childGroup)) {
				visibleGroups.add(childGroup);
			}
		}
	}

	if (childGroups.isEmpty()) {
		if (sb.length() == 0) {
			sb.append("<div class=\"alert alert-info\">");
			sb.append(LanguageUtil.get(themeDisplay.getLocale(), "no-sites-were-found"));
			sb.append("</div>");
		}

		return;
	}

	StringBundler tailSB = null;

	if (!nestedChildren) {
		tailSB = new StringBundler();
	}

	sb.append("<ul class=\"sites level-");
	sb.append(groupLevel);
	sb.append("\">");

	for (Group childGroup : childGroups) {
		boolean open = false;

		if (showHierarchy) {
			open = true;
		}

		String className = StringPool.BLANK;

		if (open) {
			className += "open ";
		}

		if (curGroup.getGroupId() == childGroup.getGroupId()) {
			className += "selected ";
		}

		sb.append("<li ");

		if (Validator.isNotNull(className)) {
			sb.append("class=\"");
			sb.append(className);
			sb.append("\" ");
		}

		sb.append(">");

		if (childGroup.getGroupId() != themeDisplay.getScopeGroupId()) {
			sb.append("<a ");
		}
		else {
			sb.append("<span ");
		}

		if (Validator.isNotNull(className)) {
			sb.append("class=\"");
			sb.append(className);
			sb.append("\" ");
		}

		if (childGroup.getGroupId() != themeDisplay.getScopeGroupId()) {
			sb.append("href=\"");
			sb.append(HtmlUtil.escapeHREF(PortalUtil.getDisplayURL(childGroup, themeDisplay, !childGroup.hasPublicLayouts())));
			sb.append("\"");
		}

		sb.append("> ");

		sb.append(HtmlUtil.escape(childGroup.getDescriptiveName(themeDisplay.getLocale())));

		if (childGroup.getGroupId() != themeDisplay.getScopeGroupId()) {
			sb.append("</a>");
		}
		else {
			sb.append("</span>");
		}

		if (open) {
			StringBundler childGroupSB = null;

			if (nestedChildren) {
				childGroupSB = sb;
			}
			else {
				childGroupSB = tailSB;
			}

			_buildSitesList(childGroup, curGroup, branchGroups, themeDisplay, groupLevel + 1, showHierarchy, nestedChildren, childGroupSB);
		}

		sb.append("</li>");
	}

	sb.append("</ul>");

	if (!nestedChildren) {
		sb.append(tailSB);
	}
}
%>
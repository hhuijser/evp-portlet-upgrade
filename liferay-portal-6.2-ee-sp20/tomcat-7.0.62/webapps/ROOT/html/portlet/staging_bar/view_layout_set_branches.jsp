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

<%@ include file="/html/portlet/staging_bar/init.jsp" %>

<%
List<LayoutSetBranch> layoutSetBranches = LayoutSetBranchLocalServiceUtil.getLayoutSetBranches(stagingGroup.getGroupId(), privateLayout);

LayoutSetBranch currentLayoutSetBranch = LayoutSetBranchLocalServiceUtil.getUserLayoutSetBranch(themeDisplay.getUserId(), stagingGroup.getGroupId(), privateLayout, 0, 0);

request.setAttribute("view_layout_set_branches.jsp-currentLayoutSetBranchId", String.valueOf(currentLayoutSetBranch.getLayoutSetBranchId()));
%>

<liferay-ui:success key="sitePageVariationAdded" message="site-page-variation-was-added" />
<liferay-ui:success key="sitePageVariationDeleted" message="site-page-variation-was-deleted" />
<liferay-ui:success key="sitePageVariationMerged" message="site-page-variation-was-merged" />
<liferay-ui:success key="sitePageVariationUpdated" message="site-page-variation-was-updated" />

<liferay-ui:error exception="<%= LayoutSetBranchNameException.class %>">

	<%
	LayoutSetBranchNameException lsbne = (LayoutSetBranchNameException)errorException;
	%>

	<c:if test="<%= lsbne.getType() == LayoutSetBranchNameException.DUPLICATE %>">
		<liferay-ui:message key="a-site-pages-variation-with-that-name-already-exists" />
	</c:if>

	<c:if test="<%= lsbne.getType() == LayoutSetBranchNameException.MASTER %>">
		<liferay-ui:message key="only-one-site-pages-variation-can-be-the-main-one" />
	</c:if>

	<c:if test="<%= lsbne.getType() == LayoutSetBranchNameException.TOO_LONG %>">
		<liferay-ui:message arguments="<%= new Object[] {4, 100} %>" key="please-enter-a-value-between-x-and-x-characters-long" translateArguments="<%= false %>" />
	</c:if>

	<c:if test="<%= lsbne.getType() == LayoutSetBranchNameException.TOO_SHORT %>">
		<liferay-ui:message arguments="<%= new Object[] {4, 100} %>" key="please-enter-a-value-between-x-and-x-characters-long" translateArguments="<%= false %>" />
	</c:if>
</liferay-ui:error>

<div class="alert alert-info">
	<liferay-ui:message key="pages-variations-help" />
</div>

<c:if test="<%= GroupPermissionUtil.contains(permissionChecker, stagingGroup.getGroupId(), ActionKeys.ADD_LAYOUT_SET_BRANCH) %>">
	<liferay-util:html-top>
		<liferay-util:include page="/html/portlet/staging_bar/edit_layout_set_branch.jsp">
			<liferay-util:param name="redirect" value="<%= currentURL %>" />
		</liferay-util:include>
	</liferay-util:html-top>

	<%
	String taglibOnClick = "javascript:Liferay.StagingBar.addBranch('" + LanguageUtil.get(pageContext, "add-site-pages-variation") + "');";
	%>

	<aui:button-row>
		<aui:button name="addBranchButton" onClick="<%= taglibOnClick %>" value="add-site-pages-variation" />
	</aui:button-row>
</c:if>

<div class="branch-results">
	<liferay-ui:search-container>
		<liferay-ui:search-container-results
			results="<%= layoutSetBranches %>"
			total="<%= layoutSetBranches.size() %>"
		/>

		<liferay-ui:search-container-row
			className="com.liferay.portal.model.LayoutSetBranch"
			escapedModel="<%= true %>"
			keyProperty="layoutSetBranchId"
			modelVar="curLayoutSetBranch"
		>

			<liferay-ui:search-container-column-text
				buffer="buffer"
				name="name"
			>

				<%
				if (currentLayoutSetBranch.equals(curLayoutSetBranch)) {
					buffer.append("<strong>");
				}

				buffer.append(layoutSetBranchDisplayContext.getLayoutSetBranchDisplayName(curLayoutSetBranch));

				if (curLayoutSetBranch.isMaster()) {
					buffer.append(" (*)");
				}

				if (currentLayoutSetBranch.equals(curLayoutSetBranch)) {
					buffer.append("</strong>");
				}
				%>

			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				property="description"
			/>

			<liferay-ui:search-container-column-jsp
				path="/html/portlet/staging_bar/layout_set_branch_action.jsp"
			/>
		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator paginate="<%= false %>" searchContainer="<%= searchContainer %>" />
	</liferay-ui:search-container>
</div>

<aui:script position="inline" use="liferay-staging-branch">
	Liferay.StagingBar.init(
		{
			namespace: '<portlet:namespace />',
			portletId: '<%= portletDisplay.getId() %>'
		}
	);
</aui:script>
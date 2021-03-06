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

<%@ include file="/html/portlet/journal/init.jsp" %>

<%
long folderId = GetterUtil.getLong((String)liferayPortletRequest.getAttribute("view.jsp-folderId"));

PortletURL portletURL = liferayPortletResponse.createRenderURL();

portletURL.setParameter("struts_action", "/journal/view");
portletURL.setParameter("folderId", String.valueOf(folderId));

ArticleSearch searchContainer = new ArticleSearch(liferayPortletRequest, portletURL);

searchContainer.setEmptyResultsMessage("no-web-content-was-found-that-matched-the-specified-filters");

ArticleDisplayTerms displayTerms = (ArticleDisplayTerms)searchContainer.getDisplayTerms();
%>

<aui:form action="<%= portletURL.toString() %>" method="post" name="fm1">
	<liferay-ui:search-toggle
		autoFocus="<%= windowState.equals(WindowState.MAXIMIZED) %>"
		buttonLabel="search"
		displayTerms="<%= displayTerms %>"
		id="<%= renderResponse.getNamespace() %>"
	>
		<aui:fieldset>
			<aui:input label="id" name="<%= displayTerms.ARTICLE_ID %>" size="20" value="<%= displayTerms.getArticleId() %>" />

			<aui:input name="<%= displayTerms.TITLE %>" size="20" type="text" value="<%= displayTerms.getTitle() %>" />

			<aui:input label="summary" name="<%= displayTerms.DESCRIPTION %>" size="20" type="text" value="<%= displayTerms.getDescription() %>" />

			<aui:input name="<%= displayTerms.CONTENT %>" size="20" type="text" value="<%= displayTerms.getContent() %>" />

			<aui:select name="<%= displayTerms.TYPE %>">
				<aui:option value=""></aui:option>

				<%
				for (int i = 0; i < JournalArticleConstants.TYPES.length; i++) {
				%>

					<aui:option label="<%= JournalArticleConstants.TYPES[i] %>" selected="<%= displayTerms.getType().equals(JournalArticleConstants.TYPES[i]) %>" />

				<%
				}
				%>

			</aui:select>

			<c:if test="<%= !portletName.equals(PortletKeys.JOURNAL) || ((themeDisplay.getScopeGroupId() == themeDisplay.getCompanyGroupId()) && (Validator.isNotNull(displayTerms.getStructureId()) || Validator.isNotNull(displayTerms.getTemplateId()))) %>">

				<%
				Group scopeGroup = themeDisplay.getScopeGroup();

				List<Group> mySiteGroups = user.getMySiteGroups();

				List<Layout> scopeLayouts = new ArrayList<Layout>();

				scopeLayouts.addAll(LayoutLocalServiceUtil.getScopeGroupLayouts(themeDisplay.getSiteGroupId(), false));
				scopeLayouts.addAll(LayoutLocalServiceUtil.getScopeGroupLayouts(themeDisplay.getSiteGroupId(), true));
				%>

				<aui:select label="my-sites" name="<%= displayTerms.GROUP_ID %>" showEmptyOption="<%= (themeDisplay.getScopeGroupId() == themeDisplay.getCompanyGroupId()) && (Validator.isNotNull(displayTerms.getStructureId()) || Validator.isNotNull(displayTerms.getTemplateId())) %>">
					<aui:option label="global" selected="<%= displayTerms.getGroupId() == themeDisplay.getCompanyGroupId() %>" value="<%= themeDisplay.getCompanyGroupId() %>" />

					<c:if test="<%= themeDisplay.getCompanyGroupId() != scopeGroup.getGroupId() %>">
						<aui:option label="<%= HtmlUtil.escape(scopeGroup.getDescriptiveName(locale)) %>" selected="<%= displayTerms.getGroupId() == scopeGroup.getGroupId() %>" value="<%= scopeGroup.getGroupId() %>" />
					</c:if>

					<%
					for (Group mySiteGroup : mySiteGroups) {
						if ((mySiteGroup.getGroupId() == themeDisplay.getCompanyGroupId()) || (mySiteGroup.getGroupId() == scopeGroup.getGroupId())) {
							continue;
						}

						if (mySiteGroup.hasStagingGroup() && !mySiteGroup.isStagedRemotely() && mySiteGroup.isStagedPortlet(PortletKeys.JOURNAL)) {
							mySiteGroup = mySiteGroup.getStagingGroup();
						}
					%>

						<aui:option label='<%= mySiteGroup.isUser() ? "my-site" : HtmlUtil.escape(mySiteGroup.getDescriptiveName(locale)) %>' selected="<%= displayTerms.getGroupId() == mySiteGroup.getGroupId() %>" value="<%= mySiteGroup.getGroupId() %>" />

					<%
					}

					if (!scopeLayouts.isEmpty()) {
						for (Layout scopeLayout : scopeLayouts) {
							Group scopeLayoutScopeGroup = scopeLayout.getScopeGroup();

							String label = HtmlUtil.escape(scopeLayout.getName(locale));

							if (scopeLayout.equals(layout)) {
								label = LanguageUtil.get(pageContext, "current-page") + " (" + label + ")";
							}
							%>

							<aui:option label="<%= label %>" selected="<%= displayTerms.getGroupId() == scopeLayoutScopeGroup.getGroupId() %>" value="<%= scopeLayoutScopeGroup.getGroupId() %>" />

					<%
						}
					}
					%>

				</aui:select>
			</c:if>

			<c:if test="<%= portletName.equals(PortletKeys.JOURNAL) %>">
				<div class="separator"><!-- --></div>

				<aui:select name="<%= displayTerms.STATUS %>">
					<aui:option value=""></aui:option>
					<aui:option label="draft" selected='<%= displayTerms.getStatus().equals("draft") %>' />
					<aui:option label="pending" selected='<%= displayTerms.getStatus().equals("pending") %>' />
					<aui:option label="approved" selected='<%= displayTerms.getStatus().equals("approved") %>' />
					<aui:option label="expired" selected='<%= displayTerms.getStatus().equals("expired") %>' />
				</aui:select>
			</c:if>
		</aui:fieldset>
	</liferay-ui:search-toggle>
</aui:form>

<aui:script use="aui-node-base,liferay-form">
	var form = Liferay.Form.get('<portlet:namespace />fm1');

	if (form) {
		form.set(
			'onSubmit',
			function(event) {
				event.preventDefault();
			}
		);
	}
</aui:script>

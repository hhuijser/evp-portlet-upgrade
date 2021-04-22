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

<%@ include file="/html/portlet/bookmarks/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

long breadcrumbsFolderId = ParamUtil.getLong(request, "breadcrumbsFolderId");

long searchFolderId = ParamUtil.getLong(request, "searchFolderId");
long searchFolderIds = ParamUtil.getLong(request, "searchFolderIds");

long[] folderIdsArray = null;

if (searchFolderId > 0) {
	folderIdsArray = new long[] {searchFolderId};
}
else {
	List folderIds = new ArrayList();

	folderIds.add(Long.valueOf(searchFolderIds));

	BookmarksFolderServiceUtil.getSubfolderIds(folderIds, scopeGroupId, searchFolderIds, true);

	folderIdsArray = StringUtil.split(StringUtil.merge(folderIds), 0L);
}

String keywords = ParamUtil.getString(request, "keywords");

if (searchFolderId > 0) {
	BookmarksUtil.addPortletBreadcrumbEntries(searchFolderId, request, renderResponse);
}

PortalUtil.addPortletBreadcrumbEntry(request, LanguageUtil.get(pageContext, "search") + ": " + keywords, currentURL);
%>

<liferay-portlet:renderURL varImpl="searchURL">
	<portlet:param name="struts_action" value="/bookmarks/search" />
</liferay-portlet:renderURL>

<aui:form action="<%= searchURL %>" method="get" name="fm">
	<liferay-portlet:renderURLParams varImpl="searchURL" />
	<aui:input name="redirect" type="hidden" value="<%= redirect %>" />
	<aui:input name="breadcrumbsFolderId" type="hidden" value="<%= breadcrumbsFolderId %>" />
	<aui:input name="searchFolderId" type="hidden" value="<%= searchFolderId %>" />
	<aui:input name="searchFolderIds" type="hidden" value="<%= searchFolderIds %>" />

	<liferay-ui:header
		backURL="<%= redirect %>"
		title="search"
	/>

	<%
	PortletURL portletURL = renderResponse.createRenderURL();

	portletURL.setParameter("struts_action", "/bookmarks/search");
	portletURL.setParameter("redirect", redirect);
	portletURL.setParameter("breadcrumbsFolderId", String.valueOf(breadcrumbsFolderId));
	portletURL.setParameter("searchFolderId", String.valueOf(searchFolderId));
	portletURL.setParameter("searchFolderIds", String.valueOf(searchFolderIds));
	portletURL.setParameter("keywords", keywords);
	%>

	<liferay-ui:search-container
		emptyResultsMessage='<%= LanguageUtil.format(pageContext, "no-entries-were-found-that-matched-the-keywords-x", "<strong>" + HtmlUtil.escape(keywords) + "</strong>", false) %>'
		iteratorURL="<%= portletURL %>"
	>

		<%
		Indexer indexer = BookmarksSearcher.getInstance();

		SearchContext searchContext = SearchContextFactory.getInstance(request);

		searchContext.setAttribute("paginationType", "more");
		searchContext.setEnd(searchContainer.getEnd());
		searchContext.setFolderIds(folderIdsArray);
		searchContext.setKeywords(keywords);
		searchContext.setStart(searchContainer.getStart());

		Hits hits = indexer.search(searchContext);

		searchContainer.setTotal(hits.getLength());
		%>

		<liferay-ui:search-container-results
			results="<%= BookmarksUtil.getEntries(hits) %>"
		/>

		<liferay-ui:search-container-row
			className="Object"
			modelVar="obj"
		>

			<c:choose>
				<c:when test="<%= obj instanceof BookmarksEntry %>">

					<%
					BookmarksEntry entry = (BookmarksEntry)obj;

					entry = entry.toEscapedModel();

					BookmarksFolder folder = entry.getFolder();

					String rowHREF = themeDisplay.getPathMain().concat("/bookmarks/open_entry?entryId=").concat(String.valueOf(entry.getEntryId()));
					%>

					<liferay-ui:search-container-column-text
						name="entry"
						title="<%= entry.getDescription() %>"
					>
						<liferay-ui:icon
							image="../ratings/star_hover"
							label="<%= true %>"
							message="<%= entry.getName() %>"
							target="_blank"
							url="<%= rowHREF %>"
						/>
					</liferay-ui:search-container-column-text>

					<liferay-ui:search-container-column-text
						href="<%= rowHREF %>"
						name="type"
						target="_blank"
						title="<%= entry.getDescription() %>"
						value='<%= LanguageUtil.get(request, "entry") %>'
					/>

					<liferay-ui:search-container-column-text
						href="<%= rowHREF %>"
						name="folder"
						target="_blank"
						title="<%= entry.getDescription() %>"
						value="<%= folder.getName() %>"
					/>

					<c:if test='<%= ArrayUtil.contains(entryColumns, "action") %>'>
						<liferay-ui:search-container-column-jsp
							path="/html/portlet/bookmarks/entry_action.jsp"
						/>
					</c:if>
				</c:when>
				<c:when test="<%= obj instanceof BookmarksFolder %>">

					<%
					BookmarksFolder folder = (BookmarksFolder)obj;

					BookmarksFolder parentFolder = folder.getParentFolder();
					%>

					<liferay-portlet:renderURL var="rowURL">
						<portlet:param name="struts_action" value="/bookmarks/view" />
						<portlet:param name="folderId" value="<%= String.valueOf(folder.getFolderId()) %>" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
					</liferay-portlet:renderURL>

					<liferay-ui:search-container-column-text
						name="entry"
						title="<%= folder.getDescription() %>"
					>
						<liferay-ui:icon
							image='<%= (BookmarksFolderLocalServiceUtil.getFoldersAndEntriesCount(folder.getGroupId(), folder.getFolderId(), WorkflowConstants.STATUS_ANY) > 0) ? "folder_full_document" : "folder_empty" %>'
							label="<%= true %>"
							message="<%= HtmlUtil.escape(folder.getName()) %>"
							url="<%= rowURL %>"
						/>
					</liferay-ui:search-container-column-text>

					<liferay-ui:search-container-column-text
						href="<%= rowURL %>"
						name="type"
						title="<%= folder.getDescription() %>"
						value='<%= LanguageUtil.get(request, "folder") %>'
					/>

					<liferay-ui:search-container-column-text
						href="<%= rowURL %>"
						name="folder"
						title="<%= folder.getDescription() %>"
						value='<%= (parentFolder != null) ? parentFolder.getName() : LanguageUtil.get(request, "home") %>'
					/>

					<c:if test='<%= ArrayUtil.contains(folderColumns, "action") %>'>
						<liferay-ui:search-container-column-jsp
							path="/html/portlet/bookmarks/folder_action.jsp"
						/>
					</c:if>
				</c:when>
			</c:choose>
		</liferay-ui:search-container-row>

		<div class="form-search">
			<liferay-ui:input-search autoFocus="<%= windowState.equals(WindowState.MAXIMIZED) %>" placeholder='<%= LanguageUtil.get(request, "keywords") %>' title='<%= LanguageUtil.get(request, "search-categories") %>' />
		</div>

		<liferay-ui:search-iterator type="more" />
	</liferay-ui:search-container>
</aui:form>
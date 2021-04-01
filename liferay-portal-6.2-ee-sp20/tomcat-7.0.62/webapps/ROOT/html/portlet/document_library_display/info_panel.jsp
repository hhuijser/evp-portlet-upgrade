<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/document_library_display/init.jsp" %>

<%
Folder folder = (com.liferay.portal.kernel.repository.model.Folder)request.getAttribute("view.jsp-folder");
long folderId = GetterUtil.getLong(request.getAttribute("view.jsp-folderId"));
long repositoryId = GetterUtil.getLong(request.getAttribute("view.jsp-repositoryId"));
boolean useAssetEntryQuery = GetterUtil.getBoolean(request.getAttribute("view.jsp-useAssetEntryQuery"));

int status = WorkflowConstants.STATUS_APPROVED;

if (permissionChecker.isContentReviewer(user.getCompanyId(), scopeGroupId)) {
	status = WorkflowConstants.STATUS_ANY;
}

int foldersCount = DLAppServiceUtil.getFoldersCount(repositoryId, folderId);
int fileEntriesCount = DLAppServiceUtil.getFileEntriesAndFileShortcutsCount(repositoryId, folderId, status);

String topLink = ParamUtil.getString(request, "topLink", "home");

String redirect = ParamUtil.getString(request, "redirect");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("struts_action", "/document_library_display/view");
portletURL.setParameter("topLink", topLink);
portletURL.setParameter("folderId", String.valueOf(folderId));
%>

<liferay-ui:panel-container extended="<%= false %>" id='<%= renderResponse.getNamespace() + "documentLibraryDisplayInfoPanelContainer" %>' persistState="<%= true %>">
	<c:if test="<%= folder != null %>">
		<c:if test="<%= Validator.isNotNull(folder.getDescription()) %>">
			<div class="lfr-asset-description">
				<%= HtmlUtil.escape(folder.getDescription()) %>
			</div>
		</c:if>

		<div class="lfr-asset-metadata">
			<div class="lfr-asset-date lfr-asset-icon">
				<%= LanguageUtil.format(pageContext, "last-updated-x", dateFormatDateTime.format(folder.getModifiedDate()), false) %>
			</div>

			<div class="lfr-asset-icon lfr-asset-subfolders">
				<%= foldersCount %> <liferay-ui:message key='<%= (foldersCount == 1) ? "subfolder" : "subfolders" %>' />
			</div>

			<div class="last lfr-asset-icon lfr-asset-items">
				<%= fileEntriesCount %> <liferay-ui:message key='<%= (fileEntriesCount == 1) ? "document" : "documents" %>' />
			</div>
		</div>

		<liferay-ui:custom-attributes-available className="<%= DLFolderConstants.getClassName() %>">
			<liferay-ui:custom-attribute-list
				className="<%= DLFolderConstants.getClassName() %>"
				classPK="<%= (folder != null) ? folder.getFolderId() : 0 %>"
				editable="<%= false %>"
				label="<%= true %>"
			/>
		</liferay-ui:custom-attributes-available>
	</c:if>

	<c:if test="<%= foldersCount > 0 %>">
		<liferay-ui:panel collapsible="<%= true %>" cssClass="view-folders" extended="<%= true %>" id='<%= renderResponse.getNamespace() + "documentLibraryDisplayFoldersListingPanel" %>' persistState="<%= true %>" title='<%= (folder != null) ? "subfolders" : "folders" %>'>
			<liferay-ui:search-container
				curParam="cur1"
				delta="<%= foldersPerPage %>"
				deltaConfigurable="<%= false %>"
				headerNames="<%= StringUtil.merge(folderColumns) %>"
				iteratorURL="<%= portletURL %>"
				total="<%= foldersCount %>"
			>
				<liferay-ui:search-container-results
					results="<%= DLAppServiceUtil.getFolders(repositoryId, folderId, searchContainer.getStart(), searchContainer.getEnd()) %>"
				/>

				<liferay-ui:search-container-row
					className="com.liferay.portal.kernel.repository.model.Folder"
					keyProperty="folderId"
					modelVar="curFolder"
					rowVar="row"
				>
					<liferay-portlet:renderURL varImpl="rowURL">
						<portlet:param name="struts_action" value="/document_library_display/view" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
						<portlet:param name="folderId" value="<%= String.valueOf(curFolder.getFolderId()) %>" />
					</liferay-portlet:renderURL>

					<%@ include file="/html/portlet/document_library/folder_columns.jspf" %>
				</liferay-ui:search-container-row>

				<liferay-ui:search-iterator />
			</liferay-ui:search-container>
		</liferay-ui:panel>
	</c:if>

	<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id='<%= renderResponse.getNamespace() + "documentLibraryDisplayDocumentsListingPanel" %>' persistState="<%= true %>" title="documents">
		<%@ include file="/html/portlet/document_library/view_file_entries.jspf" %>
	</liferay-ui:panel>
</liferay-ui:panel-container>

<%!
private static Log _log = LogFactoryUtil.getLog("portal-web.docroot.html.portlet.document_library.info_panel_jsp");
%>
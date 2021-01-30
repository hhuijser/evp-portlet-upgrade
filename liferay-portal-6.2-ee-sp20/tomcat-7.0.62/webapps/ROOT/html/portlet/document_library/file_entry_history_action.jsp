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

<%@ include file="/html/portlet/document_library/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

boolean showHistoryActions = ParamUtil.getBoolean(request, "showHistoryActions", true);

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

Object[] objArray = (Object[])row.getObject();

FileEntry fileEntry = (FileEntry)objArray[0];
FileVersion fileVersion = (FileVersion)objArray[1];
%>

<liferay-ui:icon-menu direction="down" extended="<%= false %>" icon="<%= StringPool.BLANK %>" message="<%= StringPool.BLANK %>">
	<liferay-ui:icon
		image="download"
		url="<%= DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay, StringPool.BLANK) %>"
	/>

	<c:if test="<%= showHistoryActions %>">
		<portlet:renderURL var="viewFileVersionURL">
			<c:choose>
				<c:when test="<%= portletName.equals(PortletKeys.TRASH) %>">
					<portlet:param name="struts_action" value="/trash/view_content" />
					<portlet:param name="className" value="<%= DLFileEntryConstants.getClassName() %>" />
					<portlet:param name="classPK" value="<%= String.valueOf(fileEntry.getFileEntryId()) %>" />
				</c:when>
				<c:otherwise>
					<portlet:param name="struts_action" value="/document_library/view_file_entry" />
				</c:otherwise>
			</c:choose>

			<portlet:param name="redirect" value="<%= redirect %>" />
			<portlet:param name="fileEntryId" value="<%= String.valueOf(fileEntry.getFileEntryId()) %>" />
			<portlet:param name="version" value="<%= fileVersion.getVersion() %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="view"
			message="view[action]"
			url="<%= viewFileVersionURL %>"
		/>

		<portlet:renderURL var="viewFileEntryURL">
			<portlet:param name="struts_action" value="/document_library/view_file_entry" />
			<portlet:param name="redirect" value="<%= redirect %>" />
			<portlet:param name="fileEntryId" value="<%= String.valueOf(fileEntry.getFileEntryId()) %>" />
		</portlet:renderURL>

		<c:if test="<%= (fileVersion.getStatus() != WorkflowConstants.STATUS_IN_TRASH) && DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.UPDATE) && (fileVersion.getStatus() == WorkflowConstants.STATUS_APPROVED) && !fileEntry.getLatestFileVersion().getVersion().equals(fileVersion.getVersion()) %>">
			<portlet:actionURL var="revertURL">
				<portlet:param name="struts_action" value="/document_library/edit_file_entry" />
				<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.REVERT %>" />
				<portlet:param name="redirect" value="<%= viewFileEntryURL %>" />
				<portlet:param name="fileEntryId" value="<%= String.valueOf(fileEntry.getFileEntryId()) %>" />
				<portlet:param name="version" value="<%= String.valueOf(fileVersion.getVersion()) %>" />
			</portlet:actionURL>

			<liferay-ui:icon
				image="undo"
				message="revert"
				url="<%= revertURL %>"
			/>
		</c:if>

		<c:if test="<%= (fileVersion.getStatus() != WorkflowConstants.STATUS_IN_TRASH) && DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.DELETE) && (fileVersion.getStatus() == WorkflowConstants.STATUS_APPROVED) && (fileEntry.getModel() instanceof DLFileEntry) && (((DLFileEntry)fileEntry.getModel()).getFileVersionsCount(WorkflowConstants.STATUS_APPROVED) > 1) %>">
			<portlet:actionURL var="deleteURL">
				<portlet:param name="struts_action" value="/document_library/edit_file_entry" />
				<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.DELETE %>" />
				<portlet:param name="redirect" value="<%= viewFileEntryURL %>" />
				<portlet:param name="fileEntryId" value="<%= String.valueOf(fileEntry.getFileEntryId()) %>" />
				<portlet:param name="version" value="<%= String.valueOf(fileVersion.getVersion()) %>" />
			</portlet:actionURL>

			<liferay-ui:icon-delete
				message="delete-version"
				url="<%= deleteURL %>"
			/>
		</c:if>
	</c:if>
</liferay-ui:icon-menu>
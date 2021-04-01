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

<%@ include file="/html/portlet/recent_documents/init.jsp" %>

<%
List fileRanks = DLAppLocalServiceUtil.getFileRanks(scopeGroupId, user.getUserId());
%>

<c:choose>
	<c:when test="<%= fileRanks.isEmpty() %>">
		<liferay-ui:message key="there-are-no-recent-downloads" />
	</c:when>
	<c:otherwise>
		<ul class="recent-documents">

			<%
			for (int i = 0; i < fileRanks.size(); i++) {
				DLFileRank fileRank = (DLFileRank)fileRanks.get(i);

				try {
					FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(fileRank.getFileEntryId());

					fileEntry = fileEntry.toEscapedModel();
			%>

					<li>
						<a href="<%= DLUtil.getPreviewURL(fileEntry, fileEntry.getFileVersion(), themeDisplay, StringPool.BLANK, false, true) %>">
							<img alt="" src="<%= themeDisplay.getPathThemeImages() %>/file_system/small/<%= fileEntry.getIcon() %>.png" />
							<%= fileEntry.getTitle() %>
						</a>
					</li>

			<%
				}
				catch (Exception e) {
				}
			}
			%>

		</ul>
	</c:otherwise>
</c:choose>
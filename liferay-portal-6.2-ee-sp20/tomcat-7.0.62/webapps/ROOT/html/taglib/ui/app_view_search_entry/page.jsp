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

<%@ include file="/html/taglib/init.jsp" %>

<%
String actionJsp = (String)request.getAttribute("liferay-ui:app-view-search-entry:actionJsp");
String containerIcon = GetterUtil.getString(request.getAttribute("liferay-ui:app-view-search-entry:containerIcon"), "folder");
String containerName = (String)request.getAttribute("liferay-ui:app-view-search-entry:containerName");
String containerSrc = (String)request.getAttribute("liferay-ui:app-view-search-entry:containerSrc");
String containerType = GetterUtil.getString(request.getAttribute("liferay-ui:app-view-search-entry:containerType"), LanguageUtil.get(request, "folder"));
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:app-view-search-entry:cssClass"));
String description = (String)request.getAttribute("liferay-ui:app-view-search-entry:description");
List<Tuple> fileEntryTuples = (List<Tuple>)request.getAttribute("liferay-ui:app-view-search-entry:fileEntryTuples");
boolean highlightEnabled = GetterUtil.getBoolean(request.getAttribute("liferay-ui:app-view-search-entry:highlightEnabled"));
boolean locked = GetterUtil.getBoolean(request.getAttribute("liferay-ui:app-view-search-entry:locked"));
List<MBMessage> mbMessages = (List<MBMessage>)request.getAttribute("liferay-ui:app-view-search-entry:mbMessages");
String[] queryTerms = (String[])request.getAttribute("liferay-ui:app-view-search-entry:queryTerms");
String rowCheckerId = (String)request.getAttribute("liferay-ui:app-view-search-entry:rowCheckerId");
String rowCheckerName = (String)request.getAttribute("liferay-ui:app-view-search-entry:rowCheckerName");
boolean showCheckbox = GetterUtil.getBoolean(request.getAttribute("liferay-ui:app-view-search-entry:showCheckbox"));
int status = GetterUtil.getInteger(request.getAttribute("liferay-ui:app-view-search-entry:status"));
String thumbnailSrc = (String)request.getAttribute("liferay-ui:app-view-search-entry:thumbnailSrc");
String title = (String)request.getAttribute("liferay-ui:app-view-search-entry:title");
String url = (String)request.getAttribute("liferay-ui:app-view-search-entry:url");
List<String> versions = (List<String>)request.getAttribute("liferay-ui:app-view-search-entry:versions");

Summary summary = new Summary(title, description, null);

summary.setHighlight(highlightEnabled);
summary.setQueryTerms(queryTerms);
%>

<div class="app-view-entry app-view-search-entry-taglib entry-display-style <%= showCheckbox ? "selectable" : StringPool.BLANK %> <%= cssClass %>" data-title="<%= HtmlUtil.escapeAttribute(StringUtil.shorten(title, 60)) %>">
	<a class="entry-link" href="<%= HtmlUtil.escapeAttribute(url) %>" title="<%= HtmlUtil.escapeAttribute(title + " - " + description) %>">
		<c:if test="<%= Validator.isNotNull(thumbnailSrc) %>">
			<div class="entry-thumbnail">
				<img alt="" border="no" class="img-polaroid" src="<%= HtmlUtil.escapeAttribute(thumbnailSrc) %>" />

				<c:if test="<%= locked %>">
					<img alt="<liferay-ui:message key="locked" />" class="locked-icon" src="<%= themeDisplay.getPathThemeImages() %>/file_system/large/overlay_lock.png" />
				</c:if>
			</div>
		</c:if>

		<div class="entry-metadata">
			<span class="entry-title">
				<%= summary.getHighlightedTitle() %>

				<c:if test="<%= (status != WorkflowConstants.STATUS_ANY) && (status != WorkflowConstants.STATUS_APPROVED) %>">
					<aui:workflow-status showIcon="<%= false %>" showLabel="<%= false %>" status="<%= status %>" />
				</c:if>
			</span>

			<c:if test="<%= ((versions != null) && !versions.isEmpty()) || Validator.isNotNull(containerName) %>">
				<small>
					<dl>
						<c:if test="<%= (versions != null) && !versions.isEmpty() %>">
							<dt>
								<liferay-ui:message key="versions" />:
							</dt>
							<dd>
								<%= StringUtil.merge(versions, StringPool.COMMA_AND_SPACE) %>
							</dd>
						</c:if>

						<c:if test="<%= Validator.isNotNull(containerName) %>">
							<dt>
								<c:choose>
									<c:when test="<%= Validator.isNotNull(containerSrc) %>">
										<liferay-ui:icon
											label="<%= true %>"
											message="<%= LanguageUtil.get(request, containerType) %>"
											src="<%= containerSrc %>"
										/>
									</c:when>
									<c:otherwise>
										<liferay-ui:icon
											image='<%= (Validator.isNotNull(containerIcon)) ? containerIcon : "folder" %>'
											label="<%= true %>"
											message="<%= LanguageUtil.get(request, containerType) %>"
										/>
									</c:otherwise>
								</c:choose>
								:
							</dt>
							<dd>
								<%= HtmlUtil.escape(containerName) %>
							</dd>
						</c:if>
					</dl>
				</small>
			</c:if>

			<span class="entry-description">
				<%= summary.getHighlightedContent() %>
			</span>
		</div>
	</a>

	<c:if test="<%= fileEntryTuples != null %>">

		<%
		for (Tuple fileEntryTuple : fileEntryTuples) {
			FileEntry fileEntry = (FileEntry)fileEntryTuple.getObject(0);
			summary = (Summary)fileEntryTuple.getObject(1);

			if (Validator.isNull(summary.getContent())) {
				summary.setContent(fileEntry.getTitle());
			}
		%>

			<div class="entry-attachment">
				<aui:a class="lfr-discussion-details" href="<%= url %>">
					<div class="image">
						<img alt="<%= fileEntry.getTitle() %>" class="attachment" src="<%= DLUtil.getThumbnailSrc(fileEntry, null, themeDisplay) %>" />
					</div>

					<span class="title">
						<liferay-ui:icon
							image='<%= "../file_system/small/" + DLUtil.getFileIcon(fileEntry.getExtension()) %>'
							label="<%= true %>"
							message='<%= LanguageUtil.format(locale, "attachment-added-by-x", HtmlUtil.escape(fileEntry.getUserName()), false) %>'
						/>
					</span>
					<span class="body">
						<%= summary.getHighlightedContent() %>
					</span>
				</aui:a>
			</div>

		<%
		}
		%>

	</c:if>

	<c:if test="<%= mbMessages != null %>">

		<%
		for (MBMessage mbMessage : mbMessages) {
			User userDisplay = UserLocalServiceUtil.getUser(mbMessage.getUserId());

			summary = new Summary(null, mbMessage.getBody(), null);

			summary.setHighlight(highlightEnabled);
			summary.setQueryTerms(queryTerms);
		%>

			<div class="entry-discussion">
				<aui:a class="lfr-discussion-details" href="<%= url %>">
					<div class="image">
						<img alt="<%= HtmlUtil.escapeAttribute(userDisplay.getFullName()) %>" class="avatar" src="<%= HtmlUtil.escape(userDisplay.getPortraitURL(themeDisplay)) %>" />
					</div>

					<span class="title">
						<liferay-ui:icon
							image="message"
							label="<%= true %>"
							message='<%= LanguageUtil.format(locale, "comment-by-x", HtmlUtil.escape(userDisplay.getFullName()), false) %>'
						/>
					</span>
					<span class="body">
						<%= summary.getHighlightedContent() %>
					</span>
				</aui:a>
			</div>

		<%
		}
		%>

	</c:if>

	<c:if test="<%= showCheckbox %>">
		<aui:input cssClass="entry-selector overlay" label="" name="<%= RowChecker.ROW_IDS + rowCheckerName %>" type="checkbox" value="<%= rowCheckerId %>" />
	</c:if>

	<c:if test="<%= Validator.isNotNull(actionJsp) %>">
		<liferay-util:include page="<%= actionJsp %>">
			<liferay-util:param name="showMinimalActionButtons" value="<%= String.valueOf(Boolean.TRUE) %>" />
		</liferay-util:include>
	</c:if>
</div>
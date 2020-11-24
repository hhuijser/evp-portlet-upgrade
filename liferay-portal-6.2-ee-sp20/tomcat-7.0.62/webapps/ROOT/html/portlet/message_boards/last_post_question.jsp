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

<%@ include file="/html/portlet/message_boards/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

Object[] objArray = (Object[])row.getObject();

MBMessage message = (MBMessage)objArray[0];

MBThread thread = message.getThread();

User userDisplay = UserLocalServiceUtil.fetchUserById(thread.getLastPostByUserId());
%>

<div class="user-info">
	<div class="portrait">
		<c:choose>
			<c:when test="<%= message.isAnonymous() || (userDisplay == null) %>">
				<img alt="<%= LanguageUtil.get(pageContext, "generic-portrait") %>" class="avatar" src="<%= UserConstants.getPortraitURL(themeDisplay.getPathImage(), true, 0, StringPool.BLANK) %>" width="60" /></a>
			</c:when>
			<c:otherwise>
				<a href="<%= userDisplay.getDisplayURL(themeDisplay) %>"><img alt="<%= HtmlUtil.escapeAttribute(userDisplay.getFullName()) %>" class="avatar" src="<%= userDisplay.getPortraitURL(themeDisplay) %>" width="60" /></a>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="username">
		<c:choose>
			<c:when test="<%= message.isAnonymous() || (userDisplay == null) %>">
				<liferay-ui:message key="anonymous" />
			</c:when>
			<c:otherwise>
				<a href="<%= userDisplay.getDisplayURL(themeDisplay) %>"><%= HtmlUtil.escape(PortalUtil.getUserName(thread.getLastPostByUserId(), StringPool.BLANK)) %></a>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="time">

		<%
		Date now = new Date();

		long lastPostAgo = now.getTime() - thread.getLastPostDate().getTime();
		%>

		<liferay-ui:icon
			image="../aui/time"
			label="<%= true %>"
			message='<%= LanguageUtil.format(pageContext, "x-ago", LanguageUtil.getTimeDescription(pageContext, lastPostAgo, true), false) %>'
		/>
	</div>
</div>
<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the applicable
 * Liferay software end user license agreement ("License Agreement")
 * found on www.liferay.com/legal/eulas. You may also contact Liferay, Inc.
 * for a copy of the License Agreement. You may not use this file except in
 * compliance with the License Agreement.
 * See the License Agreement for the specific language governing
 * permissions and limitations under the License Agreement, including
 * but not limited to distribution rights of the Software.
 *
 */
--%>

<%@ include file="/init.jsp" %>

<c:choose>
	<c:when test="<%= !themeDisplay.isSignedIn() %>">
		<div class="alert alert-info">
			<liferay-ui:message key="please-sign-in-to-access-this-application" />
		</div>
	</c:when>
	<c:otherwise>

		<%
		boolean actionable = ParamUtil.getBoolean(request, "actionable");
		%>

		<div class="clearfix user-notifications-container <%= actionable ? "actionable" : "non-actionable" %>">
			<aui:row>
				<aui:col cssClass="nav-bar user-notifications-sidebar" width="<%= 25 %>">
					<div class="nav">
						<a class="clearfix non-actionable <%= !actionable ? "selected" : "" %>" href="javascript:;">
							<span class="title"><liferay-ui:message key="notifications" /></span>

							<%
							int unreadNonActionableUserNotificationsCount = NotificationsUtil.getArchivedUserNotificationEventsCount(themeDisplay.getUserId(), false, false);
							%>

							<span class="count"><%= unreadNonActionableUserNotificationsCount %></span>
						</a>
					</div>

					<div class="nav">
						<a class="actionable clearfix <%= actionable ? "selected" : "" %>" href="javascript:;">
							<span class="title"><liferay-ui:message key="requests" /></span>

							<%
							int unreadActionableUserNotificationsCount = NotificationsUtil.getArchivedUserNotificationEventsCount(themeDisplay.getUserId(), true, false);
							%>

							<span class="count"><%= unreadActionableUserNotificationsCount %></span>
						</a>
					</div>

					<div class="nav">
						<a class="clearfix manage" href="javascript:;">
							<span class="title"><liferay-ui:message key="notification-delivery" /></span>
						</a>
					</div>
				</aui:col>

				<aui:col cssClass="user-notifications-list-container" width="<%= 75 %>">
					<ul class="unstyled user-notifications-list">
						<li class="clearfix pagination top">
							<span class="hide left-nav previous"><a href="javascript:;"><liferay-ui:message key="previous" /></a></span>

							<span class="hide page-info"></span>

							<span class="hide next right-nav"><a href="javascript:;"><liferay-ui:message key="next" /></a></span>
						</li>

						<div class="mark-all-as-read"><a class="hide" href="javascript:;"><liferay-ui:message key="mark-as-read" /></a></div>

						<div class="user-notifications"></div>

						<li class="bottom clearfix pagination">
							<span class="hide left-nav previous"><a href="javascript:;"><liferay-ui:message key="previous" /></a></span>

							<span class="hide page-info"></span>

							<span class="hide next right-nav"><a href="javascript:;"><liferay-ui:message key="next" /></a></span>
						</li>
					</ul>

					<div class="hide notifications-configurations"></div>
				</aui:col>
			</aui:row>
		</div>

		<aui:script use="aui-base,liferay-plugin-notifications,liferay-plugin-notifications-list">
			var notificationsCount = '.non-actionable .count';

			if (<%= actionable %>) {
				notificationsCount = '.actionable .count';
			}

			var notificationsList = new Liferay.NotificationsList(
				{
					actionable: <%= actionable %>,
					baseActionURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.ACTION_PHASE) %>',
					baseRenderURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',
					baseResourceURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RESOURCE_PHASE) %>',
					delta: <%= fullViewDelta %>,
					fullView: <%= true %>,
					markAllAsReadNode: '.user-notifications-list .mark-all-as-read',
					namespace: '<portlet:namespace />',
					nextPageNode: '.pagination .next',
					notificationsContainer: '.notifications-portlet .user-notifications-container',
					notificationsCount: notificationsCount,
					notificationsNode: '.user-notifications-list .user-notifications',
					paginationInfoNode: '.pagination .page-info',
					portletKey: '<%= portletDisplay.getId() %>',
					previousPageNode: '.pagination .previous',
					start: 0
				}
			);

			new Liferay.Notifications(
				{
					baseRenderURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',
					namespace: '<portlet:namespace />',
					notificationsList: notificationsList
				}
			);
		</aui:script>
	</c:otherwise>
</c:choose>
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

<c:if test="<%= PortletPropsValues.USER_NOTIFICATIONS_DOCKBAR_DISPLAY_ENABLED %>">

	<%
	int newUserNotificationsCount = NotificationsUtil.getDeliveredUserNotificationEventsCount(themeDisplay.getUserId(), false);
	int unreadUserNotificationsCount = NotificationsUtil.getArchivedUserNotificationEventsCount(themeDisplay.getUserId(), false);

	long notificationsPlid = themeDisplay.getPlid();

	if (layout.isTypeControlPanel()) {
		notificationsPlid = LayoutLocalServiceUtil.getDefaultPlid(user.getGroupId(), true);

		if (notificationsPlid == LayoutConstants.DEFAULT_PLID) {
			Group guestGroup = GroupLocalServiceUtil.getGroup(user.getCompanyId(), GroupConstants.GUEST);

			notificationsPlid = LayoutLocalServiceUtil.getDefaultPlid(guestGroup.getGroupId(), false);
		}
	}
	%>

	<li class="dockbar-user-notifications dropdown" id="<portlet:namespace />userNotifications">
		<a class="dropdown-toggle user-notification-link" href="javascript:;">
			<span class='user-notifications-count <%= (newUserNotificationsCount > 0) ? "alert" : StringPool.BLANK %>' id="<portlet:namespace />userNotificationsCount"><%= unreadUserNotificationsCount %></span>
		</a>

		<div class="dockbar-user-notifications-container">
			<ul class="dropdown-menu pull-right user-notifications-list">
				<div class="non-actionable">
					<div class="user-notifications-header">
						<liferay-portlet:renderURL plid="<%= notificationsPlid %>" portletName="<%= PortletKeys.NOTIFICATIONS %>" var="viewAllNonActionableNotifications" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="mvcPath" value="/notifications/view.jsp" />
							<portlet:param name="actionable" value="<%= Boolean.FALSE.toString() %>" />
						</liferay-portlet:renderURL>

						<span><a href="<%= viewAllNonActionableNotifications %>"><liferay-ui:message key="notifications" /> (<span class="count"></span>)</a></span>

						<span class="mark-all-as-read"><a class="hide" href="javascript:;"><liferay-ui:message key="mark-as-read" /></a></span>
					</div>

					<div class="user-notifications"></div>
				</div>

				<div class="actionable">
					<div class="clearfix user-notifications-header">
						<liferay-portlet:renderURL plid="<%= notificationsPlid %>" portletName="<%= PortletKeys.NOTIFICATIONS %>" var="viewAllActionableNotifications" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="mvcPath" value="/notifications/view.jsp" />
							<portlet:param name="actionable" value="<%= Boolean.TRUE.toString() %>" />
						</liferay-portlet:renderURL>

						<span class="title"><a href="<%= viewAllActionableNotifications %>"><liferay-ui:message key="requests" /> (<span class="count"></span>)</a></span>
					</div>

					<div class="user-notifications"></div>
				</div>
			</ul>
		</div>

		<aui:script use="aui-base,liferay-plugin-dockbar-notifications,liferay-plugin-notifications-list">
			var nonActionableNotificationsList = new Liferay.NotificationsList(
				{
					actionable: <%= false %>,
					baseActionURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.ACTION_PHASE) %>',
					baseRenderURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',
					baseResourceURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RESOURCE_PHASE) %>',
					delta: <%= dockbarViewDelta %>,
					fullView: <%= false %>,
					markAllAsReadNode: '.mark-all-as-read',
					namespace: '<portlet:namespace />',
					notificationsContainer: '.dockbar-user-notifications .dockbar-user-notifications-container .user-notifications-list .non-actionable',
					notificationsCount: '.count',
					notificationsNode: '.user-notifications',
					portletKey: '<%= portletDisplay.getId() %>',
					start: 0
				}
			);

			var actionableNotificationsList = new Liferay.NotificationsList(
				{
					actionable: <%= true %>,
					baseActionURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.ACTION_PHASE) %>',
					baseRenderURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',
					baseResourceURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RESOURCE_PHASE) %>',
					delta: <%= dockbarViewDelta %>,
					fullView: <%= false %>,
					namespace: '<portlet:namespace />',
					notificationsContainer: '.dockbar-user-notifications .dockbar-user-notifications-container .user-notifications-list .actionable',
					notificationsCount: '.count',
					notificationsNode: '.user-notifications',
					portletKey: '<%= portletDisplay.getId() %>',
					start: 0
				}
			);

			new Liferay.DockbarNotifications(
				{
					actionableNotificationsList: actionableNotificationsList,
					baseActionURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.ACTION_PHASE) %>',
					baseResourceURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RESOURCE_PHASE) %>',
					nonActionableNotificationsList: nonActionableNotificationsList,
					portletKey: '<%= portletDisplay.getId() %>'
				}
			);
		</aui:script>
	</li>
</c:if>
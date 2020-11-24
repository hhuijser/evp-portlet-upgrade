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

<div class="manage-notifications-content">
	<div class="manage-notifications" id="<portlet:namespace />manageNotifications">
		<div class="title">
			<div class="receive-notification">
				<c:choose>
					<c:when test="<%= UserNotificationDeliveryLocalServiceUtil.getUserNotificationDeliveriesCount() > 0 %>">
						<span><liferay-ui:message key="receive-a-notification-when-someone" /></span>
					</c:when>
					<c:otherwise>
						<span><liferay-ui:message key="there-are-no-available-options-to-configure" /></span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<%
		Map<String, List<UserNotificationDefinition>> userNotificationDefinitionsMap = new TreeMap<String, List<UserNotificationDefinition>>(new PortletIdComparator(locale));

		userNotificationDefinitionsMap.putAll(UserNotificationManagerUtil.getUserNotificationDefinitions());

		for (Map.Entry<String, List<UserNotificationDefinition>> entry : userNotificationDefinitionsMap.entrySet()) {
		%>

			<table class="notification-deliveries table table-condensed">
				<caption><%= PortalUtil.getPortletTitle(entry.getKey(), locale) %></caption>
				<tbody>

				<%
				List<UserNotificationDefinition> userNotificationDefinitions = entry.getValue();

				for (UserNotificationDefinition userNotificationDefinition : userNotificationDefinitions) {
				%>

					<tr>
						<td class="span8">
							<liferay-ui:message key="<%= userNotificationDefinition.getDescription() %>" />
						</td>
						<td class="span1">

							<%
							Map<Integer, UserNotificationDeliveryType> userNotificationDeliveryTypesMap = userNotificationDefinition.getUserNotificationDeliveryTypes();

							for (Map.Entry<Integer, UserNotificationDeliveryType> userNotificationDeliveryTypeEntry : userNotificationDeliveryTypesMap.entrySet()) {
								UserNotificationDeliveryType userNotificationDeliveryType = userNotificationDeliveryTypeEntry.getValue();

								UserNotificationDelivery userNotificationDelivery = UserNotificationDeliveryLocalServiceUtil.getUserNotificationDelivery(themeDisplay.getUserId(), entry.getKey(), userNotificationDefinition.getClassNameId(), userNotificationDefinition.getNotificationType(), userNotificationDeliveryType.getType(), userNotificationDeliveryType.isDefault());
							%>

								<div class="checkbox-container">
									<aui:input cssClass="notification-delivery" data-userNotificationDeliveryId="<%= String.valueOf(userNotificationDelivery.getUserNotificationDeliveryId()) %>" disabled="<%= !userNotificationDeliveryType.isModifiable() %>" inlineLabel="true" label="<%= userNotificationDeliveryType.getName() %>" name="<%= String.valueOf(userNotificationDelivery.getUserNotificationDeliveryId()) %>" type="checkbox" value="<%= userNotificationDelivery.isDeliver() %>" />
								</div>

							<%
							}
							%>

						</td>
					</tr>

				<%
				}
				%>

				</tbody>
			</table>

		<%
		}
		%>

		<aui:script use="aui-base,aui-io-request">
			var notificationDelivery = A.one('#<portlet:namespace />manageNotifications');

			if (notificationDelivery) {
				notificationDelivery.delegate(
					'change',
					function(event) {
						event.preventDefault();

						var currentTarget = event.currentTarget;

						A.io.request(
							'<portlet:actionURL name="updateUserNotificationDelivery" />',
							{
								data: {
									<portlet:namespace />deliver: currentTarget.attr('checked'),
									<portlet:namespace />userNotificationDeliveryId: currentTarget.attr('data-userNotificationDeliveryId')
								},
								dataType: 'json',
								on: {
									success: function() {
										var responseData = this.get('responseData');

										if (responseData.success) {
											var checkboxContainer = currentTarget.ancestor('.checkbox-container');

											var saved = checkboxContainer.one('.saved');

											if (saved) {
												saved.remove();
											}

											var input = checkboxContainer.one('input');

											checkboxContainer.insertBefore('<span class="saved" style="background: #0A85E4; color: #FFF;"><liferay-ui:message key="saved" /></span>', input);

											setInterval(
												function() {
													var saved = checkboxContainer.one('.saved');

													if (saved) {
														saved.setStyle('background', 'transparent');
														saved.setStyle('color', 'transparent');
													}

													setInterval(
														function() {
															if (saved) {
																saved.remove();
															}
														},
														3000
													);
												},
												500
											);
										}
									}
								}
							}
						);
					},
					'.notification-deliveries .notification-delivery'
				);
			}
		</aui:script>
	</div>
</div>
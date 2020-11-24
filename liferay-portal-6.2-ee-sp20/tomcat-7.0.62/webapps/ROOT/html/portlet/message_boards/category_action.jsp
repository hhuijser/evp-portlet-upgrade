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

MBCategory category = (MBCategory)row.getObject();

Set<Long> categorySubscriptionClassPKs = (Set<Long>)row.getParameter("categorySubscriptionClassPKs");

boolean defaultParentCategory = false;

if (category.getCategoryId() == MBCategoryConstants.DEFAULT_PARENT_CATEGORY_ID) {
	defaultParentCategory = true;
}

String modelResource = null;
String modelResourceDescription = null;
String resourcePrimKey = null;

boolean showPermissionsURL = false;

if (!defaultParentCategory) {
	modelResource = MBCategory.class.getName();
	modelResourceDescription = category.getName();
	resourcePrimKey = String.valueOf(category.getCategoryId());

	showPermissionsURL = MBCategoryPermission.contains(permissionChecker, category, ActionKeys.PERMISSIONS);
}
else {
	modelResource = "com.liferay.portlet.messageboards";
	modelResourceDescription = themeDisplay.getScopeGroupName();
	resourcePrimKey = String.valueOf(scopeGroupId);

	showPermissionsURL = MBPermission.contains(permissionChecker, scopeGroupId, ActionKeys.PERMISSIONS);
}
%>

<liferay-ui:icon-menu>
	<c:if test="<%= !defaultParentCategory && MBCategoryPermission.contains(permissionChecker, category, ActionKeys.UPDATE) %>">
		<portlet:renderURL var="editURL">
			<portlet:param name="struts_action" value="/message_boards/edit_category" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="mbCategoryId" value="<%= String.valueOf(category.getCategoryId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="edit"
			url="<%= editURL %>"
		/>

		<portlet:renderURL var="moveURL">
			<portlet:param name="struts_action" value="/message_boards/move_category" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="mbCategoryId" value="<%= String.valueOf(category.getCategoryId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="submit"
			message="move"
			url="<%= moveURL %>"
		/>
	</c:if>

	<c:if test="<%= showPermissionsURL %>">
		<liferay-security:permissionsURL
			modelResource="<%= modelResource %>"
			modelResourceDescription="<%= modelResourceDescription %>"
			resourcePrimKey="<%= resourcePrimKey %>"
			var="permissionsURL"
			windowState="<%= LiferayWindowState.POP_UP.toString() %>"
		/>

		<liferay-ui:icon
			image="permissions"
			method="get"
			url="<%= permissionsURL %>"
			useDialog="<%= true %>"
		/>
	</c:if>

	<c:if test="<%= portletName.equals(PortletKeys.MESSAGE_BOARDS) %>">
		<c:if test="<%= enableRSS %>">

			<%
			if (category.getCategoryId() > 0) {
				rssURL.setParameter("mbCategoryId", String.valueOf(category.getCategoryId()));
			}
			else {
				rssURL.setParameter("groupId", String.valueOf(scopeGroupId));
			}
			%>

			<liferay-ui:rss
				delta="<%= rssDelta %>"
				displayStyle="<%= rssDisplayStyle %>"
				feedType="<%= rssFeedType %>"
				resourceURL="<%= rssURL %>"
			/>
		</c:if>

		<%
		long categorySubscriptionClassPK = 0;

		boolean hasSubscriptionPermission = false;

		if (!defaultParentCategory) {
			categorySubscriptionClassPK = category.getCategoryId();

			hasSubscriptionPermission = MBCategoryPermission.contains(permissionChecker, category, ActionKeys.SUBSCRIBE);
		}
		else {
			categorySubscriptionClassPK = scopeGroupId;

			hasSubscriptionPermission = MBPermission.contains(permissionChecker, scopeGroupId, ActionKeys.SUBSCRIBE);
		}
		%>

		<c:if test="<%= hasSubscriptionPermission && (MBUtil.getEmailMessageAddedEnabled(portletPreferences) || MBUtil.getEmailMessageUpdatedEnabled(portletPreferences)) %>">
			<c:choose>
				<c:when test="<%= (categorySubscriptionClassPKs != null) && categorySubscriptionClassPKs.contains(categorySubscriptionClassPK) %>">
					<portlet:actionURL var="unsubscribeURL">
						<portlet:param name="struts_action" value="/message_boards/edit_category" />
						<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.UNSUBSCRIBE %>" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
						<portlet:param name="mbCategoryId" value="<%= String.valueOf(category.getCategoryId()) %>" />
					</portlet:actionURL>

					<liferay-ui:icon
						image="unsubscribe"
						url="<%= unsubscribeURL %>"
					/>
				</c:when>
				<c:otherwise>
					<portlet:actionURL var="subscribeURL">
						<portlet:param name="struts_action" value="/message_boards/edit_category" />
						<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.SUBSCRIBE %>" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
						<portlet:param name="mbCategoryId" value="<%= String.valueOf(category.getCategoryId()) %>" />
					</portlet:actionURL>

					<liferay-ui:icon
						image="subscribe"
						url="<%= subscribeURL %>"
					/>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:if>

	<c:if test="<%= !defaultParentCategory && MBCategoryPermission.contains(permissionChecker, category, ActionKeys.DELETE) %>">
		<portlet:actionURL var="deleteURL">
			<portlet:param name="struts_action" value="/message_boards/edit_category" />
			<portlet:param name="<%= Constants.CMD %>" value="<%= TrashUtil.isTrashEnabled(scopeGroupId) ? Constants.MOVE_TO_TRASH : Constants.DELETE %>" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="mbCategoryId" value="<%= String.valueOf(category.getCategoryId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete
			trash="<%= TrashUtil.isTrashEnabled(scopeGroupId) %>"
			url="<%= deleteURL %>"
		/>
	</c:if>
</liferay-ui:icon-menu>
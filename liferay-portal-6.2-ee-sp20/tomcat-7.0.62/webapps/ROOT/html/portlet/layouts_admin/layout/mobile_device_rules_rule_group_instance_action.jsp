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

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>

<%
SearchContainer searchContainer = (SearchContainer)request.getAttribute("liferay-ui:search:searchContainer");

String redirect = currentURL;

String closeRedirect = ParamUtil.getString(request, "closeRedirect");

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

MDRRuleGroupInstance mdrRuleGroupInstance = (MDRRuleGroupInstance)row.getObject();

MDRRuleGroup mdrRuleGroup = MDRRuleGroupLocalServiceUtil.getMDRRuleGroup(mdrRuleGroupInstance.getRuleGroupId());
%>

<liferay-ui:icon-menu>
	<c:if test="<%= MDRRuleGroupInstancePermissionUtil.contains(permissionChecker, mdrRuleGroupInstance.getRuleGroupInstanceId(), ActionKeys.UPDATE) %>">
		<liferay-portlet:renderURL portletName="<%= PortletKeys.MOBILE_DEVICE_SITE_ADMIN %>" varImpl="viewRuleGroupInstanceActionsURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
			<portlet:param name="struts_action" value="/mobile_device_rules/view_actions" />
			<portlet:param name="showBackURL" value="<%= Boolean.FALSE.toString() %>" />
			<portlet:param name="redirect" value='<%= HttpUtil.setParameter(redirect, liferayPortletResponse.getNamespace() + "historyKey", "mobileDeviceRules") %>' />
			<portlet:param name="ruleGroupInstanceId" value="<%= String.valueOf(mdrRuleGroupInstance.getRuleGroupInstanceId()) %>" />
		</liferay-portlet:renderURL>

		<%
		String taglibActionHandler = liferayPortletResponse.getNamespace() + "mobileDeviceActionHandler('" + viewRuleGroupInstanceActionsURL.toString() + "');";
		%>

		<liferay-ui:icon image="manage_nodes" message="manage-actions" onClick="<%= taglibActionHandler %>" url="javascript:;" />
	</c:if>

	<c:if test="<%= MDRRuleGroupInstancePermissionUtil.contains(permissionChecker, mdrRuleGroupInstance.getRuleGroupInstanceId(), ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= MDRRuleGroupInstance.class.getName() %>"
			modelResourceDescription="<%= mdrRuleGroup.getName(locale) %>"
			resourcePrimKey="<%= String.valueOf(mdrRuleGroupInstance.getRuleGroupInstanceId()) %>"
			var="permissionsURL"
			windowState="<%= LiferayWindowState.POP_UP.toString() %>"
		/>

		<liferay-ui:icon image="permissions" url="<%= permissionsURL %>" useDialog="<%= true %>" />
	</c:if>

	<c:if test="<%= MDRRuleGroupInstancePermissionUtil.contains(permissionChecker, mdrRuleGroupInstance.getRuleGroupInstanceId(), ActionKeys.DELETE) %>">
		<liferay-ui:icon-delete url='<%= "javascript:" + liferayPortletResponse.getNamespace() + "deleteRuleGroupInstance(" + mdrRuleGroupInstance.getRuleGroupInstanceId() + ");" %>' />
	</c:if>
</liferay-ui:icon-menu>
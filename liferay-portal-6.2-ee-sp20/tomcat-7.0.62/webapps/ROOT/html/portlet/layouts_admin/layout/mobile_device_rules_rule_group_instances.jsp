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
long groupId = ParamUtil.getLong(request, "groupId");
String className = ParamUtil.getString(request, "className");
long classPK = ParamUtil.getLong(request, "classPK");

PortletURL portletURL = (PortletURL)request.getAttribute("mobile_device_rules_header.jspf-portletURL");
%>

<%@ include file="/html/portlet/layouts_admin/layout/mobile_device_rules_toolbar.jspf" %>

<liferay-ui:search-container
	deltaConfigurable="<%= false %>"
	emptyResultsMessage="no-device-rules-are-configured"
	headerNames="name,description,priority"
	iteratorURL="<%= portletURL %>"
	total="<%= MDRRuleGroupInstanceServiceUtil.getRuleGroupInstancesCount(className, classPK) %>"
>
	<liferay-ui:search-container-results
		results="<%= MDRRuleGroupInstanceServiceUtil.getRuleGroupInstances(className, classPK, searchContainer.getStart(), searchContainer.getEnd(), new RuleGroupInstancePriorityComparator()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance"
		escapedModel="<%= true %>"
		keyProperty="ruleGroupInstanceId"
		modelVar="mdrRuleGroupInstance"
	>
		<liferay-portlet:renderURL portletName="<%= PortletKeys.MOBILE_DEVICE_SITE_ADMIN %>" varImpl="rowURL" windowState="<%= (themeDisplay.isStateExclusive() || Validator.equals(themeDisplay.getControlPanelCategory(), PortletCategoryKeys.MY)) ? LiferayWindowState.POP_UP.toString() : windowState.toString() %>">
			<portlet:param name="struts_action" value="/mobile_device_rules/view_actions" />
			<portlet:param name="redirect" value='<%= currentURL + "#tab=mobileDeviceRules" %>' />
			<portlet:param name="showBackURL" value="<%= themeDisplay.isStateExclusive() ? Boolean.FALSE.toString() : Boolean.TRUE.toString() %>" />
			<portlet:param name="ruleGroupInstanceId" value="<%= String.valueOf(mdrRuleGroupInstance.getRuleGroupInstanceId()) %>" />
		</liferay-portlet:renderURL>

		<%@ include file="/html/portlet/layouts_admin/layout/mobile_device_rules_rule_group_instance_columns.jspf" %>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator type="more" />
</liferay-ui:search-container>

<aui:script>
	function <portlet:namespace />mobileDeviceActionHandler(href) {
		<portlet:namespace />mobileDeviceOpenWindow(
			{
				uri: href
			}
		);
	}

	function <portlet:namespace />mobileDeviceOpenWindow(config) {
		var data = AUI().mix(
			config,
			{
				dialog: {
					width: 1024,
					on: {
						visibleChange: function(event) {
							<portlet:namespace />updateRuleGroupInstances();
						}
					}
				},
				title: Liferay.Language.get('javax.portlet.title.178')
			}
		);

		Liferay.Util.openWindow(data);
	}
</aui:script>

<c:if test="<%= themeDisplay.isStateExclusive() %>">
	<aui:script use="aui-base">
		var uniqueRuleGroupInstancesContainer = A.one('#<portlet:namespace />uniqueRuleGroupInstancesContainer');

		uniqueRuleGroupInstancesContainer.delegate(
			'click',
			function(event) {
				event.preventDefault();

				var href = event.target.attr('href');

				<portlet:namespace />mobileDeviceOpenWindow(
					{
						uri: href
					}
				);
			},
			'.mobile-device-rule a'
		);
	</aui:script>
</c:if>
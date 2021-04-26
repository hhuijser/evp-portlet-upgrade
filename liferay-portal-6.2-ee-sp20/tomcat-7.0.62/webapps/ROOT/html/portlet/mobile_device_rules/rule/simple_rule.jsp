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

<%@ include file="/html/portlet/mobile_device_rules/init.jsp" %>

<%
MDRRule rule = (MDRRule)request.getAttribute(WebKeys.MOBILE_DEVICE_RULES_RULE);

Set<String> operatingSystems = Collections.emptySet();
int tablet = 0;

String screenPhysicalHeightMax = StringPool.BLANK;
String screenPhysicalHeightMin = StringPool.BLANK;
String screenPhysicalWidthMax = StringPool.BLANK;
String screenPhysicalWidthMin = StringPool.BLANK;

String screenResolutionHeightMax = StringPool.BLANK;
String screenResolutionHeightMin = StringPool.BLANK;
String screenResolutionWidthMax = StringPool.BLANK;
String screenResolutionWidthMin = StringPool.BLANK;

if (rule != null) {
	UnicodeProperties typeSettingsProperties = rule.getTypeSettingsProperties();

	operatingSystems = SetUtil.fromArray(StringUtil.split(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_OS)));

	String tabletString = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_TABLET));

	if (tabletString.equals(StringPool.TRUE)) {
		tablet = 1;
	}
	else if (tabletString.equals(StringPool.FALSE)) {
		tablet = 2;
	}

	screenPhysicalHeightMax = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MAX));
	screenPhysicalHeightMin = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MIN));
	screenPhysicalWidthMax = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MAX));
	screenPhysicalWidthMin = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MIN));

	screenResolutionHeightMax = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MAX));
	screenResolutionHeightMin = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MIN));
	screenResolutionWidthMax = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MAX));
	screenResolutionWidthMin = GetterUtil.getString(typeSettingsProperties.get(SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MIN));
}
%>

<aui:fieldset label="operating-system-and-type">
	<aui:select multiple="<%= true %>" name="os">
		<aui:option label="any-os" selected="<%= operatingSystems.isEmpty() %>" value="" />

		<%
		Set<VersionableName> knownOperationSystems = DeviceDetectionUtil.getKnownOperatingSystems();

		for (VersionableName knownOperationSystem : knownOperationSystems) {
		%>

			<aui:option label="<%= knownOperationSystem.getName() %>" selected="<%= operatingSystems.contains(knownOperationSystem.getName()) %>" />

		<%
		}
		%>

	</aui:select>

	<aui:select label="device-type" name="tablet">
		<aui:option label="any" selected="<%= tablet == 0 %>" value="" />
		<aui:option label="tablets" selected="<%= tablet == 1 %>" value="<%= true %>" />
		<aui:option label="other-devices" selected="<%= tablet == 2 %>" value="<%= false %>" />
	</aui:select>
</aui:fieldset>

<aui:fieldset label="physical-screen-size">
	<div class="row-fields">
		<liferay-ui:message key="minimum" />

		<aui:input
			cssClass="aui-field-digits physical-screen-size-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MIN %>"
			inlineField="<%= true %>"
			label="width"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MIN %>"
			placeholder="mm"
			value="<%= screenPhysicalWidthMin %>"
		/>

		x

		<aui:input
			cssClass="aui-field-digits physical-screen-size-field-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MIN %>"
			inlineField="<%= true %>"
			label="height"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MIN %>"
			placeholder="mm"
			value="<%= screenPhysicalHeightMin %>"
		/>
	</div>

	<div class="row-fields">
		<liferay-ui:message key="maximum" />

		<aui:input
			cssClass="aui-field-digits physical-physical-screen-size-field-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MAX %>"
			inlineField="<%= true %>"
			label="width"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_WIDTH_MAX %>"
			placeholder="mm"
			value="<%= screenPhysicalWidthMax %>"
		/>

		x

		<aui:input
			cssClass="aui-field-digits screen-physical-size-field-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MAX %>"
			inlineField="<%= true %>"
			label="height"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_PHYSICAL_HEIGHT_MAX %>"
			placeholder="mm"
			value="<%= screenPhysicalHeightMax %>"
		/>
	</div>
</aui:fieldset>

<aui:fieldset label="screen-resolution">
	<div class="row-fields">
		<liferay-ui:message key="minimum" />

		<aui:input
			cssClass="aui-field-digits screen-resolution-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MIN %>"
			inlineField="<%= true %>"
			label="width"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MIN %>"
			placeholder="px"
			value="<%= screenResolutionWidthMin %>"
		/>

		x

		<aui:input
			cssClass="aui-field-digits screen-resolution-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MIN %>"
			inlineField="<%= true %>"
			label="height"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MIN %>"
			placeholder="px"
			value="<%= screenResolutionHeightMin %>"
		/>
	</div>

	<div class="row-fields">
		<liferay-ui:message key="maximum" />

		<aui:input
			cssClass="aui-field-digits screen-resolution-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MAX %>"
			inlineField="<%= true %>"
			label="width"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_WIDTH_MAX %>"
			placeholder="px"
			value="<%= screenResolutionWidthMax %>"
		/>

		x

		<aui:input
			cssClass="aui-field-digits screen-resolution-field"
			id="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MAX %>"
			inlineField="<%= true %>"
			label="height"
			name="<%= SimpleRuleHandler.PROPERTY_SCREEN_RESOLUTION_HEIGHT_MAX %>"
			placeholder="px"
			value="<%= screenResolutionHeightMax %>"
		/>
	</div>
</aui:fieldset>
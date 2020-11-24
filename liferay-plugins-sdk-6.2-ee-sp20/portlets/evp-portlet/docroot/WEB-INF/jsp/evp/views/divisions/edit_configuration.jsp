<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/WEB-INF/jsp/evp/views/init.jsp" %>

<liferay-util:include page="/WEB-INF/jsp/evp/views/header.jsp" servletContext="<%= application %>">
	<liferay-util:param name="title" value="${evpDivisionComposite.name}" />
	<liferay-util:param name="controller" value="divisions" />
	<liferay-util:param name="action" value="index" />
</liferay-util:include>

<portlet:actionURL var="updateEVPDivisionConfigurationURL">
	<portlet:param name="controller" value="divisions" />
	<portlet:param name="action" value="updateConfiguration" />
</portlet:actionURL>

<aui:form action="${updateEVPDivisionConfigurationURL}" method="post">
	<portlet:renderURL var="viewEVPDivisionURL">
		<portlet:param name="controller" value="divisions" />
		<portlet:param name="action" value="index" />
	</portlet:renderURL>

	<aui:input name="id" type="hidden" value="${evpDivisionComposite.evpDivisionId}" />

	<liferay-ui:header title="general" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ABBREVIATION}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ABBREVIATION]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL}" type="email" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL_NAME}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL_NAME]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE]}" />

	<aui:input autocomplete="on" name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_LINK_TO_EVP_GUIDELINES}" type="url" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_LINK_TO_EVP_GUIDELINES]}" />

	<liferay-ui:header title="employment-type" />

	<aui:input disabled="${true}" name="full-time" type="checkbox" value="${true}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_FULL_TIME_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_FULL_TIME_HIRE_DATE]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_FULL_TIME_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_FULL_TIME_HIRE_DATE]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FULL_TIME_SERVICE_HOURS}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FULL_TIME_SERVICE_HOURS]}" />

	<c:set value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMPLOYMENT_PART_TIME_ENABLED]}" var="partTimeEnabled" />

	<aui:input label="part-time" name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMPLOYMENT_PART_TIME_ENABLED}" onChange="${renderResponse.namespace}employmentTypeEnabledOnChange(this);" type="checkbox" value="${partTimeEnabled}" />

	<div class='displaying-part-time-group ${partTimeEnabled ? "" : "hide"}' id="<portlet:namespace />displayingPartTimeGroup">
		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK]}" />

		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_PART_TIME_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_PART_TIME_HIRE_DATE]}" />

		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_PART_TIME_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_PART_TIME_HIRE_DATE]}" />

		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_PART_TIME_SERVICE_HOURS}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_PART_TIME_SERVICE_HOURS]}" />
	</div>

	<c:set value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMPLOYMENT_TEMPORARY_ENABLED]}" var="temporaryEnabled" />

	<aui:input label="temporary" name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMPLOYMENT_TEMPORARY_ENABLED}" onChange="${renderResponse.namespace}employmentTypeEnabledOnChange(this);" type="checkbox" value="${temporaryEnabled}" />

	<div class='displaying-temporary-group ${temporaryEnabled ? "" : "hide"}' id="<portlet:namespace />displayingTemporaryGroup">
		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_TEMPORARY_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_DAYS_SINCE_TEMPORARY_HIRE_DATE]}" />

		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_TEMPORARY_HIRE_DATE}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_REQUIRED_MONTHS_SINCE_TEMPORARY_HIRE_DATE]}" />

		<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TEMPORARY_SERVICE_HOURS}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TEMPORARY_SERVICE_HOURS]}" />
	</div>

	<liferay-ui:header title="organization" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STREET_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STREET_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_CITY_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_CITY_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_ZIP_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_ZIP_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_FREE_EMAIL_DOMAIN_ALLOWED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_FREE_EMAIL_DOMAIN_ALLOWED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_URL_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_URL_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_TAX_ID_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_TAX_ID_REQUIRED]}" />

	<liferay-ui:header title="grant" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_PROPOSED_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_PROPOSED_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_SPONSORSHIP_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_SPONSORSHIP_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_MATCHING_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_TYPE_MATCHING_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_CHECK_MEMO_VISIBLE}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_CHECK_MEMO_VISIBLE]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_DECEMBER_SUBMISSION_ALLOWED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_DECEMBER_SUBMISSION_ALLOWED]}" />

	<liferay-ui:header title="service" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_FORK_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_FORK_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_ENABLED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_ENABLED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_HOURS_INCREMENT}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_HOURS_INCREMENT]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_REQUEST_CONTACT_PHONE_REQUIRED}" type="checkbox" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_REQUEST_CONTACT_PHONE_REQUIRED]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FOOD_EXPENSES}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FOOD_EXPENSES]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_LODGING_EXPENSES}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_LODGING_EXPENSES]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_SUPPLY_EXPENSES}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_SUPPLY_EXPENSES]}" />

	<aui:input name="${PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TRAVEL_EXPENSES}" type="text" value="${portletPreferencesMap[PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TRAVEL_EXPENSES]}" />

	<c:if test='${AlloyPermission.contains(themeDisplay, evpDivisionComposite, "updateConfiguration")}'>
		<aui:button-row>
			<aui:button type="submit" />

			<aui:button onClick="Liferay.Portlet.EVP.closeWindow();" value="cancel" />
		</aui:button-row>
	</c:if>
</aui:form>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />employmentTypeEnabledOnChange',
		function(node) {
			var A = AUI();

			var groupElement;

			var name = node.name;

			if (name.indexOf('part') != -1) {
				groupElement = A.one('#<portlet:namespace />displayingPartTimeGroup');
			}
			else if (name.indexOf('temporary') != -1) {
				groupElement = A.one('#<portlet:namespace />displayingTemporaryGroup');
			}

			if (node.checked) {
				groupElement.show();
			}
			else {
				groupElement.hide();
			}
		},
		['aui-base']
	);
</aui:script>
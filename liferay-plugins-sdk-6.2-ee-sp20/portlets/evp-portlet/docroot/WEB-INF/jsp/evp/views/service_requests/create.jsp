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
	<liferay-util:param name="title" value="new-service-request" />
	<liferay-util:param name="controller" value="service_requests" />
	<liferay-util:param name="action" value="index" />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

<portlet:actionURL var="addEVPServiceRequestURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
	<portlet:param name="controller" value="service_requests" />
	<portlet:param name="action" value="add" />

	<c:set var="confirmationMessage">
		<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="your-service-request-has-been-submitted-successfully.-the-evp-team-will-review-your-request-in-the-next-few-days-and-respond-within-a-week.-for-further-questions,-please-email-x." />
	</c:set>

	<portlet:param name="confirmationMessage" value="${confirmationMessage}" />
</portlet:actionURL>

<aui:form action="${addEVPServiceRequestURL}" cssClass="evp-form service-request-form" method="post" name="fm">
	<portlet:renderURL var="viewEVPServiceRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPServiceRequestsURL}" />
	<aui:input name="parentEVPServiceRequestId" type="hidden" />

	<portlet:renderURL var="viewEVPServiceRequestURL">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewService" : "view"}' />
	</portlet:renderURL>

	<aui:input name="viewEVPServiceRequestURL" type="hidden" value="${viewEVPServiceRequestURL}" />

	<c:set value="${false}" var="disabled" />

	<c:if test="${empty evpServiceRequestComposite.managerUserEmailAddressString}">
		<div class="alert alert-info">
			<liferay-ui:message key="we-were-not-able-to-retrieve-your-manager's-information.-please-contact-evp-global@liferay.com-for-assistance." />
		</div>
	</c:if>

	<c:if test="${!employmentTypeMap.containsKey(evpServiceRequestComposite.employmentType)}">
		<div class="alert alert-info">
			<liferay-ui:message key="we-were-not-able-to-retrieve-your-employment-information.-please-contact-evp-global@liferay.com-for-assistance." />
		</div>
	</c:if>

	<aui:fieldset column="${true}" id="hoursPerWeekWarning">
		<c:set var="workingHoursHelpMessage">
			<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)}" key="since-you-are-a-part-time-employee,-please-provide-the-number-of-hours-you-work-per-week-so-we-can-determine-your-evp-eligibility.-the-minimum-part-time-hours-required-is-x" />
		</c:set>

		<c:if test="${evpServiceRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}">
			<div class="alert alert-info">
				<liferay-ui:message key="${workingHoursHelpMessage}" />
			</div>
		</c:if>
	</aui:fieldset>

	<aui:fieldset column="${true}" cssClass="employee">
		<liferay-ui:header title="employee" />

		<c:if test="${evpServiceRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}">
			<aui:fieldset column="${true}" cssClass='${(evpServiceRequestComposite.employmentType != EVPConstants.EMPLOYMENT_TYPE_PART_TIME) ? "hide" : ""}' id="hoursPerWeek">
				<aui:input cssClass="permanent-editability span12" helpMessage="${workingHoursHelpMessage}" name="employmentHoursPerWeek" onChange="${renderResponse.namespace}partTimeHoursPerWeek();" required="${true}" type="text" wrapperCssClass="span12" />
			</aui:fieldset>
		</c:if>

		<aui:row fluid="${true}">
			<aui:input cssClass="permanent-editability span12" disabled="${true}" label="full-name" name="creatorUserFullName" tabindex="-1" type="text" value="${evpServiceRequestComposite.creatorUserFullName}" wrapperCssClass="span3" />

			<aui:input cssClass="permanent-editability span12" disabled="${true}" label="email-address" name="creatorEmailAddress" tabindex="-1" type="text" value="${evpServiceRequestComposite.creatorUserEmailAddressString}" wrapperCssClass="span3" />

			<aui:model-context model="<%= Phone.class %>" />

			<aui:input cssClass="span12" disabled="${disabled}" field="number" fieldParam="creatorUserPhone" helpMessage="please-provide-a-phone-number-where-we-can-reach-you" label="phone-number" name="creatorUserPhone" required="${true}" type="text" value="${evpServiceRequestComposite.creatorUserPhoneString}" wrapperCssClass="span3" />

			<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

			<aui:input cssClass="permanent-editability span12" disabled='${!AlloyPermission.contains(themeDisplay, "service_requests", "overrideManager", subsidiaryGroupId)}' helpMessage="this-is-your-manager's-email-that-is-listed-in-our-system.-if-you-believe-it-is-not-correct,-please-contact-evp-global@liferay.com" name="managerEmailAddress" onChange="${renderResponse.namespace}partTimeHoursPerWeek();" type="text" value="${evpServiceRequestComposite.managerUserEmailAddressString}" wrapperCssClass="span3" />
		</aui:row>
	</aui:fieldset>

	<aui:fieldset>
		<aui:row fluid="${true}">
			<aui:col cssClass="organization" width="${100}">
				<liferay-ui:header title="organization" />

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.organization}" model="<%= Organization.class %>" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-enter-the-name-of-the-organization-where-you-will-be-volunteering" name="organizationName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.organization.name}" wrapperCssClass="span6" />

					<aui:model-context bean="${evpServiceRequestComposite}" model="<%= Website.class %>" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-provide-the-url-of-the-service-organization.it-must-include-http" name="url" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_URL_REQUIRED) : false}" type="text" value="${evpServiceRequestComposite.requestOrganizationWebsiteURL}" wrapperCssClass="span6">
						<aui:validator name="url" />
					</aui:input>
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.requestOrganizationAddress}" model="<%= Address.class %>" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="street" name="street1" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STREET_REQUIRED) : false}" type="text" wrapperCssClass="span8" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" name="city" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_CITY_REQUIRED) : false}" type="text" wrapperCssClass="span4" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:select cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="country" name="countryId" onChange="${renderResponse.namespace}updateCountry(this.value);" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" wrapperCssClass="span3" />

					<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" name="countryHidden" type="hidden" />

					<aui:select cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="region" name="regionId" onChange="${renderResponse.namespace}updateRegion(this.value);" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED) : false}" wrapperCssClass="span3" />

					<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" name="regionHidden" type="hidden" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" name="zip" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_ZIP_REQUIRED) : false}" type="text" wrapperCssClass="span3">
						<aui:validator customValidatorRequired="${false}" errorMessage="the-zip-is-invalid" name="custom">
							function(val, fieldNode, ruleValue) {
								return !val.match('[^A-Za-z0-9\s-]+');
							}
						</aui:validator>
						<aui:validator name="maxLength">${EVPConstants.MAX_FIELD_LENGTH_ZIP}</aui:validator>
					</aui:input>

					<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-provide-the-tax-id-of-the-service-organization-also-known-as-ein-or-tin.-your-countrys-government-must-recognize-your-organization-as-a-valid-registered-public-charity-in-order-for-your-request-to-be-approved" label="tax-id" model="<%= EVPRequestOrganization.class %>" name="taxIdentificationNumber" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_TAX_ID_REQUIRED) : false}" type="text" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.contactUser}" model="<%= Contact.class %>" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-specify-the-first-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-first-name" name="contactUserFirstName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUser.firstName}" wrapperCssClass="span3" />

					<aui:input cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-specify-the-last-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-last-name" name="contactUserLastName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUser.lastName}" wrapperCssClass="span3" />

					<aui:model-context bean="${evpServiceRequestComposite.contactUserEmailAddress}" model="<%= EmailAddress.class %>" />

					<aui:input bean="${evpServiceRequestComposite.contactUserEmailAddress}" cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-enter-the-email-address-of-your-contact" label="contact-email-address" name="contactUserEmailAddress" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUserEmailAddress.address}" wrapperCssClass="span3">
						<aui:validator name="email" />
					</aui:input>

					<aui:model-context bean="${evpServiceRequestComposite.contactUserPhone}" model="<%= Phone.class %>" />

					<aui:input bean="${evpServiceRequestComposite.contactUserPhone}" cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-enter-the-phone-number-of-your-contact" label="contact-phone" name="contactUserPhone" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_REQUEST_CONTACT_PHONE_REQUIRED) : false}" type="text" value="${evpServiceRequestComposite.contactUserPhone.number}" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<c:if test="${!evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_FREE_EMAIL_DOMAIN_ALLOWED)}">
						<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

						<div class="box-section email-message span12">
							<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="important-the-contacts-email-address-needs-to-be-part-of-the-organizations-domain.-feel-free-to-email-x-if-you-have-any-questions-or-concerns." />
						</div>
					</c:if>
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.evpRequestOrganization}" model="<%= EVPRequestOrganization.class %>" />

					<aui:input bean="${evpServiceRequestComposite.evpRequestOrganization}" cssClass='span12 ${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" helpMessage="please-describe-the-goals-principles-and-or-achievements-of-the-organization" label="description-of-organization" name="evpRequestOrganizationDescription" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="textarea" value="${evpServiceRequestComposite.evpRequestOrganization.description}" wrapperCssClass="span12" />
				</aui:row>
			</aui:col>
		</aui:row>

		<aui:row cssClass="service-request" fluid="${true}">
			<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

			<aui:fieldset column="${true}">
				<aui:col cssClass="organization" width="${100}">
					<liferay-ui:header title="service-request" />

					<aui:row fluid="${true}">
						<aui:input cssClass="span12" disabled="${disabled}" field="requestedStartDate" fieldParam="requestedStartDateString" helpMessage="please-select-the-date-that-your-service-starts.-if-you-plan-to-use-pto-for-service-in-addition-to-evp-service-hours-please-include-those-pto-hours-in-your-start-date" label="start-date-of-service" name="requestedStartDateString" required="${true}" wrapperCssClass="span4" />

						<aui:input cssClass="span12" disabled="${disabled}" field="requestedEndDate" fieldParam="requestedEndDateString" helpMessage="please-select-the-date-that-your-service-ends.-if-you-plan-to-use-pto-for-service-in-addition-to-evp-service-hours-please-include-those-pto-hours-in-your-end-date" label="end-date-of-service" name="requestedEndDateString" required="${true}" wrapperCssClass="span4" />

						<c:set value="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_HOURS_INCREMENT)}" var="serviceHoursIncrement" />

						<aui:select cssClass="span12" disabled="${disabled}" helpMessage="please-select-the-total-hours-you-would-like-to-request-for-service.only-include-evp-service-hours-dont-include-any-pto-you-might-use-for-service" label="total-hours-requested" name="requestedTotalHours" required="${true}" wrapperCssClass="span4">
							<c:forEach begin="${serviceHoursIncrement}" end="40" step="${serviceHoursIncrement}" varStatus="i">
								<aui:option label="${i.index}" selected="${i.index == evpServiceRequestComposite.requestedTotalHours}" value="${i.index}" />
							</c:forEach>
						</aui:select>
					</aui:row>

					<aui:row fluid="${true}">
						<div class="alert box-section hide requested-start-date-warning span12">
							<liferay-ui:message key="the-service-start-date-you-entered-is-less-than-30-days-from-today" />
						</div>
					</aui:row>
				</aui:col>
			</aui:fieldset>

			<aui:fieldset column="${true}">
				<aui:col width="${60}">
					<aui:fieldset cssClass="box-section request-purpose" id="purposeOfService">
						<aui:field-wrapper name="choose-one-or-more-purposes-of-this-request" required="${true}">
							<aui:input cssClass="hide" label="" name="purposeOfServiceError" type="checkbox" />

							<c:forEach items="${purposeTypeMap}" var="purposeTypeEntry">
								<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="${purposeTypeEntry.value}" name="purpose${purposeTypeEntry.key}" type="checkbox" value="${fn:contains(evpServiceRequestComposite.purpose, purposeTypeEntry.key)}" />
							</c:forEach>

							<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' data-otherInput="${renderResponse.namespace}purposeOther" disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="other" name="purposeOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpServiceRequestComposite.purposeOther}" />
						</aui:field-wrapper>

						<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0) || (empty evpServiceRequestComposite.purposeOther)}" label="other-purpose" name="purposeOther" required="${true}" type="text" />
					</aui:fieldset>
				</aui:col>

				<aui:col width="${40}">
					<aui:fieldset cssClass="box-section request-people" id="onBehalfOf">
						<aui:field-wrapper name="choose-one-or-more-groups-of-people-that-this-request-is-on-behalf-of" required="${true}">
							<aui:input cssClass="hide" label="" name="onBehalfOfError" type="checkbox" />

							<c:forEach items="${behalfOfTypeMap}" var="behalfOfTypeEntry">
								<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="${behalfOfTypeEntry.value}" name="behalfOf${behalfOfTypeEntry.key}" type="checkbox" value="${fn:contains(evpServiceRequestComposite.behalfOf, behalfOfTypeEntry.key)}" />
							</c:forEach>

							<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' data-otherInput="${renderResponse.namespace}behalfOfOther" disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0)}" label="other" name="behalfOfOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpServiceRequestComposite.behalfOfOther}" />
						</aui:field-wrapper>

						<aui:input cssClass='${(evpServiceRequestComposite.parentEVPServiceRequestId > 0) ? "permanent-editability" : ""}' disabled="${disabled || (evpServiceRequestComposite.parentEVPServiceRequestId > 0) || (empty evpServiceRequestComposite.behalfOfOther)}" label="other-on-behalf-of" name="behalfOfOther" required="${true}" type="text" />
					</aui:fieldset>
				</aui:col>
			</aui:fieldset>

			<aui:fieldset column="${true}">
				<aui:input cssClass="span12" disabled="${disabled}" field="description" fieldParam="evpServiceRequestDescription" helpMessage="please-provide-a-detailed-description-of-what-you-will-be-doing-during-your-service" label="description-of-service" name="evpServiceRequestDescription" required="${true}" type="textarea" value="${evpServiceRequestComposite.description}" wrapperCssClass="span12" />

				<c:if test="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}">
					<aui:col width="${100}">
						<aui:fieldset cssClass="box-section promote-trip" id="promoteTrip">
							<aui:input disabled="${disabled}" label="i-would-like-to-request-that-this-trip-be-promoted-on-the-evp-site" name="promoteTrip" type="checkbox" />
						</aui:fieldset>
					</aui:col>
				</c:if>
			</aui:fieldset>
		</aui:row>
	</aui:fieldset>

	<c:if test='${AlloyPermission.contains(themeDisplay, "service_requests", "add", subsidiaryGroupId)}'>
		<aui:button-row cssClass="text-center">
			<aui:button class="permanent-editability" href="${viewEVPServiceRequestsURL}" value="cancel" />

			<aui:button cssClass="btn-transparent" disabled="${disabled}" type="submit" value="submit-service-request" />
		</aui:button-row>
	</c:if>
</aui:form>

<aui:script use="aui-base,aui-form-validator,liferay-dynamic-select">
	var DEFAULTS_FORM_VALIDATOR = A.config.FormValidator;

	var <portlet:namespace />EVP = Liferay.Portlet.EVP;

	DEFAULTS_FORM_VALIDATOR.RULES.required = function(val, fieldNode, ruleValue) {
		var validate = true;

		var fieldNodeId = fieldNode.get('id');

		if (fieldNodeId === '<portlet:namespace />behalfOfOther') {
			var behalfOfOtherCheckboxNode = A.one('#<portlet:namespace />behalfOfOtherCheckboxCheckbox');

			if (behalfOfOtherCheckboxNode) {
				if (behalfOfOtherCheckboxNode.get('checked') && val == '') {
					validate = false;
				}
			}
		}
		else if (fieldNodeId === '<portlet:namespace />countryId') {
			validate = val != 0;
		}
		else if (fieldNodeId === '<portlet:namespace />purposeOther') {
			var purposeOtherCheckboxNode = A.one('#<portlet:namespace />purposeOtherCheckboxCheckbox');

			if (purposeOtherCheckboxNode && purposeOtherCheckboxNode.get('checked') && val == '') {
				validate = false;
			}
		}
		else if (fieldNodeId === '<portlet:namespace />regionId') {
			var fieldDOMNode = fieldNode.getDOMNode();

			if (val == 0 && fieldDOMNode.children.length > 1 && ${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED)}) {
				validate = false;
			}
		}
		else if (val == '') {
			validate = false;
		}

		return validate;
	};

	A.mix(
		DEFAULTS_FORM_VALIDATOR.RULES,
		{
			<portlet:namespace />atleastOneCheckbox: function(val, fieldNode, ruleValue) {
				var validate = false;

				var fieldsetNode = A.one('#<portlet:namespace />' + ruleValue);

				if (fieldsetNode) {
					var checkbox = fieldsetNode.one(':checkbox:checked');

					if (checkbox) {
						validate = checkbox.get('checked');
					}
				}

				return validate;
			},

			<portlet:namespace />minimumRequiredHours: function(val, fieldNode, ruleValue) {
				var validate = true;

				if (${evpServiceRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}) {
					validate = <portlet:namespace />EVP.validatePartTimeHoursPerWeek(
						{
							hoursPerWeek: ${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)},
							namespace: '<portlet:namespace />'
						}

					);
				}

				return validate;
			},

			<portlet:namespace />validEndDate: function(val, fieldNode, ruleValue) {
				return <portlet:namespace />EVP.validateRequestedEndDate('<portlet:namespace />');
			},

			<portlet:namespace />validStartDate: function(val, fieldNode, ruleValue) {
				return <portlet:namespace />EVP.validateRequestedStartDate(
					{
						datePermissions: ${AlloyPermission.contains(themeDisplay, "service_requests", "setAnyDate", subsidiaryGroupId)},
						namespace: '<portlet:namespace />'
					}
				);
			}
		}
	);

	var rules = {
		<portlet:namespace />employmentHoursPerWeek: {
			<portlet:namespace />minimumRequiredHours: null
		},
		<portlet:namespace />onBehalfOfError: {
			<portlet:namespace />atleastOneCheckbox: 'onBehalfOf'
		},
		<portlet:namespace />purposeOfServiceError: {
			<portlet:namespace />atleastOneCheckbox: 'purposeOfService'
		},
		<portlet:namespace />requestedEndDateString: {
			<portlet:namespace />validEndDate: null
		},
		<portlet:namespace />requestedStartDateString: {
			<portlet:namespace />validStartDate: null
		}
	};

	A.mix(
		DEFAULTS_FORM_VALIDATOR.STRINGS,
		{
			<portlet:namespace />minimumRequiredHours: '<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)}" key="the-minimum-part-time-hours-required-is-x" />',
			<portlet:namespace />validEndDate: '<liferay-ui:message key="the-requested-end-date-must-be-after-or-equal-to-the-request-start-date" unicode="${true}" />',
			<portlet:namespace />validStartDate: '<liferay-ui:message key="the-requested-start-date-must-be-after-today's-date" />'
		}
	);

	var fieldStrings = {
		<portlet:namespace />onBehalfOfError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-group-of-people-that-this-request-is-on-behalf-of" />'
		},
		<portlet:namespace />purposeOfServiceError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-purpose-of-this-request" />'
		}
	};

	if (${evpServiceRequestComposite.parentEVPServiceRequestId == 0}) {
		new A.FormValidator(
			{
				boundingBox: '#<portlet:namespace />fm',
				fieldStrings: fieldStrings,
				rules: rules,
				showAllMessages: true,
				validateOnBlur: true,
				validateOnInput: true
			}
		);
	}

	new Liferay.DynamicSelect(
		[
			{
				select: '<portlet:namespace />countryId',
				selectData: Liferay.Address.getCountries,
				selectDesc: 'nameCurrentValue',
				selectId: 'countryId',
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />countryHidden', ${(evpServiceRequestComposite.requestOrganizationAddress.countryId > 0) ? evpServiceRequestComposite.requestOrganizationAddress.countryId : evpServiceRequestComposite.creatorEvpSubsidiaryCountryId})
			},
			{
				select: '<portlet:namespace />regionId',
				selectData: Liferay.Address.getRegions,
				selectDesc: 'name',
				selectId: 'regionId',
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />regionHidden', ${(evpServiceRequestComposite.requestOrganizationAddress.regionId > 0) ? evpServiceRequestComposite.requestOrganizationAddress.regionId : 0})
			}
		]
	);
</aui:script>

<aui:script>
	function <portlet:namespace />partTimeHoursPerWeek() {
		Liferay.Portlet.EVP.validatePartTimeHoursPerWeek(
			{
				hoursPerWeek: ${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)},
				namespace: '<portlet:namespace />'
			}
		);
	}

	function <portlet:namespace />toggleOtherInput(id) {
		Liferay.Portlet.EVP.toggleOtherInput(id);
	}

	function <portlet:namespace />updateCountry(value) {
		Liferay.Portlet.EVP.setHiddenInput(
			{
				namespace: '<portlet:namespace />',
				node: 'countryHidden',
				value: value
			}
		);
	}

	function <portlet:namespace />updateRegion(value) {
		Liferay.Portlet.EVP.setHiddenInput(
			{
				namespace: '<portlet:namespace />',
				node: 'regionHidden',
				value: value
			}
		);
	}

	Liferay.on(
		'portletReady',
		function(event) {
			if (event.portletId === '${PortletKeys.EVP}') {
				var EVP = Liferay.Portlet.EVP;

				if ((${empty evpServiceRequestComposite.managerUserEmailAddressString} && ${!AlloyPermission.contains(themeDisplay, "service_requests", "overrideManager", subsidiaryGroupId)}) || ${!employmentTypeMap.containsKey(evpServiceRequestComposite.employmentType)} || (${evpServiceRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME} && (EVP.getEmploymentHoursPerWeek('<portlet:namespace />') < ${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)}))) {
					EVP.setInputDisabled(true);
				}
			}
		}
	);
</aui:script>
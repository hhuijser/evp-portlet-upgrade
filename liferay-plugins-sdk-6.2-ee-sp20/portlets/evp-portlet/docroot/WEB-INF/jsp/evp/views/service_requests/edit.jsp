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
	<liferay-util:param name="title" value="edit-service-request" />
	<liferay-util:param name="controller" value="${controllerPath}" />
	<liferay-util:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<c:if test="${(evpServiceRequestComposite.status == EVPWorkflowConstants.SERVICE_STATUS_MORE_INFO_FROM_USER) && (evpServiceRequestComposite.userId == themeDisplay.userId)}">
	<div class="portlet-msg-info">
		<liferay-ui:message
			arguments="${evpServiceRequestComposite.mostRecentComment}"
			key="the-evp-team-requested-the-following-x"
		/>
	</div>
</c:if>

<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

<aui:form cssClass="evp-form service-request-form" method="post" name="fm">
	<portlet:renderURL var="viewEVPServiceRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPServiceRequestsURL}" />
	<aui:input name="id" type="hidden" value="${evpServiceRequestComposite.evpServiceRequestId}" />
	<aui:input name="className" type="hidden" value="<%= WorkflowInstance.class.getName() %>" />
	<aui:input name="classPK" type="hidden" value="${evpServiceRequestComposite.workflowInstanceId}" />
	<aui:input name="employmentHoursPerWeek" type="hidden" value="${evpServiceRequestComposite.employmentHoursPerWeek}" />
	<aui:input name="parentMessageId" type="hidden" value="${evpServiceRequestComposite.publicMessageId}" />
	<aui:input name="threadId" type="hidden" value="${evpServiceRequestComposite.publicThreadId}" />

	<portlet:renderURL var="viewEVPServiceRequestURL">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewService" : "view"}' />
	</portlet:renderURL>

	<aui:input name="viewEVPServiceRequestURL" type="hidden" value="${viewEVPServiceRequestURL}" />

	<c:set value="${false}" var="disabled" />

	<aui:fieldset column="${true}" cssClass="employee">
		<liferay-ui:header title="employee" />

		<aui:row fluid="${true}">
			<aui:input cssClass="permanently-disabled span12" disabled="${true}" label="full-name" name="creatorUserFullName" tabindex="-1" type="text" value="${evpServiceRequestComposite.creatorUserFullName}" wrapperCssClass="span3" />

			<aui:input cssClass="permanently-disabled span12" disabled="${true}" label="email-address" name="creatorEmailAddress" tabindex="-1" type="text" value="${evpServiceRequestComposite.creatorUserEmailAddressString}" wrapperCssClass="span3" />

			<aui:model-context bean="${evpServiceRequestComposite.creatorUserPhone}" model="<%= Phone.class %>" />

			<aui:input cssClass="span12" disabled="${disabled}" field="number" fieldParam="creatorUserPhone" helpMessage="please-provide-a-phone-number-where-we-can-reach-you" label="phone-number" name="creatorUserPhone" required="${true}" type="text" value="${evpServiceRequestComposite.creatorUserPhoneString}" wrapperCssClass="span3" />

			<aui:input cssClass="permanent-editability span12" disabled='${disabled || !AlloyPermission.contains(themeDisplay, "service_requests", "override_manager")}' helpMessage="this-is-your-manager's-email-that-is-listed-in-our-system.-if-you-believe-it-is-not-correct,-please-contact-evp-global@liferay.com" label="manager-email-address" name="managerUserEmailAddress" required="${true}" type="text" value="${evpServiceRequestComposite.managerUserEmailAddressString}" wrapperCssClass="span3" />
		</aui:row>
	</aui:fieldset>

	<aui:fieldset>
		<aui:row fluid="${true}">
			<aui:col cssClass="organization" width="${100}">
				<liferay-ui:header title="organization" />

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.organization}" model="<%= Organization.class %>" />

					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-enter-the-name-of-the-organization-where-you-will-be-volunteering" name="organizationName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.organization.name}" wrapperCssClass="span6" />

					<aui:model-context bean="${evpServiceRequestComposite}" model="<%= Website.class %>" />

					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-provide-the-url-of-the-service-organization.it-must-include-http" name="url" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_URL_REQUIRED) : false}" type="text" value="${evpServiceRequestComposite.requestOrganizationWebsiteURL}" wrapperCssClass="span6">
						<aui:validator name="url" />
					</aui:input>
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpServiceRequestComposite.requestOrganizationAddress}" model="<%= Address.class %>" />

					<aui:input cssClass="span12" disabled="${disabled}" label="street" name="street1" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STREET_REQUIRED) : false}" type="text" wrapperCssClass="span8" />

					<aui:input cssClass="span12" disabled="${disabled}" name="city" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_CITY_REQUIRED) : false}" type="text" wrapperCssClass="span4" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:select cssClass="span12" disabled="${disabled}" label="country" name="countryId" onChange="${renderResponse.namespace}updateCountry(this.value);" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" wrapperCssClass="span3" />

					<aui:input disabled="${disabled}" name="countryHidden" type="hidden" />

					<aui:select cssClass="span12" disabled="${disabled}" label="region" name="regionId" onChange="${renderResponse.namespace}updateRegion(this.value);" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED) : false}" wrapperCssClass="span3" />

					<aui:input disabled="${disabled}" name="regionHidden" type="hidden" />

					<aui:input cssClass="span12" disabled="${disabled}" name="zip" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_ZIP_REQUIRED) : false}" type="text" wrapperCssClass="span3">
						<aui:validator customValidatorRequired="${false}" errorMessage="the-zip-is-invalid" name="custom">
							function(val, fieldNode, ruleValue) {
								return !val.match('[^A-Za-z0-9\s-]+');
							}
						</aui:validator>
						<aui:validator name="maxLength">${EVPConstants.MAX_FIELD_LENGTH_ZIP}</aui:validator>
					</aui:input>

					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-provide-the-tax-id-of-the-service-organization-also-known-as-ein-or-tin.-your-countrys-government-must-recognize-your-organization-as-a-valid-registered-public-charity-in-order-for-your-request-to-be-approved" label="tax-id" name="taxIdentificationNumber" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_TAX_ID_REQUIRED) : false}" type="text" value="${evpServiceRequestComposite.taxIdentificationNumber}" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-specify-the-first-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-first-name" name="contactUserFirstName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUserFirstName}" wrapperCssClass="span3" />

					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-specify-the-last-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-last-name" name="contactUserLastName" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUserLastName}" wrapperCssClass="span3" />

					<aui:input bean="${evpServiceRequestComposite.contactUserEmailAddress}" cssClass="span12" disabled="${disabled}" helpMessage="please-enter-the-email-address-of-your-contact" label="contact-email-address" name="contactUserEmailAddress" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="text" value="${evpServiceRequestComposite.contactUserEmailAddress.address}" wrapperCssClass="span3">
						<aui:validator name="email" />
					</aui:input>

					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-enter-the-phone-number-of-your-contact" label="contact-phone" name="contactUserPhone" required="${(evpServiceRequestComposite.parentEVPServiceRequestId == 0) ? evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_REQUEST_CONTACT_PHONE_REQUIRED) : false}" type="text" value="${evpServiceRequestComposite.contactUserPhone.number}" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<c:if test="${!evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_FREE_EMAIL_DOMAIN_ALLOWED)}">
						<div class="box-section email-message span12">
							<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="important-the-contacts-email-address-needs-to-be-part-of-the-organizations-domain.-feel-free-to-email-x-if-you-have-any-questions-or-concerns." />
						</div>
					</c:if>
				</aui:row>

				<aui:row fluid="${true}">
					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-describe-the-goals-principles-and-or-achievements-of-the-organization" label="description-of-organization" name="evpRequestOrganizationDescription" required="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}" type="textarea" value="${evpServiceRequestComposite.evpRequestOrganizationDescription}" wrapperCssClass="span12" />
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
								<aui:input disabled="${disabled}" label="${purposeTypeEntry.value}" name="purpose${purposeTypeEntry.key}" type="checkbox" value="${fn:contains(evpServiceRequestComposite.purpose, purposeTypeEntry.key)}" />
							</c:forEach>

							<aui:input data-otherInput="${renderResponse.namespace}purposeOther" disabled="${disabled}" label="other" name="purposeOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpServiceRequestComposite.purposeOther}" />
						</aui:field-wrapper>

						<aui:input disabled="${disabled || (empty evpServiceRequestComposite.purposeOther)}" label="other-purpose" name="purposeOther" required="${true}" type="text" />
					</aui:fieldset>
				</aui:col>

				<aui:col width="${40}">
					<aui:fieldset cssClass="box-section request-people" id="onBehalfOf">
						<aui:field-wrapper name="choose-one-or-more-groups-of-people-that-this-request-is-on-behalf-of" required="${true}">
							<aui:input cssClass="hide" label="" name="onBehalfOfError" type="checkbox" />

							<c:forEach items="${behalfOfTypeMap}" var="behalfOfTypeEntry">
								<aui:input disabled="${disabled}" label="${behalfOfTypeEntry.value}" name="behalfOf${behalfOfTypeEntry.key}" type="checkbox" value="${fn:contains(evpServiceRequestComposite.behalfOf, behalfOfTypeEntry.key)}" />
							</c:forEach>

							<aui:input data-otherInput="${renderResponse.namespace}behalfOfOther" disabled="${disabled}" label="other" name="behalfOfOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpServiceRequestComposite.behalfOfOther}" />
						</aui:field-wrapper>

						<aui:input disabled="${disabled || (empty evpServiceRequestComposite.behalfOfOther)}" label="other-on-behalf-of" name="behalfOfOther" required="${true}" type="text" />
					</aui:fieldset>
				</aui:col>
			</aui:fieldset>

			<aui:fieldset column="${true}">
				<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-provide-a-detailed-description-of-what-you-will-be-doing-during-your-service" label="description-of-service" name="evpServiceRequestDescription" required="${true}" type="textarea" value="${evpServiceRequestComposite.description}" wrapperCssClass="span12" />

				<c:if test="${evpServiceRequestComposite.parentEVPServiceRequestId == 0}">
					<aui:col width="${100}">
						<aui:fieldset cssClass="box-section promote-trip" id="promoteTrip">
							<aui:input disabled="${disabled}" label="i-would-like-to-request-that-this-trip-be-promoted-on-the-evp-site" name="promoteTrip" type="checkbox" value="${evpServiceRequestComposite.promoteTrip}" />
						</aui:fieldset>
					</aui:col>
				</c:if>
			</aui:fieldset>
		</aui:row>
	</aui:fieldset>

	<c:if test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "verify")}'>
		<aui:fieldset column="${true}" cssClass="service-request">
			<liferay-ui:header title="proof-of-service-admin" />

			<aui:input cssClass="span12" disabled="${disabled}" name="parentEVPServiceRequestId" required="${true}" type="text" value="${evpServiceRequestComposite.parentEVPServiceRequestId}" wrapperCssClass="span12">
				<aui:validator name="parentEVPServiceRequestId" />
			</aui:input>

			<aui:row fluid="${true}">
				<fmt:formatDate pattern="MM/dd/yyyy" value="${evpServiceRequestComposite.confirmedStartDate}" var="confirmedStartDateString" />

				<aui:input cssClass="span12" disabled="${disabled}" helpMessage="must-be-in-format-mm-dd-yyyy" label="confirmed-start-date" name="confirmedStartDateString" type="text" value="${confirmedStartDateString}" wrapperCssClass="span4" />

				<fmt:formatDate pattern="MM/dd/yyyy" value="${evpServiceRequestComposite.confirmedEndDate}" var="confirmedEndDateString" />

				<aui:input cssClass="span12" disabled="${disabled}" helpMessage="must-be-in-format-mm-dd-yyyy" label="confirmed-end-date" name="confirmedEndDateString" type="text" value="${confirmedEndDateString}" wrapperCssClass="span4" />

				<aui:input cssClass="span12" disabled="${disabled}" label="confirmed-total-hours" name="confirmedTotalHours" type="text" value="${evpServiceRequestComposite.confirmedTotalHours}" wrapperCssClass="span4" />
			</aui:row>

			<aui:input cssClass="span12" disabled="${disabled}" label="benefit-to-contacts-organization" name="contactBenefit" type="textarea" value="${evpServiceRequestComposite.contactBenefit}" wrapperCssClass="span12" />

			<aui:input cssClass="span12" disabled="${disabled}" label="comments-from-contact" name="contactComments" type="textarea" value="${evpServiceRequestComposite.contactComments}" wrapperCssClass="span12" />

		</aui:fieldset>
	</c:if>

	<aui:fieldset column="${true}" cssClass="service-request">
		<aui:row fluid="${true}">
			<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-provide-any-additional-notes-you-want-the-reviewers-to-know" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="comments" required="${true}" type="textarea" wrapperCssClass="span12" />
		</aui:row>
	</aui:fieldset>

	<aui:button-row cssClass="text-center">
		<aui:button href="${viewEVPServiceRequestsURL}" value="cancel" />

		<c:choose>
			<c:when test='${controllerPath == "reviewer_dashboard"}'>
				<portlet:actionURL var="updateEVPServiceRequestURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
					<portlet:param name="controller" value="service_requests" />
					<portlet:param name="action" value="update" />

						<c:set var="successMessage">
							<liferay-ui:message key="the-service-request-was-updated-successfully" />
						</c:set>

					<portlet:param name="successMessage" value="${successMessage}" />
				</portlet:actionURL>

				<aui:button disabled="${disabled}" onClick="form.action = '${updateEVPServiceRequestURL}';" type="submit" />
			</c:when>
			<c:otherwise>
				<c:if test='${(controllerPath != "reviewer_dashboard") && AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "setOwnStatus")}'>
					<portlet:actionURL var="setOwnStatusURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
						<portlet:param name="controller" value="service_requests" />
						<portlet:param name="action" value="setOwnStatus" />

						<c:set var="successMessage">
							<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="your-service-request-has-been-edited-successfully.-the-evp-team-will-review-your-request-in-the-next-few-days-and-respond-within-a-week.-for-further-questions,-please-email-x." />
						</c:set>

						<portlet:param name="successMessage" value="${successMessage}" />

						<portlet:param name="transitionName" value="${EVPWorkflowConstants.SERVICE_TRANSITION_RESUBMIT}" />
					</portlet:actionURL>

					<aui:button id="${EVPWorkflowConstants.SERVICE_TRANSITION_RESUBMIT}" onClick="form.action = '${setOwnStatusURL}';" type="submit" value="${EVPWorkflowConstants.SERVICE_TRANSITION_LABEL_RESUBMIT}" />
				</c:if>
			</c:otherwise>
		</c:choose>
	</aui:button-row>

	<c:if test="${evpServiceRequestComposite.publicMessagesCount > 1}">
		<liferay-ui:header showBackURL="false" title="comments" />

		<liferay-ui:discussion
			className="<%= WorkflowInstance.class.getName() %>"
			classPK="${evpServiceRequestComposite.workflowInstanceId}"
			formAction="${setStatusURL}"
			formName="fm"
			hideControls="${true}"
			ratingsEnabled="${false}"
			redirect="<%= PortalUtil.getCurrentURL(request) %>"
			userId="${themeDisplay.userId}"
		/>
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

			if (purposeOtherCheckboxNode) {
				if (purposeOtherCheckboxNode.get('checked') && val == '') {
					validate = false;
				}
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
			<portlet:namespace />validStartDate: '<liferay-ui:message key="the-requested-start-date-must-be-after-today's-date" />',
			<portlet:namespace />validZip: '<%= UnicodeLanguageUtil.get(pageContext, "the-zip-is-invalid") %>'
		}
	);

	var fieldStrings = {
		<portlet:namespace />contactUserPhone: {
			required: '<liferay-ui:message key="contact-phone-number-is-not-valid" />'
		},
		<portlet:namespace />creatorUserPhone: {
			required: '<liferay-ui:message key="phone-number-is-not-valid" />'
		},
		<portlet:namespace />onBehalfOfError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-group-of-people-that-this-request-is-on-behalf-of" />'
		},
		<portlet:namespace />purposeOfServiceError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-purpose-of-this-request" />'
		}
	};

	if (${evpServiceRequestComposite.parentEVPServiceRequestId > 0}) {
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
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />countryHidden', '${evpServiceRequestComposite.requestOrganizationAddress.countryId}')
			},
			{
				select: '<portlet:namespace />regionId',
				selectData: Liferay.Address.getRegions,
				selectDesc: 'name',
				selectId: 'regionId',
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />regionHidden', '${evpServiceRequestComposite.requestOrganizationAddress.regionId}')
			}
		]
	);
</aui:script>

<aui:script>
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
</aui:script>
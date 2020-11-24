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
	<liferay-util:param name="title" value="new-grant-request" />
	<liferay-util:param name="controller" value="grant_requests" />
	<liferay-util:param name="action" value="index" />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<aui:model-context bean="${evpGrantRequestComposite}" model="<%= EVPGrantRequest.class %>" />

<portlet:actionURL var="addEVPGrantRequestURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
	<portlet:param name="controller" value="grant_requests" />
	<portlet:param name="action" value="add" />

	<c:set var="confirmationMessage">
		<liferay-ui:message arguments="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="your-grant-request-has-been-submitted-successfully.-the-evp-team-will-review-your-request-in-the-next-few-days-and-respond-within-a-week.-for-further-questions,-please-email-x." />
	</c:set>

	<portlet:param name="confirmationMessage" value="${confirmationMessage}" />
</portlet:actionURL>

<aui:form action="${addEVPGrantRequestURL}" cssClass="evp-form grant-request-form" enctype="multipart/form-data" method="post">
	<portlet:renderURL var="viewEVPGrantRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexGrant" : "index"}' />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPGrantRequestsURL}" />
	<aui:input name="parentEVPGrantRequestId" type="hidden" />

	<portlet:renderURL var="viewEVPGrantRequestURL">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewGrant" : "view"}' />
	</portlet:renderURL>

	<aui:input name="viewEVPGrantRequestURL" type="hidden" value="${viewEVPGrantRequestURL}" />

	<c:set value="${false}" var="disabled" />
	<c:set value='${(evpGrantRequestComposite.parentEVPGrantRequestId > 0) ? "permanent-editability" : ""}' var="permanentEditabilityCSSClass" />

	<c:if test="${!employmentTypeMap.containsKey(evpGrantRequestComposite.employmentType)}">
		<div class="alert alert-info">
			<liferay-ui:message key="we-were-not-able-to-retrieve-your-employment-information.-please-contact-evp-global@liferay.com-for-assistance." />
		</div>
	</c:if>

	<aui:fieldset column="${true}" id="hoursPerWeekWarning">
		<c:set var="workingHoursHelpMessage">
			<liferay-ui:message arguments="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)}" key="since-you-are-a-part-time-employee,-please-provide-the-number-of-hours-you-work-per-week-so-we-can-determine-your-evp-eligibility.-the-minimum-part-time-hours-required-is-x" />
		</c:set>

		<c:if test="${evpGrantRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}">
			<div class="alert alert-info">
				<liferay-ui:message key="${workingHoursHelpMessage}" />
			</div>
		</c:if>
	</aui:fieldset>

	<aui:fieldset column="${true}" cssClass="employee">
		<liferay-ui:header title="employee" />

		<c:if test="${evpGrantRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}">
			<aui:fieldset column="${true}" cssClass='${(evpGrantRequestComposite.employmentType != EVPConstants.EMPLOYMENT_TYPE_PART_TIME) ? "hide" : ""}' id="hoursPerWeek">
				<aui:input cssClass="permanent-editability span12" helpMessage="${workingHoursHelpMessage}" name="employmentHoursPerWeek" onChange="${renderResponse.namespace}partTimeHoursPerWeek();" required="${true}" type="text" wrapperCssClass="span12" />
			</aui:fieldset>
		</c:if>

		<aui:row fluid="${true}">
			<aui:input cssClass="permanent-editability span12" disabled="${true}" label="full-name" name="creatorUserFullName" tabindex="-1" type="text" value="${evpGrantRequestComposite.creatorUserFullName}" wrapperCssClass="span4" />

			<aui:input cssClass="permanent-editability span12" disabled="${true}" label="email-address" name="creatorEmailAddress" tabindex="-1" type="text" value="${evpGrantRequestComposite.creatorUserEmailAddressString}" wrapperCssClass="span4" />

			<aui:model-context model="<%= Phone.class %>" />

			<aui:input cssClass="span12" disabled="${disabled}" field="number" fieldParam="creatorUserPhone" helpMessage="please-provide-a-phone-number-where-we-can-reach-you" label="phone-number" name="creatorUserPhone" required="${true}" type="text" value="${evpGrantRequestComposite.creatorUserPhoneString}" wrapperCssClass="span4" />
		</aui:row>
	</aui:fieldset>

	<aui:fieldset>
		<aui:row fluid="${true}">
			<aui:col cssClass="organization" width="${100}">
				<liferay-ui:header title="organization" />

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpGrantRequestComposite.organization}" model="<%= Organization.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-enter-the-name-of-the-organization-where-you-would-like-the-grant-to-be-sent-or-where-you-will-be-volunteering" name="organizationName" required="${evpGrantRequestComposite.parentEVPGrantRequestId == 0}" type="text" value="${evpGrantRequestComposite.organization.name}" wrapperCssClass="span6" />

					<aui:model-context bean="${evpGrantRequestComposite}" model="<%= Website.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-provide-the-url-of-the-grant-or-service-organization.it-must-include-http" name="url" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_URL_REQUIRED) : false}" type="text" value="${evpGrantRequestComposite.requestOrganizationWebsiteURL}" wrapperCssClass="span6">
						<aui:validator name="url" />
					</aui:input>
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpGrantRequestComposite.requestOrganizationAddress}" model="<%= Address.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-enter-the-address-of-the-organization.-this-is-where-the-grant-check-will-be-mailed-if-applicable" label="street" name="street1" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STREET_REQUIRED) : false}" type="text" wrapperCssClass="span8" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" name="city" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_CITY_REQUIRED) : false}" type="text" wrapperCssClass="span4" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:select cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="country" name="countryId" onChange="${renderResponse.namespace}updateCountry(this.value);" required="${evpGrantRequestComposite.parentEVPGrantRequestId == 0}" wrapperCssClass="span3" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" name="countryHidden" type="hidden" />

					<aui:select cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="region" name="regionId" onChange="${renderResponse.namespace}updateRegion(this.value);" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED) : false}"  wrapperCssClass="span3" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" name="regionHidden" type="hidden" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" name="zip" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_ZIP_REQUIRED) : false}" type="text" wrapperCssClass="span3">
						<aui:validator customValidatorRequired="${false}" errorMessage="the-zip-is-invalid" name="custom">
							function(val, fieldNode, ruleValue) {
								return !val.match('[^A-Za-z0-9\s-]+');
							}
						</aui:validator>
						<aui:validator name="maxLength">${EVPConstants.MAX_FIELD_LENGTH_ZIP}</aui:validator>
					</aui:input>

					<aui:model-context bean="${evpGrantRequestComposite}" model="<%= EVPGrantRequest.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-provide-the-tax-id-of-the-grant-or-service-organization-also-known-as-ein-or-tin.-your-countrys-government-must-recognize-your-organization-as-a-valid-registered-public-charity-in-order-for-your-request-to-be-approved" label="tax-id" name="taxIdentificationNumber" required="${(evpGrantRequestComposite.parentEVPGrantRequestId == 0) ? evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_TAX_ID_REQUIRED) : false}" type="text" value="${evpGrantRequestComposite.taxIdentificationNumber}" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpGrantRequestComposite.contactUser}" model="<%= User.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-specify-the-first-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-first-name" name="contactUserFirstName" type="text" value="${evpGrantRequestComposite.contactUser.firstName}" wrapperCssClass="span3" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-specify-the-last-name-of-a-contact-person-in-the-organization-that-can-be-contacted-to-ask-additional-details-and-to-let-them-know-about-the-program-if-necessary" label="contact-last-name" name="contactUserLastName" type="text" value="${evpGrantRequestComposite.contactUser.lastName}" wrapperCssClass="span3" />

					<aui:model-context bean="${evpGrantRequestComposite.contactUserEmailAddress}" model="<%= EmailAddress.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-enter-the-email-address-of-your-contact" label="contact-email-address" name="contactUserEmailAddress" type="text" value="${evpGrantRequestComposite.contactUserEmailAddress.address}" wrapperCssClass="span3">
						<aui:validator name="email" />
					</aui:input>

					<aui:model-context bean="${evpGrantRequestComposite.contactUserPhone}"  model="<%= Phone.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-enter-the-phone-number-of-your-contact" label="contact-phone" name="contactUserPhone" type="text" value="${evpGrantRequestComposite.contactUserPhone.number}" wrapperCssClass="span3" />
				</aui:row>

				<aui:row fluid="${true}">
					<aui:model-context bean="${evpGrantRequestComposite.evpRequestOrganization}" model="<%= EVPRequestOrganization.class %>" />

					<aui:input cssClass="span12 ${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" helpMessage="please-describe-the-goals-principles-and-or-achievements-of-the-organization" label="description-of-organization" name="evpRequestOrganizationDescription" required="${evpGrantRequestComposite.parentEVPGrantRequestId == 0}" type="textarea" value="${evpGrantRequestComposite.evpRequestOrganizationDescription}" wrapperCssClass="span12" />
				</aui:row>
			</aui:col>
		</aui:row>

		<aui:row cssClass="grant-request" fluid="${true}">
			<aui:model-context bean="${evpGrantRequestComposite}" model="<%= EVPGrantRequest.class %>" />

			<aui:fieldset id="grantRequestType">
				<liferay-ui:header title="grant-request" />

				<aui:field-wrapper cssClass="box-section request-type" name='${(fn:length(grantTypeMap) == 1) ? "please-fill-out-the-following-information-regarding-your-grant-request" : "choose-one-or-more-request-types"}' required="${true}">
					<c:set value="choose-this-if-you-already-donated-funds-to-a-nonprofit-and-you-would-like-your-donation-to-be-matched-donation-receipt-required-for-match.-the-match-will-be-sent-directly-to-the-nonprofit-and-not-to-you" var="matching" />
					<c:set value="choose-this-if-you-want-to-request-funds-to-be-donated-to-support-a-nonprofit.the-funds-will-be-sent-directly-to-the-nonprofit-and-not-to-you" var="proposed" />
					<c:set value="choose-this-if-you-have-been-approved-for-a-service-trip-and-you-would-like-to-get-a-reimbursement-to-cover-eligible-trip-expenses.-the-reimbursement-will-be-sent-directly-to-you" var="sponsorship" />

					<aui:input cssClass="hide" label="" name="grantRequestTypeError" type="checkbox" />

					<aui:model-context model="<%= EVPGrantTransaction.class %>" />

					<aui:row fluid="${true}">
						<c:forEach items="${grantTypeMap}" var="grantTypeEntry">
							<c:set value="${evpGrantRequestComposite.evpGrantTransactionCompositesMap[grantTypeEntry.value]}" var="evpGrantTransactionComposite" />

							<c:if test="${evpGrantRequestComposite.getEvpGrantTransactionsProperty(grantTypeEntry.key)}">
								<aui:col cssClass="grant-type" width="${30}">
									<aui:field-wrapper>
										<aui:input checked="${(evpGrantTransactionComposite != null) || (fn:length(grantTypeMap) == 1)}" data-grantKey="${grantTypeEntry.key}" disabled="${disabled}" helpMessage="${pageScope[grantTypeEntry.value]}" label="${grantTypeEntry.value}" name="grantType${grantTypeEntry.key}" onChange="${renderResponse.namespace}updateGrantType(this.id);" type="checkbox" />
									</aui:field-wrapper>

									<aui:fieldset id="${grantTypeEntry.key}Fieldset">
										<fmt:formatNumber groupingUsed="${false}" maxFractionDigits="0" value="${evpGrantTransactionComposite.amount}" var="grantAmount" />

										<aui:field-wrapper cssClass="span12">
											<aui:input cssClass="span12" disabled="${disabled}" label="grant-amount" name="${grantTypeEntry.key}Amount" type="text" value="${grantAmount}" />
										</aui:field-wrapper>

										<c:if test="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_CHECK_MEMO_VISIBLE) && !evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED)}">
											<aui:field-wrapper cssClass="span12">
												<aui:input cssClass="span12" disabled="${disabled}" field="note" fieldParam="${grantTypeEntry.key}Note" label="grant-check-memo" name="${grantTypeEntry.key}Note" type="text" value="${evpGrantTransactionComposite.note}" />
											</aui:field-wrapper>
										</c:if>

										<c:if test="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED) && (grantTypeEntry.key != EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP)}">
											<aui:field-wrapper cssClass="span12">
												<aui:input cssClass="span12" disabled="${disabled}" label="bank-name" name="${grantTypeEntry.key}BankName" type="text" value="${evpGrantTransactionComposite.bankName}" />
											</aui:field-wrapper>

											<aui:field-wrapper cssClass="span12">
												<aui:input cssClass="span12" disabled="${disabled}" label="international-bank-account-number-iban" name="${grantTypeEntry.key}BankIBANCode" type="text" value="${evpGrantTransactionComposite.bankIBANCode}" />
											</aui:field-wrapper>

											<aui:field-wrapper cssClass="span12">
												<aui:input cssClass="span12" disabled="${disabled}" label="bank-identifier-code-bic-or-swift" name="${grantTypeEntry.key}BankBICCode" type="text" value="${evpGrantTransactionComposite.bankBICCode}" />
											</aui:field-wrapper>

											<aui:field-wrapper cssClass="span12">
												<aui:input cssClass="span12" disabled="${disabled}" helpMessage="enter-additional-grant-information-like-purpose-of-use-bank-account-type-bank-branch-name-name-bank-account-is-under-etc" label="additional-info" name="${grantTypeEntry.key}PurposeOfUse" type="text" value="${evpGrantTransactionComposite.purposeOfUse}" />
											</aui:field-wrapper>
										</c:if>

										<c:if test="${grantTypeEntry.key == EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}">
											<aui:fieldset>
												<aui:field-wrapper cssClass="span12">
													<aui:input cssClass="span12" disabled="${disabled}" label="matching-grant-receipt" name="matchingGrantReceiptFile" type="file" />

													<liferay-ui:message key="please-upload-a-scan-of-the-receipt-for-the-donation-you-request-to-be-matched" />
												</aui:field-wrapper>
											</aui:fieldset>
										</c:if>
									</aui:fieldset>
								</aui:col>
							</c:if>
						</c:forEach>
					</aui:row>
				</aui:field-wrapper>
			</aui:fieldset>

			<aui:row fluid="${true}">
				<aui:col width="${60}">
					<aui:model-context bean="${evpGrantRequestComposite}" model="<%= EVPGrantRequest.class %>" />

					<aui:fieldset cssClass="box-section request-purpose" id="purposeOfGrant">
						<aui:field-wrapper name="choose-one-or-more-purposes-of-this-request" required="${true}">
							<aui:input cssClass="hide" label="" name="purposeOfGrantError" type="checkbox" />

							<c:forEach items="${purposeTypeMap}" var="purposeTypeEntry">
								<aui:input cssClass="${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="${purposeTypeEntry.value}" name="purpose${purposeTypeEntry.key}" type="checkbox" value="${fn:contains(evpGrantRequestComposite.purpose, purposeTypeEntry.key)}" />
							</c:forEach>

							<aui:input cssClass="${permanentEditabilityCSSClass}" data-otherInput="${renderResponse.namespace}purposeOther" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="other" name="purposeOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpGrantRequestComposite.purposeOther}" />
						</aui:field-wrapper>

						<aui:input cssClass="${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="other-purpose" name="purposeOther" required="${true}" type="text" value="${evpGrantRequestComposite.purposeOther}" />
					</aui:fieldset>
				</aui:col>

				<aui:col width="${40}">
					<aui:fieldset cssClass="box-section request-people" id="onBehalfOf">
						<aui:field-wrapper name="choose-one-or-more-groups-of-people-that-this-request-is-on-behalf-of" required="${true}">
							<aui:input cssClass="hide" label="" name="onBehalfOfError" type="checkbox" />

							<c:forEach items="${behalfOfTypeMap}" var="behalfOfTypeEntry">
								<aui:input cssClass="${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="${behalfOfTypeEntry.value}" name="behalfOf${behalfOfTypeEntry.key}" type="checkbox" value="${fn:contains(evpGrantRequestComposite.behalfOf, behalfOfTypeEntry.key)}" />
							</c:forEach>

							<aui:input cssClass="${permanentEditabilityCSSClass}" data-otherInput="${renderResponse.namespace}behalfOfOther" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="other" name="behalfOfOtherCheckbox" onChange="${renderResponse.namespace}toggleOtherInput(this.id);" type="checkbox" value="${!empty evpGrantRequestComposite.behalfOfOther}" />
						</aui:field-wrapper>

						<aui:input cssClass="${permanentEditabilityCSSClass}" disabled="${disabled || (evpGrantRequestComposite.parentEVPGrantRequestId > 0)}" label="other-on-behalf-of" name="behalfOfOther" required="${true}" type="text" value="${evpGrantRequestComposite.behalfOfOther}" />
					</aui:fieldset>
				</aui:col>
			</aui:row>

			<aui:row fluid="${true}">
				<aui:model-context bean="${evpGrantRequestComposite.evpGrantRequest}" model="<%= EVPGrantRequest.class %>" />

				<aui:input cssClass="span12" disabled="${disabled}" field="description" fieldParam="evpGrantRequestDescription" helpMessage="please-provide-a-detailed-description-of-the-purpose-of-the-grant" label="description-of-grant" name="evpGrantRequestDescription" required="${true}" type="textarea" value="${evpGrantRequestComposite.description}" wrapperCssClass="span12" />
			</aui:row>
		</aui:row>
	</aui:fieldset>

	<c:if test='${AlloyPermission.contains(themeDisplay, "grant_requests", "add", subsidiaryGroupId)}'>
		<aui:button-row cssClass="text-center">
			<aui:button class="permanent-editability" href="${viewEVPGrantRequestsURL}" value="cancel" />

			<aui:button cssClass="btn-transparent" type="submit" value="submit-grant-request" />
		</aui:button-row>
	</c:if>
</aui:form>

<jsp:useBean class="java.util.Date" id="now" />

<fmt:formatDate pattern="yyyy" value="${now}" var="currentYear" />

<fmt:formatNumber maxFractionDigits="0" value="${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT) - EVPUtil.getUsersTotalGrantAmountUsed(themeDisplay.userId, currentYear, 0)}" var="remainingFunds" />

<c:set value="${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE)}" var="currencyCode" />

<aui:script use="aui-base,aui-form-validator,liferay-dynamic-select">
	var ALang = A.Lang;

	var DEFAULT_FORM_VALIDATOR = A.config.FormValidator;

	var <portlet:namespace />EVP = Liferay.Portlet.EVP;

	DEFAULT_FORM_VALIDATOR.RULES.required = function(val, fieldNode, ruleValue) {
		var validate = true;

		var fieldNodeId = fieldNode.get('id');

		if (ALang.isString(ruleValue)) {
			var checkbox = A.one(ruleValue);

			var fieldsetNode = A.one('#<portlet:namespace />grantRequestType');

			if ((checkbox.get('checked') && fieldNode.val() == '') || (fieldsetNode.one(':checkbox:checked') == null)) {
				validate = false;
			}
		}
		else if (fieldNodeId === '<portlet:namespace />behalfOfOther') {
			var behalfOfOtherCheckBox = A.one('#<portlet:namespace />behalfOfOtherCheckboxCheckbox');

			if (behalfOfOtherCheckBox) {
				if (behalfOfOtherCheckBox.get('checked') && val == '') {
					validate = false;
				}
			}
		}
		else if (fieldNodeId === '<portlet:namespace />countryId') {
			validate = val != 0;
		}
		else if (fieldNodeId === '<portlet:namespace />purposeOther') {
			var purposeOtherCheckBox = A.one('#<portlet:namespace />purposeOtherCheckboxCheckbox');

			if (purposeOtherCheckBox.get('checked') && val == '') {
				validate = false;
			}
		}
		else if (fieldNodeId === '<portlet:namespace />regionId') {
			if (val == 0 && fieldNode.get('children').length > 1 && ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_ADDRESS_STATE_REQUIRED)}) {
				validate = false;
			}
		}
		else if (val == '') {
			validate = false;
		}

		return validate;
	};

	var amountInputs = A.all('[id$=Amount]');

	A.mix(
		DEFAULT_FORM_VALIDATOR.RULES,
		{
			<portlet:namespace />amountRemaining: function(val, fieldNode, ruleValue) {
				var validate = true;

				var value = 0;

				amountInputs.each(
					function(item) {
						var nodeValue = item.val();

						if (nodeValue) {
							value += ALang.toInt(nodeValue);
						}
					}
				);

				var used = ALang.toInt('${EVPUtil.getUsersTotalGrantAmountUsed(themeDisplay.userId, currentYear, 0)}') + value;

				var total = ALang.toInt('${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT)}');

				var checkbox = A.one('#<portlet:namespace />' + ruleValue);

				if (checkbox) {
					var checkboxVal = checkbox.get('checked');

					if (checkboxVal && used > total) {
						validate = false;
					}
				}

				return validate;
			},

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

				if (${evpGrantRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}) {
					validate = <portlet:namespace />EVP.validatePartTimeHoursPerWeek(
						{
							hoursPerWeek: ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)},
							namespace: '<portlet:namespace />'
						}
					);
				}

				return validate;
			},

			<portlet:namespace />validAmount: function(val, fieldNode, ruleValue) {
				var validate = true;

				var checkbox = A.one('#<portlet:namespace />' + ruleValue);

				if (checkbox) {
					var checkboxVal = checkbox.get('checked');

					if (checkboxVal && ((val <= 0) || ((val % 1) != 0))) {
						validate = false;
					}
				}

				return validate;
			}
		}
	);

	var rules = {
		<portlet:namespace />employmentHoursPerWeek: {
			<portlet:namespace />minimumRequiredHours: null
		},
		<portlet:namespace />grantRequestTypeError: {
			<portlet:namespace />atleastOneCheckbox: 'grantRequestType'
		},
		<portlet:namespace />onBehalfOfError: {
			<portlet:namespace />atleastOneCheckbox: 'onBehalfOf'
		},
		<portlet:namespace />purposeOfGrantError: {
			<portlet:namespace />atleastOneCheckbox: 'purposeOfGrant'
		}
	};

	var proposedCheckBoxId = '#<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Checkbox';

	var proposedCheckBox = A.one(proposedCheckBoxId);

	if (proposedCheckBox) {
		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Amount'] = {
			required: proposedCheckBoxId,
			<portlet:namespace />amountRemaining: '${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Checkbox',
			<portlet:namespace />validAmount: '${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Checkbox'
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}BankBICCode'] = {
			required: proposedCheckBoxId
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}BankIBANCode'] = {
			required: proposedCheckBoxId
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}BankName'] = {
			required: proposedCheckBoxId
		};
	}

	var sponsorshipCheckBoxId = '#<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Checkbox';

	var sponsorshipCheckBox = A.one(sponsorshipCheckBoxId);

	if (sponsorshipCheckBox) {
		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Amount'] = {
			required: sponsorshipCheckBoxId,
			<portlet:namespace />amountRemaining: '${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Checkbox',
			<portlet:namespace />validAmount: '${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Checkbox'
		};
	}

	var matchingCheckBoxID = '#<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Checkbox';

	var matchingCheckBox = A.one(matchingCheckBoxID);

	if (matchingCheckBox) {
		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Amount'] = {
			required: matchingCheckBoxID,
			<portlet:namespace />amountRemaining: '${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Checkbox',
			<portlet:namespace />validAmount: '${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Checkbox'
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}BankBICCode'] = {
			required: matchingCheckBoxID
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}BankIBANCode'] = {
			required: matchingCheckBoxID
		};

		rules['<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}BankName'] = {
			required: matchingCheckBoxID
		};
	}

	A.mix(
		DEFAULT_FORM_VALIDATOR.STRINGS,
		{
			<portlet:namespace />minimumRequiredHours: '<liferay-ui:message arguments="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)}" key="the-minimum-part-time-hours-required-is-x" />',
			<portlet:namespace />validAmount: '<liferay-ui:message key="the-amount-must-be-a-whole-number" />'
		}
	);

	var fieldStrings = {
		'<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Amount': {
			<portlet:namespace />amountRemaining: '<liferay-ui:message arguments="${remainingFunds} ${currencyCode}" key="the-amount-requested-exceeds-your-remaining-grant-funds.-you-have-x-remaining" />'
		},
		'<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Amount': {
			<portlet:namespace />amountRemaining: '<liferay-ui:message arguments="${remainingFunds} ${currencyCode}" key="the-amount-requested-exceeds-your-remaining-grant-funds.-you-have-x-remaining" />'
		},
		'<portlet:namespace />${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Amount': {
			<portlet:namespace />amountRemaining: '<liferay-ui:message arguments="${remainingFunds} ${currencyCode}" key="the-amount-requested-exceeds-your-remaining-grant-funds.-you-have-x-remaining" />'
		},
		<portlet:namespace />grantRequestTypeError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-grant-request-type" />'
		},
		<portlet:namespace />onBehalfOfError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-group-of-people-that-this-request-is-on-behalf-of" />'
		},
		<portlet:namespace />purposeOfGrantError: {
			<portlet:namespace />atleastOneCheckbox: '<liferay-ui:message key="please-select-at-least-one-purpose-of-this-request" />'
		}
	};

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

	new Liferay.DynamicSelect(
		[
			{
				select: '<portlet:namespace />countryId',
				selectData: Liferay.Address.getCountries,
				selectDesc: 'nameCurrentValue',
				selectId: 'countryId',
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />countryHidden', ${(evpGrantRequestComposite.requestOrganizationAddress.countryId > 0) ? evpGrantRequestComposite.requestOrganizationAddress.countryId : evpGrantRequestComposite.creatorEvpSubsidiaryCountryId})
			},
			{
				select: '<portlet:namespace />regionId',
				selectData: Liferay.Address.getRegions,
				selectDesc: 'name',
				selectId: 'regionId',
				selectVal: Liferay.Portlet.EVP.getValue('#<portlet:namespace />regionHidden', '${evpGrantRequestComposite.requestOrganizationAddress.regionId}')
			}
		]
	);
</aui:script>

<aui:script>
	function <portlet:namespace />partTimeHoursPerWeek() {
		Liferay.Portlet.EVP.validatePartTimeHoursPerWeek(
			{
				hoursPerWeek: ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)},
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

	Liferay.provide(
		window,
		'<portlet:namespace />updateGrantType',
		function(id) {
			var A = AUI();

			var node = A.one('#' + id);

			if (node) {
				var grantTypeWrapper = node.ancestor('.grant-type');

				if (grantTypeWrapper) {
					var fieldset = grantTypeWrapper.one('.fieldset');

					if (fieldset) {
						var checked = node.get('checked');

						fieldset.toggle(checked);

						fieldset.all('input').set('disabled', !checked);

						if (${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_CHECK_MEMO_VISIBLE)} && !${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED)}) {
							var grantKey = node.get('data-grantKey');

							var note = fieldset.one('#' + grantKey + 'Note');

							if (note) {
								note.set('disabled', false);
							}
						}

					}
				}
			}
		},
		['aui-base']
	);

	Liferay.on(
		'portletReady',
		function(event) {
			if (event.portletId === '${PortletKeys.EVP}') {
				var EVP = Liferay.Portlet.EVP;

				if (${!employmentTypeMap.containsKey(evpGrantRequestComposite.employmentType)} || (${evpGrantRequestComposite.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME} && EVP.getEmploymentHoursPerWeek('<portlet:namespace />') < ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MINIMUM_PART_TIME_WORKING_HOURS_PER_WEEK)})) {
					EVP.setInputDisabled(true);
				}

				<portlet:namespace />updateGrantType('<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED}Checkbox');
				<portlet:namespace />updateGrantType('<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP}Checkbox');
				<portlet:namespace />updateGrantType('<portlet:namespace />grantType${EVPGrantTransactionConstants.GRANT_TYPE_MATCHING}Checkbox');
			}
		}
	);
</aui:script>
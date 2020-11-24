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

<c:if test="${evpServiceRequestComposite.contactUserId == themeDisplay.userId}">
	<liferay-util:include page="/WEB-INF/jsp/evp/views/header.jsp" servletContext="<%= application %>">
		<liferay-util:param name="title" value="proof-of-service-completion" />
		<liferay-util:param name="cssClass" value="form-header" />
	</liferay-util:include>

	<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

	<c:if test="${evpServiceRequestComposite.hasForkStatus(EVPWorkflowConstants.SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION)}">
		<div class="portlet-msg-info">
			<liferay-ui:message
				arguments="${evpServiceRequestComposite.mostRecentComment}"
				key="the-evp-team-requested-the-following-x"
			/>
		</div>
	</c:if>

	<portlet:actionURL var="updateEVPServiceRequestProofURL">
		<portlet:param name="controller" value="service_requests" />
		<portlet:param name="action" value="updateProof" />

		<c:set var="successMessage">
			<liferay-ui:message key="thanks-for-your-time" />
		</c:set>

		<portlet:param name="successMessage" value="${successMessage}" />
		<portlet:param name="transitionName" value="${evpServiceRequestComposite.hasForkStatus(EVPWorkflowConstants.SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION) ? EVPWorkflowConstants.SERVICE_TRANSITION_LABEL_RESUBMIT : EVPWorkflowConstants.SERVICE_TRANSITION_SUBMIT_PROOF_FORM}" />
	</portlet:actionURL>

	<aui:form action="${updateEVPServiceRequestProofURL}" cssClass="evp-form" method="post" name="fm">
		<aui:input name="redirect" type="hidden" value="" />
		<aui:input name="id" type="hidden" value="${evpServiceRequestComposite.evpServiceRequestId}" />
		<aui:input name="childEVPServiceRequstCompositesCount" type="hidden" value="${fn:length(childEVPServiceRequestComposites)}" />
		<aui:input name="className" type="hidden" value="<%= WorkflowInstance.class.getName() %>" />
		<aui:input name="classPK" type="hidden" value="${evpServiceRequestComposite.workflowInstanceId}" />
		<aui:input name="parentMessageId" type="hidden" value="${evpServiceRequestComposite.publicMessageId}" />
		<aui:input name="threadId" type="hidden" value="${evpServiceRequestComposite.publicThreadId}" />

		<aui:fieldset>
			<fmt:formatDate value="${evpServiceRequestComposite.oneWeekFromRequestedEndDate}" var="oneWeekFromRequestedEndDate" />

			<c:set value="${evpServiceRequestComposite.contactUserFullName};${oneWeekFromRequestedEndDate};${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" var="arguments" />

			<liferay-ui:message
				arguments='${fn:split(arguments, ";")}'
				key="dear-x-thank-you-for-helping-us-verify-our-employees-volunteer-service-with-your-organization.-please-fill-out-the-following-form-to-the-best-of-your-knowledge-and-click-on-the-submit-button.-wed-appreciate-a-response-by-x.-if-we-do-not-receive-it-in-a-timely-manner-our-employees-may-be-ineligible-to-participate-in-volunteer-services-next-year.-if-you-have-any-further-questions-please-contact-x.-thank-you-the-liferay-evp-team"
			/>
		</aui:fieldset>

		<aui:fieldset>
			<liferay-ui:header title="service-information" />

			<aui:row fluid="${true}">
				<aui:field-wrapper cssClass="span3" name="your-name">
					${fn:escapeXml(evpServiceRequestComposite.contactUserFullName)}
				</aui:field-wrapper>

				<aui:field-wrapper cssClass="span3" name="your-email">
					${fn:escapeXml(evpServiceRequestComposite.contactUserEmailAddressString)}
				</aui:field-wrapper>

				<aui:field-wrapper cssClass="span6" name="organization-name">
					${fn:escapeXml(evpServiceRequestComposite.organizationName)}
				</aui:field-wrapper>
			</aui:row>

			<aui:row fluid="${true}">
				<liferay-ui:message
					key="please-verify-the-information-in-the-table-below-to-the-best-of-your-knowledge-if-any-of-this-information-is-incorrect-please-adjust-the-values-before-clicking-submit"
				/>
			</aui:row>
		</aui:fieldset>

		<aui:fieldset cssClass="evp-proof-form">
			<aui:row fluid="${true}">
				<aui:input cssClass="span12" disabled="${true}" label="employee-name" name="creatorUserFullName" required="${true}" showRequiredLabel="${false}" tabindex="1" type="text" value="${fn:escapeXml(evpServiceRequestComposite.creatorUserFullName)}" wrapperCssClass="span3" />

				<aui:input cssClass="span12" disabled="${disabled}" field="confirmedStartDate" fieldParam="confirmedStartDateString" label="start-date-of-service" name="confirmedStartDateString" required="${true}" tabindex="1" value="${empty evpServiceRequestComposite.confirmedStartDate ? evpServiceRequestComposite.requestedStartDateCalendar : evpServiceRequestComposite.confirmedStartDateCalendar}" wrapperCssClass="span3" />

				<aui:input cssClass="span12" disabled="${disabled}" field="confirmedEndDate" fieldParam="confirmedEndDateString" label="end-date-of-service" name="confirmedEndDateString" required="${true}" tabindex="1" value="${empty evpServiceRequestComposite.confirmedEndDate ? evpServiceRequestComposite.requestedEndDateCalendar : evpServiceRequestComposite.confirmedEndDateCalendar}" wrapperCssClass="span3" />

				<c:set value="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_HOURS_INCREMENT)}" var="serviceHoursIncrement" />

				<aui:select bean="" cssClass="span12" disabled="${disabled}" label="number-of-service-hours" name="confirmedTotalHours" required="${true}" tabindex="1" wrapperCssClass="span3">
					<c:forEach begin="${serviceHoursIncrement}" end="40" step="${serviceHoursIncrement}" varStatus="status">
						<aui:option label="${status.index}" selected="${(evpServiceRequestComposite.confirmedTotalHours == 0) ? (status.index == evpServiceRequestComposite.requestedTotalHours) : (status.index == evpServiceRequestComposite.confirmedTotalHours)}" value="${status.index}" />
					</c:forEach>
				</aui:select>
			</aui:row>
			<c:forEach items="${childEVPServiceRequestComposites}" var="childEVPServiceRequestComposite" varStatus="status">
				<aui:model-context bean="${childEVPServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

				<aui:input name="id${status.index}" type="hidden" value="${childEVPServiceRequestComposite.evpServiceRequestId}" />

				<aui:row fluid="${true}">
					<aui:input cssClass="span12" disabled="${true}" label="employee-name" name="creatorUserFullName${status.index}" required="${true}" showRequiredLabel="${false}" tabindex="1" type="text" value="${fn:escapeXml(childEVPServiceRequestComposite.creatorUserFullName)}" wrapperCssClass="span3" />

					<aui:input cssClass="span12" disabled="${disabled}" field="confirmedStartDate" fieldParam="confirmedStartDateString${status.index}" label="start-date-of-service" name="confirmedStartDateString${status.index}" required="${true}" tabindex="1" value="${empty childEVPServiceRequestComposite.confirmedStartDate ? childEVPServiceRequestComposite.requestedStartDateCalendar : childEVPServiceRequestComposite.confirmedStartDateCalendar}" wrapperCssClass="span3" />

					<aui:input cssClass="span12" disabled="${disabled}" field="confirmedEndDate" fieldParam="confirmedEndDateString${status.index}" label="end-date-of-service" name="confirmedEndDateString${status.index}" required="${true}" tabindex="1" value="${empty childEVPServiceRequestComposite.confirmedEndDate ? childEVPServiceRequestComposite.requestedEndDateCalendar : childEVPServiceRequestComposite.confirmedEndDateCalendar}" wrapperCssClass="span3" />

					<c:set value="${childEVPServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_HOURS_INCREMENT)}" var="serviceHoursIncrement" />

					<aui:select bean="" cssClass="span12" disabled="${disabled}" field="confirmedTotalHours" fieldParam="confirmedTotalHours${status.index}" label="number-of-service-hours" name="confirmedTotalHours${status.index}" required="${true}" tabindex="1" wrapperCssClass="span3">
						<c:forEach begin="${serviceHoursIncrement}" end="40" step="${serviceHoursIncrement}" varStatus="status">
							<aui:option label="${status.index}" selected="${(childEVPServiceRequestComposite.confirmedTotalHours == 0) ? (status.index == childEVPServiceRequestComposite.requestedTotalHours) : (status.index == childEVPServiceRequestComposite.confirmedTotalHours)}" value="${status.index}" />
						</c:forEach>
					</aui:select>
				</aui:row>
			</c:forEach>

			<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

			<aui:row fluid="${true}">
				<aui:input cssClass="span12" label="how-did-our-employees-service-benefit-your-organization" name="contactBenefit" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
			</aui:row>

			<aui:row fluid="${true}">
				<aui:input cssClass="span12" label="please-provide-any-feedback-comments-you-may-have" name="contactComments" required="${false}" tabindex="1" type="textarea" wrapperCssClass="span12" />
			</aui:row>

			<c:if test="${evpServiceRequestComposite.hasForkStatus(EVPWorkflowConstants.SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION)}">
				<aui:row fluid="${true}">
					<aui:input cssClass="span12" disabled="${disabled}" helpMessage="please-provide-any-additional-notes-you-want-the-reviewers-to-know" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="comments" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
				</aui:row>
			</c:if>
		</aui:fieldset>

		<aui:button-row>
			<aui:button cssClass="btn-transparent" tabindex="1" type="submit" value="submit" />
		</aui:button-row>
	</aui:form>

	<aui:script use="aui-form-validator">
		var formValidator = A.config.FormValidator;

		formValidator.RULES.validEndDate = function(val, fieldNode, ruleValue) {
			var validate = true;

			var confirmedEndDateNode = A.one('#' + ruleValue);
			var confirmedStartDateNode = A.one('#' + ruleValue.replace('End', 'Start'));

			if (confirmedEndDateNode && confirmedStartDateNode) {
				var evp = Liferay.Portlet.EVP;

				var confirmedEndDate = evp.getDate(confirmedEndDateNode.val());
				var confirmedStartDate = evp.getDate(confirmedStartDateNode.val());

				if (confirmedEndDate < confirmedStartDate) {
					validate = false;
				}

				return validate;
			}
		};

		formValidator.STRINGS.validEndDate = '<%= UnicodeLanguageUtil.get(pageContext, "the-end-date-must-be-after-or-equal-to-the-start-date") %>';

		var rules = {
		};

		var nodeListSelector = '.field[id*=confirmedEndDateString]';

		var confirmedEndDates = A.all(nodeListSelector);

		confirmedEndDates.each(
			function(item) {
				var itemDOMNode = item.getDOMNode();

				rules[itemDOMNode.name] = {validEndDate: itemDOMNode.name};
			}
		);

		new A.FormValidator(
			{
				boundingBox: '#<portlet:namespace />fm',
				rules: rules,
				showAllMessages: true,
				validateOnBlur: true,
				validateOnInput: true
			}
		);
	</aui:script>
</c:if>
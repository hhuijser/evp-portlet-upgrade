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
	<liferay-util:param name="title" value="service-request-feedback-form" />
	<liferay-util:param name="controller" value="${controllerPath}" />
	<liferay-util:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<c:if test="${(evpServiceRequestComposite.userId != themeDisplay.userId) || evpServiceRequestComposite.hasForkStatus(EVPWorkflowConstants.SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER)}">
	<div class="portlet-msg-info">
		<liferay-ui:message
			arguments="${evpServiceRequestComposite.mostRecentComment}"
			key="the-evp-team-requested-the-following-x"
		/>
	</div>
</c:if>

<aui:model-context bean="${evpServiceRequestComposite}" model="<%= EVPServiceRequest.class %>" />

<portlet:actionURL var="updateEVPServiceRequestFeedbackURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
	<portlet:param name="controller" value="service_requests" />
	<portlet:param name="action" value="updateFeedback" />

	<c:set var="successMessage">
		<liferay-ui:message key="thanks-for-your-feedback-and-your-service" />
	</c:set>

	<portlet:param name="successMessage" value="${successMessage}" />
	<portlet:param name="transitionName" value="${EVPWorkflowConstants.SERVICE_TRANSITION_SUBMIT_FEEDBACK_FORM}" />
</portlet:actionURL>

<aui:form action="${updateEVPServiceRequestFeedbackURL}" cssClass="evp-form" method="post" name="fm">
	<portlet:renderURL var="viewEVPServiceRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
		<portlet:param name="controller" value="${controllerPath}" />
		<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	</portlet:renderURL>

	<aui:input name="redirect" type="hidden" value="${viewEVPServiceRequestsURL}" />
	<aui:input name="id" type="hidden" value="${evpServiceRequestComposite.evpServiceRequestId}" />
	<aui:input name="className" type="hidden" value="<%= WorkflowInstance.class.getName() %>" />
	<aui:input name="classPK" type="hidden" value="${evpServiceRequestComposite.workflowInstanceId}" />
	<aui:input name="parentMessageId" type="hidden" value="${evpServiceRequestComposite.publicMessageId}" />
	<aui:input name="threadId" type="hidden" value="${evpServiceRequestComposite.publicThreadId}" />

	<aui:fieldset column="${true}">
		<aui:field-wrapper cssClass="span4" name="employee-name">
			${fn:escapeXml(evpServiceRequestComposite.creatorUserFullName)}
		</aui:field-wrapper>

		<aui:field-wrapper cssClass="span4" name="organization-name">
			${fn:escapeXml(evpServiceRequestComposite.organizationName)}
		</aui:field-wrapper>

		<aui:field-wrapper cssClass="span4" name="date-of-service">
			<fmt:formatDate value="${evpServiceRequestComposite.requestedStartDate}" />

			${"-"}

			<fmt:formatDate value="${evpServiceRequestComposite.requestedEndDate}" />
		</aui:field-wrapper>
	</aui:fieldset>

	<aui:fieldset>
		<aui:row fluid="${true}">
			<aui:input cssClass="span12" helpMessage="please-provide-a-short-description-of-what-you-did-during-your-service-time" label="what-did-you-do-during-your-service-time" name="feedbackDescription" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
		</aui:row>

		<aui:row fluid="${true}">
			<aui:input cssClass="span12" helpMessage="please-provide-a-short-description-of-how-the-people-you-served-were-positively-affected" label="how-were-the-people-you-served-positively-affected" name="recipientBenefit" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
		</aui:row>

		<aui:row fluid="${true}">
			<aui:input cssClass="span12" helpMessage="please-provide-a-short-description-of-how-you-were-positively-affected-through-your-service" label="how-were-you-positively-affected-through-your-service" name="employeeBenefit" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
		</aui:row>

		<aui:row fluid="${true}">
			<aui:field-wrapper name="we-would-love-to-hear-more-about-your-evp-trip-please-consider-sharing-your-experience-with-the-evp-web-team-and-we-will-work-with-you-to-create-a-story-that-will-get-posted-on-the-evp-site-we-have-found-this-is-one-of-the-best-ways-to-encourage-your-fellow-liferayers-to-participate-in-evp">
				<aui:input label="i-want-to-share-my-story-with-liferay" name="shareStory" type="checkbox" value="${evpServiceRequestComposite.shareStory}" />
			</aui:field-wrapper>
		</aui:row>

		<c:if test="${(evpServiceRequestComposite.userId != themeDisplay.userId) || evpServiceRequestComposite.hasForkStatus(EVPWorkflowConstants.SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER)}">
			<aui:row fluid="${true}">
				<aui:input cssClass="span12" helpMessage="please-provide-any-additional-notes-you-want-the-reviewers-to-know" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="comments" required="${true}" tabindex="1" type="textarea" wrapperCssClass="span12" />
			</aui:row>
		</c:if>
	</aui:fieldset>

	<aui:button-row>
		<aui:button cssClass="btn-transparent" tabindex="1" type="submit" />
	</aui:button-row>
</aui:form>
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

<c:if test='${(controllerPath == "reviewer_dashboard") && evpServiceRequestComposite.promoteTrip}'>
	<div class="alert alert-info">
		<liferay-ui:message key="this-employee-would-like-to-promote-this-trip-on-the-evp-site" />
	</div>
</c:if>

<c:if test="${duplicateOrganization}">
	<div class="alert alert-info">
		<liferay-ui:message arguments="${evpServiceRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="an-organization-with-this-name-already-exists-in-the-system.-please-review-this-organization's-details-below.-if-any-of-the-details-are-incorrect,-please-contact-x" />
	</div>
</c:if>

<c:set var="title">
	<liferay-ui:message arguments="${evpServiceRequestComposite.evpServiceRequestId}" key="service-request-x" />
</c:set>

<liferay-util:include page="/WEB-INF/jsp/evp/views/header.jsp" servletContext="<%= application %>">
	<liferay-util:param name="title" value="${title}" />
	<liferay-util:param name="controller" value="${controllerPath}" />
	<liferay-util:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<aui:fieldset cssClass="accordian-details view-request view-service-request">
	<aui:col width="${50}">
		<aui:row cssClass="section">
			<div class="section-header toggler-header-expanded">
				<liferay-ui:header title="employee" />
			</div>

			<dl class="section-details toggler-content-expanded">
				<c:if test="${not empty evpServiceRequestComposite.creatorUserFullName}">
					<dt title='<liferay-ui:message key="full-name" />'>
						<liferay-ui:message key="full-name" />:
					</dt>
					<dd>
						${evpServiceRequestComposite.creatorUserFullName}
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.employmentTypeLabel}">
					<dt title='<liferay-ui:message key="employment-type" />'>
						<liferay-ui:message key="employment-type" />:
					</dt>
					<dd>
						<liferay-ui:message key="${evpServiceRequestComposite.employmentTypeLabel}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.creatorUserEmailAddressString}">
					<dt title='<liferay-ui:message key="email" />'>
						<liferay-ui:message key="email" />:
					</dt>
					<dd>
						<aui:a href="mailto:${evpServiceRequestComposite.creatorUserEmailAddressString}" label="${evpServiceRequestComposite.creatorUserEmailAddressString}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.creatorUserPhone.number}">
					<dt title='<liferay-ui:message key="phone-number" />'>
						<liferay-ui:message key="phone-number" />:
					</dt>
					<dd>
						${evpServiceRequestComposite.creatorUserPhone.number}
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.managerUserEmailAddressString}">
					<dt title='<liferay-ui:message key="manager" />'>
						<liferay-ui:message key="manager" />:
					</dt>
					<dd>
						<aui:a href="mailto:${evpServiceRequestComposite.managerUserEmailAddressString}" label="${evpServiceRequestComposite.managerUserEmailAddressString}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.creatorSubsidiaryEVPDivisionComposite.name}">
					<dt title='<liferay-ui:message key="subsidiary" />'>
						<liferay-ui:message key="subsidiary" />:
					</dt>
					<dd>
						${evpServiceRequestComposite.creatorSubsidiaryEVPDivisionComposite.name}
					</dd>
				</c:if>
			</dl>
		</aui:row>

		<c:set value="${evpServiceRequestComposite}" var="requestComposite" />

		<%@ include file="/WEB-INF/jsp/evp/views/request_organizations/view_details.jspf" %>

		<aui:row cssClass="section service-details">
			<div class="section-header toggler-header-expanded">
				<liferay-ui:header title="service-details" />
			</div>

			<dl class="section-details toggler-content-expanded">
				<c:if test="${not empty evpServiceRequestComposite.requestedStartDate}">
					<dt title='<liferay-ui:message key="start-date" />'>
						<liferay-ui:message key="start-date" />:
					</dt>
					<dd>
						<fmt:formatDate value="${evpServiceRequestComposite.requestedStartDate}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpServiceRequestComposite.requestedEndDate}">
					<dt title='<liferay-ui:message key="end-date" />'>
						<liferay-ui:message key="end-date" />:
					</dt>
					<dd>
						<fmt:formatDate value="${evpServiceRequestComposite.requestedEndDate}" />
					</dd>
				</c:if>

				<c:if test="${evpServiceRequestComposite.requestedTotalHours > 0}">
					<dt title='<liferay-ui:message key="total-hours-requested" />'>
						<liferay-ui:message key="total-hours-requested" />:
					</dt>
					<dd>
						${evpServiceRequestComposite.requestedTotalHours}
					</dd>
				</c:if>

				<dt title='<liferay-ui:message key="purpose" />'>
					<liferay-ui:message key="purpose" />:
				</dt>
				<dd class="clear-label">
					<ul>
						<c:forEach items="${evpServiceRequestComposite.purpose}" var="purpose" varStatus="status">
							<li>
								<liferay-ui:message key="${purposeTypeMap[purpose]}" />
							</li>
						</c:forEach>

						<c:if test="${not empty evpServiceRequestComposite.purposeOther}">
							<li>
								${fn:escapeXml(evpServiceRequestComposite.purposeOther)}
							</li>
						</c:if>
					</ul>
				</dd>

				<dt title='<liferay-ui:message key="behalf-of" />'>
					<liferay-ui:message key="behalf-of" />:
				</dt>
				<dd class="clear-label">
					<ul>
						<c:forEach items="${evpServiceRequestComposite.behalfOf}" var="behalfOf" varStatus="status">
							<li>
								<liferay-ui:message key="${behalfOfTypeMap[behalfOf]}" />
							</li>
						</c:forEach>

						<c:if test="${not empty evpServiceRequestComposite.behalfOfOther}">
							<li>
								${fn:escapeXml(evpServiceRequestComposite.behalfOfOther)}
							</li>
						</c:if>
					</ul>
				</dd>

				<c:if test="${not empty evpServiceRequestComposite.description}">
					<dt title='<liferay-ui:message key="description" />'>
						<liferay-ui:message key="description" />:
					</dt>
					<dd class="clear-label">
						${fn:escapeXml(evpServiceRequestComposite.description)}
					</dd>
				</c:if>
			</dl>
		</aui:row>

		<c:if test="${not empty evpServiceRequestComposite.confirmedStartDate}">
			<aui:row cssClass="section">
				<div class="section-header toggler-header-expanded">
					<liferay-ui:header title="proof-of-service" />
				</div>

				<dl class="section-details toggler-content-expanded">
					<c:if test="${not empty evpServiceRequestComposite.confirmedStartDate}">
						<dt title='<liferay-ui:message key="confirmed-start-date" />'>
							<liferay-ui:message key="confirmed-start-date" />:
						</dt>
						<dd>
							<fmt:formatDate value="${evpServiceRequestComposite.confirmedStartDate}" />
						</dd>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.confirmedEndDate}">
						<dt title='<liferay-ui:message key="confirmed-end-date" />'>
							<liferay-ui:message key="confirmed-end-date" />:
						</dt>
						<dd>
							<fmt:formatDate value="${evpServiceRequestComposite.confirmedEndDate}" />
						</dd>
					</c:if>

					<c:if test="${evpServiceRequestComposite.confirmedTotalHours > 0}">
						<dt title='<liferay-ui:message key="total-hours-confirmed" />'>
							<liferay-ui:message key="total-hours-confirmed" />:
						</dt>
						<dd>
							${evpServiceRequestComposite.confirmedTotalHours}
						</dd>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.contactBenefit}">
						<dt title='<liferay-ui:message key="how-did-our-employees-service-benefit-your-organization" />'>
							<liferay-ui:message key="how-did-our-employees-service-benefit-your-organization" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpServiceRequestComposite.contactBenefit)}
						</dd>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.contactComments}">
						<dt title='<liferay-ui:message key="please-provide-any-feedback-comments-you-may-have" />'>
							<liferay-ui:message key="please-provide-any-feedback-comments-you-may-have" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpServiceRequestComposite.contactComments)}
						</dd>
					</c:if>
				</dl>
			</aui:row>
		</c:if>

		<c:if test="${not empty evpServiceRequestComposite.feedbackDescription}">
			<aui:row cssClass="section">
				<div class="section-header toggler-header-expanded">
					<liferay-ui:header title="feedback-form" />
				</div>

				<dl class="section-details toggler-content-expanded">
					<c:if test='${(controllerPath == "reviewer_dashboard") && evpServiceRequestComposite.shareStory}'>
						<div class="alert alert-info">
							<liferay-ui:message key="this-employee-would-like-to-share-this-trips-story-on-the-evp-site" />
						</div>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.feedbackDescription}">
						<dt title='<liferay-ui:message key="what-did-you-do-during-your-service-time" />'>
							<liferay-ui:message key="what-did-you-do-during-your-service-time" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpServiceRequestComposite.feedbackDescription)}
						</dd>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.recipientBenefit}">
						<dt title='<liferay-ui:message key="how-were-the-people-you-served-positively-affected" />'>
							<liferay-ui:message key="how-were-the-people-you-served-positively-affected" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpServiceRequestComposite.recipientBenefit)}
						</dd>
					</c:if>

					<c:if test="${not empty evpServiceRequestComposite.employeeBenefit}">
						<dt title='<liferay-ui:message key="how-were-the-people-you-served-positively-affected" />'>
							<liferay-ui:message key="how-were-you-positively-affected-through-your-service" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpServiceRequestComposite.employeeBenefit)}
						</dd>
					</c:if>
				</dl>
			</aui:row>
		</c:if>

		<aui:button-row>
			<aui:button onClick="Liferay.EVP.toggler.toggleAll()" value="toggle-all" />
		</aui:button-row>
	</aui:col>

	<aui:col width="${50}">
		<aui:row cssClass="section">
			<liferay-ui:header title="workflow" />

			<c:set value="<%= EVPServiceRequest.class.getName() %>" var="className" />

			<dl class="section-details">
				<dt title='<liferay-ui:message key="workflow-state" />'>
					<liferay-ui:message key="workflow-state" />:
				</dt>
				<dd>
					<liferay-ui:message key="${evpServiceRequestComposite.statusLabel}" />
				</dd>
			</dl>

			<c:forEach items="${evpWorkflowTaskComposites}" var="workflowTaskComposite">
				<c:if test='${controllerPath == "reviewer_dashboard"}'>
					<dl class="section-separator" />

					<c:set value="${workflowTaskComposite.workflowTaskName};${workflowTaskComposite.workflowTaskAssignees};" var="arguments" />

					<dl class="section-details">
						<dt title='<liferay-ui:message key="workflow-task" />'>
							<liferay-ui:message key="workflow-task" />:
						</dt>
						<dd>
							<liferay-ui:message arguments='${fn:split(arguments, ";")}' key="x-assigned-to-x" translateArguments="${true}" />
						</dd>
					</dl>
				</c:if>

				<dl class="section-details">
					<c:choose>
						<c:when test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "setStatus") && workflowTaskComposite.workflowTaskAssignedToUser}'>
							<aui:form method="post" name="fm${workflowTaskComposite.workflowTaskId}" onSubmit="event.preventDefault();">
								<aui:row>
									<aui:input cssClass="span12" label="comments" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="${workflowTaskComposite.workflowTaskId}Comments" type="textarea" />
								</aui:row>

								<aui:field-wrapper name="available-transitions">
									<aui:button-row>
										<portlet:renderURL var="viewEVPServiceRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
											<portlet:param name="controller" value="${controllerPath}" />
											<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
										</portlet:renderURL>

										<c:forEach items="${workflowTaskComposite.getTransitionComposites(className)}" var="transitionComposite">
											<portlet:actionURL var="setStatusURL">
												<portlet:param name="controller" value="reviewer_dashboard" />
												<portlet:param name="action" value="setServiceStatus" />
												<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
												<portlet:param name="redirect" value="${viewEVPServiceRequestsURL}" />

												<c:choose>
													<c:when test="${transitionComposite.commentsPrivate}">
														<portlet:param name="className" value="${className}" />
														<portlet:param name="classPK" value="${evpServiceRequestComposite.evpServiceRequestId}" />
														<portlet:param name="parentMessageId" value="${evpServiceRequestComposite.privateMessageId}" />
														<portlet:param name="threadId" value="${evpServiceRequestComposite.privateThreadId}" />
													</c:when>
													<c:otherwise>
														<portlet:param name="className" value="<%= WorkflowInstance.class.getName() %>" />
														<portlet:param name="classPK" value="${evpServiceRequestComposite.workflowInstanceId}" />
														<portlet:param name="parentMessageId" value="${evpServiceRequestComposite.publicMessageId}" />
														<portlet:param name="threadId" value="${evpServiceRequestComposite.publicThreadId}" />
													</c:otherwise>
												</c:choose>

												<portlet:param name="transitionName" value="${transitionComposite.transitionName}" />
												<portlet:param name="workflowTaskId" value="${workflowTaskComposite.workflowTaskId}" />
											</portlet:actionURL>

											<aui:button id="${transitionComposite.transitionName}" onClick="${renderResponse.namespace}submit(this, ${workflowTaskComposite.workflowTaskId}, '${setStatusURL}');" type="submit" value="${transitionComposite.transitionLabel}" />
										</c:forEach>
									</aui:button-row>
								</aui:field-wrapper>
							</aui:form>
						</c:when>
						<c:otherwise>
							<aui:field-wrapper name="available-transitions">
								<liferay-ui:message key="you-do-not-have-the-role-required-to-transition-this-task" />
							</aui:field-wrapper>
						</c:otherwise>
					</c:choose>
				</dl>
			</c:forEach>

			<c:if test='${(controllerPath == "reviewer_dashboard") && AlloyPermission.contains(themeDisplay, "reviewer_dashboard", "addComment")}'>
				<c:set var="title">
					<liferay-ui:message key="evp-team-comment" />
				</c:set>

				<c:set var="helpMessage">
					<liferay-ui:icon-help message="evp-team-members-can-use-this-section-to-add-a-comment-at-any-time-during-the-workflow.-only-other-evp-team-members-will-be-notified-about-the-comment,-and-it-will-show-up-in-the-private-comments-section-below" />
				</c:set>

				<liferay-ui:header escapeXml="${false}" localizeTitle="${false}" showBackURL="${false}" title="${title} ${helpMessage}" />

				<portlet:actionURL var="addCommentURL">
					<portlet:param name="controller" value="reviewer_dashboard" />
					<portlet:param name="action" value="addComment" />
					<portlet:param name="redirect" value="${portletURL}" />
					<portlet:param name="className" value="${className}" />
					<portlet:param name="classPK" value="${evpServiceRequestComposite.evpServiceRequestId}" />
					<portlet:param name="parentMessageId" value="${evpServiceRequestComposite.privateMessageId}" />
					<portlet:param name="subsidiaryGroupId" value="${evpServiceRequestComposite.subsidiaryGroupId}" />
					<portlet:param name="threadId" value="${evpServiceRequestComposite.privateThreadId}" />
				</portlet:actionURL>

				<aui:form action="${addCommentURL}" method="post" name="extraCommentsFm">
					<aui:row>
						<aui:input cssClass="span12" label="" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="extraComments" required="${true}" type="textarea" />
					</aui:row>

					<aui:button-row>
						<aui:button type="submit" value="add-comment" />
					</aui:button-row>
				</aui:form>
			</c:if>

			<c:if test="${evpServiceRequestComposite.publicMessagesCount > 0}">
				<liferay-ui:header showBackURL="${false}" title="comments" />

				<liferay-ui:discussion
					className="<%= WorkflowInstance.class.getName() %>"
					classPK="${evpServiceRequestComposite.workflowInstanceId}"
					formAction="${setStatusURL}"
					formName="commentFm"
					hideControls="${true}"
					ratingsEnabled="${false}"
					redirect="${portletURL}"
					userId="${themeDisplay.userId}"
				/>
			</c:if>

			<c:if test='${(controllerPath == "reviewer_dashboard") && (evpServiceRequestComposite.privateMessagesCount > 0)}'>
				<div class="portlet-msg-info">
					<liferay-ui:message key="the-comment-section-below-is-not-viewable-by-employees" />
				</div>

				<liferay-ui:header showBackURL="${false}" title="private-comments" />

				<liferay-ui:discussion
					className="<%= EVPServiceRequest.class.getName() %>"
					classPK="${evpServiceRequestComposite.evpServiceRequestId}"
					formAction="${setStatusURL}"
					formName="commentFm"
					hideControls="${true}"
					ratingsEnabled="${false}"
					redirect="${portletURL}"
					userId="${themeDisplay.userId}"
				/>
			</c:if>
		</aui:row>
	</aui:col>
</aui:fieldset>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />submit',
		function(node, workflowTaskId, formAction) {
			var A = AUI();

			var rules = {};

			var transitionsRequiredString = '${fn:join(EVPWorkflowConstants.GRANT_TRANSITIONS_COMMENTS_REQUIRED, ",")}';

			var transitionsRequired = transitionsRequiredString.split(',');

			if (transitionsRequired.indexOf(node.id) >= 0) {
				rules['<portlet:namespace />' + workflowTaskId + 'Comments'] = {
					required: true
				};
			}

			var formValidator = new A.FormValidator(
				{
					boundingBox: '#<portlet:namespace />fm' + workflowTaskId,
					rules: rules,
					showAllMessages: true
				}
			);

			formValidator.validate();

			if (!formValidator.hasErrors()) {
				var form = A.one('#<portlet:namespace />fm' + workflowTaskId);

				form.attr('action', formAction);

				submitForm(form);
			}
		},
		['aui-base', 'aui-form-validator']
	);
</aui:script>
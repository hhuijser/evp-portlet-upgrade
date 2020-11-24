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

<c:if test="${duplicateOrganization}">
	<div class="alert alert-info">
		<liferay-ui:message arguments="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="an-organization-with-this-name-already-exists-in-the-system.-please-review-this-organization's-details-below.-if-any-of-the-details-are-incorrect,-please-contact-x" />
	</div>
</c:if>

<c:set var="title">
	<liferay-ui:message arguments="${evpGrantRequestComposite.evpGrantRequestId}" key="grant-request-x" />
</c:set>

<liferay-util:include page="/WEB-INF/jsp/evp/views/header.jsp" servletContext="<%= application %>">
	<liferay-util:param name="title" value="${title}" />
	<liferay-util:param name="controller" value="${controllerPath}" />
	<liferay-util:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexGrant" : "index"}' />
	<liferay-util:param name="cssClass" value="form-header" />
</liferay-util:include>

<c:if test="${evpGrantRequestComposite.formerMatchingGrant}">
	<div class="alert alert-info">
		<liferay-ui:message key="all-or-a-portion-of-this-proposed-grant-was-originally-submitted-as-a-matching-grant" />
	</div>
</c:if>

<aui:fieldset cssClass="accordian-details view-grant-request view-request">
	<aui:col width="${50}">
		<aui:row cssClass="section">
			<div class="section-header toggler-header-expanded">
				<liferay-ui:header title="employee" />
			</div>

			<dl class="section-details toggler-content-expanded">
				<c:if test="${not empty evpGrantRequestComposite.creatorUserFullName}">
					<dt title='<liferay-ui:message key="full-name" />'>
						<liferay-ui:message key="full-name" />:
					</dt>
					<dd>
						${evpGrantRequestComposite.creatorUserFullName}
					</dd>
				</c:if>

				<c:if test="${not empty evpGrantRequestComposite.employmentTypeLabel}">
					<dt title='<liferay-ui:message key="employment-type" />'>
						<liferay-ui:message key="employment-type" />:
					</dt>
					<dd>
						<liferay-ui:message key="${evpGrantRequestComposite.employmentTypeLabel}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpGrantRequestComposite.creatorUserEmailAddressString}">
					<dt title='<liferay-ui:message key="email" />'>
						<liferay-ui:message key="email" />:
					</dt>
					<dd>
						<aui:a href="mailto:${evpGrantRequestComposite.creatorUserEmailAddressString}" label="${evpGrantRequestComposite.creatorUserEmailAddressString}" />
					</dd>
				</c:if>

				<c:if test="${not empty evpGrantRequestComposite.creatorUserPhone.number}">
					<dt title='<liferay-ui:message key="phone-number" />'>
						<liferay-ui:message key="phone-number" />:
					</dt>
					<dd>
						${evpGrantRequestComposite.creatorUserPhone.number}
					</dd>
				</c:if>

				<c:if test="${not empty evpGrantRequestComposite.creatorSubsidiaryEVPDivisionComposite.abbreviation}">
					<dt title='<liferay-ui:message key="subsidiary" />'>
						<liferay-ui:message key="subsidiary" />:
					</dt>
					<dd>
						${evpGrantRequestComposite.creatorSubsidiaryEVPDivisionComposite.name}
					</dd>
				</c:if>
			</dl>
		</aui:row>

		<c:set value="${evpGrantRequestComposite}" var="requestComposite" />

		<%@ include file="/WEB-INF/jsp/evp/views/request_organizations/view_details.jspf" %>

		<aui:row cssClass="grant-details section">
			<div class="section-header toggler-header-expanded">
				<liferay-ui:header title="grant-details" />
			</div>

			<div class="section-details toggler-content-expanded">
				<c:forEach items="${grantTypeMap}" var="grantTypeEntry">
					<c:set value="${evpGrantRequestComposite.evpGrantTransactionCompositesMap[grantTypeEntry.value]}" var="evpGrantTransactionComposite" />

					<c:if test="${evpGrantTransactionComposite != null}">
						<aui:fieldset label="${grantTypeEntry.value}" name="${grantTypeEntry.value}">
							<dl class="sub-section-details">
								<dt title='<liferay-ui:message key="amount" />'>
									<liferay-ui:message key="amount" />:
								</dt>
								<dd>
									<fmt:formatNumber pattern="### ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE)}" type="currency" value="${evpGrantTransactionComposite.amount}" />
								</dd>

								<c:if test="${not empty evpGrantTransactionComposite.note}">
									<dt title='<liferay-ui:message key="memo" />'>
										<liferay-ui:message key="memo" />:
									</dt>
									<dd>
										${fn:escapeXml(evpGrantTransactionComposite.note)}
									</dd>
								</c:if>

								<c:if test="${not empty evpGrantTransactionComposite.bankName}">
									<dt title='<liferay-ui:message key="bank-name" />'>
										<liferay-ui:message key="bank-name" />:
									</dt>
									<dd>
										${evpGrantTransactionComposite.bankName}
									</dd>
								</c:if>

								<c:if test="${not empty evpGrantTransactionComposite.bankIBANCode}">
									<dt title='<liferay-ui:message key="iban" />'>
										<liferay-ui:message key="iban" />:
									</dt>
									<dd>
										${evpGrantTransactionComposite.bankIBANCode}
									</dd>
								</c:if>

								<c:if test="${not empty evpGrantTransactionComposite.bankBICCode}">
									<dt title='<liferay-ui:message key="bic" />'>
										<liferay-ui:message key="bic" />:
									</dt>
									<dd>
										${evpGrantTransactionComposite.bankBICCode}
									</dd>
								</c:if>

								<c:if test="${not empty evpGrantTransactionComposite.purposeOfUse}">
									<dt title='<liferay-ui:message key="additional-info" />'>
										<liferay-ui:message key="additional-info" />:
									</dt>
									<dd>
										${evpGrantTransactionComposite.purposeOfUse}
									</dd>
								</c:if>

								<c:choose>
									<c:when test="${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED)}">
										<c:if test="${not empty evpGrantTransactionComposite.date}">
											<dt title='<liferay-ui:message key="transaction-date" />'>
												<liferay-ui:message key="transaction-date" />:
											</dt>
											<dd>
												<fmt:formatDate value="${evpGrantTransactionComposite.date}" />
											</dd>
										</c:if>

										<c:if test="${not empty evpGrantTransactionComposite.number}">
											<dt title='<liferay-ui:message key="transaction-number" />'>
												<liferay-ui:message key="transaction-number" />:
											</dt>
											<dd>
												${evpGrantTransactionComposite.number}
											</dd>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${not empty evpGrantTransactionComposite.date}">
											<dt title='<liferay-ui:message key="check-date" />'>
												<liferay-ui:message key="check-date" />:
											</dt>
											<dd>
												<fmt:formatDate value="${evpGrantTransactionComposite.date}" />
											</dd>
										</c:if>

										<c:if test="${not empty evpGrantTransactionComposite.number}">
											<dt title='<liferay-ui:message key="check-number" />'>
												<liferay-ui:message key="check-number" />:
											</dt>
											<dd>
												${evpGrantTransactionComposite.number}
											</dd>
										</c:if>
									</c:otherwise>
								</c:choose>

								<c:if test="${evpGrantTransactionComposite.matching}">
									<dt title='<liferay-ui:message key="receipt" />'>
										<liferay-ui:message key="receipt" />:
									</dt>
									<dd>
										<aui:a href="${evpGrantTransactionComposite.getFileEntryPreviewURL(themeDisplay)}" label="${evpGrantTransactionComposite.fileEntryTitle}" target="_blank" />
									</dd>
								</c:if>
							</dl>
						</aui:fieldset>
					</c:if>
				</c:forEach>

				<dl>
					<dt title='<liferay-ui:message key="purpose" />'>
						<liferay-ui:message key="purpose" />:
					</dt>
					<dd class="clear-label">
						<ul>
							<c:forEach items="${evpGrantRequestComposite.purpose}" var="purpose" varStatus="status">
								<li>
									<liferay-ui:message key="${purposeTypeMap[purpose]}" />
								</li>
							</c:forEach>

							<c:if test="${not empty evpGrantRequestComposite.purposeOther}">
								<li>
									${fn:escapeXml(evpGrantRequestComposite.purposeOther)}
								</li>
							</c:if>
						</ul>
					</dd>
					<dt title='<liferay-ui:message key="behalf-of" />'>
						<liferay-ui:message key="behalf-of" />:
					</dt>
					<dd class="clear-label">
						<ul>
							<c:forEach items="${evpGrantRequestComposite.behalfOf}" var="behalfOf" varStatus="status">
								<li>
									<liferay-ui:message key="${behalfOfTypeMap[behalfOf]}" />
								</li>
							</c:forEach>

							<c:if test="${not empty evpGrantRequestComposite.behalfOfOther}">
								<li>
									${fn:escapeXml(evpGrantRequestComposite.behalfOfOther)}
								</li>
							</c:if>
						</ul>
					</dd>

					<c:if test="${not empty evpGrantRequestComposite.description}">
						<dt title='<liferay-ui:message key="description" />'>
							<liferay-ui:message key="description" />:
						</dt>
						<dd class="clear-label">
							${fn:escapeXml(evpGrantRequestComposite.description)}
						</dd>
					</c:if>
				</dl>
			</div>
		</aui:row>

		<aui:button-row>
			<aui:button onClick="Liferay.EVP.toggler.toggleAll()" value="toggle-all" />
		</aui:button-row>
	</aui:col>

	<aui:col width="${50}">
		<aui:row cssClass="section">
			<liferay-ui:header title="workflow" />

			<c:set value="<%= EVPGrantRequest.class.getName() %>" var="className" />

			<dl class="section-details">
				<dt title='<liferay-ui:message key="workflow-state" />'>
					<liferay-ui:message key="workflow-state" />:
				</dt>
				<dd>
					<liferay-ui:message key="${evpGrantRequestComposite.statusLabel}" />
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
						<c:when test='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "setStatus") && workflowTaskComposite.workflowTaskAssignedToUser}'>
							<aui:form method="post" name="fm${workflowTaskComposite.workflowTaskId}" onSubmit="event.preventDefault()">
								<c:if test='${(evpGrantRequestComposite.status == EVPWorkflowConstants.GRANT_STATUS_PENDING_FINANCIAL_REVIEW) && AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "viewFinanceForm")}'>
									<%@ include file="/WEB-INF/jsp/evp/views/grant_requests/financial_review_fields.jspf" %>
								</c:if>

								<aui:row>
									<aui:input cssClass="span12" label="comments" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="${workflowTaskComposite.workflowTaskId}Comments" type="textarea" />
								</aui:row>

								<aui:field-wrapper name="available-transitions">
									<aui:button-row>
										<portlet:renderURL var="viewEVPGrantRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
											<portlet:param name="controller" value="${controllerPath}" />
											<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexGrant" : "index"}' />
										</portlet:renderURL>

										<c:forEach items="${workflowTaskComposite.getTransitionComposites(className)}" var="transitionComposite">
											<portlet:actionURL var="setStatusURL">
												<portlet:param name="controller" value="reviewer_dashboard" />
												<portlet:param name="action" value="setGrantStatus" />
												<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
												<portlet:param name="redirect" value="${viewEVPGrantRequestsURL}" />

												<c:choose>
													<c:when test="${transitionComposite.commentsPrivate}">
														<portlet:param name="className" value="${className}" />
														<portlet:param name="classPK" value="${evpGrantRequestComposite.evpGrantRequestId}" />
														<portlet:param name="parentMessageId" value="${evpGrantRequestComposite.privateMessageId}" />
														<portlet:param name="threadId" value="${evpGrantRequestComposite.privateThreadId}" />
													</c:when>
													<c:otherwise>
														<portlet:param name="className" value="<%= WorkflowInstance.class.getName() %>" />
														<portlet:param name="classPK" value="${evpGrantRequestComposite.workflowInstanceId}" />
														<portlet:param name="parentMessageId" value="${evpGrantRequestComposite.publicMessageId}" />
														<portlet:param name="threadId" value="${evpGrantRequestComposite.publicThreadId}" />
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
					<portlet:param name="classPK" value="${evpGrantRequestComposite.evpGrantRequestId}" />
					<portlet:param name="parentMessageId" value="${evpGrantRequestComposite.privateMessageId}" />
					<portlet:param name="subsidiaryGroupId" value="${evpGrantRequestComposite.subsidiaryGroupId}" />
					<portlet:param name="threadId" value="${evpGrantRequestComposite.privateThreadId}" />
				</portlet:actionURL>

				<aui:form action="${addCommentURL}" method="post" name="extraCommentsFm">
					<aui:row>
						<aui:input cssClass="span12" helpMessage="evp-team-members-can-use-this-section-to-add-a-comment-at-any-time-during-the-workflow.-only-other-evp-team-members-will-be-notified-about-the-comment,-and-it-will-show-up-in-private-comments-below" label="" maxLength="${EVPConstants.MAX_FIELD_LENGTH_TEXTAREA}" name="extraComments" required="${true}" type="textarea" />
					</aui:row>

					<aui:button-row>
						<aui:button type="submit" value="add-comment" />
					</aui:button-row>
				</aui:form>
			</c:if>

			<c:if test="${evpGrantRequestComposite.publicMessagesCount > 0}">
				<liferay-ui:header showBackURL="${false}" title="comments" />

				<liferay-ui:discussion
					className="<%= WorkflowInstance.class.getName() %>"
					classPK="${evpGrantRequestComposite.workflowInstanceId}"
					formAction="${setStatusURL}"
					formName="commentFm"
					hideControls="${true}"
					ratingsEnabled="${false}"
					redirect="${portletURL}"
					userId="${themeDisplay.userId}"
				/>
			</c:if>

			<c:if test='${(controllerPath == "reviewer_dashboard") && (evpGrantRequestComposite.privateMessagesCount > 0)}'>
				<div class="portlet-msg-info">
					<liferay-ui:message key="the-comment-section-below-is-not-viewable-by-employees" />
				</div>

				<liferay-ui:header showBackURL="${false}" title="private-comments" />

				<liferay-ui:discussion
					className="<%= EVPGrantRequest.class.getName() %>"
					classPK="${evpGrantRequestComposite.evpGrantRequestId}"
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

			var financialReviewFields = ['Date', 'Number'];

			var grantTypes = ['${EVPGrantTransactionConstants.GRANT_LABEL_MATCHING}', '${EVPGrantTransactionConstants.GRANT_LABEL_PROPOSED}', '${EVPGrantTransactionConstants.GRANT_LABEL_SPONSORSHIP}'];

			if (node.id != '${EVPWorkflowConstants.GRANT_TRANSITION_CANCEL_REQUEST}') {
				A.Array.each(
					grantTypes,
					function(grantType) {
						A.Array.each(
							financialReviewFields,
							function(financialReviewField) {
								if (A.one('#<portlet:namespace />' + grantType + financialReviewField) != null) {
									rules['<portlet:namespace/>' + grantType + financialReviewField] = {
										required: true
									};
								}
							}
						);
					}
				);
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
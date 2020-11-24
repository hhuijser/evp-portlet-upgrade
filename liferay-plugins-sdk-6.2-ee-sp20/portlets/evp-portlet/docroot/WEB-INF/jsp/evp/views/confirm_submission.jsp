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

<aui:fieldset cssClass="confirmation-message">
	<div class="section-header">
		<liferay-ui:header title="confirmation-of-submission" />
	</div>

	<aui:field-wrapper cssClass="message">
		${confirmationMessage}
	</aui:field-wrapper>

	<c:if test="${not empty requestComposite}">
		<aui:field-wrapper cssClass="message">
			<liferay-ui:message arguments="${requestComposite.organizationName}" key="there-is-already-an-existing-organization-in-the-system-with-the-name-x.-we-have-used-the-following-organization-details-for-your-evp-request" />
		</aui:field-wrapper>

		<%@ include file="/WEB-INF/jsp/evp/views/request_organizations/view_details.jspf" %>

		<aui:field-wrapper cssClass="message">
			<liferay-ui:message arguments="${requestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_EMAIL)}" key="if-these-details-are-correct-you-do-not-need-to-take-any-further-action.-however-if-these-details-are-incorrect-please-contact-x-and-include-a-detailed-explanation-of-why-the-organization-information-is-incorrect" />
		</aui:field-wrapper>
	</c:if>

	<aui:button-row cssClass="button-holder">
		<portlet:renderURL var="viewRequestsURL" windowState="<%= LiferayWindowState.NORMAL.toString() %>">
			<portlet:param name="controller" value="${controllerPath}" />
			<portlet:param name="action" value="index" />
		</portlet:renderURL>

		<aui:button href="${viewRequestsURL}" value="back-to-dashboard" />
	</aui:button-row>
</aui:fieldset>
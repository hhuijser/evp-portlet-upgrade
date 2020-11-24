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

<liferay-util:include page="/WEB-INF/jsp/evp/views/toolbar.jsp" servletContext="<%= application %>">
	<liferay-util:param name="tabs1" value='${(controllerPath == "reviewer_dashboard") ? "reviewer" : "service"}' />
	<liferay-util:param name="tabs2" value='${(controllerPath == "reviewer_dashboard") ? "service" : ""}' />
</liferay-util:include>

<c:choose>
	<c:when test="${not empty participationError}">
		<aui:row fluid="${true}">
			<div class="alert alert-info">
				${participationError}
			</div>
		</aui:row>
	</c:when>
	<c:otherwise>
		<c:if test='${(controllerPath != "reviewer_dashboard") && AlloyPermission.contains(themeDisplay, "service_requests", "create", subsidiaryGroupId)}'>
			<aui:row cssClass="dashboard-top" fluid="${true}">
				<aui:button-row cssClass="create-request span4">
					<portlet:renderURL var="createEVPServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="service_requests" />
						<portlet:param name="action" value="create" />
					</portlet:renderURL>

					<aui:button cssClass="create-request-btn span12" href="${createEVPServiceRequestURL}" value="fill-out-service-request-form" />
				</aui:button-row>

				<c:set var="totalHours">
					<c:choose>
						<c:when test="${evpEmployee.employmentType == EVPConstants.EMPLOYMENT_TYPE_FULL_TIME}">
							${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FULL_TIME_SERVICE_HOURS)}
						</c:when>
						<c:when test="${evpEmployee.employmentType == EVPConstants.EMPLOYMENT_TYPE_PART_TIME}">
							${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_PART_TIME_SERVICE_HOURS)}
						</c:when>
						<c:when test="${evpEmployee.employmentType == EVPConstants.EMPLOYMENT_TYPE_TEMPORARY}">
							${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TEMPORARY_SERVICE_HOURS)}
						</c:when>
					</c:choose>
				</c:set>

				<aui:field-wrapper cssClass="progress-bar-wrapper span8">
					<c:set var="units">
						<liferay-ui:message key="hours" />
					</c:set>

					<jsp:useBean class="java.util.Date" id="now" />

					<fmt:formatDate pattern="yyyy" value="${now}" var="currentYear" />

					<div class="progress-bar" data-total="${totalHours}" data-units="${units}" data-used="${EVPUtil.getUsersTotalServiceHoursUsed(themeDisplay.userId, currentYear, 0)}" id="testingService">
						<div class="remaining"></div>
					</div>
				</aui:field-wrapper>
			</aui:row>
		</c:if>
	</c:otherwise>
</c:choose>

<portlet:renderURL var="viewEVPServiceRequestsURL">
	<portlet:param name="controller" value="${controllerPath}" />
	<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexService" : "index"}' />
	<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
</portlet:renderURL>

<c:set value='${(controllerPath == "reviewer_dashboard") ? "reviewer" : ""}' var="cssClassReviewer" />

<aui:form action="${viewEVPServiceRequestsURL}" cssClass="dashboard evp-form ${cssClassReviewer}" method="get" name="fm">
	<aui:fieldset>
		<aui:row fluid="${true}">
			<div class="search-request">
				<aui:input cssClass="span12" inlineField="${true}" label="keywords" name="keywords" size="30" title="search-service-requests" type="text" wrapperCssClass="span6" />

				<aui:select cssClass="span12" inlineField="${true}" label="status" name="statusFilter" wrapperCssClass="span4 workflow-status">
					<aui:option label="${EVPWorkflowConstants.STATUS_LABEL_ALL}" selected="${statusFilter == EVPWorkflowConstants.STATUS_LABEL_ALL}" value="${EVPWorkflowConstants.STATUS_LABEL_ALL}" />
					<aui:option label="${EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" selected="${statusFilter == EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" value="${EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" />

					<c:forEach items="${searchableServiceLabels}" var="searchableServiceLabel">
						<aui:option label="${searchableServiceLabel}" selected="${statusFilter == searchableServiceLabel}" value="${searchableServiceLabel}" />
					</c:forEach>
				</aui:select>

				<aui:button cssClass="search-btn span2" type="submit" value="search" />
			</div>
		</aui:row>
	</aui:fieldset>
</aui:form>

<liferay-ui:search-container emptyResultsMessage="there-are-no-service-requests" iteratorURL="${alloySearchResult.portletURL}" orderByCol="${orderByCol}" orderByType="${orderByType}">
	<liferay-ui:search-container-results
		results="${evpServiceRequestComposites}"
		total="${alloySearchResult.size}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="evpServiceRequestId"
		modelVar="evpServiceRequestComposite"
	>
		<c:catch>
			<c:if test="${evpServiceRequestComposite.pastDue && (evpServiceRequestComposite.confirmedTotalHours <= 0)}">
				<liferay-ui:search-container-row-parameter name="className" value="alert-danger" />
			</c:if>

			<c:choose>
				<c:when test='${(controllerPath != "reviewer_dashboard") && evpServiceRequestComposite.statusEditable}'>
					<c:set value='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "edit")}' var="hasPermission" />

					<portlet:renderURL var="evpServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="${controllerPath}" />
						<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "editService" : "edit"}' />
						<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
					</portlet:renderURL>
				</c:when>
				<c:when test='${(controllerPath != "reviewer_dashboard") && evpServiceRequestComposite.statusEditableFeedback}'>
					<c:set value='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "feedback")}' var="hasPermission" />

					<portlet:renderURL var="evpServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="service_requests" />
						<portlet:param name="action" value="feedback" />
						<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
					</portlet:renderURL>
				</c:when>
				<c:otherwise>
					<c:set value='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "view")}' var="hasPermission" />

					<portlet:renderURL var="evpServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="${controllerPath}" />
						<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewService" : "view"}' />
						<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
					</portlet:renderURL>
				</c:otherwise>
			</c:choose>

			<liferay-ui:search-container-column-text
				cssClass="create-date"
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="create-date"
				orderable="${true}"
				orderableProperty="createDate"
			>
				<span class="default-time hide">${evpServiceRequestComposite.createDate}</span>

				<fmt:formatDate value="${evpServiceRequestComposite.createDate}" />
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				cssClass="modified-date"
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="modified-date"
				orderable="${true}"
				orderableProperty="modified"
			>
				<span class="default-time hide">${evpServiceRequestComposite.modifiedDate}</span>

				<fmt:formatDate value="${evpServiceRequestComposite.modifiedDate}" />
			</liferay-ui:search-container-column-text>

			<c:if test='${controllerPath == "reviewer_dashboard"}'>
				<liferay-ui:search-container-column-text
					href='${hasPermission ? evpServiceRequestURL : ""}'
					name="name"
					orderable="${true}"
					orderableProperty="creatorUserFullName_sortable"
					property="creatorUserFullName"
				/>
			</c:if>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="organization-name"
				orderable="${true}"
				orderableProperty="organizationName_sortable"
				property="organizationName"
			/>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="start-date"
				orderable="${true}"
				orderableProperty="requestedStartDate"
			>
				<fmt:formatDate value="${evpServiceRequestComposite.requestedStartDate}" />
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="end-date"
				orderable="${true}"
				orderableProperty="requestedEndDate"
			>
				<fmt:formatDate value="${evpServiceRequestComposite.requestedEndDate}" />
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="total-hours-requested"
				orderable="${true}"
				orderableProperty="requestedTotalHours"
				property="requestedTotalHours"
			/>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpServiceRequestURL : ""}'
				name="status"
				orderable="${true}"
				orderableProperty="statusLabel_sortable"
			>
				<c:choose>
					<c:when test="${evpServiceRequestComposite.fork}">
						<c:forEach items="${evpServiceRequestComposite.forkStatusLabels}" var="forkStatusLabel">
							<liferay-ui:message key="${forkStatusLabel}" /><br />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<liferay-ui:message key="${evpServiceRequestComposite.statusLabel}" />
					</c:otherwise>
				</c:choose>
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
					align="right"
			>
				<liferay-ui:icon-menu>
					<c:if test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "view")}'>
						<portlet:renderURL var="viewEVPServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="controller" value="${controllerPath}" />
							<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewService" : "view"}' />
							<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
						</portlet:renderURL>

						<liferay-ui:icon
							image="view"
							method="get"
							url="${viewEVPServiceRequestURL}"
						/>
					</c:if>

					<c:if test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "edit")}'>
						<portlet:renderURL var="editEVPServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="controller" value="${controllerPath}" />
							<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "editService" : "edit"}' />
							<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
						</portlet:renderURL>

						<liferay-ui:icon
							image="edit"
							method="get"
							url="${editEVPServiceRequestURL}"
						/>
					</c:if>

					<c:if test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "feedback") && (controllerPath != "reviewer_dashboard")}'>
						<portlet:renderURL var="feedbackEVPServiceRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="controller" value="service_requests" />
							<portlet:param name="action" value="feedback" />
							<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
						</portlet:renderURL>

						<liferay-ui:icon
							image="edit"
							message="fill-out-feedback-form"
							method="get"
							url="${feedbackEVPServiceRequestURL}"
						/>
					</c:if>

					<c:if test='${AlloyPermission.contains(themeDisplay, evpServiceRequestComposite.evpServiceRequest, "delete")}'>
						<portlet:actionURL var="deleteEVPServiceRequestURL">
							<portlet:param name="controller" value="service_requests" />
							<portlet:param name="action" value="delete" />
							<portlet:param name="id" value="${evpServiceRequestComposite.evpServiceRequestId}" />
							<portlet:param name="redirect" value="${alloySearchResult.portletURL}" />
						</portlet:actionURL>

						<liferay-ui:icon-delete
								url="${deleteEVPServiceRequestURL}"
						/>
					</c:if>
				</liferay-ui:icon-menu>
			</liferay-ui:search-container-column-text>
		</c:catch>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script use="aui-base,aui-datatype">
	function formatDates(selector) {
		var dateRow = A.all('.' + selector + '-date');

		Liferay.Portlet.EVP.setNewDateValue(dateRow);
	}

	formatDates('create');
	formatDates('modified');
</aui:script>
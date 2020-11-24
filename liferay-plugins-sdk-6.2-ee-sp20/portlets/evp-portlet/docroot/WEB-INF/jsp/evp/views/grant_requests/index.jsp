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
	<liferay-util:param name="tabs1" value='${(controllerPath == "reviewer_dashboard") ? "reviewer" : "grant"}' />
	<liferay-util:param name="tabs2" value='${(controllerPath == "reviewer_dashboard") ? "grant" : ""}' />
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
		<c:if test='${(controllerPath != "reviewer_dashboard") && AlloyPermission.contains(themeDisplay, "grant_requests", "create", subsidiaryGroupId)}'>
			<aui:row cssClass="dashboard-top" fluid="${true}">
				<aui:button-row cssClass="create-request span4">
					<portlet:renderURL var="createEVPGrantRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="grant_requests" />
						<portlet:param name="action" value="create" />
					</portlet:renderURL>

					<aui:button cssClass="create-request-btn span12" href="${createEVPGrantRequestURL}" value="fill-out-grant-request-form" />
				</aui:button-row>

				<aui:field-wrapper cssClass="progress-bar-wrapper span8">
					<jsp:useBean class="java.util.Date" id="now" />

					<fmt:formatDate pattern="yyyy" value="${now}" var="currentYear" />

					<div class="progress-bar" data-total="${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT)}" data-units="${EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE)}" data-used="${EVPUtil.getUsersTotalGrantAmountUsed(themeDisplay.userId, currentYear, 0)}" id="testingGrant">
						<div class="remaining"></div>
					</div>
				</aui:field-wrapper>
			</aui:row>
		</c:if>
	</c:otherwise>
</c:choose>

<portlet:renderURL var="viewEVPGrantRequestsURL">
	<portlet:param name="controller" value="${controllerPath}" />
	<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "indexGrant" : "index"}' />
	<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
</portlet:renderURL>

<c:set value='${(controllerPath == "reviewer_dashboard") ? "reviewer" : ""}' var="cssClassReviewer" />

<aui:form action="${viewEVPGrantRequestsURL}" cssClass="dashboard evp-form ${cssClassReviewer}" method="get" name="fm">
	<aui:fieldset>
		<aui:row fluid="${true}">
			<div class="search-request">
				<aui:input cssClass="span12" inlineField="${true}" label="keywords" name="keywords" size="30" title="search-grant-requests" type="text" wrapperCssClass="span6" />

				<aui:select cssClass="span12" inlineField="${true}" label="status" name="statusFilter" wrapperCssClass="span4 workflow-status">
					<aui:option label="${EVPWorkflowConstants.STATUS_LABEL_ALL}" selected="${statusFilter == EVPWorkflowConstants.STATUS_LABEL_ALL}" value="${EVPWorkflowConstants.STATUS_LABEL_ALL}" />
					<aui:option label="${EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" selected="${statusFilter == EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" value="${EVPWorkflowConstants.STATUS_LABEL_ACTIVE}" />

					<c:forEach items="${searchableGrantLabels}" var="searchableGrantLabel">
						<aui:option label="${searchableGrantLabel}" selected="${statusFilter == searchableGrantLabel}" value="${searchableGrantLabel}" />
					</c:forEach>
				</aui:select>

				<aui:button cssClass="search-btn span2" type="submit" value="search" />
			</div>
		</aui:row>
	</aui:fieldset>
</aui:form>

<liferay-ui:search-container emptyResultsMessage="there-are-no-grant-requests" iteratorURL="${alloySearchResult.portletURL}" orderByCol="${orderByCol}" orderByType="${orderByType}">
	<liferay-ui:search-container-results
		results="${evpGrantRequestComposites}"
		total="${alloySearchResult.size}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="evpGrantRequestId"
		modelVar="evpGrantRequestComposite"
	>
		<c:catch>
			<aui:input name="createDate" type="hidden" value="${evpGrantRequestComposite.createDate}" />
			<aui:input name="modifiedDate" type="hidden" value="${evpGrantRequestComposite.modifiedDate}" />

			<c:choose>
				<c:when test='${(controllerPath != "reviewer_dashboard") && evpGrantRequestComposite.statusEditable}'>
					<c:set value='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "edit")}' var="hasPermission" />

					<portlet:renderURL var="evpGrantRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="${controllerPath}" />
						<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "editGrant" : "edit"}' />
						<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
					</portlet:renderURL>
				</c:when>
				<c:otherwise>
					<c:set value='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "view")}' var="hasPermission" />

					<portlet:renderURL var="evpGrantRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
						<portlet:param name="controller" value="${controllerPath}" />
						<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewGrant" : "view"}' />
						<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
					</portlet:renderURL>
				</c:otherwise>
			</c:choose>

			<liferay-ui:search-container-column-text
				cssClass="create-date"
				href='${hasPermission ? evpGrantRequestURL : ""}'
				name="create-date"
				orderable="${true}"
				orderableProperty="createDate"
			>
				<span class="default-time hide">${evpGrantRequestComposite.createDate}</span>

				<fmt:formatDate value="${evpGrantRequestComposite.createDate}" />
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				cssClass="modified-date"
				href='${hasPermission ? evpGrantRequestURL : ""}'
				name="modified-date"
				orderable="${true}"
				orderableProperty="modified"
			>
				<span class="default-time hide">${evpGrantRequestComposite.modifiedDate}</span>

				<fmt:formatDate value="${evpGrantRequestComposite.modifiedDate}" />
			</liferay-ui:search-container-column-text>

			<c:if test='${controllerPath == "reviewer_dashboard"}'>
				<liferay-ui:search-container-column-text
					href='${hasPermission ? evpGrantRequestURL : ""}'
					name="name"
					orderable="${true}"
					orderableProperty="creatorUserFullName_sortable"
					property="creatorUserFullName"
				/>
			</c:if>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpGrantRequestURL : ""}'
				name="organization-name"
				orderable="${true}"
				orderableProperty="organizationName_sortable"
				property="organizationName"
			/>

			<c:forEach items="${grantTypeMap}" var="grantTypeEntry">
				<liferay-ui:search-container-column-text
					href='${hasPermission ? evpGrantRequestURL : ""}'
					name="${grantTypeEntry.value}"
					orderable="${true}"
					orderableProperty="${grantTypeEntry.value}Amount"
				>
					<c:set value="${evpGrantRequestComposite.evpGrantTransactionCompositesMap[grantTypeEntry.value]}" var="evpGrantTransactionComposite" />

					<fmt:formatNumber pattern="### ${evpGrantRequestComposite.getCreatorSubsidiaryProperty(PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE)}" type="currency" value="${evpGrantTransactionComposite.amount}" />
				</liferay-ui:search-container-column-text>
			</c:forEach>

			<liferay-ui:search-container-column-text
				href='${hasPermission ? evpGrantRequestURL : ""}'
				name="status"
				orderable="${true}"
				orderableProperty="statusLabel_sortable"
			>
				<liferay-ui:message key="${evpGrantRequestComposite.statusLabel}" />
			</liferay-ui:search-container-column-text>

			<liferay-ui:search-container-column-text
				align="right"
			>
				<liferay-ui:icon-menu>
					<c:if test='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "view")}'>
						<portlet:renderURL var="viewEVPGrantRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="controller" value="${controllerPath}" />
							<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "viewGrant" : "view"}' />
							<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
						</portlet:renderURL>

						<liferay-ui:icon
							image="view"
							method="get"
							url="${viewEVPGrantRequestURL}"
						/>
					</c:if>

					<c:if test='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "edit")}'>
						<portlet:renderURL var="editEVPGrantRequestURL" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>">
							<portlet:param name="controller" value="${controllerPath}" />
							<portlet:param name="action" value='${(controllerPath == "reviewer_dashboard") ? "editGrant" : "edit"}' />
							<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
						</portlet:renderURL>

						<liferay-ui:icon
							image="edit"
							method="get"
							url="${editEVPGrantRequestURL}"
						/>
					</c:if>

					<c:if test='${AlloyPermission.contains(themeDisplay, evpGrantRequestComposite.evpGrantRequest, "delete")}'>
						<portlet:actionURL var="deleteEVPGrantRequestURL">
							<portlet:param name="controller" value="grant_requests" />
							<portlet:param name="action" value="delete" />
							<portlet:param name="id" value="${evpGrantRequestComposite.evpGrantRequestId}" />
							<portlet:param name="redirect" value="${alloySearchResult.portletURL}" />
						</portlet:actionURL>

						<liferay-ui:icon-delete
								url="${deleteEVPGrantRequestURL}"
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
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

<liferay-ui:search-container emptyResultsMessage="there-are-no-contacts" iteratorURL="${portletURL}">
	<liferay-ui:search-container-results
		results="${requestScope[param.resultsParam]}"
		total="${requestScope[param.totalParam]}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="userId"
		modelVar="userComposite"
	>
		<liferay-ui:search-container-column-text
			name="first-name"
			property="firstName"
		/>

		<liferay-ui:search-container-column-text
			name="last-name"
			property="lastName"
		/>

		<liferay-ui:search-container-column-text
			name="email"
			value="${userComposite.emailAddress.address}"
		/>

		<liferay-ui:search-container-column-text
			name="phone"
			value="${userComposite.phone.number}"
		/>

		<liferay-ui:search-container-column-text
			name="of-service-requests"
			property="evpServiceRequestsCount"
		/>

		<liferay-ui:search-container-column-text
			name="of-grant-requests"
			property="evpGrantRequestsCount"
		/>

		<liferay-ui:search-container-column-text
			align="right"
		>
			<c:set value="${userComposite.firstName} ${userComposite.lastName}" var="userCompositeFullName" />

			<c:choose>
				<c:when test='${actionPath == "index"}'>
					<liferay-ui:icon-menu>
						<portlet:renderURL var="selectUserURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
							<portlet:param name="controller" value="users" />
							<portlet:param name="action" value="selectReplacement" />
							<portlet:param name="id" value="${userComposite.userId}" />
							<portlet:param name="organizationId" value="${organizationId}" />
						</portlet:renderURL>

						<c:set value="${fn:escapeXml(userCompositeFullName)}" var="selectUserURLTitle" />

						<c:set value="javascript:Liferay.Portlet.EVP.openWindow('${selectUserURL}', '${selectUserURLTitle}', true, 2000)" var="selectUserURL" />

						<liferay-ui:icon
							image="edit"
							message="select-replacement"
							method="get"
							url="${selectUserURL}"
						/>
					</liferay-ui:icon-menu>
				</c:when>
				<c:when test='${actionPath == "selectReplacement"}'>
					<liferay-ui:icon-menu>
						<portlet:actionURL var="replaceUserURL">
							<portlet:param name="controller" value="users" />
							<portlet:param name="action" value="replace" />
							<portlet:param name="duplicateUserId" value="${duplicateUser.userId}" />
							<portlet:param name="mainUserId" value="${userComposite.userId}" />
						</portlet:actionURL>

						<c:set var="confirmationMessage">
							<c:set value="${duplicateUser.firstName} ${duplicateUser.lastName}" var="duplicateUserFullName" />

							<c:set value='${empty duplicateUserFullName ? " " : duplicateUserFullName};${empty userCompositeFullName ? " " : userCompositeFullName};' var="arguments" />

							<liferay-ui:message arguments='${fn:split(arguments, ";")}' key="are-you-sure-you-want-to-replace-x-with-x-and-delete-x" />
						</c:set>

						<liferay-ui:icon-delete
							confirmation="${confirmationMessage}"
							image="copy"
							message="select"
							url="${replaceUserURL}"
						/>
					</liferay-ui:icon-menu>
				</c:when>
			</c:choose>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
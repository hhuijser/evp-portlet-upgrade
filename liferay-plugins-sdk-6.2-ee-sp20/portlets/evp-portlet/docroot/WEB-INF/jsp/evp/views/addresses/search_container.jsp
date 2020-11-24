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

<liferay-ui:search-container emptyResultsMessage="there-are-no-addresses" iteratorURL="${portletURL}">
	<liferay-ui:search-container-results
		results="${requestScope[param.resultsParam]}"
		total="${requestScope[param.totalParam]}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="addressId"
		modelVar="addressComposite"
	>
		<liferay-ui:search-container-column-text
			name="street"
			property="street1"
		/>

		<liferay-ui:search-container-column-text
			property="city"
		/>

		<liferay-ui:search-container-column-text
			name="country"
		>
			<liferay-ui:message key='${empty addressComposite.country ? "" : "country."}${addressComposite.country.name}' />
		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-text
			property="zip"
		/>

		<liferay-ui:search-container-column-text
			property="primary"
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
			<c:choose>
				<c:when test='${actionPath == "index"}'>
					<liferay-ui:icon-menu>
						<portlet:renderURL var="selectAddressURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
							<portlet:param name="controller" value="addresses" />
							<portlet:param name="action" value="selectReplacement" />
							<portlet:param name="id" value="${addressComposite.addressId}" />
						</portlet:renderURL>

						<c:set value="${fn:escapeXml(address.street1)}" var="selectURLTitle" />

						<c:set value="javascript:Liferay.Portlet.EVP.openWindow('${selectAddressURL}', '${selectURLTitle}', true, 2000)" var="selectAddressURL" />

						<liferay-ui:icon
							image="edit"
							message="replace"
							method="get"
							url="${selectAddressURL}"
						/>
					</liferay-ui:icon-menu>
				</c:when>
				<c:when test='${actionPath == "selectReplacement"}'>
					<liferay-ui:icon-menu>
						<portlet:actionURL var="replaceAddressURL">
							<portlet:param name="controller" value="addresses" />
							<portlet:param name="action" value="replace" />
							<portlet:param name="duplicateAddressId" value="${duplicateAddress.addressId}" />
							<portlet:param name="mainAddressId" value="${addressComposite.addressId}" />
						</portlet:actionURL>

						<c:set var="confirmationMessage">
							<c:set value='${empty duplicateAddress.street1 ? " " : duplicateAddress.street1};${empty addressComposite.street1 ? " " : addressComposite.street1};' var="arguments" />

							<liferay-ui:message arguments='${fn:split(arguments, ";")}' key="are-you-sure-you-want-to-replace-x-with-x-and-delete-x" />
						</c:set>

						<liferay-ui:icon-delete
							confirmation="${confirmationMessage}"
							image="copy"
							message="select"
							url="${replaceAddressURL}"
						/>
					</liferay-ui:icon-menu>
				</c:when>
			</c:choose>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
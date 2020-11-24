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

<liferay-ui:search-container emptyResultsMessage="there-are-no-urls" iteratorURL="${portletURL}">
	<liferay-ui:search-container-results
		results="${requestScope[param.resultsParam]}"
		total="${requestScope[param.totalParam]}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="websiteId"
		modelVar="websiteComposite"
	>
		<liferay-ui:search-container-column-text
			name="url"
			property="url"
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
					<portlet:renderURL var="selectWebsiteURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
						<portlet:param name="controller" value="websites" />
						<portlet:param name="action" value="selectReplacement" />
						<portlet:param name="id" value="${websiteComposite.websiteId}" />
					</portlet:renderURL>

					<c:set value="${fn:escapeXml(websiteComposite.url)}" var="selectWebsiteURLTitle" />

					<c:set value="javascript:Liferay.Portlet.EVP.openWindow('${selectWebsiteURL}', '${selectWebsiteURLTitle}', true, 2000)" var="selectWebsiteURL" />

					<liferay-ui:icon
						image="edit"
						message="select-replacement"
						method="get"
						url="${selectWebsiteURL}"
					/>
					</liferay-ui:icon-menu>
				</c:when>
				<c:when test='${actionPath == "selectReplacement"}'>
					<liferay-ui:icon-menu>
						<portlet:actionURL var="replaceWebsiteURL">
							<portlet:param name="controller" value="websites" />
							<portlet:param name="action" value="replace" />
							<portlet:param name="duplicateWebsiteId" value="${duplicateWebsite.websiteId}" />
							<portlet:param name="mainWebsiteId" value="${websiteComposite.websiteId}" />
						</portlet:actionURL>

						<c:set var="confirmationMessage">
							<c:set value='${empty duplicateWebsite.url ? " " : duplicateWebsite.url};${empty websiteComposite.url ? " " : websiteComposite.url};' var="arguments" />

							<liferay-ui:message arguments='${fn:split(arguments, ";")}' key="are-you-sure-you-want-to-replace-x-with-x-and-delete-x" />
						</c:set>

						<liferay-ui:icon-delete
							confirmation="${confirmationMessage}"
							image="copy"
							message="select"
							url="${replaceWebsiteURL}"
						/>
					</liferay-ui:icon-menu>
				</c:when>
			</c:choose>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
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

<c:set var ="alloySearchResult" value="${requestScope[param.alloySearchResultParam]}" />

<liferay-ui:search-container emptyResultsMessage="there-are-no-request-organizations" iteratorURL="${alloySearchResult.portletURL}" orderByCol="${orderByCol}" orderByType="${orderByType}">
	<liferay-ui:search-container-results
		results="${requestScope[param.resultsParam]}"
		total="${alloySearchResult.size}"
	/>

	<liferay-ui:search-container-row
		className="java.lang.Object"
		escapedModel="${true}"
		keyProperty="evpRequestOrganizationId"
		modelVar="evpRequestOrganizationComposite"
	>
		<portlet:renderURL var="viewEVPRequestOrganizationURL">
			<portlet:param name="controller" value="request_organizations" />
			<portlet:param name="action" value="view" />
			<portlet:param name="id" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="name"
			orderable="${true}"
			orderableProperty="name_sortable"
			value="${evpRequestOrganizationComposite.organization.name}"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="street"
			value="${evpRequestOrganizationComposite.address.street1}"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="city"
			orderable="${true}"
			orderableProperty="city_sortable"
			value="${evpRequestOrganizationComposite.address.city}"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="country"
			orderable="${true}"
			orderableProperty="country_sortable"
		>
			<liferay-ui:message key='${empty evpRequestOrganizationComposite.country ? "" : "country."}${evpRequestOrganizationComposite.country.name}' />
		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="url"
			orderable="${true}"
			orderableProperty="url_sortable"
			value="${evpRequestOrganizationComposite.website.url}"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="tax-id"
		>
			<liferay-ui:message key='${empty evpRequestOrganizationComposite.taxIdentificationNumber ? "na" : evpRequestOrganizationComposite.taxIdentificationNumber}' />
		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="description"
			property="descriptionTruncated"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="of-grant-requests"
			property="evpGrantRequestsCount"
		/>

		<liferay-ui:search-container-column-text
			href="${viewEVPRequestOrganizationURL}"
			name="of-service-requests"
			property="evpServiceRequestsCount"
		/>

		<liferay-ui:search-container-column-text
			align="right"
		>
			<c:choose>
				<c:when test='${actionPath == "index"}'>
					<liferay-ui:icon-menu>
					<portlet:renderURL var="editEVPRequestOrganizationURL">
						<portlet:param name="controller" value="request_organizations" />
						<portlet:param name="action" value="edit" />
						<portlet:param name="id" value="${evpRequestOrganization.evpRequestOrganizationId}" />
					</portlet:renderURL>

					<liferay-ui:icon
						image="edit"
						method="get"
						url="${editEVPRequestOrganizationURL}"
					/>

					<portlet:actionURL var="deleteEVPRequestOrganizationURL">
						<portlet:param name="controller" value="request_organizations" />
						<portlet:param name="action" value="delete" />
						<portlet:param name="id" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
						<portlet:param name="redirect" value="${alloySearchResult.portletURL}" />
					</portlet:actionURL>

					<liferay-ui:icon
						image="delete"
						onClick="${renderResponse.namespace}validateDelete('${evpRequestOrganizationComposite.evpGrantRequestsCount}','${evpRequestOrganizationComposite.evpServiceRequestsCount}', '${deleteEVPRequestOrganizationURL}');"
						url="javascript:"
					/>

					<portlet:renderURL var="selectEVPRequestOrganizationsURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
						<portlet:param name="controller" value="request_organizations" />
						<portlet:param name="action" value="selectReplacement" />
						<portlet:param name="id" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
						<portlet:param name="keywords" value="${keywords}" />
					</portlet:renderURL>

					<c:set value="${fn:escapeXml(evpRequestOrganizationComposite.organization.name)}" var="selectURLTitle" />

					<c:set value="javascript:Liferay.Portlet.EVP.openWindow('${selectEVPRequestOrganizationsURL}', '${selectURLTitle}', true, 2000)" var="selectEVPRequestOrganizationsURL" />

					<liferay-ui:icon
						image="edit"
						message="select-replacement"
						method="get"
						url="${selectEVPRequestOrganizationsURL}"
					/>

					<portlet:renderURL var="manageAddressesEVPRequestOrganizationsURL">
						<portlet:param name="controller" value="addresses" />
						<portlet:param name="action" value="index" />
						<portlet:param name="evpRequestOrganizationId" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
					</portlet:renderURL>

					<liferay-ui:icon
						image="edit"
						message="manage-addresses"
						method="get"
						url="${manageAddressesEVPRequestOrganizationsURL}"
					/>

					<portlet:renderURL var="manageContactsEVPRequestOrganizationsURL">
						<portlet:param name="controller" value="users" />
						<portlet:param name="action" value="index" />
						<portlet:param name="evpRequestOrganizationId" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
					</portlet:renderURL>

					<liferay-ui:icon
						image="edit"
						message="manage-contacts"
						method="get"
						url="${manageContactsEVPRequestOrganizationsURL}"
					/>

					<portlet:renderURL var="manageURLsEVPRequestOrganizationsURL">
						<portlet:param name="controller" value="websites" />
						<portlet:param name="action" value="index" />
						<portlet:param name="evpRequestOrganizationId" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
					</portlet:renderURL>

					<liferay-ui:icon
						image="edit"
						message="manage-urls"
						method="get"
						url="${manageURLsEVPRequestOrganizationsURL}"
					/>
					</liferay-ui:icon-menu>
				</c:when>
				<c:when test='${actionPath == "selectReplacement"}'>
					<liferay-ui:icon-menu>
						<portlet:actionURL var="replaceEVPRequestOrganizationURL">
							<portlet:param name="controller" value="request_organizations" />
							<portlet:param name="action" value="replace" />
							<portlet:param name="duplicateEVPRequestOrganizationId" value="${duplicateEVPRequestOrganizationComposite.evpRequestOrganizationId}" />
							<portlet:param name="mainEVPRequestOrganizationId" value="${evpRequestOrganizationComposite.evpRequestOrganizationId}" />
						</portlet:actionURL>

						<c:set var="confirmationMessage">
							<c:set value='${empty duplicateEVPRequestOrganizationComposite.organization.name ? " " : duplicateEVPRequestOrganizationComposite.organization.name};${empty evpRequestOrganizationComposite.organization.name ? " " : evpRequestOrganizationComposite.organization.name};' var="arguments" />

							<liferay-ui:message arguments='${fn:split(arguments, ";")}' key="are-you-sure-you-want-to-replace-x-with-x-and-delete-x" />
						</c:set>

						<liferay-ui:icon-delete
							confirmation="${confirmationMessage}"
							image="copy"
							message="replace"
							url="${replaceEVPRequestOrganizationURL}"
							/>
					</liferay-ui:icon-menu>
				</c:when>
			</c:choose>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	function <portlet:namespace />confirmDelete(message, url) {
		if (confirm(message)) {
			window.location.href = url;
		}
	}

	function <portlet:namespace />validateDelete(evpGrantRequestsCount, evpServiceRequestsCount, url) {
		if ((evpGrantRequestsCount <= 0) && (evpServiceRequestsCount <= 0)) {
			<portlet:namespace />confirmDelete(Liferay.Language.get('are-you-sure-you-want-to-delete-this-organization-and-all-associated-entities'), url);
		}
		else {
			alert(Liferay.Language.get('you-cannot-delete-this-organization-because-it-is-used-by-x-existing-grant-requests-and-x-existing-service-requests', [evpGrantRequestsCount, evpServiceRequestsCount]));
		}
	}
</aui:script>
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

<aui:button-row>
	<portlet:renderURL var="createEVPGrantTransactionURL">
		<portlet:param name="controller" value="grant_transactions" />
		<portlet:param name="action" value="create" />
	</portlet:renderURL>

	<aui:button href="${createEVPGrantTransactionURL}" value="create-evp-grant-transaction" />
</aui:button-row>

<liferay-ui:search-container emptyResultsMessage="there-are-no-evp-grant-transactions" iteratorURL="${portletURL}">
	<liferay-ui:search-container-results
		results="${evpGrantTransactions}"
		total="${evpGrantTransactionsCount}"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.evp.model.EVPGrantTransaction"
		escapedModel="${true}"
		keyProperty="evpGrantTransactionId"
		modelVar="evpGrantTransaction"
	>
		<portlet:renderURL var="viewEVPGrantTransactionURL">
			<portlet:param name="controller" value="grant_transactions" />
			<portlet:param name="action" value="view" />
			<portlet:param name="id" value="${evpGrantTransaction.evpGrantTransactionId}" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			href="${viewEVPGrantTransactionURL}"
			orderable="${true}"
			property="name"
		/>

		<liferay-ui:search-container-column-text
			align="right"
		>
			<liferay-ui:icon-menu>
				<liferay-ui:icon
					image="view"
					method="get"
					url="${viewEVPGrantTransactionURL}"
				/>

				<portlet:renderURL var="editEVPGrantTransactionURL">
					<portlet:param name="controller" value="grant_transactions" />
					<portlet:param name="action" value="edit" />
					<portlet:param name="id" value="${evpGrantTransaction.evpGrantTransactionId}" />
				</portlet:renderURL>

				<liferay-ui:icon
					image="edit"
					method="get"
					url="${editEVPGrantTransactionURL}"
				/>

				<portlet:renderURL var="viewEVPGrantTransactionsURL">
					<portlet:param name="controller" value="grant_transactions" />
					<portlet:param name="action" value="index" />
				</portlet:renderURL>

				<portlet:actionURL var="deleteEVPGrantTransactionURL">
					<portlet:param name="controller" value="grant_transactions" />
					<portlet:param name="action" value="delete" />
					<portlet:param name="id" value="${evpGrantTransaction.evpGrantTransactionId}" />
					<portlet:param name="redirect" value="${viewEVPGrantTransactionsURL}" />
				</portlet:actionURL>

				<liferay-ui:icon-delete
					url="${deleteEVPGrantTransactionURL}"
				/>
			</liferay-ui:icon-menu>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
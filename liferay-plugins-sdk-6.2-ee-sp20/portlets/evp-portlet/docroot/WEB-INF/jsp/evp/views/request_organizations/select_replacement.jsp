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

<liferay-ui:header title="request-organizations" />

<portlet:renderURL var="selectEVPRequestOrganizationsURL">
	<portlet:param name="controller" value="request_organizations" />
	<portlet:param name="action" value="selectReplacement" />
</portlet:renderURL>

<aui:form action="${selectEVPRequestOrganizationsURL}" cssClass="dashboard evp-form" method="get" name="fm1" onSubmit="event.preventDefault(); ${renderResponse.namespace}searchEVPRequestOrganizations();">
	<aui:fieldset>
		<aui:row fluid="${true}">
			<div class="search-request">
				<aui:input name="id" type="hidden" value="${duplicateEVPRequestOrganizationComposite.evpRequestOrganizationId}" />

				<aui:input cssClass="span12" inlineField="${true}" label="keywords" name="keywords" size="30" title="search-organizations" type="text" wrapperCssClass="span6" />

				<aui:button cssClass="search-btn span2" type="submit" value="search" />
			</div>
		</aui:row>
	</aui:fieldset>
</aui:form>

<liferay-util:include page="/WEB-INF/jsp/evp/views/request_organizations/search_container.jsp" servletContext="<%= application %>">
	<liferay-util:param name="alloySearchResultParam" value="alloySearchResult" />
	<liferay-util:param name="resultsParam" value="evpRequestOrganizationComposites" />
</liferay-util:include>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />searchEVPRequestOrganizations',
		function() {
			var id = document.<portlet:namespace />fm1.<portlet:namespace />id.value;
			var keywords = document.<portlet:namespace />fm1.<portlet:namespace />keywords.value;

			window.location.href = '${selectEVPRequestOrganizationsURL}&<portlet:namespace />keywords=' + escape(keywords) + '&<portlet:namespace />id=' + escape(id);
		}
	);
</aui:script>
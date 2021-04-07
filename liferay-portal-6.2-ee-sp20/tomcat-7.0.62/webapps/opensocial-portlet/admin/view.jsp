<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the applicable
 * Liferay software end user license agreement ("License Agreement")
 * found on www.liferay.com/legal/eulas. You may also contact Liferay, Inc.
 * for a copy of the License Agreement. You may not use this file except in
 * compliance with the License Agreement.
 * See the License Agreement for the specific language governing
 * permissions and limitations under the License Agreement, including
 * but not limited to distribution rights of the Software.
 *
 */
--%>

<%@ include file="/init.jsp" %>

<liferay-ui:search-container
	emptyResultsMessage="there-are-no-gadgets"
	headerNames="name"
	iteratorURL="<%= renderResponse.createRenderURL() %>"
	total="<%= GadgetLocalServiceUtil.getGadgetsCount(company.getCompanyId()) %>"
>
	<liferay-ui:search-container-results
		results="<%= GadgetLocalServiceUtil.getGadgets(company.getCompanyId(), searchContainer.getStart(), searchContainer.getEnd()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.opensocial.model.Gadget"
		keyProperty="gadgetId"
		modelVar="gadget"
	>
		<liferay-ui:search-container-column-text
			name="gadget"
			property="name"
		/>

		<%
		String gadgetURL = gadget.getUrl();
		%>

		<liferay-ui:search-container-column-text
			href="<%= gadgetURL %>"
			name="url"
			value="<%= gadgetURL %>"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/admin/gadget_action.jsp"
			valign="top"
		/>
	</liferay-ui:search-container-row>

	<div>
		<c:if test="<%= GadgetPermission.contains(permissionChecker, themeDisplay.getScopeGroupId(), ActionKeys.PUBLISH_GADGET) %>">
			<span>
				<portlet:renderURL var="publishGadgetURL">
					<portlet:param name="mvcPath" value="/admin/edit_gadget.jsp" />
					<portlet:param name="redirect" value="<%= currentURL %>" />
				</portlet:renderURL>

				<aui:button onClick="<%= publishGadgetURL %>" value="publish-gadget" />
			</span>
		</c:if>

		<span>
			<portlet:actionURL name="refreshGadgets" var="refreshGadgetsURL">
				<portlet:param name="redirect" value="<%= currentURL %>" />
			</portlet:actionURL>

			<aui:button onClick="<%= refreshGadgetsURL %>" value="refresh-gadgets" />
		</span>
	</div>

	<br />

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
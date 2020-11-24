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

<%@ include file="/designer/init.jsp" %>

<c:choose>
	<c:when test="<%= WorkflowEngineManagerUtil.isDeployed() %>">
		<liferay-portlet:renderURL varImpl="iteratorURL">
			<portlet:param name="mvcPath" value="/designer/view.jsp" />
		</liferay-portlet:renderURL>

		<%
		List<KaleoDraftDefinition> latestKaleoDraftDefinitions = KaleoDraftDefinitionServiceUtil.getLatestKaleoDraftDefinitions(company.getCompanyId(), -1, QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
		%>

		<liferay-ui:search-container
			emptyResultsMessage="no-workflow-definitions-are-defined"
			iteratorURL="<%= iteratorURL %>"
			total= "<%= latestKaleoDraftDefinitions.size() %>"
		>

			<c:if test="<%= KaleoDesignerPermission.contains(permissionChecker, themeDisplay.getCompanyGroupId(), ActionKeys.ADD_DRAFT) %>">
				<portlet:renderURL var="editKaleoDraftDefinitionURL">
					<portlet:param name="mvcPath" value='<%= "/designer/edit_kaleo_draft_definition.jsp" %>' />
					<portlet:param name="backURL" value="<%= currentURL %>" />
				</portlet:renderURL>

				<div class="btn-toolbar">
					<aui:button href="<%= editKaleoDraftDefinitionURL %>" primary="<%= true %>" value='<%= LanguageUtil.format(pageContext, "add-new-x", "definition") %>' />
				</div>
			</c:if>

			<liferay-ui:search-container-results
				 results="<%= ListUtil.subList(latestKaleoDraftDefinitions, searchContainer.getStart(), searchContainer.getEnd()) %>"
			/>

			<liferay-ui:search-container-row
				className="com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition"
				escapedModel="<%= true %>"
				keyProperty="kaleoDraftDefinitionId"
				modelVar="kaleoDraftDefinition"
			>
				<liferay-ui:search-container-column-text
					name="name"
					value="<%= HtmlUtil.escape(kaleoDraftDefinition.getName()) %>"
				/>

				<liferay-ui:search-container-column-text
					name="title"
					value="<%= HtmlUtil.escape(kaleoDraftDefinition.getTitle(themeDisplay.getLanguageId())) %>"
				/>

				<liferay-ui:search-container-column-text
					name="version"
					value="<%= String.valueOf(kaleoDraftDefinition.getVersion()) %>"
				/>

				<liferay-ui:search-container-column-text
					name="draft-version"
					value="<%= String.valueOf(kaleoDraftDefinition.getDraftVersion()) %>"
				/>

				<liferay-ui:search-container-column-text
					name="published"
					value='<%= (kaleoDraftDefinition.getVersion() > 0) ? LanguageUtil.get(locale, "yes") : LanguageUtil.get(locale, "no") %>'
				/>

				<liferay-ui:search-container-column-jsp
					align="right"
					path="/designer/kaleo_draft_definition_action.jsp"
				/>
			</liferay-ui:search-container-row>

			<liferay-ui:search-iterator />
		</liferay-ui:search-container>
	</c:when>
	<c:otherwise>
		<div class="portlet-msg-info">
			<liferay-ui:message key="no-workflow-engine-is-deployed" />
		</div>
	</c:otherwise>
</c:choose>
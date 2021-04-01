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

<%@ include file="/admin/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");
String currentSectionURL = HttpUtil.setParameter(currentURL, renderResponse.getNamespace() + "historyKey", "fields");

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

long ddmStructureId = KaleoFormsUtil.getKaleoProcessDDMStructureId(kaleoProcess, portletSession);

String ddmStructureName = StringPool.BLANK;

if (ddmStructureId > 0) {
	DDMStructure ddmStructure = DDMStructureLocalServiceUtil.fetchDDMStructure(ddmStructureId);

	if (ddmStructure != null) {
		ddmStructureName = ddmStructure.getName(locale);
	}
}
%>

<h3 class="kaleo-process-header"><liferay-ui:message key="fields" /></h3>

<p class="kaleo-process-message"><liferay-ui:message key="please-select-or-create-a-new-field-set-containing-all-the-fields-that-will-be-used-by-your-forms" /></p>

<aui:field-wrapper>
	<liferay-ui:message key="selected-field-set" />:

	<span class="badge badge-info" id="<portlet:namespace />ddmStructureDisplay"><%= HtmlUtil.escape(ddmStructureName) %></span>

	<aui:input name="ddmStructureId" type="hidden" value="<%= ddmStructureId %>" />

	<aui:input name="ddmStructureName" type="hidden" value="<%= ddmStructureName %>">
		<aui:validator name="required" />
	</aui:input>
</aui:field-wrapper>

<liferay-ui:error exception="<%= RecordSetDDMStructureIdException.class %>" message="please-enter-a-valid-definition" />

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/admin/edit_kaleo_process.jsp" />
	<portlet:param name="redirect" value="<%= redirect %>" />
	<portlet:param name="historyKey" value="fields" />
	<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
</liferay-portlet:renderURL>

<liferay-ui:search-container
	searchContainer='<%= new SearchContainer(renderRequest, new DisplayTerms(request), null, SearchContainer.DEFAULT_CUR_PARAM, SearchContainer.DEFAULT_DELTA, iteratorURL, null, "there-are-no-results") %>'
>

	<%
	DisplayTerms displayTerms = searchContainer.getDisplayTerms();
	%>

	<liferay-ui:search-container-results>

		<%
		total = DDMStructureServiceUtil.searchCount(company.getCompanyId(), PortalUtil.getSiteAndCompanyGroupIds(scopeGroupId), new long[] {PortalUtil.getClassNameId(ddmDisplay.getStructureType())}, displayTerms.getKeywords());

		searchContainer.setTotal(total);

		results = DDMStructureServiceUtil.search(company.getCompanyId(), PortalUtil.getSiteAndCompanyGroupIds(scopeGroupId), new long[] {PortalUtil.getClassNameId(ddmDisplay.getStructureType())}, displayTerms.getKeywords(), searchContainer.getStart(), searchContainer.getEnd(), null);

		searchContainer.setResults(results);
		%>

	</liferay-ui:search-container-results>

	<c:if test="<%= permissionChecker.hasPermission(scopeGroupId, ddmDisplay.getResourceName(), scopeGroupId, ddmDisplay.getAddStructureActionId()) %>">
		<portlet:renderURL var="editDefinitionURL">
			<portlet:param name="mvcPath" value="/admin/process/edit_structure.jsp" />
			<portlet:param name="redirect" value="<%= currentSectionURL %>" />
		</portlet:renderURL>

		<aui:button-row>
			<aui:button href="<%= editDefinitionURL.toString() %>" primary="<%= true %>" value="add-field-set" />
		</aui:button-row>
	</c:if>

	<liferay-ui:search-container-row
		className="com.liferay.portlet.dynamicdatamapping.model.DDMStructure"
		keyProperty="structureId"
		modelVar="structure"
	>
		<liferay-ui:search-container-row-parameter
			name="redirect"
			value="<%= currentSectionURL %>"
		/>

		<liferay-ui:search-container-column-text
			name="name"
			value="<%= HtmlUtil.escape(structure.getName(locale)) %>"
		/>

		<liferay-ui:search-container-column-text
			name="description"
			value="<%= HtmlUtil.escape(structure.getDescription(locale)) %>"
		/>

		<liferay-ui:search-container-column-date
			name="modified-date"
			value="<%= structure.getModifiedDate() %>"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/admin/process/structure_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	Liferay.on(
		'<portlet:namespace />chooseDefinition',
		function(event) {
			var A = AUI();

			var ddmStructureId = event.ddmstructureid;
			var ddmStructureName = event.name;

			A.one('#<portlet:namespace />ddmStructureDisplay').html(Liferay.Util.escapeHTML(ddmStructureName));
			A.one('#<portlet:namespace />ddmStructureId').val(ddmStructureId);
			A.one('#<portlet:namespace />ddmStructureName').val(ddmStructureName);

			var kaleoFormsAdmin = Liferay.component('<portlet:namespace />KaleoFormsAdmin');

			kaleoFormsAdmin.saveInPortletSession(
				{
					ddmStructureId: ddmStructureId,
					ddmStructureName: ddmStructureName
				}
			);

			kaleoFormsAdmin.updateNavigationControls();
		},
		['aui-base']
	);
</aui:script>
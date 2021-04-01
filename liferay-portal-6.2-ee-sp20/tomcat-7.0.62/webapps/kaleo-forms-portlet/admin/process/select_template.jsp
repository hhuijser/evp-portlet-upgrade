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
String backURL = ParamUtil.getString(request, "backURL");

long ddmStructureId = ParamUtil.getLong(request, "ddmStructureId");
String workflowDefinition = ParamUtil.getString(request, "workflowDefinition");
String workflowTaskName = ParamUtil.getString(request, "workflowTaskName");
String mode = ParamUtil.getString(request, "mode");
%>

<liferay-ui:header
	backURL="<%= backURL %>"
	title='<%= LanguageUtil.format(locale, "select-form-for-task-x", workflowTaskName) %>'
/>

<liferay-portlet:renderURL varImpl="iteratorURL">
	<portlet:param name="mvcPath" value="/admin/process/select_template.jsp" />
	<portlet:param name="backURL" value="<%= backURL %>" />
	<portlet:param name="ddmStructureId" value="<%= String.valueOf(ddmStructureId) %>" />
	<portlet:param name="workflowDefinition" value="<%= workflowDefinition %>" />
	<portlet:param name="workflowTaskName" value="<%= workflowTaskName %>" />
	<portlet:param name="mode" value="<%= mode %>" />
</liferay-portlet:renderURL>

<liferay-ui:search-container
	searchContainer='<%= new SearchContainer(renderRequest, new DisplayTerms(request), null, SearchContainer.DEFAULT_CUR_PARAM, SearchContainer.DEFAULT_DELTA, iteratorURL, null, "there-are-no-results") %>'
>

	<%
	DisplayTerms displayTerms = searchContainer.getDisplayTerms();
	%>

	<liferay-ui:search-container-results>

		<%
		long[] groupIds = ddmDisplay.getTemplateGroupIds(themeDisplay, true);

		total = DDMTemplateLocalServiceUtil.searchCount(company.getCompanyId(), scopeGroupId, PortalUtil.getClassNameId(DDMStructure.class), ddmStructureId, displayTerms.getKeywords(), DDMTemplateConstants.TEMPLATE_TYPE_FORM, mode);

		searchContainer.setTotal(total);

		results = DDMTemplateLocalServiceUtil.search(company.getCompanyId(), scopeGroupId, PortalUtil.getClassNameId(DDMStructure.class), ddmStructureId, displayTerms.getKeywords(), DDMTemplateConstants.TEMPLATE_TYPE_FORM, mode, searchContainer.getStart(), searchContainer.getEnd(), null);

		searchContainer.setResults(results);
		%>

	</liferay-ui:search-container-results>

	<c:if test="<%= permissionChecker.hasPermission(scopeGroupId, ddmDisplay.getResourceName(), scopeGroupId, ddmDisplay.getAddTemplateActionId()) %>">

		<%
		String taglibOnClick = "javascript:" + renderResponse.getNamespace() + "openDDMPortlet();";
		%>

		<aui:button-row>
			<aui:button onClick="<%= taglibOnClick %>" primary="<%= true %>" value="add-form" />
		</aui:button-row>
	</c:if>

	<liferay-ui:search-container-row
		className="com.liferay.portlet.dynamicdatamapping.model.DDMTemplate"
		keyProperty="templateId"
		modelVar="ddmTemplate"
	>

		<liferay-ui:search-container-column-text
			name="name"
			value="<%= HtmlUtil.escape(ddmTemplate.getName(locale)) %>"
		/>

		<liferay-ui:search-container-column-date
			name="modified-date"
			value="<%= ddmTemplate.getModifiedDate() %>"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/admin/process/template_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<aui:script>
	Liferay.on(
		'<portlet:namespace />chooseTemplate',
		function(event) {
			var A = AUI();

			A.io.request(
				'<portlet:resourceURL id="saveInPortletSession" />',
				{
					after: {
						success: function() {
							window.location = decodeURIComponent('<%= HtmlUtil.escapeURL(backURL) %>');
						}
					},
					data: {
						'<%= HtmlUtil.escapeJS(renderResponse.getNamespace() + ddmStructureId + workflowDefinition + workflowTaskName) %>' : event.ddmtemplateid
					}
				}
			);
		},
		['aui-base', 'aui-io-request']
	);

	Liferay.provide(
		window,
		'<portlet:namespace />openDDMPortlet',
		function(ddmTemplateId) {
			Liferay.Util.openDDMPortlet(
				{
					basePortletURL: '<%= PortletURLFactoryUtil.create(request, PortletKeys.DYNAMIC_DATA_MAPPING, themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',
					classNameId: <%= PortalUtil.getClassNameId(DDMStructure.class) %>,
					classPK: <%= ddmStructureId %>,
					dialog: {
						destroyOnHide: true,
						on: {
							destroy: function() {
								Liferay.Portlet.refresh('#p_p_id_<%= portletDisplay.getId() %>_');
							}
						}
					},
					id: 'ddmDialog',
					mode: '<%= HtmlUtil.escapeJS(mode) %>',
					portletResourceNamespace: '<%= renderResponse.getNamespace() %>',
					redirect: '<portlet:renderURL><portlet:param name="mvcPath" value="/admin/process/update_template_redirect.jsp" /></portlet:renderURL>',
					refererPortletName: '<%= portletDisplay.getId() %>',
					showBackURL: false,
					structureAvailableFields: '<%= renderResponse.getNamespace() + "getAvailableFields" %>',
					struts_action: '/dynamic_data_mapping/edit_template',
					templateId: ddmTemplateId,
					title: '<liferay-ui:message key="form" />'
				}
			);
		},
		['liferay-util']
	);
</aui:script>
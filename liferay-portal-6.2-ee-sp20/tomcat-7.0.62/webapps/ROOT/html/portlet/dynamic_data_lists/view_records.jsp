<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/portlet/dynamic_data_lists/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

DDLRecordSet recordSet = (DDLRecordSet)request.getAttribute(WebKeys.DYNAMIC_DATA_LISTS_RECORD_SET);

long formDDMTemplateId = ParamUtil.getLong(request, "formDDMTemplateId");

boolean editable = ParamUtil.getBoolean(request, "editable", true);
boolean hasDeletePermission = false;
boolean hasUpdatePermission = false;
boolean showAddRecordButton = false;

if (editable || portletName.equals(PortletKeys.DYNAMIC_DATA_LISTS)) {
	editable = DDLRecordSetPermission.contains(permissionChecker, recordSet.getRecordSetId(), ActionKeys.UPDATE);
	hasDeletePermission = DDLRecordSetPermission.contains(permissionChecker, recordSet.getRecordSetId(), ActionKeys.DELETE);
	hasUpdatePermission = DDLRecordSetPermission.contains(permissionChecker, recordSet.getRecordSetId(), ActionKeys.UPDATE);
	showAddRecordButton = DDLRecordSetPermission.contains(permissionChecker, recordSet.getRecordSetId(), ActionKeys.ADD_RECORD);
}

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("struts_action", "/dynamic_data_lists/view_record_set");
portletURL.setParameter("redirect", redirect);
portletURL.setParameter("recordSetId", String.valueOf(recordSet.getRecordSetId()));
%>

<aui:form action="<%= portletURL.toString() %>" method="post" name="fm">

	<%
	DDMStructure ddmStructure = recordSet.getDDMStructure(formDDMTemplateId);

	Map<String, Map<String, String>> fieldsMap = ddmStructure.getFieldsMap(LanguageUtil.getLanguageId(request));

	List<String> headerNames = new ArrayList<String>();

	for (Map<String, String> fields : fieldsMap.values()) {
		if (GetterUtil.getBoolean(fields.get(FieldConstants.PRIVATE))) {
			continue;
		}

		String label = fields.get(FieldConstants.LABEL);

		headerNames.add(label);
	}

	if (hasUpdatePermission) {
		headerNames.add("status");
		headerNames.add("modified-date");
		headerNames.add("author");
	}

	headerNames.add(StringPool.BLANK);
	%>

	<liferay-ui:search-container
		searchContainer='<%= new SearchContainer(renderRequest, new DisplayTerms(request), null, SearchContainer.DEFAULT_CUR_PARAM, SearchContainer.DEFAULT_DELTA, portletURL, headerNames, LanguageUtil.format(pageContext, "no-x-records-were-found", HtmlUtil.escape(ddmStructure.getName(locale)), false)) %>'
	>
		<aui:nav-bar>
			<aui:nav>
				<c:if test="<%= showAddRecordButton %>">
					<portlet:renderURL var="addRecordURL">
						<portlet:param name="struts_action" value="/dynamic_data_lists/edit_record" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
						<portlet:param name="recordSetId" value="<%= String.valueOf(recordSet.getRecordSetId()) %>" />
						<portlet:param name="formDDMTemplateId" value="<%= String.valueOf(formDDMTemplateId) %>" />
					</portlet:renderURL>

					<aui:nav-item href="<%= addRecordURL %>" iconCssClass="icon-plus" label='<%= LanguageUtil.format(pageContext, "add-x", HtmlUtil.escape(ddmStructure.getName(locale)), false) %>' />
				</c:if>
			</aui:nav>

			<aui:nav-bar-search cssClass="pull-right" file="/html/portlet/dynamic_data_lists/record_search.jsp" searchContainer="<%= searchContainer %>" />
		</aui:nav-bar>

		<liferay-ui:search-container-results>
			<%@ include file="/html/portlet/dynamic_data_lists/record_search_results.jspf" %>
		</liferay-ui:search-container-results>

		<%
		List resultRows = searchContainer.getResultRows();

		for (int i = 0; i < results.size(); i++) {
			DDLRecord record = (DDLRecord)results.get(i);

			DDLRecordVersion recordVersion = record.getRecordVersion();

			if (editable) {
				recordVersion = record.getLatestRecordVersion();
			}

			Fields fieldsModel = StorageEngineUtil.getFields(recordVersion.getDDMStorageId());

			ResultRow row = new ResultRow(record, record.getRecordId(), i);

			row.setParameter("formDDMTemplateId", String.valueOf(formDDMTemplateId));
			row.setParameter("hasDeletePermission", String.valueOf(hasDeletePermission));
			row.setParameter("hasUpdatePermission", String.valueOf(hasUpdatePermission));

			PortletURL rowURL = renderResponse.createRenderURL();

			rowURL.setParameter("struts_action", "/dynamic_data_lists/view_record");
			rowURL.setParameter("redirect", currentURL);
			rowURL.setParameter("recordId", String.valueOf(record.getRecordId()));
			rowURL.setParameter("version", recordVersion.getVersion());
			rowURL.setParameter("formDDMTemplateId", String.valueOf(formDDMTemplateId));

			// Columns

			for (Map<String, String> fields : fieldsMap.values()) {
				if (GetterUtil.getBoolean(fields.get(FieldConstants.PRIVATE))) {
					continue;
				}
		%>

				<%@ include file="/html/portlet/dynamic_data_lists/record_row_value.jspf" %>

		<%
			}

			if (hasUpdatePermission) {
				row.addStatus(recordVersion.getStatus(), recordVersion.getStatusByUserId(), recordVersion.getStatusDate(), rowURL);
				row.addDate(record.getModifiedDate(), rowURL);
				row.addText(HtmlUtil.escape(PortalUtil.getUserName(recordVersion)), rowURL);
			}

			// Action

			row.addJSP("right", SearchEntry.DEFAULT_VALIGN, "/html/portlet/dynamic_data_lists/record_action.jsp");

			// Add result row

			resultRows.add(row);
		}
		%>

		<liferay-ui:search-iterator />
	</liferay-ui:search-container>
</aui:form>

<aui:script>
	AUI().use('liferay-portlet-dynamic-data-lists');
</aui:script>
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

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("mvcPath", "/admin/view_kaleo_process.jsp");
portletURL.setParameter("backURL", backURL);
portletURL.setParameter("kaleoProcessId", String.valueOf(kaleoProcessId));
%>

<liferay-ui:header
	backURL="<%= backURL %>"
	title="<%= kaleoProcess.getName(locale) %>"
/>

<aui:form action="<%= portletURL.toString() %>" method="post" name="fm">
	<liferay-ui:search-container
		searchContainer='<%= new SearchContainer(renderRequest, new DisplayTerms(request), null, SearchContainer.DEFAULT_CUR_PARAM, SearchContainer.DEFAULT_DELTA, portletURL, null, "no-records-were-found") %>'
	>
		<aui:nav-bar>
			<aui:nav cssClass="navbar-nav" searchContainer="<%= searchContainer %>">
				<c:if test="<%= KaleoProcessPermission.contains(permissionChecker, kaleoProcess, ActionKeys.SUBMIT) %>">
					<portlet:renderURL var="submitURL">
						<portlet:param name="mvcPath" value="/admin/edit_request.jsp" />
						<portlet:param name="redirect" value="<%= currentURL %>" />
						<portlet:param name="backURL" value="<%= currentURL %>" />
						<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
					</portlet:renderURL>

					<aui:nav-item href="<%= submitURL %>" iconCssClass="icon-plus" label='<%= LanguageUtil.format(pageContext, "submit-new-x", HtmlUtil.escape(kaleoProcess.getName(locale)), false) %>' />
				</c:if>

				<portlet:resourceURL id="kaleoProcess" var="exportURL">
					<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcess.getKaleoProcessId()) %>" />
				</portlet:resourceURL>

				<%
				StringBundler sb = new StringBundler(6);

				sb.append("javascript:");
				sb.append(renderResponse.getNamespace());
				sb.append("exportKaleoProcess");
				sb.append("('");
				sb.append(exportURL);
				sb.append("');");
				%>

				<aui:nav-item href="<%= sb.toString() %>" iconCssClass="icon-arrow-down" label="export" />
			</aui:nav>

			<aui:nav-bar-search cssClass="navbar-search-advanced" searchContainer="<%= searchContainer %>">
				<%@ include file="/admin/record_search.jspf" %>
			</aui:nav-bar-search>
		</aui:nav-bar>

		<liferay-ui:search-container-results>
			<%@ include file="/admin/record_search_results.jspf" %>
		</liferay-ui:search-container-results>

		<liferay-ui:search-container-row
			className="com.liferay.portlet.dynamicdatalists.model.DDLRecord"
			modelVar="ddlRecord"
		>

			<%
			DDLRecordVersion ddlRecordVersion = ddlRecord.getLatestRecordVersion();

			PortletURL rowURL = renderResponse.createRenderURL();

			rowURL.setParameter("mvcPath", "/admin/view_record.jsp");
			rowURL.setParameter("redirect", currentURL);
			rowURL.setParameter("ddlRecordId", String.valueOf(ddlRecord.getRecordId()));
			rowURL.setParameter("kaleoProcessId", String.valueOf(kaleoProcessId));
			rowURL.setParameter("version", String.valueOf(ddlRecordVersion.getVersion()));

			Fields fieldsModel = ddlRecord.getFields();

			// Columns
			DDLRecordSet ddlRecordSet = kaleoProcess.getDDLRecordSet();

			DDMStructure ddmStructure = ddlRecordSet.getDDMStructure();

			Map<String, Map<String, String>> fieldsMap = ddmStructure.getFieldsMap();

			for (Map<String, String> fields : fieldsMap.values()) {
				if (GetterUtil.getBoolean(fields.get(FieldConstants.PRIVATE))) {
					continue;
				}

				String name = fields.get(FieldConstants.NAME);

				String value = StringPool.BLANK;

				if (fieldsModel.contains(name)) {
					com.liferay.portlet.dynamicdatamapping.storage.Field field = fieldsModel.get(name);

					value = field.getRenderedValue(themeDisplay.getLocale());

					String dataType = field.getDataType();

					if (dataType.equals(FieldConstants.HTML)) {
						StringBundler sb = new StringBundler(9);

						sb.append("<a href=\"");
						sb.append("javascript:");
						sb.append(renderResponse.getNamespace());
						sb.append("openPreviewDialog");
						sb.append("('");
						sb.append(HtmlUtil.escapeJS(value));
						sb.append("')\">(");
						sb.append(LanguageUtil.get(pageContext, "preview"));
						sb.append(")</a>");

						value = sb.toString();
					}
					else {
						value = HtmlUtil.escape(value);
					}
				}
				%>

				<liferay-ui:search-container-column-text
					href="<%= rowURL %>"
					name="<%= fields.get(FieldConstants.LABEL) %>"
					value="<%= value %>"
				/>

			<%
				row.setParameter("kaleoProcessId", String.valueOf(kaleoProcessId));
			}
			%>

			<liferay-ui:search-container-column-status
				href="<%= rowURL %>"
				property="status"
			/>

			<liferay-ui:search-container-column-date
				href="<%= rowURL %>"
				name="modified-date"
				value="<%= ddlRecord.getModifiedDate() %>"
			/>

			<liferay-ui:search-container-column-text
				href="<%= rowURL %>"
				name="author"
				value="<%= HtmlUtil.escape(PortalUtil.getUserName(ddlRecord.getUserId(), ddlRecord.getUserName())) %>"
			/>

			<liferay-ui:search-container-column-jsp
				cssClass="entry-action"
				path="/admin/record_action.jsp"
			/>
		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator />
	</liferay-ui:search-container>
</aui:form>

<%@ include file="/admin/export_kaleo_process.jspf" %>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />openPreviewDialog',
		function(content) {
			var Util = Liferay.Util;

			var dialog = Util.getWindow('<portlet:namespace />previewDialog');

			if (!dialog) {
				dialog = Util.Window.getWindow(
					{
						dialog: {
							bodyContent: content
						},
						id: '<portlet:namespace />previewDialog',
						title: Liferay.Language.get('preview')
					}
				);
			}
			else {
				dialog.show();

				dialog.set('bodyContent', content);
			}
		},
		['liferay-util-window']
	);
</aui:script>
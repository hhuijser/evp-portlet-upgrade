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

long classNameId = ParamUtil.getLong(request, "classNameId");
long classPK = ParamUtil.getLong(request, "classPK");

if (classPK > 0) {
	DDMStructure ddmStructure = DDMStructureServiceUtil.getStructure(classPK);

	renderRequest.setAttribute(WebKeys.DYNAMIC_DATA_MAPPING_STRUCTURE, ddmStructure);
}
%>

<div class="portlet-dynamic-data-mapping">
	<portlet:actionURL name="updateStructure" var="updateStructureURL">
		<portlet:param name="mvcPath" value="/admin/process/edit_structure.jsp" />
	</portlet:actionURL>

	<liferay-util:include page="/html/portlet/dynamic_data_mapping/edit_structure.jsp" portletId="<%= PortletKeys.DYNAMIC_DATA_MAPPING %>">
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="refererPortletName" value="<%= portletDisplay.getId() %>" />
		<portlet:param name="portletResourceNamespace" value="<%= renderResponse.getNamespace() %>" />
		<portlet:param name="groupId" value="<%= String.valueOf(scopeGroupId) %>" />
		<portlet:param name="classNameId" value="<%= String.valueOf(classNameId) %>" />
		<portlet:param name="classPK" value="<%= String.valueOf(classPK) %>" />
		<portlet:param name="structureAvailableFields" value='<%= renderResponse.getNamespace() + "getAvailableFields" %>' />
		<portlet:param name="editStructureURL" value="<%= updateStructureURL %>" />
		<portlet:param name="scopeTitle" value='<%= LanguageUtil.get(request, "field-set") %>' />
	</liferay-util:include>
</div>
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

<%@ include file="/html/portal/layout/edit/init.jsp" %>

<%
String copyLayoutIdPrefix = ParamUtil.getString(request, "copyLayoutIdPrefix");
%>

<aui:select id='<%= HtmlUtil.escapeAttribute(copyLayoutIdPrefix) + "copyLayoutId" %>' label="copy-from-page" name="copyLayoutId" showEmptyOption="<%= true %>">

	<%
	List<LayoutDescription> layoutDescriptions = (List<LayoutDescription>)request.getAttribute(WebKeys.LAYOUT_LISTER_LIST);

	for (LayoutDescription layoutDescription : layoutDescriptions) {
		Layout layoutDescriptionLayout = LayoutLocalServiceUtil.fetchLayout(layoutDescription.getPlid());

		if (layoutDescriptionLayout != null) {
	%>

			<aui:option disabled="<%= Validator.isNotNull(selLayout) && selLayout.getPlid() == layoutDescriptionLayout.getPlid() %>" label="<%= layoutDescription.getDisplayName() %>" value="<%= layoutDescriptionLayout.getLayoutId() %>" />

	<%
		}
	}
	%>

</aui:select>
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

<%
Map<String, UserPref> userPrefs = (Map<String, UserPref>)renderRequest.getAttribute(WebKeys.USER_PREFS);

String namespace = ShindigUtil.getPortletResourceNamespace(renderRequest, themeDisplay);

JSONObject jsonObject = ExpandoValueServiceUtil.getJSONData(themeDisplay.getCompanyId(), Layout.class.getName(), ShindigUtil.getTableOpenSocial(), ShindigUtil.getColumnUserPrefs(namespace, themeDisplay), themeDisplay.getPlid());
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionURL" />

<aui:form action="<%= configurationActionURL %>" method="post" name="fm">
	<aui:fieldset>

		<%
		for (UserPref userPref : userPrefs.values()) {
			UserPref.DataType dataType = userPref.getDataType();
			String displayName = userPref.getDisplayName();
			String name = userPref.getName();

			String value = userPref.getDefaultValue();

			if (jsonObject != null) {
				value = GetterUtil.getString(jsonObject.getString(name), value);
			}
		%>

			<c:choose>
				<c:when test="<%= dataType == UserPref.DataType.BOOL %>">
					<aui:select label="<%= displayName %>" name="<%= name %>">
						<aui:option label='<%= LanguageUtil.get(pageContext, "yes") %>' selected="<%= GetterUtil.getBoolean(value) %>" value="true" />
						<aui:option label='<%= LanguageUtil.get(pageContext, "no") %>' selected="<%= !GetterUtil.getBoolean(value) %>" value="false" />
					</aui:select>
				</c:when>
				<c:when test="<%= dataType == UserPref.DataType.ENUM %>">
					<aui:select label="<%= displayName %>" name="<%= name %>">

						<%
						for (UserPref.EnumValuePair enumValuePair : userPref.getOrderedEnumValues()) {
							String enumDisplayValue = enumValuePair.getDisplayValue();
							String enumValue = enumValuePair.getValue();
						%>

							<aui:option label="<%= enumDisplayValue %>" selected="<%= value.equals(enumValue) %>" value="<%= enumValue %>" />

						<%
						}
						%>

					</aui:select>
				</c:when>
				<c:when test="<%= dataType == UserPref.DataType.HIDDEN %>">
				</c:when>
				<c:otherwise>
					<aui:input label="<%= displayName %>" name="<%= name %>" type="text" value="<%= value %>" wrapperCssClass="lfr-input-text-container" />
				</c:otherwise>
			</c:choose>

		<%
		}
		%>

	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>
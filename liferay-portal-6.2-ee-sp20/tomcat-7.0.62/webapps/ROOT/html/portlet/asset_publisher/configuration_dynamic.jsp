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

<%@ include file="/html/portlet/asset_publisher/init.jsp" %>

<%
List<AssetRendererFactory> classTypesAssetRendererFactories = (List<AssetRendererFactory>)request.getAttribute("configuration.jsp-classTypesAssetRendererFactories");
PortletURL configurationRenderURL = (PortletURL)request.getAttribute("configuration.jsp-configurationRenderURL");
String redirect = (String)request.getAttribute("configuration.jsp-redirect");
String rootPortletId = (String)request.getAttribute("configuration.jsp-rootPortletId");
String selectScope = (String)request.getAttribute("configuration.jsp-selectScope");
String selectStyle = (String)request.getAttribute("configuration.jsp-selectStyle");
%>

<liferay-ui:tabs
	formName="fm"
	names="asset-selection,display-settings,subscriptions"
	param="tabs2"
	refresh="<%= false %>"
>
	<liferay-ui:section>
		<liferay-ui:error-marker key="errorSection" value="asset-selection" />

		<liferay-util:include page="/html/portlet/asset_publisher/asset_selection.jsp" />
	</liferay-ui:section>

	<liferay-ui:section>
		<liferay-ui:error-marker key="errorSection" value="display-settings" />

		<liferay-util:include page="/html/portlet/asset_publisher/display_settings.jsp" />
	</liferay-ui:section>

	<liferay-ui:section>
		<liferay-ui:error-marker key="errorSection" value="subscriptions" />

		<liferay-util:include page="/html/portlet/asset_publisher/subscriptions.jsp" />
	</liferay-ui:section>
</liferay-ui:tabs>

<aui:button-row>
	<aui:button onClick='<%= renderResponse.getNamespace() + "saveSelectBoxes();" %>' type="submit" />
</aui:button-row>
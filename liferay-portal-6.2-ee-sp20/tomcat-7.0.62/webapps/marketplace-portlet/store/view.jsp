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
PortletURL viewURL = renderResponse.createRenderURL();

String portletId = portletDisplay.getId();

if (portletId.equals(PortletKeys.STORE)) {
	long appEntryId = ParamUtil.getLong(request, "appEntryId");

	if (appEntryId <= 0) {
		viewURL.setParameter("remoteMVCPath", "/marketplace/view.jsp");
	}
	else {
		viewURL.setParameter("remoteMVCPath", "/marketplace/view_app_entry.jsp");
		viewURL.setParameter("appEntryId", String.valueOf(appEntryId));
	}
}
else {
	viewURL.setParameter("remoteMVCPath", "/marketplace_server/view_purchased.jsp");
}

viewURL.setWindowState(LiferayWindowState.EXCLUSIVE);
%>

<iframe frameborder="0" id="<portlet:namespace />frame" name="<portlet:namespace />frame" scrolling="no" src="<%= viewURL %>"></iframe>

<c:if test="<%= GetterUtil.getBoolean(request.getAttribute(WebKeys.OAUTH_AUTHORIZED)) %>">
	<div class="sign-out">
		<liferay-portlet:actionURL name="deauthorize" var="deauthorizeURL" />

		<aui:button onClick="<%= deauthorizeURL %>" value="sign-out" />
	</div>
</c:if>

<aui:script use="liferay-marketplace-messenger">
	var frame = A.one('#<portlet:namespace />frame');

	Liferay.MarketplaceMessenger.init(
		{
			targetFrame: frame
		}
	);

	Liferay.MarketplaceMessenger.receiveMessage(
		function(event) {
			var response = event.responseData;

			if (!response.cmd) {
				return;
			}

			if ((response.cmd == 'resize') || (response.cmd == 'init')) {
				if (response.height) {
					frame.height(response.height + 50);
				}

				if (response.width) {
					frame.width(response.width);
				}
			}

			if ((response.cmd == 'scrollTo') || (response.cmd == 'init')) {
				var scrollX = response.scrollX || 0;
				var scrollY = response.scrollY || 0;

				window.scrollTo(scrollX, scrollY);
			}

			if (response.cmd == 'goto') {
				var url = '<%= themeDisplay.getURLControlPanel() %>';

				if (response.panel == 'purchased') {
					url = '<liferay-portlet:renderURL doAsGroupId="<%= themeDisplay.getScopeGroupId() %>" portletName="<%= PortletKeys.PURCHASED %>" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>" />';
				}
				else if (response.panel == 'store') {
					url = '<liferay-portlet:renderURL doAsGroupId="<%= themeDisplay.getScopeGroupId() %>" portletName="<%= PortletKeys.STORE %>" windowState="<%= LiferayWindowState.MAXIMIZED.toString() %>" />';

					if (response.appEntryId) {
						url = Liferay.Util.addParams('<%= PortalUtil.getPortletNamespace(PortletKeys.STORE) %>appEntryId=' + response.appEntryId, url);
					}
				}

				window.location = url;
			}
		},
		A.Lang.emptyFnTrue
	);
</aui:script>
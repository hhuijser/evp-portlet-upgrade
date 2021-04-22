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

<%@ include file="/html/taglib/ui/asset_links/init.jsp" %>

<%
long assetEntryId = GetterUtil.getLong((String)request.getAttribute("liferay-ui:asset-links:assetEntryId"));

List<AssetLink> assetLinks = null;

if (assetEntryId > 0) {
	assetLinks = AssetLinkLocalServiceUtil.getDirectLinks(assetEntryId);
}
%>

<c:if test="<%= (assetLinks != null) && !assetLinks.isEmpty() %>">
	<div class="taglib-asset-links">
		<h2 class="asset-links-title"><liferay-ui:message key="related-assets" />:</h2>

		<ul class="asset-links-list">

			<%
			for (AssetLink assetLink : assetLinks) {
				AssetEntry assetLinkEntry = null;

				if (assetLink.getEntryId1() == assetEntryId) {
					assetLinkEntry = AssetEntryLocalServiceUtil.getEntry(assetLink.getEntryId2());
				}
				else {
					assetLinkEntry = AssetEntryLocalServiceUtil.getEntry(assetLink.getEntryId1());
				}

				if (!assetLinkEntry.isVisible()) {
					continue;
				}

				assetLinkEntry = assetLinkEntry.toEscapedModel();

				String className = PortalUtil.getClassName(assetLinkEntry.getClassNameId());

				AssetRendererFactory assetRendererFactory = AssetRendererFactoryRegistryUtil.getAssetRendererFactoryByClassName(className);

				if (Validator.isNull(assetRendererFactory)) {
					if (_log.isWarnEnabled()) {
						_log.warn("No asset renderer factory found for class " + className);
					}

					continue;
				}

				if (!assetRendererFactory.isActive(company.getCompanyId())) {
					continue;
				}

				AssetRenderer assetRenderer = assetRendererFactory.getAssetRenderer(assetLinkEntry.getClassPK());

				if (assetRenderer.hasViewPermission(permissionChecker)) {
					String asseLinktEntryTitle = assetLinkEntry.getTitle(locale);

					LiferayPortletURL assetPublisherURL = new PortletURLImpl(request, PortletKeys.ASSET_PUBLISHER, plid, PortletRequest.RENDER_PHASE);

					assetPublisherURL.setParameter("struts_action", "/asset_publisher/view_content");
					assetPublisherURL.setParameter("redirect", currentURL);
					assetPublisherURL.setParameter("assetEntryId", String.valueOf(assetLinkEntry.getEntryId()));
					assetPublisherURL.setParameter("type", assetRendererFactory.getType());

					if (Validator.isNotNull(assetRenderer.getUrlTitle())) {
						if (assetRenderer.getGroupId() != themeDisplay.getSiteGroupId()) {
							assetPublisherURL.setParameter("groupId", String.valueOf(assetRenderer.getGroupId()));
						}

						assetPublisherURL.setParameter("urlTitle", assetRenderer.getUrlTitle());
					}

					assetPublisherURL.setWindowState(WindowState.MAXIMIZED);

					String viewFullContentURLString = assetPublisherURL.toString();

					viewFullContentURLString = HttpUtil.setParameter(viewFullContentURLString, "redirect", currentURL);

					String urlViewInContext = assetRenderer.getURLViewInContext((LiferayPortletRequest)portletRequest, (LiferayPortletResponse)portletResponse, viewFullContentURLString);

					urlViewInContext = HttpUtil.setParameter(urlViewInContext, "inheritRedirect", true);

					String method = null;
					String target = "_self";

					if (themeDisplay.isStatePopUp() || (themeDisplay.isStateMaximized() && PropsValues.DOCKBAR_ADMINISTRATIVE_LINKS_SHOW_IN_POP_UP && PortletCategoryKeys.MY.equals(themeDisplay.getControlPanelCategory()))) {
						method = "get";
						target = "_blank";
					}
			%>

					<li class="asset-links-list-item">
						<liferay-ui:icon
							label="<%= true %>"
							message="<%= asseLinktEntryTitle %>"
							method="<%= method %>"
							src="<%= assetRenderer.getIconPath(portletRequest) %>"
							target="<%= target %>"
							url="<%= urlViewInContext %>"
						/>
					</li>

			<%
				}
			}
			%>

		</ul>
	</div>
</c:if>

<%!
private static Log _log = LogFactoryUtil.getLog("portal-web.docroot.html.taglib.ui.asset_links.page_jsp");
%>
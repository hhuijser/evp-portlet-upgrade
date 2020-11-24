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
List results = (List)request.getAttribute("view.jsp-results");

int assetEntryIndex = ((Integer)request.getAttribute("view.jsp-assetEntryIndex")).intValue();

AssetEntry assetEntry = (AssetEntry)request.getAttribute("view.jsp-assetEntry");
AssetRendererFactory assetRendererFactory = (AssetRendererFactory)request.getAttribute("view.jsp-assetRendererFactory");
AssetRenderer assetRenderer = (AssetRenderer)request.getAttribute("view.jsp-assetRenderer");

boolean show = ((Boolean)request.getAttribute("view.jsp-show")).booleanValue();

request.setAttribute("view.jsp-showIconLabel", true);

String title = (String)request.getAttribute("view.jsp-title");

if (Validator.isNull(title)) {
	title = assetRenderer.getTitle(locale);
}

String viewURL = AssetPublisherHelperImpl.getAssetViewURL(liferayPortletRequest, liferayPortletResponse, assetEntry, viewInContext);

String viewURLMessage = viewInContext ? assetRenderer.getViewInContextMessage() : "read-more-x-about-x";

String summary = StringUtil.shorten(assetRenderer.getSummary(liferayPortletRequest, liferayPortletResponse), abstractLength);
%>

<c:if test="<%= show %>">
	<div class="asset-abstract <%= defaultAssetPublisher ? "default-asset-publisher" : StringPool.BLANK %>">
		<liferay-util:include page="/html/portlet/asset_publisher/asset_actions.jsp" />

		<h3 class="asset-title">
			<c:choose>
				<c:when test="<%= Validator.isNotNull(viewURL) %>">
					<a href="<%= viewURL %>"><img alt="" src="<%= assetRenderer.getIconPath(renderRequest) %>" /> <%= HtmlUtil.escape(title) %></a>
				</c:when>
				<c:otherwise>
					<img alt="" src="<%= assetRenderer.getIconPath(renderRequest) %>" /> <%= HtmlUtil.escape(title) %>
				</c:otherwise>
			</c:choose>
		</h3>

		<div class="asset-content">
			<div class="asset-summary">

				<%
				String path = assetRenderer.render(renderRequest, renderResponse, AssetRenderer.TEMPLATE_ABSTRACT);

				request.setAttribute(WebKeys.ASSET_RENDERER, assetRenderer);
				request.setAttribute(WebKeys.ASSET_PUBLISHER_ABSTRACT_LENGTH, abstractLength);
				request.setAttribute(WebKeys.ASSET_PUBLISHER_VIEW_URL, viewURL);
				%>

				<c:choose>
					<c:when test="<%= path == null %>">
						<%= HtmlUtil.escape(summary) %>
					</c:when>
					<c:otherwise>
						<liferay-util:include page="<%= path %>" portletId="<%= assetRendererFactory.getPortletId() %>" />
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="<%= Validator.isNotNull(viewURL) %>">
				<div class="asset-more">
					<a href="<%= viewURL %>"><liferay-ui:message arguments='<%= new Object[] {"hide-accessible", HtmlUtil.escape(assetRenderer.getTitle(locale))} %>' key="<%= viewURLMessage %>" translateArguments="<%= false %>" /> &raquo; </a>
				</div>
			</c:if>
		</div>

		<div class="asset-metadata">

			<%
			request.setAttribute("asset_metadata.jspf-filterByMetadata", true);
			%>

			<%@ include file="/html/portlet/asset_publisher/asset_metadata.jspf" %>
		</div>
	</div>
</c:if>
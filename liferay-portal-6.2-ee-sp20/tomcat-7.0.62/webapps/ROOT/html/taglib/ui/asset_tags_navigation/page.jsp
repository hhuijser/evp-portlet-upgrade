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

<%@ include file="/html/taglib/ui/asset_tags_navigation/init.jsp" %>

<%
long classNameId = GetterUtil.getLong((String)request.getAttribute("liferay-ui:asset-tags-navigation:classNameId"));
String displayStyle = (String)request.getAttribute("liferay-ui:asset-tags-navigation:displayStyle");
boolean hidePortletWhenEmpty = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:asset-tags-navigation:hidePortletWhenEmpty"));
int maxAssetTags = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:asset-tags-navigation:maxAssetTags"));
boolean showAssetCount = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:asset-tags-navigation:showAssetCount"));
boolean showZeroAssetCount = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:asset-tags-navigation:showZeroAssetCount"));

String tag = ParamUtil.getString(request, "tag");

PortletURL portletURL = renderResponse.createRenderURL();

String tagsNavigation = _buildTagsNavigation(scopeGroupId, tag, portletURL, classNameId, displayStyle, maxAssetTags, showAssetCount, showZeroAssetCount);

if (Validator.isNotNull(tagsNavigation)) {
%>

	<liferay-ui:panel-container cssClass="taglib-asset-tags-navigation" extended="<%= true %>" persistState="<%= true %>">
		<%= tagsNavigation %>
	</liferay-ui:panel-container>

<%
}
else {
	if (hidePortletWhenEmpty) {
		renderRequest.setAttribute(WebKeys.PORTLET_CONFIGURATOR_VISIBILITY, Boolean.TRUE);
	}
%>

	<div class="alert alert-info">
		<liferay-ui:message key="there-are-no-tags" />
	</div>

<%
}

if (Validator.isNotNull(tag)) {
	PortalUtil.addPortletBreadcrumbEntry(request, tag, currentURL);
}
%>

<%!
private String _buildTagsNavigation(long scopeGroupId, String selectedTagName, PortletURL portletURL, long classNameId, String displayStyle, int maxAssetTags, boolean showAssetCount, boolean showZeroAssetCount) throws Exception {
	List<AssetTag> tags = null;

	if (showAssetCount && (classNameId > 0)) {
		tags = AssetTagServiceUtil.getTags(PortalUtil.getSiteGroupId(scopeGroupId), classNameId, null, 0, maxAssetTags, new AssetTagCountComparator());
	}
	else {
		tags = AssetTagServiceUtil.getGroupTags(PortalUtil.getSiteGroupId(scopeGroupId), 0, maxAssetTags, new AssetTagCountComparator());
	}

	if (tags.isEmpty()) {
		return null;
	}

	tags = ListUtil.sort(tags);

	StringBundler sb = new StringBundler();

	sb.append("<ul class=\"tag-items ");

	if (showAssetCount && displayStyle.equals("cloud")) {
		sb.append("tag-cloud");
	}
	else {
		sb.append("tag-list");
	}

	sb.append("\">");

	int maxCount = 1;
	int minCount = 1;

	if (showAssetCount && displayStyle.equals("cloud")) {
		for (AssetTag tag : tags) {
			String tagName = tag.getName();

			int count = 0;

			if (classNameId > 0) {
				count = AssetTagServiceUtil.getTagsCount(scopeGroupId, classNameId, tagName);
			}
			else {
				count = AssetTagServiceUtil.getTagsCount(scopeGroupId, tagName);
			}

			if (!showZeroAssetCount && (count == 0)) {
				continue;
			}

			maxCount = Math.max(maxCount, count);
			minCount = Math.min(minCount, count);
		}
	}

	double multiplier = 1;

	if (maxCount != minCount) {
		multiplier = (double)5 / (maxCount - minCount);
	}

	for (AssetTag tag : tags) {
		String tagName = tag.getName();

		int count = 0;

		if (classNameId > 0) {
			count = AssetTagServiceUtil.getTagsCount(scopeGroupId, classNameId, tagName);
		}
		else {
			count = AssetTagServiceUtil.getTagsCount(scopeGroupId, tagName);
		}

		int popularity = (int)(1 + ((maxCount - (maxCount - (count - minCount))) * multiplier));

		if (!showZeroAssetCount && (count == 0)) {
			continue;
		}

		sb.append("<li class=\"tag-popularity-");
		sb.append(popularity);
		sb.append("\"><span>");

		if (tagName.equals(selectedTagName)) {
			portletURL.setParameter("tag", StringPool.BLANK);

			sb.append("<a class=\"tag-selected\" href=\"");
		}
		else {
			portletURL.setParameter("resetCur", Boolean.TRUE.toString());
			portletURL.setParameter("tag", tagName);

			sb.append("<a href=\"");
		}

		sb.append(HtmlUtil.escape(portletURL.toString()));
		sb.append("\">");
		sb.append(tagName);

		if (showAssetCount) {
			sb.append("<span class=\"tag-asset-count\">");
			sb.append(StringPool.SPACE);
			sb.append(StringPool.OPEN_PARENTHESIS);
			sb.append(count);
			sb.append(StringPool.CLOSE_PARENTHESIS);
			sb.append("</span>");
		}

		sb.append("</a></span></li>");
	}

	sb.append("</ul><br style=\"clear: both;\" />");

	return sb.toString();
}
%>
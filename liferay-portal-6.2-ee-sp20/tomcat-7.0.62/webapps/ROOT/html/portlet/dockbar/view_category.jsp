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

<%@ include file="/html/portlet/dockbar/init.jsp" %>

<%
String panelContainerId = ParamUtil.getString(request, "panelContainerId");

PortletCategory portletCategory = (PortletCategory)request.getAttribute(WebKeys.PORTLET_CATEGORY);

int portletCategoryIndex = GetterUtil.getInteger((String)request.getAttribute(WebKeys.PORTLET_CATEGORY_INDEX));

String oldCategoryPath = (String)request.getAttribute(WebKeys.PORTLET_CATEGORY_PATH);

String newCategoryPath = LanguageUtil.get(pageContext, portletCategory.getName());

Pattern pattern = Pattern.compile(".*");

Matcher matcher = pattern.matcher(newCategoryPath);

StringBundler divId = new StringBundler();

while (matcher.find()) {
	divId.append(matcher.group());
}

newCategoryPath = divId.toString();

if (Validator.isNotNull(oldCategoryPath)) {
	newCategoryPath = oldCategoryPath + ":" + newCategoryPath;
}

List<PortletCategory> categories = ListUtil.fromCollection(portletCategory.getCategories());

categories = ListUtil.sort(categories, new PortletCategoryComparator(locale));

List<Portlet> portlets = new ArrayList<Portlet>();

Set<String> portletIds = portletCategory.getPortletIds();

String externalPortletCategory = null;

for (String portletId : portletIds) {
	Portlet portlet = PortletLocalServiceUtil.getPortletById(user.getCompanyId(), portletId);

	if ((portlet != null) && PortletPermissionUtil.contains(permissionChecker, layout, portlet, ActionKeys.ADD_TO_PAGE)) {
		portlets.add(portlet);

		PortletApp portletApp = portlet.getPortletApp();

		if (portletApp.isWARFile() && Validator.isNull(externalPortletCategory)) {
			PortletConfig curPortletConfig = PortletConfigFactoryUtil.create(portlet, application);

			externalPortletCategory = ResourceBundleUtil.getString(curPortletConfig.getResourceBundle(locale), portletCategory.getName());
		}
	}
}

portlets = ListUtil.sort(portlets, new PortletTitleComparator(application, locale));

if (!categories.isEmpty() || !portlets.isEmpty()) {
%>

	<div class="lfr-add-content">
		<liferay-ui:panel collapsible="<%= layout.isTypePortlet() %>" cssClass="lfr-content-category panel-page-category unstyled" defaultState="closed" extended="<%= true %>" id='<%= renderResponse.getNamespace() + "portletCategory" + portletCategoryIndex %>' parentId="<%= panelContainerId %>" persistState="<%= true %>" title="<%= Validator.isNotNull(externalPortletCategory) ? externalPortletCategory : LanguageUtil.get(pageContext, portletCategory.getName()) %>">
			<aui:nav collapsible="<%= false %>" cssClass="nav-list">

				<%
				for (PortletCategory category : categories) {
					request.setAttribute(WebKeys.PORTLET_CATEGORY, category);
					request.setAttribute(WebKeys.PORTLET_CATEGORY_INDEX, String.valueOf(portletCategoryIndex));
					request.setAttribute(WebKeys.PORTLET_CATEGORY_PATH, newCategoryPath);
				%>

					<liferay-util:include page="/html/portlet/dockbar/view_category.jsp">
						<liferay-util:param name="panelContainerId" value="<%= panelContainerId %>" />
					</liferay-util:include>

				<%
					request.setAttribute(WebKeys.PORTLET_CATEGORY_PATH, oldCategoryPath);

					portletCategoryIndex++;
				}

				for (Portlet portlet : portlets) {
					divId.setIndex(0);

					divId.append(newCategoryPath);
					divId.append(":");

					matcher = pattern.matcher(PortalUtil.getPortletTitle(portlet, application, locale));

					while (matcher.find()) {
						divId.append(matcher.group());
					}

					boolean portletInstanceable = portlet.isInstanceable();

					boolean portletUsed = layoutTypePortlet.hasPortletId(portlet.getPortletId());

					boolean portletLocked = (!portletInstanceable && portletUsed);

					if (portletInstanceable && layout.isTypePanel()) {
						continue;
					}
				%>

					<c:choose>
						<c:when test="<%= layout.isTypePortlet() %>">

							<%
							Map<String, Object> data = new HashMap<String, Object>();

							data.put("draggable", true);
							data.put("id", renderResponse.getNamespace() + "portletItem" + portlet.getPortletId());
							data.put("instanceable", portletInstanceable);
							data.put("plid", plid);
							data.put("portlet-id", portlet.getPortletId());
							data.put("search", divId.toString().replace(':', '-'));
							data.put("title", PortalUtil.getPortletTitle(portlet, application, locale));

							String cssClass = "drag-content-item";

							if (portletLocked) {
								cssClass += " lfr-portlet-used";
							}
							%>

							<aui:nav-item cssClass="lfr-content-item" href="">
								<span <%= AUIUtil.buildData(data) %> class="<%= cssClass %>">
									<i class="<%= portletInstanceable ? "icon-th-large" : "icon-stop" %>"></i>

									<liferay-ui:message key="<%= PortalUtil.getPortletTitle(portlet, application, locale) %>" />
								</span>

								<%
								data.remove("draggable");
								%>

								<span <%= AUIUtil.buildData(data) %> class='add-content-item <%= portletLocked ? "lfr-portlet-used" : StringPool.BLANK %>'>
									<liferay-ui:message key="add" />
								</span>
							</aui:nav-item>

							<%
							List<PortletItem> portletItems = PortletItemLocalServiceUtil.getPortletItems(themeDisplay.getScopeGroupId(), portlet.getPortletId(), com.liferay.portal.model.PortletPreferences.class.getName());

							for (PortletItem portletItem : portletItems) {
								divId.setIndex(0);

								divId.append(newCategoryPath);
								divId.append(":");
								divId.append(PortalUtil.getPortletTitle(portlet, application, locale));
								divId.append(":");

								matcher = pattern.matcher(HtmlUtil.escape(portletItem.getName()));

								while (matcher.find()) {
									divId.append(matcher.group());
								}

								Map<String, Object> portletItemData = new HashMap<String, Object>();

								portletItemData.put("draggable", true);
								portletItemData.put("id", renderResponse.getNamespace() + "portletItem" + portletItem.getPortletItemId());
								portletItemData.put("instanceable", portletInstanceable);
								portletItemData.put("plid", plid);
								portletItemData.put("portlet-id", portlet.getPortletId());
								portletItemData.put("portlet-item-id", portletItem.getPortletItemId());
								portletItemData.put("search", divId.toString().replace(':', '-'));
								portletItemData.put("title", HtmlUtil.escape(portletItem.getName()));
							%>

								<aui:nav-item cssClass="lfr-archived-setup lfr-content-item" data="<%= portletItemData %>" href="">
									<span <%= AUIUtil.buildData(portletItemData) %> class="<%= cssClass %>">
										<i class="<%= portletInstanceable ? "icon-th-large" : "icon-stop" %>"></i>

										<liferay-ui:message key="<%= HtmlUtil.escape(portletItem.getName()) %>" />
									</span>
									<span <%= AUIUtil.buildData(portletItemData) %> class='add-content-item <%= portletLocked ? "lfr-portlet-used" : StringPool.BLANK %>'>
										<liferay-ui:message key="add" />
									</span>
								</aui:nav-item>

							<%
							}
							%>

						</c:when>
						<c:otherwise>
							<div>
								<a href="<liferay-portlet:renderURL portletName="<%= portlet.getRootPortletId() %>" windowState="<%= WindowState.MAXIMIZED.toString() %>"></liferay-portlet:renderURL>"><%= PortalUtil.getPortletTitle(portlet, application, locale) %></a>
							</div>
						</c:otherwise>
					</c:choose>

				<%
				}
				%>

			</aui:nav>
		</liferay-ui:panel>
	</div>

	<input id="<portlet:namespace />portletCategory<%= portletCategoryIndex %>CategoryPath" type="hidden" value="<%= newCategoryPath.replace(':', '-') %>" />

<%
}
%>
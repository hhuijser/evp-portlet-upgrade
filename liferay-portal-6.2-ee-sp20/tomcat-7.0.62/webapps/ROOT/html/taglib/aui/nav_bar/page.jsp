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

<%@ include file="/html/taglib/aui/nav_bar/init.jsp" %>

<div class="navbar <%= cssClass %>" id="<%= id %>" <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %>>
	<div class="navbar-inner">
		<div class="container">
			<span id="<%= id %>ResponsiveButton">
				<%= responsiveButtons %>
			</span>

			<span id="<%= id %>bodyContent">
				<%= bodyContentString %>
			</span>

			<aui:script use="aui-base,event-outside,liferay-menu-toggle">
				A.all('#<%= id %>ResponsiveButton .btn-navbar').each(
					function(item, index, collection) {
						var contentId = item.attr('id');
						var navId = item.attr('data-navid');

						var toggleMenu = new Liferay.MenuToggle(
							{
								content: '#' + navId + 'NavbarCollapse, #<%= id %>ResponsiveButton #' + contentId,
								toggleTouch: true,
								trigger: '#<%= id %>ResponsiveButton #' + contentId
							}
						);
					}
				);
			</aui:script>
		</div>
	</div>
</div>
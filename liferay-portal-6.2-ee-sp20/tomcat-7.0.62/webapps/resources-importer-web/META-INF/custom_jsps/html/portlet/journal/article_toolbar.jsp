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

<%@ include file="/html/portlet/journal/article_toolbar.portal.jsp" %>

<%
String structureId = BeanParamUtil.getString(article, request, "structureId");
%>

<c:if test="<%= (article != null) && Validator.isNotNull(structureId) %>">
	<aui:script use="aui-base">
		var toolbar = A.Widget.getByNode('#<portlet:namespace />articleToolbar');

		toolbar.add(
			{
				icon: 'icon-download',
				label: '<%= UnicodeLanguageUtil.get(pageContext, "download") %>',
				on: {
					click: function(event) {
						event.domEvent.preventDefault();

						var downloadArticleContent = Liferay.Util.openWindow(
							{
								dialog: {
									bodyContent: '<pre><%= HtmlUtil.escapeJS(HtmlUtil.escape(article.getContent())) %></pre>',
									modal: true
								},
								id: '<portlet:namespace />articleDownload',
								title: '<%= HtmlUtil.escapeJS(article.getTitle(locale)) %>'
							}
						);
					}
				}
			}
		);
	</aui:script>

	<style type="text/css">
		.portlet-journal .article-toolbar .icon-download {
			background-image: none;
		}
	</style>
</c:if>
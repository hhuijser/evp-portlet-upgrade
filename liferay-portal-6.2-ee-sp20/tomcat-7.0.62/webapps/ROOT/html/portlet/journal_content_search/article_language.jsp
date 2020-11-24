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

<%@ include file="/html/portlet/journal_content_search/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

Object[] objArray = (Object[])row.getObject();

Locale snippetLocale = ((Summary)objArray[1]).getLocale();

String languageId = LocaleUtil.toLanguageId(snippetLocale);
%>

<c:if test="<%= languageId.length() > 0 %>">
	<liferay-ui:icon image='<%= "../language/" + languageId %>' message='<%= LanguageUtil.format(locale, "this-result-comes-from-the-x-version-of-this-content", snippetLocale.getDisplayLanguage(locale), false) %>' />
</c:if>
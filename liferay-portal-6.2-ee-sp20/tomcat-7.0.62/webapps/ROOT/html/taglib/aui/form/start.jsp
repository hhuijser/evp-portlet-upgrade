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

<%@ include file="/html/taglib/aui/form/init.jsp" %>

<form action="<%= HtmlUtil.escapeAttribute(action) %>" class="form <%= cssClass %> <%= inlineLabels ? "field-labels-inline" : StringPool.BLANK %>" id="<%= namespace + HtmlUtil.escapeAttribute(name) %>" method="<%= method %>" name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %>>
	<c:if test="<%= Validator.isNotNull(onSubmit) %>">
		<fieldset class="input-container" disabled="disabled">
	</c:if>

	<input name="<%= namespace %>formDate" type="hidden" value="<%= System.currentTimeMillis() %>" />
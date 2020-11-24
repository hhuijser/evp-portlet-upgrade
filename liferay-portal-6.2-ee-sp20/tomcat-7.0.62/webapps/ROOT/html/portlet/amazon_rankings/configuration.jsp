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

<%@ include file="/html/portlet/amazon_rankings/init.jsp" %>

<%
String isbnsString = StringUtil.merge(isbns, StringPool.SPACE);

isbns = StringUtil.split(ParamUtil.getString(request, "isbns", isbnsString), CharPool.SPACE);

isbnsString = StringUtil.merge(isbns, StringPool.SPACE);
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionURL" />

<liferay-portlet:renderURL portletConfiguration="true" var="configurationRenderURL" />

<aui:form action="<%= configurationActionURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= configurationRenderURL %>" />

	<liferay-ui:error exception="<%= ValidatorException.class %>">

		<%
		ValidatorException ve = (ValidatorException)errorException;
		%>

		<liferay-ui:message key="the-following-are-invalid-isbn-numbers" />

		<%
		Enumeration enu = ve.getFailedKeys();

		while (enu.hasMoreElements()) {
			String isbn = (String)enu.nextElement();
		%>

			<strong><%= HtmlUtil.escape(isbn) %></strong><%= (enu.hasMoreElements()) ? ", " : "." %>

		<%
		}
		%>

	</liferay-ui:error>

	<aui:fieldset>
		<aui:input autoFocus="<%= (windowState.equals(WindowState.MAXIMIZED) || windowState.equals(LiferayWindowState.POP_UP)) %>" cssClass="lfr-textarea-container" label="add-all-isbn-numbers-separated-by-spaces" name="preferences--isbns--" type="textarea" value="<%= isbnsString %>" wrap="soft" />
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>
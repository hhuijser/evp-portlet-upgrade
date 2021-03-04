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

<%@ include file="/html/portlet/portal_settings/init.jsp" %>

<%
String casLoginURL = ParamUtil.getString(request, "casLoginURL");
String casLogoutURL = ParamUtil.getString(request, "casLogoutURL");
String casServerURL = ParamUtil.getString(request, "casServerURL");
String casServiceURL = ParamUtil.getString(request, "casServiceURL");
%>

<table class="lfr-table lfr-table-grid">
	<tr>
		<td class="lfr-label">
			<liferay-ui:message key="login-url" />:
		</td>
		<td>

			<%
			String casLoginURLResult = _testURL(casLoginURL);
			%>

			<span class="<%= _getCssClass(casLoginURLResult) %>"><liferay-ui:message key="<%= casLoginURLResult %>" /></span> <span class="field-hint"><%= HtmlUtil.escape(casLoginURL) %></span>
		</td>
	</tr>
	<tr>
		<td class="lfr-label">
			<liferay-ui:message key="logout-url" />:
		</td>
		<td>

			<%
			String casLogoutURLResult = _testURL(casLogoutURL);
			%>

			<span class="<%= _getCssClass(casLogoutURLResult) %>"><liferay-ui:message key="<%= casLogoutURLResult %>" /></span> <span class="field-hint"><%= HtmlUtil.escape(casLogoutURL) %></span>
		</td>
	</tr>

	<c:if test="<%= Validator.isNotNull(casServerURL) %>">
		<tr>
			<td class="lfr-label">
				<liferay-ui:message key="server-url" />:
			</td>
			<td>

				<%
				String casServerURLResult = _testURL(casServerURL);
				%>

				<span class="<%= _getCssClass(casServerURLResult) %>"><liferay-ui:message key="<%= casServerURLResult %>" /></span> <span class="field-hint"><%= HtmlUtil.escape(casServerURL) %></span>
			</td>
		</tr>
	</c:if>

	<c:if test="<%= Validator.isNotNull(casServiceURL) %>">
		<tr>
			<td class="lfr-label">
				<liferay-ui:message key="service-url" />:
			</td>
			<td>

				<%
				String casServiceURLResult = _testURL(casServiceURL);
				%>

				<span class="<%= _getCssClass(casServiceURLResult) %>"><liferay-ui:message key="<%= casServiceURLResult %>" /></span> <span class="field-hint"><%= HtmlUtil.escape(casServiceURL) %></span>
			</td>
		</tr>
	</c:if>
</table>

<%!
private String _getCssClass(String result) {
	String cssClass = "lfr-status-";

	if (result.equals("pass")) {
		cssClass += "success";
	}
	else {
		cssClass += "error";
	}

	cssClass += "-label";

	return cssClass;
}

private String _testURL(String url) {
	try {
		URL urlObj = new URL(url);

		HttpURLConnection httpURLConnection = (HttpURLConnection)urlObj.openConnection();

		httpURLConnection.setConnectTimeout(3000);

		httpURLConnection.getResponseCode();
	}
	catch (MalformedURLException murle) {
		return "fail";
	}
	catch (Exception e) {
		String message = GetterUtil.getString(e.getMessage());

		if (message.contains("PKIX")) {
			return "ssl-error";
		}
		else {
			return "unreachable";
		}
	}

	return "pass";
}
%>
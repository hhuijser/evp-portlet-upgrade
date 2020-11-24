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

<%@ include file="/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

long oAuthApplicationId = ParamUtil.getLong(request, "oAuthApplicationId");

OAuthApplication oAuthApplication = OAuthApplicationLocalServiceUtil.getOAuthApplication(oAuthApplicationId);
%>

<liferay-ui:header
	backURL="<%= redirect %>"
	localizeTitle="<%= false %>"
	title="<%= oAuthApplication.getName() %>"
/>

<aui:layout>
	<aui:column columnWidth="<%= (oAuthApplication.getLogoId() != 0) ? 50 : 100 %>">
		<c:if test="<%= Validator.isNotNull(oAuthApplication.getDescription()) %>">
			<aui:field-wrapper label="description">
				<%= HtmlUtil.escape(oAuthApplication.getDescription()) %>
			</aui:field-wrapper>
		</c:if>

		<aui:field-wrapper label="access-type">
			<liferay-ui:message key="<%= oAuthApplication.getAccessLevelLabel() %>" />
		</aui:field-wrapper>

		<aui:field-wrapper label="website-url">
			<%= HtmlUtil.escape(oAuthApplication.getWebsiteURL()) %>
		</aui:field-wrapper>

		<aui:field-wrapper label="callback-uri">
			<%= HtmlUtil.escape(oAuthApplication.getCallbackURI()) %>
		</aui:field-wrapper>

		<aui:field-wrapper label="share-access-token">
			<c:choose>
				<c:when test="<%= oAuthApplication.isShareableAccessToken() %>">
					<liferay-ui:icon image="checked" />
				</c:when>
				<c:otherwise>
					<liferay-ui:icon image="close" />
				</c:otherwise>
			</c:choose>
		</aui:field-wrapper>

		<aui:field-wrapper label="application-credentials">
			<liferay-ui:message key="consumer-key" />:

			<%= HtmlUtil.escape(oAuthApplication.getConsumerKey()) %><br />

			<liferay-ui:message key="consumer-secret" />:

			<%= HtmlUtil.escape(oAuthApplication.getConsumerSecret()) %>
		</aui:field-wrapper>

		<aui:field-wrapper label="oauth-request-uris">
			<liferay-ui:message key="request-token-uri" />:

			<%= OAuthUtil.getRequestTokenURI() %><br />

			<liferay-ui:message key="user-authorization-uri" />:

			<%= OAuthUtil.getAuthorizeURI() %><br />

			<liferay-ui:message key="access-token-uri" />:

			<%= OAuthUtil.getAccessTokenURI() %>
		</aui:field-wrapper>
	</aui:column>

	<c:if test="<%= oAuthApplication.getLogoId() != 0 %>">
		<aui:column columnWidth="50">
			<img src="<%= HtmlUtil.escape(themeDisplay.getPathImage() + "/logo?img_id=" + oAuthApplication.getLogoId() + "&t=" + WebServerServletTokenUtil.getToken(oAuthApplication.getLogoId())) %>" />
		</aui:column>
	</c:if>
</aui:layout>
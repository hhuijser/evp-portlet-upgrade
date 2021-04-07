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

<%@ include file="/html/portal/init.jsp" %>

<%
String referer = ParamUtil.getString(request, WebKeys.REFERER, PortalUtil.getCurrentURL(request));

Ticket ticket = (Ticket)request.getAttribute(WebKeys.TICKET);

String ticketKey = ParamUtil.getString(request, "ticketKey");

if (referer.startsWith(themeDisplay.getPathMain() + "/portal/update_password") && Validator.isNotNull(ticketKey)) {
	referer = themeDisplay.getPathMain();
}

PasswordPolicy passwordPolicy = user.getPasswordPolicy();
%>

<c:choose>
	<c:when test="<%= !themeDisplay.isSignedIn() && (ticket == null) %>">
		<div class="alert alert-warning">
			<liferay-ui:message key="your-password-reset-link-is-no-longer-valid" />

			<%
			PortletURL portletURL = new PortletURLImpl(request, PortletKeys.LOGIN, plid, PortletRequest.RENDER_PHASE);

			portletURL.setParameter("struts_action", "/login/forgot_password");
			portletURL.setWindowState(WindowState.MAXIMIZED);
			%>

			<div>
				<aui:a href="<%= portletURL.toString() %>" label="request-a-new-password-reset-link"></aui:a>
			</div>
		</div>
	</c:when>
	<c:when test="<%= SessionErrors.contains(request, UserLockoutException.class.getName()) %>">
		<div class="alert alert-error">
			<liferay-ui:message key="this-account-has-been-locked" />
		</div>
	</c:when>
	<c:otherwise>
		<aui:form action='<%= themeDisplay.getPathMain() + "/portal/update_password" %>' method="post" name="fm">
			<aui:input name="p_l_id" type="hidden" value="<%= layout.getPlid() %>" />
			<aui:input name="p_auth" type="hidden" value="<%= AuthTokenUtil.getToken(request) %>" />
			<aui:input name="doAsUserId" type="hidden" value="<%= themeDisplay.getDoAsUserId() %>" />
			<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
			<aui:input name="<%= WebKeys.REFERER %>" type="hidden" value="<%= referer %>" />
			<aui:input name="ticketKey" type="hidden" value="<%= ticketKey %>" />

			<c:if test="<%= SessionErrors.contains(request, UserPasswordException.class.getName()) %>">

				<%
				UserPasswordException upe = (UserPasswordException)SessionErrors.get(request, UserPasswordException.class.getName());
				%>

				<div class="alert alert-error">
					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_ALREADY_USED %>">
						<liferay-ui:message key="that-password-has-already-been-used-please-enter-in-a-different-password" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_CONTAINS_TRIVIAL_WORDS %>">
						<liferay-ui:message key="that-password-uses-common-words-please-enter-in-a-password-that-is-harder-to-guess-i-e-contains-a-mix-of-numbers-and-letters" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_INVALID %>">
						<liferay-ui:message key="that-password-is-invalid-please-enter-in-a-different-password" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_LENGTH %>">
						<%= LanguageUtil.format(pageContext, "that-password-is-too-short-or-too-long-please-make-sure-your-password-is-between-x-and-512-characters", String.valueOf(passwordPolicy.getMinLength()), false) %>
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_NOT_CHANGEABLE %>">
						<liferay-ui:message key="passwords-may-not-be-changed-under-the-current-password-policy" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_SAME_AS_CURRENT %>">
						<liferay-ui:message key="your-new-password-cannot-be-the-same-as-your-old-password-please-enter-in-a-different-password" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_TOO_TRIVIAL %>">
						<liferay-ui:message key="that-password-is-too-trivial" />
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORD_TOO_YOUNG %>">
						<%= LanguageUtil.format(pageContext, "you-cannot-change-your-password-yet-please-wait-at-least-x-before-changing-your-password-again", LanguageUtil.getTimeDescription(pageContext, passwordPolicy.getMinAge() * 1000), false) %>
					</c:if>

					<c:if test="<%= upe.getType() == UserPasswordException.PASSWORDS_DO_NOT_MATCH %>">
						<liferay-ui:message key="the-passwords-you-entered-do-not-match-each-other-please-re-enter-your-password" />
					</c:if>
				</div>
			</c:if>

			<aui:fieldset>
				<aui:input autoFocus="<%= true %>" class="lfr-input-text-container" label="password" name="password1" showRequiredLabel="<%= false %>" type="password">
					<aui:validator name="required" />
				</aui:input>

				<aui:input class="lfr-input-text-container" label="enter-again" name="password2" showRequiredLabel="<%= false %>" type="password">
					<aui:validator name="equalTo">
						'#<portlet:namespace />password1'
					</aui:validator>

					<aui:validator name="required" />
				</aui:input>
			</aui:fieldset>

			<aui:button-row>
				<aui:button type="submit" />
			</aui:button-row>
		</aui:form>
	</c:otherwise>
</c:choose>
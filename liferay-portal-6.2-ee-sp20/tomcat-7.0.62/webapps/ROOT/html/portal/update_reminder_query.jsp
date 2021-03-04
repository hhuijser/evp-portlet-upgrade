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

if (referer.equals(themeDisplay.getPathMain() + "/portal/update_reminder_query")) {
	referer = themeDisplay.getPathMain() + "?doAsUserId=" + themeDisplay.getDoAsUserId();
}
%>

<aui:form action='<%= themeDisplay.getPathMain() + "/portal/update_reminder_query" %>' autocomplete='<%= PropsValues.COMPANY_SECURITY_PASSWORD_REMINDER_QUERY_FORM_AUTOCOMPLETE ? "on" : "off" %>' cssClass="update-reminder-query" method="post" name="fm">
	<aui:input name="p_auth" type="hidden" value="<%= AuthTokenUtil.getToken(request) %>" />
	<aui:input name="doAsUserId" type="hidden" value="<%= themeDisplay.getDoAsUserId() %>" />
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="<%= WebKeys.REFERER %>" type="hidden" value="<%= referer %>" />

	<c:if test="<%= SessionErrors.contains(request, UserReminderQueryException.class.getName()) %>">
		<div class="alert alert-error">
			<liferay-ui:message key="reminder-query-and-answer-cannot-be-empty" />
		</div>
	</c:if>

	<aui:fieldset>
		<%@ include file="/html/portal/update_reminder_query_question.jspf" %>

		<c:if test="<%= PropsValues.USERS_REMINDER_QUERIES_CUSTOM_QUESTION_ENABLED %>">
			<div class="hide" id="customQuestionContainer">
				<aui:input autoFocus="<%= true %>" bean="<%= user %>" cssClass="reminder-query-custom" fieldParam="reminderQueryCustomQuestion" label="" model="<%= User.class %>" name="reminderQueryQuestion" />
			</div>
		</c:if>

		<aui:input cssClass="reminder-query-answer" label="answer" maxlength="<%= ModelHintsConstants.TEXT_MAX_LENGTH %>" name="reminderQueryAnswer" showRequiredLabel="<%= false %>" size="50" type="text" value="<%= user.getReminderQueryAnswer() %>">
			<aui:validator name="required" />
		</aui:input>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>

<aui:script use="aui-base">
	var customQuestionContainer = A.one('#customQuestionContainer');
	var reminderQueryQuestion = A.one('#reminderQueryQuestion');

	if (reminderQueryQuestion && customQuestionContainer) {
		if (reminderQueryQuestion.val() != '<%= UsersAdmin.CUSTOM_QUESTION %>') {
			customQuestionContainer.hide();
		}
		else {
			customQuestionContainer.show();
		}

		reminderQueryQuestion.on(
			'change',
			function(event) {
				if (this.val() == '<%= UsersAdmin.CUSTOM_QUESTION %>') {
					<c:if test="<%= PropsValues.USERS_REMINDER_QUERIES_CUSTOM_QUESTION_ENABLED %>">
						customQuestionContainer.show();

						Liferay.Util.focusFormField('#reminderQueryCustomQuestion');
					</c:if>
				}
				else {
					customQuestionContainer.hide();

					Liferay.Util.focusFormField('#reminderQueryAnswer');
				}
			}
		);
	}
</aui:script>
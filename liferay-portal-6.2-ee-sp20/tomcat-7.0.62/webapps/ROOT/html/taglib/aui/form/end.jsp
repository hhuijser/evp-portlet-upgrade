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

	<c:if test="<%= Validator.isNotNull(onSubmit) %>">
		</fieldset>
	</c:if>
</form>

<%
String formId = namespace + HtmlUtil.escapeJS(name);
%>

<aui:script use="liferay-form">
	Liferay.Form.register(
		{
			id: '<%= formId %>'

			<c:if test="<%= validatorTagsMap != null %>">
				, fieldRules: [

					<%
					int i = 0;

					for (String fieldName : validatorTagsMap.keySet()) {
						List<ValidatorTag> validatorTags = validatorTagsMap.get(fieldName);

						for (ValidatorTag validatorTag : validatorTags) {
					%>

							<%= i != 0 ? StringPool.COMMA : StringPool.BLANK %>

							{
								body: <%= validatorTag.getBody() %>,
								custom: <%= validatorTag.isCustom() %>,
								customValidatorRequired: <%= validatorTag.isCustomValidatorRequired() %>,
								errorMessage: '<%= UnicodeLanguageUtil.get(pageContext, validatorTag.getErrorMessage()) %>',
								fieldName: '<%= namespace + HtmlUtil.escapeJS(fieldName) %>',
								validatorName: '<%= validatorTag.getName() %>'
							}

					<%
							i++;
						}
					}
					%>

				]
			</c:if>

			<c:if test="<%= Validator.isNotNull(onSubmit) %>">
				, onSubmit: function(event) {
					<%= onSubmit %>
				}
			</c:if>
		}
	);

	<c:if test="<%= Validator.isNotNull(onSubmit) %>">
		A.all('#<%= formId %> .input-container').removeAttribute('disabled');
	</c:if>

	Liferay.fire('<%= formId %>formReady');
</aui:script>
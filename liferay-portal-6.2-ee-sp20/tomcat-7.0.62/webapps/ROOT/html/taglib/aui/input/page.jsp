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

<%@ include file="/html/taglib/aui/input/init.jsp" %>

<liferay-util:buffer var="labelContent">
	<liferay-ui:message key="<%= label %>" localizeKey="<%= localizeLabel %>" />

	<c:if test='<%= required && showRequiredLabel && !type.equals("radio") %>'>
		<span class="label-required">(<liferay-ui:message key="required" />)</span>
	</c:if>

	<c:if test="<%= Validator.isNotNull(helpMessage) %>">
		<liferay-ui:icon-help message="<%= helpMessage %>" />
	</c:if>

	<c:if test="<%= changesContext %>">
		<span class="hide-accessible"><liferay-ui:message key="changing-the-value-of-this-field-will-reload-the-page" />)</span>
	</c:if>
</liferay-util:buffer>

<c:if test='<%= !type.equals("hidden") && !wrappedField && useInputWrapper %>'>
	<div class="<%= inputWrapperClass %>">
</c:if>

<%
boolean choiceField = checkboxField || radioField;
%>

<c:if test='<%= !type.equals("assetCategories") && !type.equals("hidden") && Validator.isNotNull(label) %>'>
	<c:if test='<%= choiceField || !inlineLabel.equals("right") %>'>
		<label <%= labelTag %>>
	</c:if>

	<c:if test='<%= !choiceField && !inlineLabel.equals("right") %>'>
			<%= labelContent %>
		</label>
	</c:if>
</c:if>

<c:if test="<%= Validator.isNotNull(prefix) || Validator.isNotNull(suffix) %>">
	<div class="<%= addOnCssClass %>">
		<c:if test="<%= Validator.isNotNull(prefix) %>">
			<span class="<%= helpTextCssClass %>"><liferay-ui:message key="<%= prefix %>" /></span>
		</c:if>
</c:if>

<c:choose>
	<c:when test='<%= (model != null) && type.equals("assetCategories") %>'>
		<liferay-ui:asset-categories-selector
			className="<%= model.getName() %>"
			classPK="<%= _getClassPK(bean, classPK) %>"
			contentCallback='<%= portletResponse.getNamespace() + "getSuggestionsContent" %>'
			ignoreRequestValue="<%= ignoreRequestValue %>"
		/>
	</c:when>
	<c:when test='<%= (model != null) && type.equals("assetTags") %>'>
		<liferay-ui:asset-tags-selector
			autoFocus="<%= autoFocus %>"
			className="<%= model.getName() %>"
			classPK="<%= _getClassPK(bean, classPK) %>"
			contentCallback='<%= portletResponse.getNamespace() + "getSuggestionsContent" %>'
			id="<%= namespace + id %>"
			ignoreRequestValue="<%= ignoreRequestValue %>"
		/>
	</c:when>
	<c:when test="<%= (model != null) && Validator.isNull(type) %>">
		<liferay-ui:input-field
			autoComplete='<%= GetterUtil.getBoolean(dynamicAttributes.get("autocomplete"), true) %>'
			autoFocus="<%= autoFocus %>"
			bean="<%= bean %>"
			cssClass="<%= fieldCssClass %>"
			dateTogglerCheckboxLabel="<%= dateTogglerCheckboxLabel %>"
			defaultLanguageId="<%= defaultLanguageId %>"
			defaultValue="<%= value %>"
			disabled="<%= disabled %>"
			field="<%= field %>"
			fieldParam="<%= fieldParam %>"
			format='<%= (Format)dynamicAttributes.get("format") %>'
			formName="<%= formName %>"
			id="<%= id %>"
			ignoreRequestValue="<%= ignoreRequestValue %>"
			languageId="<%= languageId %>"
			model="<%= model %>"
			placeholder="<%= placeholder %>"
			timeFormat='<%= GetterUtil.getString(dynamicAttributes.get("timeFormat")) %>'
		/>
	</c:when>
	<c:when test='<%= type.equals("checkbox") %>'>

		<%
		String valueString = String.valueOf(checked);

		if (value != null) {
			valueString = value.toString();
		}

		if (!ignoreRequestValue) {
			valueString = ParamUtil.getString(request, name, valueString);
		}

		if (StringUtil.equalsIgnoreCase(valueString, "false") || StringUtil.equalsIgnoreCase(valueString, "true")) {
			checked = GetterUtil.getBoolean(valueString);
		}

		String defaultValueString = String.valueOf(checked);

		if (Validator.isNotNull(valueString) && !StringUtil.equalsIgnoreCase(valueString, "false") && !StringUtil.equalsIgnoreCase(valueString, "true")) {
			defaultValueString = valueString;
		}
		%>

		<input id="<%= namespace + HtmlUtil.escapeAttribute(id) %>" name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" type="hidden" value="<%= HtmlUtil.escapeAttribute(valueString) %>" />

		<input <%= checked ? "checked" : StringPool.BLANK %> class="<%= fieldCssClass %>" <%= disabled ? "disabled" : StringPool.BLANK %> id="<%= namespace + HtmlUtil.escapeAttribute(id) %>Checkbox" name="<%= namespace + HtmlUtil.escapeAttribute(name) %>Checkbox" <%= Validator.isNotNull(onChange) ? "onChange=\"" + onChange + "\"" : StringPool.BLANK %> onClick="Liferay.Util.updateCheckboxValue(this); <%= onClick %>" <%= Validator.isNotNull(title) ? "title=\"" + LanguageUtil.get(locale, title) + "\"" : StringPool.BLANK %> type="checkbox" value="<%= HtmlUtil.escapeAttribute(defaultValueString) %>" <%= AUIUtil.buildData(data) %> <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %> />
	</c:when>
	<c:when test='<%= type.equals("radio") %>'>

		<%
		String valueString = String.valueOf(checked);

		if (value != null) {
			valueString = value.toString();
		}

		if (!ignoreRequestValue) {
			String requestValue = ParamUtil.getString(request, name);

			if (Validator.isNotNull(requestValue)) {
				checked = valueString.equals(requestValue);
			}
		}
		%>

		<input <%= checked ? "checked" : StringPool.BLANK %> class="<%= fieldCssClass %>" <%= disabled ? "disabled" : StringPool.BLANK %> id="<%= namespace + HtmlUtil.escapeAttribute(id) %>" name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" <%= Validator.isNotNull(onChange) ? "onChange=\"" + onChange + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(onClick) ? "onClick=\"" + onClick + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(title) ? "title=\"" + LanguageUtil.get(locale, title) + "\"" : StringPool.BLANK %> type="radio" value="<%= HtmlUtil.escapeAttribute(valueString) %>" <%= AUIUtil.buildData(data) %> <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %> />
	</c:when>
	<c:when test='<%= type.equals("resource") %>'>
		<liferay-ui:input-resource id="<%= id %>" title="<%= title %>" url="<%= String.valueOf(value) %>" />
	</c:when>
	<c:when test='<%= type.equals("timeZone") %>'>

		<%
		int displayStyle = TimeZone.LONG;

		if (dynamicAttributes.get("displayStyle") != null) {
			displayStyle = GetterUtil.getInteger((String)dynamicAttributes.get("displayStyle"));
		}
		%>

		<liferay-ui:input-time-zone
			autoFocus="<%= autoFocus %>"
			daylight='<%= GetterUtil.getBoolean((String)dynamicAttributes.get("daylight")) %>'
			disabled="<%= disabled %>"
			displayStyle="<%= displayStyle %>"
			name="<%= name %>"
			nullable='<%= GetterUtil.getBoolean((String)dynamicAttributes.get("nullable")) %>'
			value="<%= value.toString() %>"
		/>
	</c:when>
	<c:otherwise>

		<%
		String valueString = StringPool.BLANK;

		if (value != null) {
			valueString = value.toString();
		}

		if (type.equals("hidden") && (value == null)) {
			valueString = BeanPropertiesUtil.getStringSilent(bean, name);
		}
		else if (!ignoreRequestValue && (Validator.isNull(type) || type.equals("email") || type.equals("text") || type.equals("textarea"))) {
			valueString = BeanParamUtil.getStringSilent(bean, request, name, valueString);

			if (Validator.isNotNull(fieldParam)) {
				valueString = ParamUtil.getString(request, fieldParam, valueString);
			}
		}
		%>

		<c:choose>
			<c:when test='<%= localized && (type.equals("editor") || type.equals("text") || type.equals("textarea")) %>'>
				<liferay-ui:input-localized
					autoFocus="<%= autoFocus %>"
					availableLocales="<%= LanguageUtil.getAvailableLocales(themeDisplay.getSiteGroupId()) %>"
					cssClass="<%= fieldCssClass %>"
					defaultLanguageId="<%= defaultLanguageId %>"
					disabled="<%= disabled %>"
					formName="<%= formName %>"
					id="<%= id %>"
					ignoreRequestValue="<%= ignoreRequestValue %>"
					languageId="<%= languageId %>"
					name="<%= name %>"
					onChange="<%= onChange %>"
					onClick="<%= onClick %>"
					placeholder="<%= placeholder %>"
					type='<%= type.equals("text") ? "input" : type %>'
					xml="<%= valueString %>"
				/>
			</c:when>
			<c:when test='<%= type.equals("textarea") %>'>

				<%
				String[] storedDimensions = resizable ? StringUtil.split(SessionClicks.get(request, _TEXTAREA_WIDTH_HEIGHT_PREFIX + namespace + id, StringPool.BLANK)) : StringPool.EMPTY_ARRAY;
				%>

				<textarea class="<%= fieldCssClass %>" <%= disabled ? "disabled" : StringPool.BLANK %> id="<%= namespace + HtmlUtil.escapeAttribute(id) %>" <%= multiple ? "multiple" : StringPool.BLANK %> name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" <%= Validator.isNotNull(onChange) ? "onChange=\"" + onChange + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(onClick) ? "onClick=\"" + onClick + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(placeholder) ? "placeholder=\"" + LanguageUtil.get(pageContext, placeholder) + "\"" : StringPool.BLANK %> <%= (storedDimensions.length > 1) ? "style=\"height: " + storedDimensions[0] + "; width: " + storedDimensions[1] + ";" + title + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(title) ? "title=\"" + LanguageUtil.get(locale, title) + "\"" : StringPool.BLANK %> <%= AUIUtil.buildData(data) %> <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %>><%= HtmlUtil.escape(valueString) %></textarea>

				<c:if test="<%= autoSize %>">
					<aui:script use="aui-autosize">
						A.one('#<%= namespace + HtmlUtil.escapeJS(id) %>').plug(A.Plugin.Autosize);
					</aui:script>
				</c:if>

				<c:if test="<%= resizable %>">
					<aui:script use="liferay-store,resize-base">
						var textareaNode = A.one('#<%= namespace + HtmlUtil.escapeJS(id) %>');

						var resizeInstance = new A.Resize(
							{
								after: {
									'end': function(event) {
										Liferay.Store('<%= _TEXTAREA_WIDTH_HEIGHT_PREFIX %><%= namespace + HtmlUtil.escapeJS(id) %>', textareaNode.getStyle('height') + ',' + textareaNode.getStyle('width'));
									}
								},
								autoHide: true,
								handles: 'r, br, b',
								node: textareaNode
							}
						);

						textareaNode.setData('resizeInstance', resizeInstance);
					</aui:script>
				</c:if>
			</c:when>
			<c:otherwise>
				<input <%= type.equals("image") ? "alt=\"" + LanguageUtil.get(pageContext, title) + "\"" : StringPool.BLANK %> class="<%= fieldCssClass %>" <%= disabled ? "disabled" : StringPool.BLANK %> id="<%= namespace + HtmlUtil.escapeAttribute(id) %>" <%= (max != null) ? "max=\"" + max + "\"": StringPool.BLANK %> <%= (min != null) ? "min=\"" + min + "\"": StringPool.BLANK %> <%= multiple ? "multiple" : StringPool.BLANK %> name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" <%= Validator.isNotNull(onChange) ? "onChange=\"" + onChange + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(onClick) ? "onClick=\"" + onClick + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(placeholder) ? "placeholder=\"" + LanguageUtil.get(pageContext, placeholder) + "\"" : StringPool.BLANK %> <%= Validator.isNotNull(title) ? "title=\"" + LanguageUtil.get(locale, title) + "\"" : StringPool.BLANK %> type="<%= Validator.isNull(type) ? "text" : type %>" <%= !type.equals("image") ? "value=\"" + HtmlUtil.escapeAttribute(valueString) + "\"" : StringPool.BLANK %> <%= AUIUtil.buildData(data) %> <%= InlineUtil.buildDynamicAttributes(dynamicAttributes) %> />
			</c:otherwise>
		</c:choose>

		<c:if test="<%= autoFocus %>">
			<aui:script>
				Liferay.Util.focusFormField('#<%= namespace + HtmlUtil.escapeJS(id) %>');
			</aui:script>
		</c:if>
	</c:otherwise>
</c:choose>

<c:if test="<%= Validator.isNotNull(prefix) || Validator.isNotNull(suffix) %>">
		<c:if test="<%= Validator.isNotNull(suffix) %>">
			<span class="<%= helpTextCssClass %>"><liferay-ui:message key="<%= suffix %>" /></span>
		</c:if>
	</div>
</c:if>

<c:if test='<%= !type.equals("assetCategories") && !type.equals("hidden") && Validator.isNotNull(label) %>'>
	<c:if test='<%= !choiceField && inlineLabel.equals("right") %>'>
		<label <%= labelTag %>>
			<%= labelContent %>
	</c:if>

	<c:if test="<%= choiceField %>">
		<%= labelContent %>
	</c:if>

	<c:if test='<%= inlineLabel.equals("right") %>'>
		</label>
	</c:if>
</c:if>

<c:if test='<%= !type.equals("hidden") && !wrappedField && useInputWrapper %>'>
	</div>
</c:if>

<%!
private long _getClassPK(Object bean, long classPK) {
	if ((bean != null) && (classPK <= 0)) {
		if (bean instanceof ClassedModel) {
			ClassedModel classedModel = (ClassedModel)bean;

			Serializable primaryKeyObj = classedModel.getPrimaryKeyObj();

			if (primaryKeyObj instanceof Long) {
				classPK = (Long)primaryKeyObj;
			}
			else {
				classPK = GetterUtil.getLong(primaryKeyObj.toString());
			}
		}
	}

	return classPK;
}

private static final String _TEXTAREA_WIDTH_HEIGHT_PREFIX = "liferay_resize_";
%>
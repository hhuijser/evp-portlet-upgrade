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

<%@ include file="/html/taglib/init.jsp" %>

<%
String randomNamespace = PortalUtil.generateRandomKey(request, "taglib_ui_input_date_page") + StringPool.UNDERLINE;

if (GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-date:disableNamespace"))) {
	namespace = StringPool.BLANK;
}

boolean autoFocus = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-date:autoFocus"));
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:cssClass"));
String dateTogglerCheckboxLabel = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:dateTogglerCheckboxLabel"), "disable");
boolean disabled = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-date:disabled"));
String dayParam = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:dayParam"));
int dayValue = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-date:dayValue"));
int firstDayOfWeek = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-date:firstDayOfWeek"));
String formName = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:formName"));
String monthAndYearParam = namespace + request.getAttribute("liferay-ui:input-date:monthAndYearParam");
String monthParam = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:monthParam"));
int monthValue = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-date:monthValue"));
String name = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:name"));
boolean nullable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-date:nullable"));
boolean required = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-date:required"));
String yearParam = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-date:yearParam"));
int yearValue = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-date:yearValue"));

String dayParamId = namespace + HtmlUtil.getAUICompatibleId(dayParam);
String monthParamId = namespace + HtmlUtil.getAUICompatibleId(monthParam);
String nameId = namespace + HtmlUtil.getAUICompatibleId(name);
String yearParamId = namespace + HtmlUtil.getAUICompatibleId(yearParam);

Calendar calendar = CalendarFactoryUtil.getCalendar(yearValue, monthValue, dayValue);

String mask = _MASK_MDY;
String simpleDateFormatPattern = _SIMPLE_DATE_FORMAT_PATTERN_MDY;

if (BrowserSnifferUtil.isMobile(request)) {
	simpleDateFormatPattern = _SIMPLE_DATE_FORMAT_PATTERN_HTML5;
}
else {
	DateFormat shortDateFormat = DateFormat.getDateInstance(DateFormat.SHORT, locale);

	SimpleDateFormat shortDateFormatSimpleDateFormat = (SimpleDateFormat)shortDateFormat;

	String shortDateFormatSimpleDateFormatPattern = shortDateFormatSimpleDateFormat.toPattern();

	if (shortDateFormatSimpleDateFormatPattern.indexOf("y") == 0) {
		mask = _MASK_YMD;
		simpleDateFormatPattern = _SIMPLE_DATE_FORMAT_PATTERN_YMD;
	}
	else if (shortDateFormatSimpleDateFormatPattern.indexOf("d") == 0) {
		mask = _MASK_DMY;
		simpleDateFormatPattern = _SIMPLE_DATE_FORMAT_PATTERN_DMY;
	}
}

String dayAbbreviation = LanguageUtil.get(pageContext, "day-abbreviation");
String monthAbbreviation = LanguageUtil.get(pageContext, "month-abbreviation");
String yearAbbreviation = LanguageUtil.get(pageContext, "year-abbreviation");

String[] dateAbbreviations = {"M", "d", "y"};
String[] localizedDateAbbreviations = {monthAbbreviation, dayAbbreviation, yearAbbreviation};

String placeholderValue = StringUtil.replace(simpleDateFormatPattern, dateAbbreviations, localizedDateAbbreviations);

boolean nullDate = false;

if (nullable && !required && (dayValue == 0) && (monthValue == -1) && (yearValue == 0)) {
	nullDate = true;
}

String dateString = null;

Format format = FastDateFormatFactoryUtil.getSimpleDateFormat(simpleDateFormatPattern, locale);

if (nullable && nullDate) {
	dateString = StringPool.BLANK;
}
else {
	dateString = format.format(calendar.getTime());
}
%>

<span class="lfr-input-date <%= cssClass %>" id="<%= randomNamespace %>displayDate">
	<c:choose>
		<c:when test="<%= BrowserSnifferUtil.isMobile(request) %>">
			<input class="input-medium" <%= disabled ? "disabled=\"disabled\"" : "" %> id="<%= nameId %>" name="<%= namespace + HtmlUtil.escapeAttribute(name) %>" type="date" value="<%= format.format(calendar.getTime()) %>" />
		</c:when>
		<c:otherwise>
			<aui:input disabled="<%= disabled %>" id="<%= HtmlUtil.getAUICompatibleId(name) %>" label="" name="<%= name %>" placeholder="<%= StringUtil.toLowerCase(placeholderValue) %>" required="<%= required %>" title="" type="text" value="<%= dateString %>" wrappedField="<%= true %>">
				<aui:validator customValidatorRequired="<%= Boolean.FALSE %>" errorMessage="please-enter-a-valid-date" name="custom">
					function(val) {
						return AUI().use('aui-datatype-date-parse').Parsers.date('<%= mask %>', val);
					}
				</aui:validator>
			</aui:input>
		</c:otherwise>
	</c:choose>

	<input <%= disabled ? "disabled=\"disabled\"" : "" %> id="<%= dayParamId %>" name="<%= namespace + HtmlUtil.escapeAttribute(dayParam) %>" type="hidden" value="<%= dayValue %>" />
	<input <%= disabled ? "disabled=\"disabled\"" : "" %> id="<%= monthParamId %>" name="<%= namespace + HtmlUtil.escapeAttribute(monthParam) %>" type="hidden" value="<%= monthValue %>" />
	<input <%= disabled ? "disabled=\"disabled\"" : "" %> id="<%= yearParamId %>" name="<%= namespace + HtmlUtil.escapeAttribute(yearParam) %>" type="hidden" value="<%= yearValue %>" />
</span>

<c:if test="<%= nullable && !required %>">

	<%
	String dateTogglerCheckboxName = TextFormatter.format(dateTogglerCheckboxLabel, TextFormatter.M);
	%>

	<aui:input label="<%= dateTogglerCheckboxLabel %>" name="<%= randomNamespace + dateTogglerCheckboxName %>" type="checkbox" value="<%= disabled %>" />

	<aui:script use="aui-base">
		var checkbox = A.one('#<%= namespace + randomNamespace + dateTogglerCheckboxName %>Checkbox');

		checkbox.on(
			'click',
			function(event) {
				var checked = checkbox.attr('checked');

				var form = A.one('#<%= namespace + formName %>');

				if (!form) {
					form = checkbox.attr('form');
				}

				var dayField = form.one('#<%= dayParamId %>');
				var inputDateField = form.one('#<%= nameId %>');
				var monthField = form.one('#<%= monthParamId %>');
				var yearField = form.one('#<%= yearParamId %>');

				inputDateField.attr('disabled', checked);
				dayField.attr('disabled', checked);
				monthField.attr('disabled', checked);
				yearField.attr('disabled', checked);

				if (checked) {
					inputDateField.val('');
					dayField.val('');
					monthField.val('');
					yearField.val('');
				}
			}
		);
	</aui:script>
</c:if>

<aui:script use='<%= "aui-datepicker" + (BrowserSnifferUtil.isMobile(request) ? "-native" : StringPool.BLANK) %>'>
	Liferay.component(
		'<%= nameId %>DatePicker',
		function() {
			var datePicker = new A.DatePicker<%= BrowserSnifferUtil.isMobile(request) ? "Native" : StringPool.BLANK %>(
				{
					calendar: {

						<%
						String calendarOptions = StringPool.BLANK;

						if (firstDayOfWeek != -1) {
							calendarOptions += String.format("'strings.first_weekday': %d", firstDayOfWeek);
						}
						%>

						<%= calendarOptions %>
					},
					container: '#<%= randomNamespace %>displayDate',
					mask: '<%= mask %>',
					on: {
						disabledChange: function(event) {
							var instance = this;

							var container = instance.get('container');

							var newVal = event.newVal;

							container.one('#<%= dayParamId %>').attr('disabled', newVal);
							container.one('#<%= monthParamId %>').attr('disabled', newVal);
							container.one('#<%= nameId %>').attr('disabled', newVal);
							container.one('#<%= yearParamId %>').attr('disabled', newVal);
						},
						enterKey: function(event) {
							var instance = this;

							var inputVal = instance.get('activeInput').val();

							var date = instance.getParsedDatesFromInputValue(inputVal);

							if (date) {
								datePicker.updateValue(date[0]);
							}
						},
						selectionChange: function(event) {
							if (isNaN(event.newSelection[0])) {
								event.newSelection[0] = new Date();
							}

							datePicker.updateValue(event.newSelection[0]);
						}
					},
					popover: {
						zIndex: Liferay.zIndex.TOOLTIP
					},
					trigger: '#<%= nameId %>'
				}
			);

			datePicker.getDate = function() {
				var instance = this;

				var container = instance.get('container');

				return new Date(container.one('#<%= yearParamId %>').val(), container.one('#<%= monthParamId %>').val(), container.one('#<%= dayParamId %>').val());
			};

			datePicker.updateValue = function(date) {
				var instance = this;

				var container = instance.get('container');

				if (date) {
					container.one('#<%= dayParamId %>').val(date.getDate());
					container.one('#<%= monthParamId %>').val(date.getMonth());
					container.one('#<%= yearParamId %>').val(date.getFullYear());
				}
			};

			datePicker.after(
				'selectionChange',
				function(event) {
					var input = A.one('#<%= nameId %>');

					if (input) {
						var form = input.get('form');

						var formId = form.get('id');

						var formInstance = Liferay.Form.get(formId);

						formInstance.formValidator.validateField('<%= namespace + HtmlUtil.escapeAttribute(name) %>');
					}
				}
			);

			return datePicker;
		}
	);

	Liferay.component('<%= nameId %>DatePicker');
</aui:script>

<%!
private static final String _SIMPLE_DATE_FORMAT_PATTERN_DMY = "dd/MM/yyyy";

private static final String _SIMPLE_DATE_FORMAT_PATTERN_HTML5 = "yyyy-MM-dd";

private static final String _SIMPLE_DATE_FORMAT_PATTERN_MDY = "MM/dd/yyyy";

private static final String _SIMPLE_DATE_FORMAT_PATTERN_YMD = "yyyy/MM/dd";

private static final String _MASK_DMY = "%d/%m/%Y";

private static final String _MASK_MDY = "%m/%d/%Y";

private static final String _MASK_YMD = "%Y/%m/%d";
%>
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

<%@ include file="/html/portlet/sites_admin/init.jsp" %>

<%
Group liveGroup = (Group)request.getAttribute("site.liveGroup");
%>

<liferay-ui:error-marker key="errorSection" value="displaySettings" />

<h3><liferay-ui:message key="display-settings" /></h3>

<h3><liferay-ui:message key="language" /></h3>

<%
UnicodeProperties typeSettingsProperties = null;

if (liveGroup != null) {
	typeSettingsProperties = liveGroup.getTypeSettingsProperties();
}
else {
	typeSettingsProperties = new UnicodeProperties();
}

boolean inheritLocales = GetterUtil.getBoolean(typeSettingsProperties.getProperty(GroupConstants.TYPE_SETTINGS_KEY_INHERIT_LOCALES), true);

LayoutSet publicLayoutSet = liveGroup.getPublicLayoutSet();
LayoutSet privateLayoutSet = liveGroup.getPrivateLayoutSet();

boolean disabledLocaleInput = false;

if (publicLayoutSet.isLayoutSetPrototypeLinkEnabled() || privateLayoutSet.isLayoutSetPrototypeLinkEnabled()) {
	disabledLocaleInput = true;
}
%>

<aui:input checked="<%= inheritLocales %>" disabled="<%= disabledLocaleInput %>" id="<%= GroupConstants.TYPE_SETTINGS_KEY_INHERIT_LOCALES %>" label="use-the-default-language-options" name="TypeSettingsProperties--inheritLocales--" type="radio" value="<%= true %>" />

<aui:input checked="<%= !inheritLocales %>" disabled="<%= disabledLocaleInput %>" id="customLocales" label="define-a-custom-default-language-and-additional-available-languages-for-this-site" name="TypeSettingsProperties--inheritLocales--" type="radio" value="<%= false %>" />

<aui:fieldset id="customLocalesFieldset">
	<aui:fieldset cssClass="default-language" label="default-language">

		<%
		User user2 = company.getDefaultUser();

		Locale defaultLocale = user2.getLocale();
		%>

		<%= defaultLocale.getDisplayName(locale) %>
	</aui:fieldset>

	<aui:fieldset cssClass="available-languages" label="available-languages">

		<%
		for (Locale availableLocale : LanguageUtil.getAvailableLocales()) {
		%>

			<%= availableLocale.getDisplayName(locale) %>,

		<%
		}
		%>

	</aui:fieldset>
</aui:fieldset>

<aui:fieldset id="inheritLocalesFieldset">
	<liferay-ui:error exception="<%= LocaleException.class %>">

		<%
		LocaleException le = (LocaleException)errorException;
		%>

		<c:choose>
			<c:when test="<%= le.getType() == LocaleException.TYPE_DEFAULT %>">
				<liferay-ui:message arguments="<%= StringUtil.merge(LocaleUtil.toDisplayNames(le.getTargetAvailableLocales(), locale), StringPool.COMMA_AND_SPACE) %>" key="please-select-a-default-language-among-the-available-languages-of-the-site-x" translateArguments="<%= false %>" />
			</c:when>
			<c:when test="<%= le.getType() == LocaleException.TYPE_DISPLAY_SETTINGS %>">
				<liferay-ui:message arguments="<%= StringUtil.merge(LocaleUtil.toDisplayNames(le.getSourceAvailableLocales(), locale), StringPool.COMMA_AND_SPACE) %>" key="please-select-the-available-languages-of-the-site-among-the-available-languages-of-the-portal-x" translateArguments="<%= false %>" />
			</c:when>
		</c:choose>
	</liferay-ui:error>

	<%
	Locale[] siteAvailableLocales = LanguageUtil.getAvailableLocales(liveGroup.getGroupId());
	%>

	<aui:fieldset cssClass="default-language" label="default-language">
		<aui:select disabled="<%= disabledLocaleInput %>" label="" name="TypeSettingsProperties--languageId--" title="language">

			<%
			Locale siteDefaultLocale = PortalUtil.getSiteDefaultLocale(liveGroup.getGroupId());

			for (Locale siteAvailableLocale : siteAvailableLocales) {
			%>

				<aui:option label="<%= siteAvailableLocale.getDisplayName(locale) %>" lang="<%= LocaleUtil.toW3cLanguageId(siteAvailableLocale) %>" selected="<%= (siteDefaultLocale.getLanguage().equals(siteAvailableLocale.getLanguage()) && siteDefaultLocale.getCountry().equals(siteAvailableLocale.getCountry())) %>" value="<%= LocaleUtil.toLanguageId(siteAvailableLocale) %>" />

			<%
			}
			%>

		</aui:select>
	</aui:fieldset>

	<aui:fieldset cssClass="available-languages" label="available-languages">
		<aui:input name='<%= "TypeSettingsProperties--" + PropsKeys.LOCALES + "--" %>' type="hidden" value="<%= StringUtil.merge(LocaleUtil.toLanguageIds(siteAvailableLocales)) %>" />

		<%

		// Left list

		List leftList = new ArrayList();

		for (Locale siteAvailableLocale : siteAvailableLocales) {
			leftList.add(new KeyValuePair(LocaleUtil.toLanguageId(siteAvailableLocale), siteAvailableLocale.getDisplayName(locale)));
		}

		// Right list

		List rightList = new ArrayList();

		for (Locale availableLocale : LanguageUtil.getAvailableLocales()) {
			if (!ArrayUtil.contains(siteAvailableLocales, availableLocale)) {
				rightList.add(new KeyValuePair(LocaleUtil.toLanguageId(availableLocale), availableLocale.getDisplayName(locale)));
			}
		}

		rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
		%>

		<liferay-ui:input-move-boxes
			leftBoxName="currentLanguageIds"
			leftList="<%= leftList %>"
			leftReorder="true"
			leftTitle="current"
			rightBoxName="availableLanguageIds"
			rightList="<%= rightList %>"
			rightTitle="available"
		/>
	</aui:fieldset>
</aui:fieldset>

<aui:script use="liferay-util-list-fields">
	Liferay.provide(
		window,
		'<portlet:namespace />saveLocales',
		function() {
			document.<portlet:namespace />fm.<portlet:namespace /><%= PropsKeys.LOCALES %>.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />currentLanguageIds);
		},
		['liferay-util-list-fields']
	);
</aui:script>

<aui:script>
	Liferay.Util.toggleRadio('<portlet:namespace />customLocales', '<portlet:namespace />inheritLocalesFieldset', '<portlet:namespace />customLocalesFieldset');
	Liferay.Util.toggleRadio('<portlet:namespace />inheritLocales', '<portlet:namespace />customLocalesFieldset', '<portlet:namespace />inheritLocalesFieldset');
</aui:script>
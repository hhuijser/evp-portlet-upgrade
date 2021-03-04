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

portletPreferences = SyncPreferencesLocalServiceUtil.getPortletPreferences(themeDisplay.getCompanyId());

boolean allowUserPersonalSites = PrefsPropsUtil.getBoolean(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_ALLOW_USER_PERSONAL_SITES);
boolean enabled = PrefsPropsUtil.getBoolean(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_SERVICES_ENABLED);
boolean forceSecurityMode = PrefsPropsUtil.getBoolean(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_CLIENT_FORCE_SECURITY_MODE);
boolean lanEnabled = PrefsPropsUtil.getBoolean(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_LAN_ENABLED);
int maxConnections = PrefsPropsUtil.getInteger(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_CLIENT_MAX_CONNECTIONS);
int maxDownloadRate = PrefsPropsUtil.getInteger(themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_CLIENT_MAX_DOWNLOAD_RATE);
int maxUploadRate = PrefsPropsUtil.getInteger(themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_CLIENT_MAX_UPLOAD_RATE);
boolean oAuthEnabled = PrefsPropsUtil.getBoolean(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_OAUTH_ENABLED);
int pollInterval = PrefsPropsUtil.getInteger(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_CLIENT_POLL_INTERVAL);

boolean oAuthApplicationAvailable = false;

if (oAuthEnabled) {
	long oAuthApplicationId = PrefsPropsUtil.getInteger(portletPreferences, themeDisplay.getCompanyId(), PortletPropsKeys.SYNC_OAUTH_APPLICATION_ID, 0);

	if (SyncPreferencesLocalServiceUtil.isOAuthApplicationAvailable(oAuthApplicationId)) {
		oAuthApplicationAvailable = true;
	}
}
%>

<c:if test='<%= oAuthEnabled && !DeployManagerUtil.isDeployed("oauth-portlet") %>'>
	<div class="alert alert-warning">
		<liferay-ui:message key="oauth-publisher-is-not-deployed" />
	</div>
</c:if>

<c:if test="<%= oAuthEnabled && !oAuthApplicationAvailable %>">
	<div class="alert alert-warning">
		<liferay-ui:message key="the-oauth-application-for-liferay-sync-is-missing" />
	</div>
</c:if>

<liferay-portlet:actionURL var="configurationActionURL" />

<aui:form action="<%= configurationActionURL %>" method="post" name="fm" onSubmit='<%= "event.preventDefault(); " + renderResponse.getNamespace() + "updatePreferences();" %>'>
	<aui:input name="redirect" type="hidden" value="<%= redirect %>" />

	<liferay-ui:error exception="<%= OAuthPortletUndeployedException.class %>" message="oauth-publisher-is-not-deployed" />

	<h4><liferay-ui:message key="general" /></h4>

	<aui:fieldset>
		<aui:input label="allow-the-use-of-sync" name="enabled" type="checkbox" value="<%= enabled %>" />
		<aui:input label="allow-users-to-sync-their-personal-sites" name="allowUserPersonalSites" type="checkbox" value="<%= allowUserPersonalSites %>" />
	</aui:fieldset>

	<c:if test='<%= DeployManagerUtil.isDeployed("oauth-portlet") %>'>
		<aui:fieldset>
			<aui:input helpMessage="oauth-enabled-help" label="oauth-enabled" name="oAuthEnabled" type="checkbox" value="<%= oAuthEnabled %>" />
		</aui:fieldset>
	</c:if>

	<h4><liferay-ui:message key="desktop" /></h4>

	<aui:input helpMessage="allow-lan-syncing-help" label="allow-lan-syncing" name="lanEnabled" type="checkbox" value="<%= lanEnabled %>" />

	<aui:input helpMessage="max-connections-help" label="max-connections" name="maxConnections" type="text" value="<%= maxConnections %>" wrapperCssClass="lfr-input-text-container">
		<aui:validator name="digits" />
		<aui:validator name="min">1</aui:validator>
	</aui:input>

	<aui:input helpMessage="poll-interval-help" label="poll-interval" name="pollInterval" type="text" value="<%= pollInterval %>" wrapperCssClass="lfr-input-text-container">
		<aui:validator name="digits" />
		<aui:validator name="min">1</aui:validator>
	</aui:input>

	<aui:input helpMessage="max-download-rate-help" label="max-download-rate" name="maxDownloadRate" type="text" value="<%= maxDownloadRate %>" wrapperCssClass="lfr-input-text-container">
		<aui:validator name="digits" />
	</aui:input>

	<aui:input helpMessage="max-upload-rate-help" label="max-upload-rate" name="maxUploadRate" type="text" value="<%= maxUploadRate %>" wrapperCssClass="lfr-input-text-container">
		<aui:validator name="digits" />
	</aui:input>

	<h4><liferay-ui:message key="mobile" /></h4>

	<aui:fieldset>
		<aui:input helpMessage="force-security-mode-help" label="force-security-mode" name="forceSecurityMode" type="checkbox" value="<%= forceSecurityMode %>" />
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>

<aui:script>
	function <portlet:namespace />updatePreferences() {
		submitForm(document.<portlet:namespace />fm, '<portlet:actionURL name="updatePreferences" />');
	}
</aui:script>
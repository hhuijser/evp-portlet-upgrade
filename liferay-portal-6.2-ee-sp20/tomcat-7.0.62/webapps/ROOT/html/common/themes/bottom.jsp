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


	<%@ include file="/html/common/themes/init.jsp" %>
	<%@ include file="/html/common/themes/init.jsp" %>

	<c:if test="<%= permissionChecker.isOmniadmin() %>">

	<%
	String lcsNotificationMessage = GetterUtil.getString(request.getAttribute("LCS_NOTIFICATION_MESSAGE"));
	%>

	<c:if test="<%= Validator.isNotNull(lcsNotificationMessage) %>">
		<div class="hide" id="lcsNotificationMessageNotice">
			<%= HtmlUtil.escape(lcsNotificationMessage) %>
		</div>

		<aui:script use="liferay-notice">
			var lcsNotificationMessageNoticeContainer = A.one('#lcsNotificationMessageNotice');

			new Liferay.Notice(
				{
					closeText: '<liferay-ui:message key="close" />',
					content: lcsNotificationMessageNoticeContainer.html(),
					toggleText: false,
					type: 'warning'
				}
			);
		</aui:script>
	</c:if>

	<%
	List<Map<String, String>> licenseProperties = com.liferay.portal.license.LicenseManager.getLicenseProperties();

	if ((licenseProperties != null) && !licenseProperties.isEmpty()) {
		Map<String, String> portalLicenseProperties = licenseProperties.get(0);

		String productId = GetterUtil.getString(portalLicenseProperties.get("productId"));

		long now = System.currentTimeMillis();

		String accountEntryName = GetterUtil.getString(portalLicenseProperties.get("accountEntryName"));
		long startDate = GetterUtil.getLong(portalLicenseProperties.get("startDate"));
		long expirationDate = GetterUtil.getLong(portalLicenseProperties.get("expirationDate"));
		long lifetimeDays = (expirationDate - startDate) / Time.DAY;
		long expirationDays = (expirationDate - now) / Time.DAY;
	%>

		<c:if test='<%= productId.equals("Portal") && (((lifetimeDays == 30) && (expirationDays < 7)) || ((lifetimeDays > 30) && (expirationDays < 30))) %>'>
			<div class="hide" id="expirationNotice">
				<c:choose>
					<c:when test="<%= expirationDays <= 0 %>">
						<a href="<%= themeDisplay.getPathMain() %>/portal/license">Your license key has expired <%= expirationDays * -1 %> days ago.</a>
					</c:when>
					<c:otherwise>
						<a href="<%= themeDisplay.getPathMain() %>/portal/license">Update your license key because it will expire in <%= expirationDays %> days.</a>

						<c:if test='<%= accountEntryName.equals("Liferay Trial") %>'>
							Visit <a href="http://www.liferay.com/c/portal/license">your profile page at Liferay.com</a> to upgrade your trial license.
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>

			<aui:script use="liferay-notice">
				var expirationNoticeContainer = A.one('#expirationNotice');

				new Liferay.Notice(
					{
						closeText: '<liferay-ui:message key="close" />',
						content: expirationNoticeContainer.html(),
						toggleText: false,
						type: 'warning'
					}
				);
			</aui:script>
		</c:if>

	<%
	}
	%>
</c:if>

<%
List<Portlet> portlets = (List<Portlet>)request.getAttribute(WebKeys.LAYOUT_PORTLETS);
%>

<%-- Portlet CSS References --%>

<%@ include file="/html/common/themes/bottom_portlet_resources_css.jspf" %>

<%-- Portlet JavaScript References --%>

<%@ include file="/html/common/themes/bottom_portlet_resources_js.jspf" %>

<c:if test="<%= PropsValues.JAVASCRIPT_LOG_ENABLED %>">
	<%@ include file="/html/common/themes/bottom_js_logging.jspf" %>
</c:if>

<%@ include file="/html/common/themes/bottom_js.jspf" %>

<%@ include file="/html/common/themes/password_expiring_soon.jspf" %>

<%@ include file="/html/common/themes/session_timeout.jspf" %>

<%
ScriptTag.flushScriptData(pageContext);
%>

<%-- Raw Text --%>

<%
StringBundler pageBottomSB = OutputTag.getData(request, WebKeys.PAGE_BOTTOM);
%>

<c:if test="<%= pageBottomSB != null %>">

	<%
	pageBottomSB.writeTo(out);
	%>

</c:if>

<%-- Theme JavaScript --%>

<script src="<%= HtmlUtil.escape(PortalUtil.getStaticResourceURL(request, themeDisplay.getPathThemeJavaScript() + "/main.js")) %>" type="text/javascript"></script>

<c:if test="<%= layout != null %>">

	<%-- User Inputted Layout and LayoutSet JavaScript --%>

	<%
	LayoutSet layoutSet = themeDisplay.getLayoutSet();

	UnicodeProperties layoutSetSettings = layoutSet.getSettingsProperties();

	UnicodeProperties layoutTypeSettings = layout.getTypeSettingsProperties();
	%>

	<script type="text/javascript">
		// <![CDATA[
			<%= GetterUtil.getString(layoutSetSettings.getProperty("javascript")) %>

			<%= GetterUtil.getString(layoutTypeSettings.getProperty("javascript")) %>
		// ]]>
	</script>
</c:if>

<c:if test="<%= PropsValues.MONITORING_PORTAL_REQUEST %>">
	<%@ include file="/html/common/themes/bottom_monitoring.jspf" %>
</c:if>

<liferay-util:include page="/html/common/themes/bottom-ext.jsp" />
<liferay-util:include page="/html/common/themes/bottom-test.jsp" />
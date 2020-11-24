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

<%@ include file="/html/portlet/init.jsp" %>

<%@ page import="com.liferay.portal.CompanyMxException" %><%@
page import="com.liferay.portal.CompanyVirtualHostException" %><%@
page import="com.liferay.portal.CompanyWebIdException" %><%@
page import="com.liferay.portal.RequiredCompanyException" %><%@
page import="com.liferay.portal.captcha.recaptcha.ReCaptchaImpl" %><%@
page import="com.liferay.portal.convert.ConvertProcess" %><%@
page import="com.liferay.portal.dao.shard.ManualShardSelector" %><%@
page import="com.liferay.portal.kernel.dao.shard.ShardUtil" %><%@
page import="com.liferay.portal.kernel.image.ImageMagickUtil" %><%@
page import="com.liferay.portal.kernel.scripting.ScriptingUtil" %><%@
page import="com.liferay.portal.kernel.util.InstancePool" %><%@
page import="com.liferay.portal.kernel.util.OSDetector" %><%@
page import="com.liferay.portal.kernel.xuggler.XugglerUtil" %><%@
page import="com.liferay.portal.upload.LiferayFileUpload" %><%@
page import="com.liferay.portal.util.PortalInstances" %><%@
page import="com.liferay.portlet.documentlibrary.model.DLFileVersion" %><%@
page import="com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil" %><%@
page import="com.liferay.portlet.expando.model.ExpandoColumnConstants" %>

<%@ page import="org.apache.log4j.Level" %><%@
page import="org.apache.log4j.LogManager" %><%@
page import="org.apache.log4j.Logger" %>

<%
boolean showShardSelector = false;

if (PropsValues.SHARD_SELECTOR.equals(ManualShardSelector.class.getName()) && (ShardUtil.getAvailableShardNames().length > 1)) {
	showShardSelector = true;
}

String tabs1 = ParamUtil.getString(request, "tabs1", "server");

boolean showTabs1 = false;

if (portletName.equals(PortletKeys.ADMIN_INSTANCE)) {
	tabs1 = "instances";
}
else if (portletName.equals(PortletKeys.ADMIN_PLUGINS)) {
	tabs1 = "plugins";
}
else if (portletName.equals(PortletKeys.ADMIN_SERVER)) {
	tabs1 = "server";
}
else if (portletName.equals(PortletKeys.ADMIN)) {
	showTabs1 = true;
}

String tabs2 = ParamUtil.getString(request, "tabs2");
String tabs3 = ParamUtil.getString(request, "tabs3");

if (tabs1.equals("plugins")) {
	if (!tabs2.equals("portlet-plugins") && !tabs2.equals("theme-plugins") && !tabs2.equals("layout-template-plugins") && !tabs2.equals("hook-plugins") && !tabs2.equals("web-plugins")) {
		tabs2 = "portlet-plugins";
	}
}

NumberFormat numberFormat = NumberFormat.getInstance();

numberFormat.setMaximumIntegerDigits(2);
numberFormat.setMinimumIntegerDigits(2);
%>

<%@ include file="/html/portlet/admin/init-ext.jsp" %>
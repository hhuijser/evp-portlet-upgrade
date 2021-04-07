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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %><%@
taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.opensocial.DuplicateGadgetURLException" %><%@
page import="com.liferay.opensocial.GadgetPortletCategoryNamesException" %><%@
page import="com.liferay.opensocial.GadgetURLException" %><%@
page import="com.liferay.opensocial.NoSuchGadgetException" %><%@
page import="com.liferay.opensocial.model.Gadget" %><%@
page import="com.liferay.opensocial.model.OAuthConsumer" %><%@
page import="com.liferay.opensocial.model.OAuthConsumerConstants" %><%@
page import="com.liferay.opensocial.model.impl.GadgetConstants" %><%@
page import="com.liferay.opensocial.service.GadgetLocalServiceUtil" %><%@
page import="com.liferay.opensocial.service.OAuthConsumerLocalServiceUtil" %><%@
page import="com.liferay.opensocial.service.permission.GadgetPermission" %><%@
page import="com.liferay.opensocial.shindig.util.ShindigUtil" %><%@
page import="com.liferay.opensocial.util.ActionKeys" %><%@
page import="com.liferay.opensocial.util.PortletPropsValues" %><%@
page import="com.liferay.opensocial.util.WebKeys" %><%@
page import="com.liferay.portal.kernel.dao.search.ResultRow" %><%@
page import="com.liferay.portal.kernel.json.JSONObject" %><%@
page import="com.liferay.portal.kernel.language.LanguageUtil" %><%@
page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %><%@
page import="com.liferay.portal.kernel.repository.model.Folder" %><%@
page import="com.liferay.portal.kernel.util.Constants" %><%@
page import="com.liferay.portal.kernel.util.GetterUtil" %><%@
page import="com.liferay.portal.kernel.util.LocaleUtil" %><%@
page import="com.liferay.portal.kernel.util.ParamUtil" %><%@
page import="com.liferay.portal.kernel.util.PrefsParamUtil" %><%@
page import="com.liferay.portal.kernel.util.StringPool" %><%@
page import="com.liferay.portal.kernel.util.TreeNodeView" %><%@
page import="com.liferay.portal.kernel.util.TreeView" %><%@
page import="com.liferay.portal.kernel.util.UnicodeFormatter" %><%@
page import="com.liferay.portal.kernel.util.Validator" %><%@
page import="com.liferay.portal.model.Layout" %><%@
page import="com.liferay.portal.util.PortalUtil" %><%@
page import="com.liferay.portal.util.PortletLister" %><%@
page import="com.liferay.portal.util.PortletListerFactoryUtil" %><%@
page import="com.liferay.portlet.PortletURLFactoryUtil" %><%@
page import="com.liferay.portlet.expando.service.ExpandoValueServiceUtil" %>

<%@ page import="java.util.Locale" %><%@
page import="java.util.Map" %>

<%@ page import="javax.portlet.PortletRequest" %><%@
page import="javax.portlet.PortletURL" %>

<%@ page import="org.apache.shindig.gadgets.spec.Feature" %><%@
page import="org.apache.shindig.gadgets.spec.GadgetSpec" %><%@
page import="org.apache.shindig.gadgets.spec.ModulePrefs" %><%@
page import="org.apache.shindig.gadgets.spec.OAuthService" %><%@
page import="org.apache.shindig.gadgets.spec.UserPref" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<%
String currentURL = PortalUtil.getCurrentURL(request);
%>
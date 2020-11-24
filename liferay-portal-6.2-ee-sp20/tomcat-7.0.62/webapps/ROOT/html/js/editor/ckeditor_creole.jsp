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

<%@ include file="/html/common/init.jsp" %>

<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%
String ckEditorVersion = PropsUtil.get(PropsKeys.EDITOR_CKEDITOR_VERSION);

if (Validator.equals(ckEditorVersion, "latest")) {
	ckEditorVersion = StringPool.UNDERLINE + ckEditorVersion;

	float majorVersion = BrowserSnifferUtil.getMajorVersion(request);

	if (BrowserSnifferUtil.isChrome(request)) {
		ckEditorVersion = _setCkeditorVersion(PropsValues.EDITOR_CKEDITOR_VERSION_LATEST_CHROME, majorVersion, ckEditorVersion);
	}
	else if (BrowserSnifferUtil.isFirefox(request)) {
		ckEditorVersion = _setCkeditorVersion(PropsValues.EDITOR_CKEDITOR_VERSION_LATEST_FIREFOX, majorVersion, ckEditorVersion);
	}
	else if (BrowserSnifferUtil.isIe(request)) {
		ckEditorVersion = _setCkeditorVersion(PropsValues.EDITOR_CKEDITOR_VERSION_LATEST_IE, majorVersion, ckEditorVersion);
	}
	else if (BrowserSnifferUtil.isSafari(request)) {
		ckEditorVersion = _setCkeditorVersion(PropsValues.EDITOR_CKEDITOR_VERSION_LATEST_SAFARI, majorVersion, ckEditorVersion);
	}
	else {
		ckEditorVersion = StringPool.BLANK;
	}
}
else {
	ckEditorVersion = StringPool.BLANK;
}
%>

<liferay-util:include page='<%= "/html/js/editor/ckeditor" + ckEditorVersion + ".jsp" %>'>
	<liferay-util:param name="ckEditorConfigFileName" value="ckconfig_creole.jsp" />
	<liferay-util:param name="hideImageResizing" value="<%= Boolean.TRUE.toString() %>" />
</liferay-util:include>

<%!
private String _setCkeditorVersion(float propertyValue, float majorVersion, String ckEditorVersion) {
	if (Validator.isNotNull(propertyValue)) {
		if (propertyValue > majorVersion) {
			ckEditorVersion = StringPool.BLANK;
		}
	}
	else {
		return StringPool.BLANK;
	}

	return ckEditorVersion;
}
%>
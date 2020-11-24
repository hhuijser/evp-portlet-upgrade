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

<%@ include file="/html/portlet/login/init.jsp" %>

<%
String strutsAction = ParamUtil.getString(request, "struts_action");

boolean showSignInIcon = false;

if (Validator.isNotNull(strutsAction) && !strutsAction.equals("/login/login")) {
	showSignInIcon = true;
}
%>

<c:if test="<%= showSignInIcon %>">

	<%
	String signInURL = themeDisplay.getURLSignIn();

	if (portletName.equals(PortletKeys.FAST_LOGIN)) {
		PortletURL fastLoginURL = PortletURLFactoryUtil.create(request, PortletKeys.FAST_LOGIN, themeDisplay.getPlid(), PortletRequest.RENDER_PHASE);

		fastLoginURL.setParameter("saveLastPath", Boolean.FALSE.toString());
		fastLoginURL.setParameter("struts_action", "/login/login");
		fastLoginURL.setPortletMode(PortletMode.VIEW);
		fastLoginURL.setWindowState(LiferayWindowState.POP_UP);

		signInURL = fastLoginURL.toString();
	}
	%>

	<liferay-ui:icon
		image="status_online"
		message="sign-in"
		url="<%= signInURL %>"
	/>
</c:if>
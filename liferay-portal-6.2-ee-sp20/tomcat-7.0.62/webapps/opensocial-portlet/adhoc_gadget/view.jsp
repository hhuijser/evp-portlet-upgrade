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
Gadget gadget = (Gadget)renderRequest.getAttribute(WebKeys.GADGET);
%>

<c:choose>
	<c:when test="<%= gadget == null %>">
		<div class="alert alert-info portlet-configuration">
			<a href="<%= portletDisplay.getURLConfiguration() %>" onClick="<%= portletDisplay.getURLConfigurationJS() %>">
				<liferay-ui:message key="configure-a-gadget-to-be-displayed-in-this-portlet" />
			</a>
		</div>

		<liferay-ui:icon
			cssClass="portlet-configuration"
			image="configuration"
			message="configure-gadget"
			method="get"
			onClick="<%= portletDisplay.getURLConfigurationJS() %>"
			url="<%= portletDisplay.getURLConfiguration() %>"
		/>
	</c:when>
	<c:otherwise>
		<liferay-util:include page="/gadget/view.jsp" servletContext="<%= application %>" />
	</c:otherwise>
</c:choose>
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

<%@ include file="/admin/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");
String backURL = ParamUtil.getString(request, "backURL");

KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);

long kaleoProcessId = BeanParamUtil.getLong(kaleoProcess, request, "kaleoProcessId");

long groupId = BeanParamUtil.getLong(kaleoProcess, request, "groupId", scopeGroupId);
%>

<div class="kaleo-forms-display-portlet">
	<liferay-util:include page="/display/edit_request.jsp" servletContext="<%= application %>">
		<portlet:param name="redirect" value="<%= redirect %>" />
		<portlet:param name="backURL" value="<%= backURL %>" />
		<portlet:param name="kaleoProcessId" value="<%= String.valueOf(kaleoProcessId) %>" />
	</liferay-util:include>
</div>
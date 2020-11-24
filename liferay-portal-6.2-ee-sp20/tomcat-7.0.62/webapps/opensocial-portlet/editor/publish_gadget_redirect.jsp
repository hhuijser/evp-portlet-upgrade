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
long gadgetId = ParamUtil.getLong(request, "gadgetId");

boolean unpublishPermission = ParamUtil.getBoolean(request, "unpublishPermission");
%>

<aui:script use="aui-base">
	Liferay.Util.getOpener().Liferay.fire(
		'publishGadgetSuccess',
		{
			gadgetId: <%= gadgetId %>,
			unpublishPermission: <%= unpublishPermission %>
		}
	);
</aui:script>
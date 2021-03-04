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

<%@ include file="/html/portlet/document_library/init.jsp" %>

<liferay-ui:header
	backURL='<%= ParamUtil.getString(request, "backURL") %>'
	title="compare-versions"
/>

<liferay-ui:diff
	diffResults="<%= (List[])renderRequest.getAttribute(WebKeys.DIFF_RESULTS) %>"
	sourceName="<%= (String)renderRequest.getAttribute(WebKeys.SOURCE_NAME) %>"
	targetName="<%= (String)renderRequest.getAttribute(WebKeys.TARGET_NAME) %>"
/>
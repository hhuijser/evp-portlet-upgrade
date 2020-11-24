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
KaleoProcess kaleoProcess = (KaleoProcess)request.getAttribute(WebKeys.KALEO_PROCESS);
%>

<h3 class="kaleo-process-header"><liferay-ui:message key="details" /></h3>

<liferay-ui:error exception="<%= RecordSetNameException.class %>" message="please-enter-a-valid-name" />

<p class="kaleo-process-message"><liferay-ui:message key="please-type-a-name-for-your-process-and-a-description-of-what-it-does" /></p>

<aui:fieldset>
	<aui:input localized="<%= true %>" name="name" type="text" value="<%= KaleoFormsUtil.getKaleoProcessName(kaleoProcess, portletSession) %>">
		<aui:validator name="required" />
	</aui:input>

	<aui:input cssClass="lfr-editor-textarea" localized="<%= true %>" name="description" type="textarea" value="<%= KaleoFormsUtil.getKaleoProcessDescription(kaleoProcess, portletSession) %>" wrapperCssClass="lfr-textarea-container" />
</aui:fieldset>
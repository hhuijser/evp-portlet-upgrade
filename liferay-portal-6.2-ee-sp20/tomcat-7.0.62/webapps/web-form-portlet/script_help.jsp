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

<p>
	<liferay-ui:message key="enter-javascript-code-that-returns-true-or-false-to-validate-the-field.-the-following-implicit-variables-are-available"></liferay-ui:message>
</p>

<ul>
	<li>
		<strong>currentFieldValue</strong>: <liferay-ui:message key="the-value-being-validated" />
	</li>
	<li>
		<strong>fieldsMap</strong>: <liferay-ui:message key="the-array-of-all-form-values-indexed-by-name" />
	</li>
</ul>
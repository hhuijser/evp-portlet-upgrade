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

@generated
--%>

<%@ include file="/html/taglib/taglib-init.jsp" %>

<%
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("aui:row:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("aui:row:scopedAttributes");

Map<String, Object> _options = new HashMap<String, Object>();

if ((scopedAttributes != null) && !scopedAttributes.isEmpty()) {
	_options.putAll(scopedAttributes);
}

if ((dynamicAttributes != null) && !dynamicAttributes.isEmpty()) {
	_options.putAll(dynamicAttributes);
}

java.lang.String cssClass = GetterUtil.getString((java.lang.String)request.getAttribute("aui:row:cssClass"));
boolean fluid = GetterUtil.getBoolean(String.valueOf(request.getAttribute("aui:row:fluid")), true);
java.lang.String id = GetterUtil.getString((java.lang.String)request.getAttribute("aui:row:id"));

_updateOptions(_options, "cssClass", cssClass);
_updateOptions(_options, "fluid", fluid);
_updateOptions(_options, "id", id);
%>

<%@ include file="/html/taglib/aui/row/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "aui:row:";
%>
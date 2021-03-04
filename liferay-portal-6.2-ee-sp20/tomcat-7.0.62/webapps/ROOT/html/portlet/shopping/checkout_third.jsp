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

<%@ include file="/html/portlet/shopping/init.jsp" %>

<%
try {
	ShoppingCart cart = ShoppingUtil.getCart(renderRequest);

	ShoppingCartLocalServiceUtil.updateCart(cart.getUserId(), cart.getGroupId(), StringPool.BLANK, StringPool.BLANK, 0, false);
}
catch (Exception e) {
}
%>

<liferay-util:include page="/html/portlet/shopping/tabs1.jsp">
	<liferay-util:param name="tabs1" value="cart" />
</liferay-util:include>

<div class="alert alert-success">
	<liferay-ui:message key="thank-you-for-your-purchase" />
</div>

<%
ShoppingOrder order = null;

try {
	order = ShoppingOrderLocalServiceUtil.getOrder(ParamUtil.getLong(request, "orderId"));
}
catch (NoSuchOrderException nsoe) {
}
%>

<c:choose>
	<c:when test="<%= order != null %>">
		<liferay-ui:message key="your-order-number-is" /> <strong><%= HtmlUtil.escape(order.getNumber()) %></strong>. <liferay-ui:message key="you-will-receive-an-email-shortly-with-your-order-summary-and-further-details" />
	</c:when>
	<c:otherwise>
		<liferay-ui:message key="your-order-was-already-processed.-please-check-your-email-for-your-order-summary-and-further-details" />
	</c:otherwise>
</c:choose>
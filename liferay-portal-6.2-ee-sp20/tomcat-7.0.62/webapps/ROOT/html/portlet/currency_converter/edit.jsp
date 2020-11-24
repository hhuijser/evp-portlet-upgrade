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

<%@ include file="/html/portlet/currency_converter/init.jsp" %>

<portlet:actionURL var="editCurrency">
	<portlet:param name="struts_action" value="/currency_converter/edit" />
</portlet:actionURL>

<aui:form action="<%= editCurrency %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="symbols" type="hidden" value="" />

	<%
	List leftList = new ArrayList();

	for (int i = 0; i < symbols.length; i++) {
		leftList.add(new KeyValuePair(symbols[i], LanguageUtil.get(pageContext, "currency." + symbols[i])));
	}

	List rightList = new ArrayList();

	Arrays.sort(symbols);

	for (Map.Entry<String, String> entry : allSymbols.entrySet()) {
		String symbol = entry.getValue();
		String currencyValue = entry.getKey();

		if (Arrays.binarySearch(symbols, symbol) < 0) {
			rightList.add(new KeyValuePair(symbol, LanguageUtil.get(pageContext, "currency." + currencyValue)));
		}
	}

	rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
	%>

	<liferay-ui:input-move-boxes
		leftBoxName="current_actions"
		leftList="<%= leftList %>"
		leftReorder="true"
		leftTitle="current"
		rightBoxName="available_actions"
		rightList="<%= rightList %>"
		rightTitle="available"
	/>

	<aui:button onClick='<%= renderResponse.getNamespace() + "saveCurrency();" %>' primary="<%= true %>" value="save" />
</aui:form>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />saveCurrency',
		function() {
			document.<portlet:namespace />fm.<portlet:namespace />symbols.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />current_actions);

			submitForm(document.<portlet:namespace />fm);
		},
		['liferay-util-list-fields']
	);
</aui:script>
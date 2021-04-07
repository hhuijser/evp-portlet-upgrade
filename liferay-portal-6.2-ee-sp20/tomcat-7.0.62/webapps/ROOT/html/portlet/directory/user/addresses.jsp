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

<%@ include file="/html/portlet/directory/init.jsp" %>

<%
List<Organization> organizations = (List<Organization>)request.getAttribute("user.organizations");

String className = (String)request.getAttribute("addresses.className");
long classPK = (Long)request.getAttribute("addresses.classPK");

List<Address> personalAddresses = Collections.emptyList();
List<Address> organizationAddresses = new ArrayList<Address>();

if (classPK > 0) {
	personalAddresses = AddressServiceUtil.getAddresses(className, classPK);
}

for (int i = 0; i < organizations.size(); i++) {
	try {
		organizationAddresses.addAll(AddressServiceUtil.getAddresses(Organization.class.getName(), organizations.get(i).getOrganizationId()));
	}
	catch (Exception e) {
	}
}
%>

<c:if test="<%= !personalAddresses.isEmpty() || !organizationAddresses.isEmpty() %>">
	<h3><liferay-ui:message key="address" /></h3>

	<c:if test="<%= !organizationAddresses.isEmpty() %>">
		<div>
			<h4><liferay-ui:message key="organization-address" /></h4>

			<ul class="property-list">

				<%
				for (Address address : organizationAddresses) {
					String street1 = address.getStreet1();
					String street2 = address.getStreet2();
					String street3 = address.getStreet3();

					String zipCode = address.getZip();
					String city = address.getCity();

					String mailingName = LanguageUtil.get(pageContext, address.getType().getName());
				%>

					<li class="<%= address.isPrimary() ? "primary" : "" %>">
						<%@ include file="/html/portlet/directory/user/addresses_address.jspf" %>
					</li>

				<%
				}
				%>

			</ul>
		</div>
	</c:if>

	<c:if test="<%= !personalAddresses.isEmpty() %>">
		<div>
			<h4><liferay-ui:message key="personal-address" /></h4>

			<ul class="property-list">

				<%
				for (Address address : personalAddresses) {
					String street1 = address.getStreet1();
					String street2 = address.getStreet2();
					String street3 = address.getStreet3();

					String zipCode = address.getZip();
					String city = address.getCity();

					String mailingName = LanguageUtil.get(pageContext, address.getType().getName());
				%>

					<li class="<%= address.isPrimary() ? "primary" : "" %>">
						<%@ include file="/html/portlet/directory/user/addresses_address.jspf" %>
					</li>

				<%
				}
				%>

			</ul>
		</div>
	</c:if>
</c:if>
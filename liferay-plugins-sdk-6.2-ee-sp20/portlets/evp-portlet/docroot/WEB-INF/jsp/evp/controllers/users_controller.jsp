<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/WEB-INF/jsp/evp/controllers/init.jspf" %>

<%!
public class AlloyControllerImpl extends EVPAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(User.class);
		setPermissioned(true);
	}

	public void index() throws Exception {
		long evpRequestOrganizationId = ParamUtil.getLong(request, "evpRequestOrganizationId");

		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(evpRequestOrganizationId);

		renderRequest.setAttribute("organizationId", evpRequestOrganization.getOrganizationId());

		SearchContainer<Address> searchContainer = new SearchContainer<Address>(portletRequest, portletURL, null, null);

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("User_", "firstName", true);

		List<User> users = UserLocalServiceUtil.getOrganizationUsers(evpRequestOrganization.getOrganizationId(), searchContainer.getStart(), searchContainer.getEnd(), obc);

		renderRequest.setAttribute("userComposites", EVPCompositeUtil.getComposites(users, UserComposite.class));

		long usersCount = UserLocalServiceUtil.getOrganizationUsersCount(evpRequestOrganization.getOrganizationId());

		renderRequest.setAttribute("usersCount", usersCount);
	}

	public void replace() throws Exception {
		long duplicateUserid = ParamUtil.getLong(request, "duplicateUserId");

		User duplicateUser = UserLocalServiceUtil.getUser(duplicateUserid);

		long mainUserId = ParamUtil.getLong(request, "mainUserId");

		User mainUser = UserLocalServiceUtil.getUser(mainUserId);

		List<EmailAddress> emailAddresses = EmailAddressLocalServiceUtil.getEmailAddresses(duplicateUser.getCompanyId(), Contact.class.getName(), duplicateUser.getContactId());

		for (EmailAddress emailAddress : emailAddresses) {
			EmailAddress mainUserEmailAddress = _fetchEmailAddress(mainUser.getContactId());

			EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"contactEmailAddressId", emailAddress.getEmailAddressId()}, "contactEmailAddressId", mainUserEmailAddress.getEmailAddressId());

			EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"contactEmailAddressId", emailAddress.getEmailAddressId()}, "contactEmailAddressId", mainUserEmailAddress.getEmailAddressId());
		}

		List<Phone> phones = PhoneLocalServiceUtil.getPhones(duplicateUser.getCompanyId(), Contact.class.getName(), duplicateUser.getContactId());

		for (Phone phone : phones) {
			Phone mainUserPhone = _fetchPhone(mainUser.getContactId());

			EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"contactPhoneId", phone.getPhoneId()}, "contactPhoneId", mainUserPhone.getPhoneId());

			EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"contactPhoneId", phone.getPhoneId()}, "contactPhoneId", mainUserPhone.getPhoneId());

		}

		Role organizationContactRole = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

		List<UserGroupRole> duplicateUserGroupRoles = UserGroupRoleLocalServiceUtil.getUserGroupRoles(duplicateUserid);

		for (UserGroupRole duplicateUserGroupRole : duplicateUserGroupRoles) {
			if (duplicateUserGroupRole.getRoleId() == organizationContactRole.getRoleId()) {
				UserGroupRoleLocalServiceUtil.addUserGroupRoles(mainUserId, duplicateUserGroupRole.getGroupId(), new long[] {duplicateUserGroupRole.getRoleId()});
			}
		}

		EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"contactUserId", duplicateUserid}, "contactUserId", mainUserId);

		EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"contactUserId", duplicateUserid}, "contactUserId", mainUserId);

		UserLocalServiceUtil.deleteUser(duplicateUserid);

		setOpenerSuccessMessage();

		render("../close");
	}

	public void selectReplacement() throws Exception {
		long organizationId = ParamUtil.getLong(request, "organizationId");

		SearchContainer<Address> searchContainer = new SearchContainer<Address>(portletRequest, portletURL, null, null);

		OrderByComparator obc = OrderByComparatorFactoryUtil.create("User_", "firstName", true);

		List<User> users = UserLocalServiceUtil.getOrganizationUsers(organizationId, searchContainer.getStart(), searchContainer.getEnd(), obc);

		long duplicateUserId = ParamUtil.getLong(request, "id");

		User duplicateUser = UserLocalServiceUtil.getUser(duplicateUserId);

		renderRequest.setAttribute("duplicateUser", duplicateUser);

		users.remove(duplicateUser);

		renderRequest.setAttribute("userComposites", EVPCompositeUtil.getComposites(users, UserComposite.class));

		long usersCount = UserLocalServiceUtil.getOrganizationUsersCount(organizationId);

		renderRequest.setAttribute("usersCount", usersCount);

		render("select_replacement");
	}

	private EmailAddress _fetchEmailAddress(long contactId) throws Exception {
		AlloyServiceInvoker emailAddressAlloyServiceInvoker = new AlloyServiceInvoker(EmailAddress.class.getName());

		List<EmailAddress> emailAddress = emailAddressAlloyServiceInvoker.executeDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Contact.class), "classPK", contactId, "primary", true});

		if (!emailAddress.isEmpty()) {
			return emailAddress.get(0);
		}

		return EmailAddressLocalServiceUtil.createEmailAddress(0);
	}

	private Phone _fetchPhone(long contactId) throws Exception {
		AlloyServiceInvoker phoneAlloyServiceInvoker = new AlloyServiceInvoker(Phone.class.getName());

		List<Phone> phones = phoneAlloyServiceInvoker.executeDynamicQuery(new Object[] {"classNameId", PortalUtil.getClassNameId(Contact.class), "classPK", contactId, "primary", true});

		if (!phones.isEmpty()) {
			return phones.get(0);
		}

		return PhoneLocalServiceUtil.createPhone(0);
	}

}
%>
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

package com.liferay.evp.util;

import com.liferay.alloy.mvc.AlloyException;
import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.Contact;
import com.liferay.portal.model.EmailAddress;
import com.liferay.portal.model.ListType;
import com.liferay.portal.model.ListTypeConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.service.ListTypeServiceUtil;
import com.liferay.portal.util.PortalUtil;

import java.util.List;

/**
 * @author Ethan Bustad
 */
public class EVPPortalUtil {

	public static int fetchAddressListTypeId(String className) {
		try {
			return getListTypeId(
				className + ListTypeConstants.ADDRESS, "other");
		}
		catch (Exception e) {
			return 0;
		}
	}

	public static User fetchContactUser(
			String firstName, String lastName, String emailAddress)
		throws Exception {

		AlloyServiceInvoker userAlloyServiceInvoker = new AlloyServiceInvoker(
			User.class.getName());

		List<User> users = userAlloyServiceInvoker.executeDynamicQuery(
			new Object[] {"firstName", firstName, "lastName", lastName});

		for (User user : users) {
			AlloyServiceInvoker emailAddressAlloyServiceInvoker =
				new AlloyServiceInvoker(EmailAddress.class.getName());

			long emailAddressesCount =
				emailAddressAlloyServiceInvoker.executeDynamicQueryCount(
					new Object[] {
						"classNameId", PortalUtil.getClassNameId(Contact.class),
						"classPK", user.getContactId(), "address", emailAddress
					});

			if (emailAddressesCount > 0) {
				return user;
			}
		}

		return null;
	}

	public static int getListTypeId(String type, String name) throws Exception {
		List<ListType> listTypes = ListTypeServiceUtil.getListTypes(type);

		for (ListType listType : listTypes) {
			if (Validator.equals(listType.getName(), name)) {
				return listType.getListTypeId();
			}
		}

		throw new AlloyException("List type '" + name + "' not found");
	}

}
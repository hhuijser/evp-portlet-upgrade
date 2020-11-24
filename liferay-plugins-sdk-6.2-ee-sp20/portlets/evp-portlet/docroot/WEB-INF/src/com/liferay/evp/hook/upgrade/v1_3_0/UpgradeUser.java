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

package com.liferay.evp.hook.upgrade.v1_3_0;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.service.EVPGrantRequestLocalServiceUtil;
import com.liferay.evp.service.EVPServiceRequestLocalServiceUtil;
import com.liferay.evp.util.EVPPortalUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.Contact;
import com.liferay.portal.model.EmailAddress;
import com.liferay.portal.model.ListTypeConstants;
import com.liferay.portal.model.Phone;
import com.liferay.portal.model.User;
import com.liferay.portal.service.EmailAddressLocalServiceUtil;
import com.liferay.portal.service.PhoneLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.util.Date;
import java.util.List;

/**
 * @author Ethan Bustad
 */
public class UpgradeUser extends UpgradeProcess {

	protected EmailAddress addBlankEmailAddress(long userId) throws Exception {
		EmailAddress emailAddress =
			EmailAddressLocalServiceUtil.createEmailAddress(0);

		emailAddress.setEmailAddressId(CounterLocalServiceUtil.increment());

		User user = UserLocalServiceUtil.getUser(userId);

		emailAddress.setCompanyId(user.getCompanyId());
		emailAddress.setUserId(user.getUserId());
		emailAddress.setUserName(user.getFullName());

		Date now = new Date();

		emailAddress.setCreateDate(now);
		emailAddress.setModifiedDate(now);

		emailAddress.setClassName(Contact.class.getName());

		emailAddress.setClassPK(user.getContactId());

		emailAddress.setAddress(StringPool.NULL_CHAR);
		emailAddress.setPrimary(false);
		emailAddress.setTypeId(ListTypeConstants.CONTACT_EMAIL_ADDRESS_DEFAULT);

		return EmailAddressLocalServiceUtil.addEmailAddress(emailAddress);
	}

	protected Phone addBlankPhone(long userId) throws Exception {
		Phone phone = PhoneLocalServiceUtil.createPhone(0);

		phone.setPhoneId(CounterLocalServiceUtil.increment());

		User user = UserLocalServiceUtil.getUser(userId);

		phone.setCompanyId(user.getCompanyId());
		phone.setUserId(user.getUserId());
		phone.setUserName(user.getFullName());

		Date now = new Date();

		phone.setCreateDate(now);
		phone.setModifiedDate(now);

		phone.setClassName(Contact.class.getName());

		phone.setClassPK(user.getContactId());

		phone.setNumber(StringPool.NULL_CHAR);
		phone.setExtension(StringPool.BLANK);
		phone.setTypeId(
			EVPPortalUtil.getListTypeId(
				ListTypeConstants.CONTACT_PHONE, "personal"));
		phone.setPrimary(true);

		return PhoneLocalServiceUtil.addPhone(phone);
	}

	@Override
	protected void doUpgrade() throws Exception {
		updateUsers();
	}

	protected void updateUsers() throws Exception {
		AlloyServiceInvoker evpGrantRequestAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPGrantRequest.class.getName());

		List<EVPGrantRequest> evpGrantRequests =
			evpGrantRequestAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {"contactEmailAddressId", 0L});

		for (EVPGrantRequest evpGrantRequest : evpGrantRequests) {
			EmailAddress contactEmailAddress = addBlankEmailAddress(
				evpGrantRequest.getUserId());

			evpGrantRequest.setContactEmailAddressId(
				contactEmailAddress.getEmailAddressId());

			EVPGrantRequestLocalServiceUtil.updateEVPGrantRequest(
				evpGrantRequest);
		}

		evpGrantRequests =
			evpGrantRequestAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {"contactPhoneId", 0L});

		for (EVPGrantRequest evpGrantRequest : evpGrantRequests) {
			Phone contactPhone = addBlankPhone(evpGrantRequest.getUserId());

			evpGrantRequest.setContactPhoneId(contactPhone.getPhoneId());

			EVPGrantRequestLocalServiceUtil.updateEVPGrantRequest(
				evpGrantRequest);
		}

		AlloyServiceInvoker evpServiceRequestAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPServiceRequest.class.getName());

		List<EVPServiceRequest> evpServiceRequests =
			evpServiceRequestAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {"contactEmailAddressId", 0L});

		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			EmailAddress contactEmailAddress = addBlankEmailAddress(
				evpServiceRequest.getUserId());

			evpServiceRequest.setContactEmailAddressId(
				contactEmailAddress.getEmailAddressId());

			EVPServiceRequestLocalServiceUtil.updateEVPServiceRequest(
				evpServiceRequest);
		}

		evpServiceRequests =
			evpServiceRequestAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {"contactPhoneId", 0L});

		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			Phone contactPhone = addBlankPhone(evpServiceRequest.getUserId());

			evpServiceRequest.setContactPhoneId(contactPhone.getPhoneId());

			EVPServiceRequestLocalServiceUtil.updateEVPServiceRequest(
				evpServiceRequest);
		}
	}

}
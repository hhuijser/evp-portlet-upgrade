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

package com.liferay.evp.service.impl;

import com.liferay.evp.model.EVPGrantTransaction;
import com.liferay.evp.service.base.EVPGrantTransactionLocalServiceBaseImpl;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;

import java.util.Date;

/**
 * @author Val Nagy
 * @author Ethan Bustad
 */
public class EVPGrantTransactionLocalServiceImpl
	extends EVPGrantTransactionLocalServiceBaseImpl {

	public EVPGrantTransaction addEVPGrantTransaction(
			long companyId, long userId, Date createDate,
			long evpGrantRequestId, long fileEntryId, int grantType,
			double amount, String currencyCode, Date date, String note,
			String number, String bankBICCode, String bankIBANCode,
			String bankName, String purposeOfUse)
		throws PortalException, SystemException {

		EVPGrantTransaction evpGrantTransaction =
			evpGrantTransactionPersistence.create(
				counterLocalService.increment());

		evpGrantTransaction.setCompanyId(companyId);

		User user = userPersistence.findByPrimaryKey(userId);

		evpGrantTransaction.setUserId(user.getUserId());
		evpGrantTransaction.setUserName(user.getFullName());

		evpGrantTransaction.setCreateDate(createDate);
		evpGrantTransaction.setModifiedDate(new Date());
		evpGrantTransaction.setEvpGrantRequestId(evpGrantRequestId);
		evpGrantTransaction.setFileEntryId(fileEntryId);
		evpGrantTransaction.setGrantType(grantType);
		evpGrantTransaction.setAmount(amount);
		evpGrantTransaction.setCurrencyCode(currencyCode);
		evpGrantTransaction.setDate(date);
		evpGrantTransaction.setNote(note);
		evpGrantTransaction.setNumber(number);
		evpGrantTransaction.setBankBICCode(bankBICCode);
		evpGrantTransaction.setBankIBANCode(bankIBANCode);
		evpGrantTransaction.setBankName(bankName);
		evpGrantTransaction.setPurposeOfUse(purposeOfUse);

		return evpGrantTransactionPersistence.update(evpGrantTransaction);
	}

}
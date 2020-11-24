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

package com.liferay.evp.hook.upgrade.v1_2_0;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.model.EVPGrantTransaction;
import com.liferay.evp.service.EVPGrantTransactionLocalServiceUtil;
import com.liferay.evp.util.EVPGrantTransactionConstants;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.BigDecimalUtil;
import com.liferay.portal.kernel.util.StringBundler;

import java.util.Date;
import java.util.List;

/**
 * @author Ethan Bustad
 */
public class UpgradeEVPGrantTransaction extends UpgradeProcess {

	@Override
	protected void doUpgrade() throws Exception {
		updateEVPGrantTransactions();
	}

	protected void updateEVPGrantTransactions() throws Exception {
		AlloyServiceInvoker evpGrantTransactionAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPGrantTransaction.class.getName());

		List<EVPGrantTransaction> matchingEVPGrantTransactions =
			evpGrantTransactionAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {
					"grantType",
					EVPGrantTransactionConstants.GRANT_TYPE_MATCHING
				});

		if (_log.isDebugEnabled()) {
			_log.debug(
				matchingEVPGrantTransactions.size() +
					" matching grant transaction(s) found");
		}

		for (EVPGrantTransaction matchingEVPGrantTransaction :
				matchingEVPGrantTransactions) {

			List<EVPGrantTransaction> proposedEVPGrantTransactions =
				evpGrantTransactionAlloyServiceInvoker.executeDynamicQuery(
					new Object[] {
						"evpGrantRequestId",
						matchingEVPGrantTransaction.getEvpGrantRequestId(),
						"grantType",
						EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED
					});

			if (_log.isDebugEnabled()) {
				StringBundler sb = new StringBundler(3);

				sb.append(proposedEVPGrantTransactions.size());
				sb.append(
					" proposed grant transaction(s) found for grant request ");
				sb.append(matchingEVPGrantTransaction.getEvpGrantRequestId());

				_log.debug(sb.toString());
			}

			if (proposedEVPGrantTransactions.isEmpty()) {
				matchingEVPGrantTransaction.setModifiedDate(new Date());
				matchingEVPGrantTransaction.setGrantType(
					EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED);

				EVPGrantTransactionLocalServiceUtil.updateEVPGrantTransaction(
					matchingEVPGrantTransaction);
			}
			else {
				EVPGrantTransaction proposedEVPGrantTransaction =
					proposedEVPGrantTransactions.get(0);

				proposedEVPGrantTransaction.setModifiedDate(new Date());

				proposedEVPGrantTransaction.setFileEntryId(
					matchingEVPGrantTransaction.getFileEntryId());

				double combinedAmount = BigDecimalUtil.add(
					proposedEVPGrantTransaction.getAmount(),
					matchingEVPGrantTransaction.getAmount());

				proposedEVPGrantTransaction.setAmount(combinedAmount);

				EVPGrantTransactionLocalServiceUtil.updateEVPGrantTransaction(
					proposedEVPGrantTransaction);

				EVPGrantTransactionLocalServiceUtil.deleteEVPGrantTransaction(
					matchingEVPGrantTransaction);
			}
		}
	}

	private static Log _log = LogFactoryUtil.getLog(
		UpgradeEVPGrantTransaction.class);

}
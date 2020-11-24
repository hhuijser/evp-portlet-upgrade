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

package com.liferay.evp.hook.upgrade;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeEVPDivision;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeEVPGrantRequest;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeEVPRequestOrganization;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeEVPServiceRequest;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeKaleo;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeMBMessage;
import com.liferay.evp.hook.upgrade.v1_1_0.UpgradeUser;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;

/**
 * @author Ethan Bustad
 */
public class UpgradeProcess_1_1_0 extends UpgradeProcess {

	@Override
	public int getThreshold() {
		return 110;
	}

	@Override
	protected void doUpgrade() throws Exception {
		upgrade(UpgradeEVPDivision.class);

		ServiceContextThreadLocal.pushServiceContext(new ServiceContext());

		try {
			upgrade(UpgradeKaleo.class);

			upgrade(UpgradeEVPRequestOrganization.class);

			upgrade(UpgradeUser.class);

			upgrade(UpgradeEVPGrantRequest.class);

			upgrade(UpgradeEVPServiceRequest.class);

			upgrade(UpgradeMBMessage.class);
		}
		finally {
			ServiceContextThreadLocal.popServiceContext();
		}
	}

}
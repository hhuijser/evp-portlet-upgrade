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

package com.liferay.evp.hook.upgrade.v1_0_0;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.service.EVPEmployeeLocalServiceUtil;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author Wesley Gong
 */
public class UpgradeEVPEmployee extends UpgradeProcess {

	@Override
	protected void doUpgrade() throws Exception {
		updateEVPEmployee();
	}

	protected void updateEVPEmployee() throws Exception {
		if (!hasTable("EVPUser")) {
			return;
		}

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement("select * from EVPUser");

			rs = ps.executeQuery();

			while (rs.next()) {
				long userId = rs.getLong("userId");
				long managerUserId = rs.getLong("managerUserId");

				try {
					EVPEmployeeLocalServiceUtil.addEVPEmployee(
						userId, userId, managerUserId, 0, 0, null);
				}
				catch (Exception e) {
					_log.error(e, e);
				}
			}
		}
		finally {
			DataAccess.cleanUp(con, ps);
		}

		runSQL("drop table EVPUser");
	}

	private static Log _log = LogFactoryUtil.getLog(UpgradeEVPEmployee.class);

}
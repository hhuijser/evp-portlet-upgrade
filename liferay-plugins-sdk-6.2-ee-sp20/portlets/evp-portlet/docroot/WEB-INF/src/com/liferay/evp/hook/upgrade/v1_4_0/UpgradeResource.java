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

package com.liferay.evp.hook.upgrade.v1_4_0;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.service.ResourceLocalServiceUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author Wesley Gong
 */
public class UpgradeResource extends UpgradeProcess {

	protected void addEVPGrantRequestResource() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement("select * from EVPGrantRequest");

			rs = ps.executeQuery();

			while (rs.next()) {
				long companyId = rs.getLong("companyId");
				long subsidiaryGroupId = rs.getLong("subsidiaryGroupId");
				long userId = rs.getLong("userId");
				long evpGrantRequestId = rs.getLong("evpGrantRequestId");

				ResourceLocalServiceUtil.addResources(
					companyId, subsidiaryGroupId, userId,
					EVPGrantRequest.class.getName(), evpGrantRequestId, false,
					true, true);
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
		}
	}

	protected void addEVPServiceRequestResource() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DataAccess.getUpgradeOptimizedConnection();

			ps = con.prepareStatement("select * from EVPServiceRequest");

			rs = ps.executeQuery();

			while (rs.next()) {
				long companyId = rs.getLong("companyId");
				long subsidiaryGroupId = rs.getLong("subsidiaryGroupId");
				long userId = rs.getLong("userId");
				long evpServiceRequestId = rs.getLong("evpServiceRequestId");

				ResourceLocalServiceUtil.addResources(
					companyId, subsidiaryGroupId, userId,
					EVPServiceRequest.class.getName(), evpServiceRequestId,
					false, true, true);
			}
		}
		finally {
			DataAccess.cleanUp(con, ps, rs);
		}
	}

	@Override
	protected void doUpgrade() throws Exception {
		addEVPGrantRequestResource();
		addEVPServiceRequestResource();
	}

}
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

package com.liferay.evp.hook.upgrade.v1_1_0;

import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.util.EVPWorkflowUtil;
import com.liferay.evp.workflow.EVPGrantRequestWorkflowHandler;
import com.liferay.evp.workflow.EVPServiceRequestWorkflowHandler;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;
import com.liferay.portal.model.Company;
import com.liferay.portal.service.CompanyLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @author Ethan Bustad
 */
public class UpgradeKaleo extends UpgradeProcess {

	@Override
	protected void doUpgrade() throws Exception {
		updateKaleo();
		updateWorkflowDefinitions();
	}

	protected void updateKaleo() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;

		for (String tableName : _TABLE_NAMES) {
			try {
				con = DataAccess.getUpgradeOptimizedConnection();

				ps = con.prepareStatement("delete from " + tableName);

				ps.execute();
			}
			finally {
				DataAccess.cleanUp(con, ps);
			}
		}
	}

	protected void updateWorkflowDefinitions() throws Exception {
		WorkflowHandlerRegistryUtil.register(
			EVPGrantRequestWorkflowHandler.class.newInstance());
		WorkflowHandlerRegistryUtil.register(
			EVPServiceRequestWorkflowHandler.class.newInstance());

		long companyId = PortalUtil.getDefaultCompanyId();

		Company company = CompanyLocalServiceUtil.getCompany(companyId);

		EVPWorkflowUtil.deployWorkflowDefinition(
			companyId, company.getGroupId(), "evp-grant-request-definition.xml",
			EVPGrantRequest.class.getName());

		EVPWorkflowUtil.deployWorkflowDefinition(
			companyId, company.getGroupId(),
			"evp-service-request-definition.xml",
			EVPServiceRequest.class.getName());
	}

	private static final String[] _TABLE_NAMES = {
		"KaleoInstanceToken", "KaleoTaskAssignmentInstance",
		"KaleoTaskInstanceToken"
	};

}
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

import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StringPool;

import java.util.HashMap;

/**
 * @author Ethan Bustad
 */
public class EVPWorkflowContextVariablesUtil {

	public static HashMap<String, Object> getDummyRequestVariables(
			long companyId, long subsidiaryGroupId)
		throws Exception {

		HashMap<String, Object> requestContext = new HashMap<String, Object>();

		requestContext.put(
			EVPWorkflowContextConstants.CREATOR_USER_FULL_NAME,
			StringPool.BLANK);

		requestContext.put(
			EVPWorkflowContextConstants.LINK_TO_REVIEWER_DASHBOARD,
			StringPool.BLANK);

		requestContext.put(EVPWorkflowContextConstants.NOTES, StringPool.BLANK);

		boolean forkEnabled = GetterUtil.getBoolean(
			EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(
				companyId, subsidiaryGroupId,
				PortletPropsKeys.
					SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_FORK_ENABLED)
			);

		requestContext.put(
			EVPWorkflowContextConstants.
				SUBSIDIARY_CONFIGURATION_APPROVE_WITH_MANAGER_FORK_ENABLED,
			forkEnabled);

		return requestContext;
	}

}
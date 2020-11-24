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

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.dao.orm.Property;
import com.liferay.portal.kernel.dao.orm.PropertyFactoryUtil;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.Organization;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.OrganizationLocalServiceUtil;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Ethan Bustad
 */
public class EVPDivisionUtil {

	public static Set<Long> getOrganizationGroupIds(long groupId) {
		Set<Long> groupIds = new HashSet<Long>();

		groupIds.add(groupId);

		try {
			Group group = GroupLocalServiceUtil.getGroup(groupId);

			List<Organization> parentOrganizations =
				OrganizationLocalServiceUtil.getParentOrganizations(
					group.getClassPK());

			for (Organization organization : parentOrganizations) {
				groupIds.addAll(
					getOrganizationGroupIds(organization.getGroupId()));
			}
		}
		catch (Exception e) {
		}

		return groupIds;
	}

	public static EVPDivision getSubsidiaryEVPDivision(long userId)
		throws Exception {

		try {
			return EVPDivisionLocalServiceUtil.getSubsidiaryEVPDivision(userId);
		}
		catch (Exception e) {
		}

		AlloyServiceInvoker evpDivisionAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPDivision.class.getName());

		List<EVPDivision> evpDivisions =
			evpDivisionAlloyServiceInvoker.executeDynamicQuery(
				getEVPDivisionDynamicQuery(
					userId, EVPDivisionConstants.TYPE_SUBSIDIARY),
				0, 1);

		if (evpDivisions.isEmpty()) {
			throw new Exception(
				"Unable to get subsidiary EVP division for user " + userId);
		}

		return evpDivisions.get(0);
	}

	protected static DynamicQuery getEVPDivisionDynamicQuery(
			long userId, int type)
		throws Exception {

		AlloyServiceInvoker evpDivisionAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPDivision.class.getName());

		DynamicQuery evpDivisionDynamicQuery =
			evpDivisionAlloyServiceInvoker.buildDynamicQuery(
				new Object[] {"type", type});

		if (userId > 0) {
			Property divisionOrganizationIdProperty =
				PropertyFactoryUtil.forName("organizationId");

			List<Long> organizationIds = new ArrayList<Long>();

			List<Organization> organizations =
				OrganizationLocalServiceUtil.getUserOrganizations(userId);

			if (organizations.isEmpty()) {
				throw new Exception(
					"Unable to get organization for user " + userId);
			}

			for (Organization organization : organizations) {
				organizationIds.add(organization.getOrganizationId());
			}

			evpDivisionDynamicQuery.add(
				divisionOrganizationIdProperty.in(organizationIds));
		}

		return evpDivisionDynamicQuery;
	}

}
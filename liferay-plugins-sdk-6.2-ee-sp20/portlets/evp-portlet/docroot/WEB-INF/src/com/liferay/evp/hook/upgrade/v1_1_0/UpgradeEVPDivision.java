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

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.compat.portal.util.PortalUtil;
import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.model.EVPEmployee;
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.evp.service.EVPEmployeeLocalServiceUtil;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.Organization;
import com.liferay.portal.model.User;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Ethan Bustad
 */
public class UpgradeEVPDivision extends UpgradeProcess {

	@Override
	protected void doUpgrade() throws Exception {
		long companyId = PortalUtil.getDefaultCompanyId();

		Map<String, Long> evpDivisionIdsMap = updateEVPDivisions(companyId);

		updateEVPEmployees(companyId, evpDivisionIdsMap);
	}

	protected EVPDivision fetchOrAddEVPDivision(
			long companyId, long parentEVPDivisionId, String abbreviation,
			String organizationName, int type)
		throws Exception {

		AlloyServiceInvoker evpDivisionAlloyServiceInvoker =
			new AlloyServiceInvoker(EVPDivision.class.getName());

		List<EVPDivision> evpDivisions =
			evpDivisionAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {
					"companyId", companyId, "abbreviation", abbreviation
				});

		if (!evpDivisions.isEmpty()) {
			return evpDivisions.get(0);
		}

		EVPDivision evpDivision = EVPDivisionLocalServiceUtil.createEVPDivision(
			CounterLocalServiceUtil.increment());

		evpDivision.setCompanyId(companyId);

		User user = UserLocalServiceUtil.getDefaultUser(companyId);

		evpDivision.setUserId(user.getUserId());
		evpDivision.setUserName(user.getFullName());

		Date date = new Date();

		evpDivision.setCreateDate(date);
		evpDivision.setModifiedDate(date);

		long parentOrganizationId = 0;

		if (parentEVPDivisionId > 0) {
			EVPDivision parentEVPDivision =
				EVPDivisionLocalServiceUtil.getEVPDivision(parentEVPDivisionId);

			parentOrganizationId = parentEVPDivision.getOrganizationId();
		}

		Organization organization = fetchOrAddOrganization(
			companyId, organizationName, parentOrganizationId);

		evpDivision.setOrganizationId(organization.getOrganizationId());

		evpDivision.setParentEVPDivisionId(parentEVPDivisionId);
		evpDivision.setAbbreviation(abbreviation);
		evpDivision.setType(type);

		return EVPDivisionLocalServiceUtil.addEVPDivision(evpDivision);
	}

	protected EVPEmployee fetchOrAddEVPEmployee(
			long companyId, long employeeUserId, long subsidiaryEVPDivisionId)
		throws Exception {

		EVPEmployee evpEmployee =
			EVPEmployeeLocalServiceUtil.fetchEVPEmployeeByEmployeeUserId(
				employeeUserId);

		if (evpEmployee != null) {
			return evpEmployee;
		}

		evpEmployee = EVPEmployeeLocalServiceUtil.createEVPEmployee(
			CounterLocalServiceUtil.increment());

		evpEmployee.setCompanyId(companyId);

		User user = UserLocalServiceUtil.getDefaultUser(companyId);

		evpEmployee.setUserId(user.getUserId());
		evpEmployee.setUserName(user.getFullName());

		Date date = new Date();

		evpEmployee.setCreateDate(date);
		evpEmployee.setModifiedDate(date);

		evpEmployee.setEmployeeUserId(employeeUserId);
		evpEmployee.setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);

		return EVPEmployeeLocalServiceUtil.addEVPEmployee(evpEmployee);
	}

	protected Organization fetchOrAddOrganization(
			long companyId, String organizationName, long parentOrganizationId)
		throws Exception {

		Organization organization =
			OrganizationLocalServiceUtil.fetchOrganization(
				companyId, organizationName);

		if (organization != null) {
			return organization;
		}

		long userId = UserLocalServiceUtil.getDefaultUserId(companyId);

		return OrganizationLocalServiceUtil.addOrganization(
			userId, parentOrganizationId, organizationName, false);
	}

	protected Map<String, Long> updateEVPDivisions(long companyId)
		throws Exception {

		Map<String, Long> evpDivisionIdsMap = new HashMap<String, Long>();

		EVPDivision rootEVPDivision = fetchOrAddEVPDivision(
			companyId, 0, _TYPE_ABBREVIATION_ROOT, _TYPE_NAME_ROOT, _TYPE_ROOT);

		for (Map.Entry<String, Map<String, String>> evpDivisionEntry :
				_evpDivisionsMap.entrySet()) {

			String regionName = evpDivisionEntry.getKey();

			EVPDivision regionEVPDivision = fetchOrAddEVPDivision(
				companyId, rootEVPDivision.getEvpDivisionId(), regionName,
				regionName, _TYPE_REGION);

			evpDivisionIdsMap.put(
				regionName, regionEVPDivision.getEvpDivisionId());

			Map<String, String> subsidiariesMap = evpDivisionEntry.getValue();

			for (Map.Entry<String, String> subsidiaryEntry :
					subsidiariesMap.entrySet()) {

				String subsidiaryAbbreviation = subsidiaryEntry.getValue();
				String subsidiaryName = subsidiaryEntry.getKey();

				EVPDivision subsidiaryEVPDivision = fetchOrAddEVPDivision(
					companyId, regionEVPDivision.getEvpDivisionId(),
					subsidiaryAbbreviation, subsidiaryName, _TYPE_SUBSIDIARY);

				evpDivisionIdsMap.put(
					subsidiaryName, subsidiaryEVPDivision.getEvpDivisionId());
			}
		}

		return evpDivisionIdsMap;
	}

	protected void updateEVPEmployees(
			long companyId, Map<String, Long> evpDivisionIdsMap)
		throws Exception {

		for (Map.Entry<String, Long> evpDivisionEntry :
				evpDivisionIdsMap.entrySet()) {

			String name = evpDivisionEntry.getKey();

			Group subsidiarySiteGroup = GroupLocalServiceUtil.fetchGroup(
				companyId, name);

			if (subsidiarySiteGroup == null) {
				continue;
			}

			long evpDivisionId = evpDivisionEntry.getValue();

			long[] groupUserIds = UserLocalServiceUtil.getGroupUserIds(
				subsidiarySiteGroup.getGroupId());

			for (long userId : groupUserIds) {
				fetchOrAddEVPEmployee(companyId, userId, evpDivisionId);
			}
		}
	}

	private static final String _TYPE_ABBREVIATION_ROOT = "root";

	private static final String _TYPE_NAME_ROOT = "Liferay";

	private static final int _TYPE_REGION = 2;

	private static final int _TYPE_ROOT = 1;

	private static final int _TYPE_SUBSIDIARY = 3;

	private static Map<String, Map<String, String>> _evpDivisionsMap;

	static {
		Map<String, Map<String, String>> evpDivisionsMap =
			new HashMap<String, Map<String, String>>();

		Map<String, String> americasMap = new HashMap<String, String>();

		americasMap.put("US", "us");
		americasMap.put("Brazil", "br");

		evpDivisionsMap.put("Americas", americasMap);

		Map<String, String> emeaMap = new HashMap<String, String>();

		emeaMap.put("France", "fr");
		emeaMap.put("Germany", "de");
		emeaMap.put("Hungary", "hu");
		emeaMap.put("Ireland", "ie");
		emeaMap.put("Morocco", "ma");
		emeaMap.put("Netherlands", "nl");
		emeaMap.put("Spain", "es");
		emeaMap.put("UK", "uk");

		evpDivisionsMap.put("EMEA", emeaMap);

		Map<String, String> apacMap = new HashMap<String, String>();

		apacMap.put("Australia", "au");
		apacMap.put("China", "cn");
		apacMap.put("India", "in");
		apacMap.put("Japan", "jp");
		apacMap.put("Singapore", "sg");

		evpDivisionsMap.put("APAC", apacMap);

		_evpDivisionsMap = evpDivisionsMap;
	}

}
<%--
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
--%>

<%@ include file="/WEB-INF/jsp/evp/controllers/init.jspf" %>
<%@ include file="/WEB-INF/jsp/util/evp_request_organization_indexer.jspf" %>

<%!
public class AlloyControllerImpl extends BaseAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPRequestOrganization.class);
		setPermissioned(true);
	}

	public void add() throws Exception {
		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.createEVPRequestOrganization(0);

		_validateAdd();

		updateModel(evpRequestOrganization);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void create() throws Exception {
		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.createEVPRequestOrganization(0);

		renderRequest.setAttribute("evpRequestOrganization", evpRequestOrganization);
	}

	public void delete() throws Exception {
		EVPRequestOrganization evpRequestOrganization = _fetchEVPRequestOrganization();

		_validateDelete(evpRequestOrganization);

		Organization organization = OrganizationLocalServiceUtil.fetchOrganization(evpRequestOrganization.getOrganizationId());

		if (organization != null) {
			long[] organizationUserIds = UserLocalServiceUtil.getOrganizationUserIds(evpRequestOrganization.getOrganizationId());

			UserLocalServiceUtil.unsetOrganizationUsers(evpRequestOrganization.getOrganizationId(), organizationUserIds);

			Role employeeRole = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), EVPRoleConstants.ROLE_NAME_EMPLOYEE);

			Role organizationContactRole = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

			for (long organizationUserId : organizationUserIds) {
				DynamicQuery userGroupRoleDynamicQuery = DynamicQueryFactoryUtil.forClass(UserGroupRole.class, PortalClassLoaderUtil.getClassLoader());

				Property groupIdProperty = PropertyFactoryUtil.forName("primaryKey.groupId");

				User user = UserLocalServiceUtil.getUser(organizationUserId);

				EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(organization.getUserId());

				Criterion groupIdCriteria = groupIdProperty.eq(subsidiaryEVPDivision.getOrganizationGroupId());

				Property roleIdProperty = PropertyFactoryUtil.forName("primaryKey.roleId");

				Criterion roleIdCriteria = roleIdProperty.eq(organizationContactRole.getRoleId());

				Criterion subsidiaryUserGroupRoleCriteria = RestrictionsFactoryUtil.and(groupIdCriteria, roleIdCriteria);

				userGroupRoleDynamicQuery.add(RestrictionsFactoryUtil.not(subsidiaryUserGroupRoleCriteria));

				Property userIdProperty = PropertyFactoryUtil.forName("primaryKey.userId");

				userGroupRoleDynamicQuery.add(userIdProperty.eq(user.getUserId()));

				long userGroupRoleDynamicQueryCount = UserGroupRoleLocalServiceUtil.dynamicQueryCount(userGroupRoleDynamicQuery);

				if ((userGroupRoleDynamicQueryCount <= 0) && !RoleLocalServiceUtil.hasUserRole(user.getUserId(), employeeRole.getRoleId())) {
					UserLocalServiceUtil.deleteUser(organizationUserId);
				}
			}

			OrganizationLocalServiceUtil.deleteOrganization(organization);
		}

		EVPRequestOrganizationLocalServiceUtil.deleteEVPRequestOrganization(evpRequestOrganization);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void edit() throws Exception {
		EVPRequestOrganization evpRequestOrganization = _fetchEVPRequestOrganization();

		renderRequest.setAttribute("evpRequestOrganization", evpRequestOrganization);
	}

	public void index() throws Exception {
		String keywords = ParamUtil.getString(request, "keywords");

		renderRequest.setAttribute("keywords", keywords);

		String orderByCol = ParamUtil.getString(request, "orderByCol", "name_sortable");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "asc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("name_sortable", true),
			new Sort("city_sortable", false),
			new Sort("country_sortable", false),
			new Sort("url_sortable", false)
		};

		AlloySearchResult alloySearchResult = search(null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPRequestOrganizationComposite> evpRequestOrganizationComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPRequestOrganizationComposite.class);

		renderRequest.setAttribute("evpRequestOrganizationComposites", evpRequestOrganizationComposites);
	}

	public void replace() throws Exception {
		long duplicateEVPRequestOrganizationId = ParamUtil.getLong(request, "duplicateEVPRequestOrganizationId");

		EVPRequestOrganization duplicateEVPRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(duplicateEVPRequestOrganizationId);

		long mainEVPRequestOrganizationId = ParamUtil.getLong(request, "mainEVPRequestOrganizationId");

		EVPRequestOrganization mainEVPRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(mainEVPRequestOrganizationId);

		long[] duplicateOrganizationUserIds = UserLocalServiceUtil.getOrganizationUserIds(duplicateEVPRequestOrganization.getOrganizationId());

		long[] mainOrganizationUserIds = UserLocalServiceUtil.getOrganizationUserIds(mainEVPRequestOrganization.getOrganizationId());

		UserLocalServiceUtil.setOrganizationUsers(mainEVPRequestOrganization.getOrganizationId(), ArrayUtil.append(duplicateOrganizationUserIds, mainOrganizationUserIds));

		UserLocalServiceUtil.unsetOrganizationUsers(duplicateEVPRequestOrganization.getOrganizationId(), duplicateOrganizationUserIds);

		EVPPortalUtil.updateModelProperties(Address.class.getName(), new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class.getName()), "classPK", duplicateEVPRequestOrganization.getOrganizationId()}, "classPK", mainEVPRequestOrganization.getOrganizationId(), "primary", false);

		EVPPortalUtil.updateModelProperties(Website.class.getName(), new Object[] {"classNameId", PortalUtil.getClassNameId(Organization.class.getName()), "classPK", duplicateEVPRequestOrganization.getOrganizationId()}, "classPK", mainEVPRequestOrganization.getOrganizationId(), "primary", false);

		EVPPortalUtil.updateModelProperties(EVPGrantRequest.class.getName(), new Object[] {"evpRequestOrganizationId", duplicateEVPRequestOrganizationId}, "evpRequestOrganizationId", mainEVPRequestOrganizationId);

		EVPPortalUtil.updateModelProperties(EVPServiceRequest.class.getName(), new Object[] {"evpRequestOrganizationId", duplicateEVPRequestOrganizationId}, "evpRequestOrganizationId", mainEVPRequestOrganizationId);

		OrganizationLocalServiceUtil.deleteOrganization(duplicateEVPRequestOrganization.getOrganizationId());

		EVPRequestOrganizationLocalServiceUtil.deleteEVPRequestOrganization(duplicateEVPRequestOrganizationId);

		setOpenerSuccessMessage();

		render("../close");
	}

	public void selectReplacement() throws Exception {
		long duplicateEVPRequestOrganizationId = ParamUtil.getLong(request, "id");

		EVPRequestOrganization duplicateEVPRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(duplicateEVPRequestOrganizationId);

		renderRequest.setAttribute("duplicateEVPRequestOrganizationComposite", new EVPRequestOrganizationComposite(duplicateEVPRequestOrganization));

		portletURL.setParameter("id", String.valueOf(duplicateEVPRequestOrganizationId));

		Map<String, Serializable> attributes = new HashMap<String, Serializable>();

		attributes.put("excludableEVPRequestOrganizationId", duplicateEVPRequestOrganizationId);

		String orderByCol = ParamUtil.getString(request, "orderByCol", "name_sortable");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "asc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("name_sortable", true),
			new Sort("city_sortable", false),
			new Sort("country_sortable", false),
			new Sort("url_sortable", false)
		};

		AlloySearchResult alloySearchResult = search(attributes, null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPRequestOrganizationComposite> evpRequestOrganizationComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPRequestOrganizationComposite.class);

		renderRequest.setAttribute("evpRequestOrganizationComposites", evpRequestOrganizationComposites);

		render("select_replacement");
	}

	public void update() throws Exception {
		EVPRequestOrganization evpRequestOrganization = _fetchEVPRequestOrganization();

		_validateUpdate(evpRequestOrganization);

		updateModel(evpRequestOrganization);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	protected Indexer buildIndexer() {
		return EVPRequestOrganizationIndexer.getInstance();
	}

	@Override
	protected void executeRender(Method method) throws Exception {
		renderRequest.setAttribute("actionPath", actionPath);

		super.executeRender(method);
	}

	private EVPRequestOrganization _fetchEVPRequestOrganization() throws Exception {
		long evpRequestOrganizationId = ParamUtil.getLong(request, "id");

		return EVPRequestOrganizationLocalServiceUtil.fetchEVPRequestOrganization(evpRequestOrganizationId);
	}

	private void _validateAdd() throws Exception {
	}

	private void _validateDelete(EVPRequestOrganization evpRequestOrganization) throws Exception {
		_validateEVPRequestOrganization(evpRequestOrganization);

		_validateEVPRequestCount(evpRequestOrganization);
	}

	private void _validateEVPRequestCount(EVPRequestOrganization evpRequestOrganization) throws Exception {
		EVPRequestOrganizationComposite evpRequestOrganizationComposite = new EVPRequestOrganizationComposite(evpRequestOrganization);

		if ((evpRequestOrganizationComposite.getEvpGrantRequestsCount() > 0) || (evpRequestOrganizationComposite.getEvpServiceRequestsCount() > 0)) {
			throw new AlloyException(translate("you-cannot-delete-this-organization-because-it-is-used-by-x-existing-grant-requests-and-x-existing-service-requests", evpRequestOrganizationComposite.getEvpGrantRequestsCount(), evpRequestOrganizationComposite.getEvpServiceRequestsCount()));
		}
	}

	private void _validateEVPRequestOrganization(EVPRequestOrganization evpRequestOrganization) throws Exception {
		if (evpRequestOrganization == null) {
			throw new AlloyException("the-grant-request-does-not-exist");
		}
	}

	private void _validateUpdate(EVPRequestOrganization evpRequestOrganization) throws Exception {
		_validateEVPRequestOrganization(evpRequestOrganization);
	}

}
%>
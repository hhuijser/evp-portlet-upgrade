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

<%!
public class AlloyControllerImpl extends EVPAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPDivision.class);
		setPermissioned(true);
	}

	public void add() throws Exception {
		EVPDivision evpDivision = EVPDivisionLocalServiceUtil.createEVPDivision(0);

		_validateAdd();

		String abbreviation = ParamUtil.getString(request, "abbreviation");
		String organizationName = ParamUtil.getString(request, "name");
		long parentEVPDivisionId = ParamUtil.getLong(request, "parentEVPDivisionId");
		int type = ParamUtil.getInteger(request, "type");

		_updateEVPDivision(evpDivision, abbreviation, organizationName, parentEVPDivisionId, type);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void create() throws Exception {
		renderRequest.setAttribute("EVPDivisionConstants", getConstantsBean(EVPDivisionConstants.class));

		EVPDivision evpDivision = EVPDivisionLocalServiceUtil.createEVPDivision(0);

		renderRequest.setAttribute("evpDivisionComposite", new EVPDivisionComposite(evpDivision));

		int type = ParamUtil.getInteger(request, "type");

		if (type == EVPDivisionConstants.TYPE_REGION) {
			EVPDivision rootEVPDivision = EVPDivisionUtil.fetchRootEVPDivision(themeDisplay.getCompanyId());

			if (rootEVPDivision == null) {
				rootEVPDivision = EVPDivisionLocalServiceUtil.createEVPDivision(0);

				_updateEVPDivision(rootEVPDivision, EVPDivisionConstants.TYPE_ABBREVIATION_ROOT, EVPDivisionConstants.TYPE_NAME_ROOT, 0, EVPDivisionConstants.TYPE_ROOT);
			}

			renderRequest.setAttribute("rootEVPDivisionId", rootEVPDivision.getEvpDivisionId());
		}
		else if (type == EVPDivisionConstants.TYPE_SUBSIDIARY) {
			renderRequest.setAttribute("regionEVPDivisionComposites", EVPCompositeUtil.getComposites(EVPDivisionUtil.getEVPDivisions(EVPDivisionConstants.TYPE_REGION), EVPDivisionComposite.class));
		}
	}

	public void delete() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateDelete(evpDivision);

		if (evpDivision.getType() == EVPDivisionConstants.TYPE_SUBSIDIARY) {
			com.liferay.portal.model.PortletPreferences portletPreferences = PortletPreferencesLocalServiceUtil.getPortletPreferences(evpDivision.getOrganizationGroupId(), com.liferay.portal.util.PortletKeys.PREFS_OWNER_TYPE_GROUP, 0, PortletKeys.EVP);

			PortletPreferencesLocalServiceUtil.deletePortletPreferences(portletPreferences);
		}

		OrganizationLocalServiceUtil.deleteOrganization(evpDivision.getOrganizationId());

		EVPDivisionLocalServiceUtil.deleteEVPDivision(evpDivision);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void deleteRequests() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateDeleteRequests(evpDivision);

		_deleteModels(EVPGrantRequest.class.getName(), evpDivision);
		_deleteModels(EVPServiceRequest.class.getName(), evpDivision);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void edit() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateEdit(evpDivision);

		renderRequest.setAttribute("EVPDivisionConstants", getConstantsBean(EVPDivisionConstants.class));

		int type = ParamUtil.getInteger(request, "type");

		if (type == EVPDivisionConstants.TYPE_SUBSIDIARY) {
			renderRequest.setAttribute("regionEVPDivisionComposites", EVPCompositeUtil.getComposites(EVPDivisionUtil.getEVPDivisions(EVPDivisionConstants.TYPE_REGION), EVPDivisionComposite.class));
		}

		renderRequest.setAttribute("evpDivisionComposite", new EVPDivisionComposite(evpDivision));
	}

	public void editConfiguration() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateEditConfiguration(evpDivision);

		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		renderRequest.setAttribute("evpDivisionComposite", new EVPDivisionComposite(evpDivision));

		Map<String, String> portletPreferencesMap = new HashMap<String, String>();

		String[] portletPropsKeys = _getPortletPropsKeys();

		for (String portletPropsKey : portletPropsKeys) {
			if (portletPropsKey.startsWith("subsidiary.configuration")) {
				String subsidiaryPortletPropsValue = EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), evpDivision.getOrganizationGroupId(), portletPropsKey);

				portletPreferencesMap.put(portletPropsKey, subsidiaryPortletPropsValue);
			}
		}

		renderRequest.setAttribute("portletPreferencesMap", portletPreferencesMap);

		render("edit_configuration");
	}

	public void importUser() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateImportUser(evpDivision);

		renderRequest.setAttribute("evpDivision", evpDivision);

		renderRequest.setAttribute("divisionGroupId", evpDivision.getOrganizationGroupId());

		render("import_user");
	}

	public void index() throws Exception {
		renderRequest.setAttribute("EVPDivisionConstants", getConstantsBean(EVPDivisionConstants.class));
		renderRequest.setAttribute("EVPDivisionConstantsMethods", new EVPDivisionConstants());

		for (int type : EVPDivisionConstants.TYPES) {
			String typeString = StringPool.BLANK;

			if (type > 0) {
				typeString = String.valueOf(type);
			}

			int delta = ParamUtil.getInteger(request, "delta" + typeString, EVPDivisionConstants.DIVISION_DELTA_DEFAULT);

			SearchContainer<EVPDivision> searchContainer = new SearchContainer<EVPDivision>(portletRequest, null, null, "cur" + typeString, delta, portletURL, null, null);

			List<EVPDivision> evpDivisions = alloyServiceInvoker.executeDynamicQuery(new Object[] {"companyId", themeDisplay.getCompanyId(), "type", type}, searchContainer.getStart(), searchContainer.getEnd());

			List<EVPDivisionComposite> evpDivisionComposites = EVPCompositeUtil.getComposites(evpDivisions, EVPDivisionComposite.class, new Class<?>[] {EVPDivision.class}, new Object[] {});

			renderRequest.setAttribute("evpDivisionComposites" + typeString, evpDivisionComposites);

			long evpDivisionsCount = alloyServiceInvoker.executeDynamicQueryCount(new Object[] {"companyId", themeDisplay.getCompanyId(), "type", type});

			renderRequest.setAttribute("evpDivisionsCount" + typeString, evpDivisionsCount);
		}

		renderRequest.setAttribute("portletURL", portletURL);
	}

	public void setUser() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateSetUser(evpDivision);

		String emailAddressString = ParamUtil.getString(request, "emailAddress");

		User user = EVPUtil.importLDAPUser(themeDisplay.getCompanyId(), emailAddressString);

		if (user == null) {
			throw new AlloyException(translate("the-system-was-unable-to-import-a-user-with-email-address-x-via-ldap", emailAddressString));
		}

		UserLocalServiceUtil.addGroupUsers(evpDivision.getOrganizationGroupId(), new long[] {user.getUserId()});

		EVPEmployee evpEmployee = EVPEmployeeLocalServiceUtil.fetchEVPEmployeeByEmployeeUserId(user.getUserId());

		if (evpEmployee == null) {
			evpEmployee = EVPEmployeeLocalServiceUtil.createEVPEmployee(0);
		}

		updateModelIgnoreRequest(evpEmployee, "employeeUserId", user.getUserId(), "subsidiaryEVPDivisionId", evpDivision.getEvpDivisionId());

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void update() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateUpdate(evpDivision);

		String abbreviation = ParamUtil.getString(request, "abbreviation");
		String organizationName = ParamUtil.getString(request, "name");
		long parentEVPDivisionId = ParamUtil.getLong(request, "parentEVPDivisionId");
		int type = ParamUtil.getInteger(request, "type");

		_updateEVPDivision(evpDivision, abbreviation, organizationName, parentEVPDivisionId, type);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void updateConfiguration() throws Exception {
		EVPDivision evpDivision = _fetchEVPDivision();

		_validateUpdateConfiguration(evpDivision);

		PortletPreferences portletPreferences = PortletPreferencesLocalServiceUtil.getPreferences(themeDisplay.getCompanyId(), evpDivision.getOrganizationGroupId(), com.liferay.portal.util.PortletKeys.PREFS_OWNER_TYPE_GROUP, 0, PortletKeys.EVP);

		String[] portletPropsKeys = _getPortletPropsKeys();

		for (String portletPropsKey : portletPropsKeys) {
			if (portletPropsKey.startsWith("subsidiary.configuration", 0)) {
				String subsidiaryPortletPropsValue = ParamUtil.getString(request, portletPropsKey, StringPool.BLANK);

				if (Validator.isNotNull(subsidiaryPortletPropsValue)) {
					portletPreferences.setValue(portletPropsKey, subsidiaryPortletPropsValue);
				}
			}
		}

		portletPreferences.store();

		setOpenerSuccessMessage();

		render("../close");
	}

	private void _deleteModels(String className, EVPDivision evpDivision) throws Exception {
		AlloyServiceInvoker classNameAlloyServiceInvoker = new AlloyServiceInvoker(className);

		List<BaseModel<?>> baseModels = classNameAlloyServiceInvoker.executeDynamicQuery(new Object[] {"subsidiaryGroupId", evpDivision.getOrganizationGroupId()});

		for (BaseModel<?> baseModel : baseModels) {
			ResourceLocalServiceUtil.deleteResource((AuditedModel)baseModel, ResourceConstants.SCOPE_INDIVIDUAL);

			classNameAlloyServiceInvoker.deleteModel(baseModel);
		}

		List<EVPDivision> childrenEVPDivisions = alloyServiceInvoker.executeDynamicQuery(new Object[] {"parentEVPDivisionId", evpDivision.getEvpDivisionId()});

		for (EVPDivision childEVPDivision : childrenEVPDivisions) {
			_deleteModels(className, childEVPDivision);
		}
	}

	private EVPDivision _fetchEVPDivision() throws Exception {
		long evpDivisionId = ParamUtil.getLong(request, "id");

		return EVPDivisionLocalServiceUtil.fetchEVPDivision(evpDivisionId);
	}

	private String[] _getPortletPropsKeys() throws Exception {
		java.lang.reflect.Field[] fields = PortletPropsKeys.class.getFields();

		String[] portletPropsKeys = new String[fields.length];

		for (int i = 0; i < fields.length; i++) {
			java.lang.reflect.Field field = fields[i];

			portletPropsKeys[i] = (String)field.get(null);
		}

		return portletPropsKeys;
	}

	private void _updateEVPDivision(EVPDivision evpDivision, String abbreviation, String organizationName, long parentEVPDivisionId, int type) throws Exception {
		evpDivision.setAbbreviation(abbreviation);

		long parentOrganizationId = 0;

		if (parentEVPDivisionId > 0) {
			EVPDivision parentEVPDivision = EVPDivisionLocalServiceUtil.getEVPDivision(parentEVPDivisionId);

			parentOrganizationId = parentEVPDivision.getOrganizationId();
		}

		Organization divisionOrganization = null;

		if (evpDivision.isNew()) {
			try {
				divisionOrganization = OrganizationLocalServiceUtil.addOrganization(themeDisplay.getUserId(), parentOrganizationId, organizationName, false);
			}
			catch(Exception e) {
				throw new AlloyException(translate("an-organization-with-the-name-x-already-exists", organizationName));
			}

			Role role = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), RoleConstants.ORGANIZATION_OWNER);

			UserGroupRoleLocalServiceUtil.deleteUserGroupRoles(themeDisplay.getUserId(), divisionOrganization.getGroupId(), new long[] {role.getRoleId()});
		}
		else {
			divisionOrganization = OrganizationLocalServiceUtil.getOrganization(evpDivision.getOrganizationId());

			OrganizationLocalServiceUtil.updateOrganization(divisionOrganization.getCompanyId(), divisionOrganization.getOrganizationId(), parentOrganizationId, organizationName, divisionOrganization.getType(), divisionOrganization.getRegionId(), divisionOrganization.getCountryId(), divisionOrganization.getStatusId(), StringPool.BLANK, false, null);
		}

		evpDivision.setOrganizationId(divisionOrganization.getOrganizationId());

		evpDivision.setParentEVPDivisionId(parentEVPDivisionId);
		evpDivision.setType(type);

		updateModelIgnoreRequest(evpDivision);
	}

	private void _validateAdd() throws Exception {
		_validateFields();
	}

	private void _validateDelete(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);

		long childrenEVPDivisionsCount = alloyServiceInvoker.executeDynamicQueryCount(new Object[] {"parentEVPDivisionId", evpDivision.getEvpDivisionId()});

		if (childrenEVPDivisionsCount > 0) {
			throw new AlloyException("the-division-cannot-be-deleted-because-it-has-child-divisions");
		}

		AlloyServiceInvoker evpEmployeeAlloyServiceInvoker = new AlloyServiceInvoker(EVPEmployee.class.getName());

		long evpEmployeesCount = evpEmployeeAlloyServiceInvoker.executeDynamicQueryCount(new Object[] {"subsidiaryEVPDivisionId", evpDivision.getEvpDivisionId()});

		if (evpEmployeesCount > 0) {
			throw new AlloyException("the-division-cannot-be-deleted-because-it-has-associated-users");
		}
	}

	private void _validateDeleteRequests(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);
	}

	private void _validateEdit(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);
	}

	private void _validateEditConfiguration(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);

		if (evpDivision.getType() != EVPDivisionConstants.TYPE_SUBSIDIARY) {
			throw new AlloyException("configuration-values-can-only-be-set-for-subsidiaries");
		}
	}

	private void _validateEVPDivision(EVPDivision evpDivision) throws Exception {
		if (evpDivision == null) {
			throw new AlloyException("the-division-does-not-exist");
		}
	}

	private void _validateFields() throws Exception {
		String abbreviation = ParamUtil.getString(request, "abbreviation");

		if (Validator.isNull(abbreviation)) {
			throw new AlloyException("the-abbreviation-is-required");
		}

		if (abbreviation.length() > EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT) {
			throw new AlloyException(translate("the-abbreviation-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT));
		}

		String organizationName = ParamUtil.getString(request, "name");

		if (Validator.isNull(organizationName)) {
			throw new AlloyException("the-organization-name-is-required");
		}

		if (organizationName.length() > EVPConstants.MAX_FIELD_LENGTH_ORGANIZATION_NAME) {
			throw new AlloyException(translate("the-organization-name-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_ORGANIZATION_NAME));
		}
	}

	private void _validateImportUser(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);
	}

	private void _validateSetUser(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);
	}

	private void _validateUpdate(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);

		_validateFields();
	}

	private void _validateUpdateConfiguration(EVPDivision evpDivision) throws Exception {
		_validateEVPDivision(evpDivision);
	}

}
%>
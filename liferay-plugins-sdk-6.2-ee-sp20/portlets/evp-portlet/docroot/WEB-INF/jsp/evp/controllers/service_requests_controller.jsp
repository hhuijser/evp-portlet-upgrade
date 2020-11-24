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
<%@ include file="/WEB-INF/jsp/util/evp_service_request_indexer.jspf" %>
<%@ include file="/WEB-INF/jsp/util/evp_service_request_scheduler_message_listener.jspf" %>

<%!
public class AlloyControllerImpl extends EVPAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPServiceRequest.class);
		setPermissioned(true);
	}

	public void add() throws Exception {
		EVPServiceRequest evpServiceRequest = EVPServiceRequestLocalServiceUtil.createEVPServiceRequest(0);

		_setClonedAttributes(evpServiceRequest, "parentEVPServiceRequestId");

		evpServiceRequest.setCreateDate(new Date());
		evpServiceRequest.setEmploymentType(EVPUtil.getEmploymentType(user.getUserId()));
		evpServiceRequest.setUserId(user.getUserId());

		_validateAdd(evpServiceRequest);

		boolean duplicateOrganization = false;

		EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(user.getUserId());

		if (evpServiceRequest.getParentEVPServiceRequestId() <= 0) {
			evpServiceRequest.setBehalfOf(EVPUtil.getCheckedTypesString(request, EVPConstants.BEHALF_OF_TYPES, "behalfOf"));

			String evpRequestOrganizationDescription = ParamUtil.getString(request, "evpRequestOrganizationDescription");

			String taxIdentificationNumber = ParamUtil.getString(request, "taxIdentificationNumber");

			int organizationNonprofitType = EVPRequestOrganizationUtil.getNonprofitType(taxIdentificationNumber);

			String organizationName = EVPPortalUtil.getStringSafe(request, "organizationName");

			Organization organization = EVPRequestOrganizationUtil.fetchOrganization(themeDisplay, organizationName);

			EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationUtil.fetchRequestOrganization(organization.getOrganizationId());

			if (evpRequestOrganization.isNew()) {
				updateModel(evpRequestOrganization, "organizationId", organization.getOrganizationId(), "description", evpRequestOrganizationDescription, "nonprofitType", organizationNonprofitType, "subsidiaryGroupId", subsidiaryEVPDivision.getOrganizationGroupId());
			}
			else if (!Validator.equals(evpRequestOrganization.getTaxIdentificationNumber(), taxIdentificationNumber) || !Validator.equals(evpRequestOrganization.getDescription(), evpRequestOrganizationDescription) || (evpRequestOrganization.getNonprofitType() != organizationNonprofitType)) {
				duplicateOrganization = true;
			}

			evpServiceRequest.setEvpRequestOrganizationId(evpRequestOrganization.getEvpRequestOrganizationId());

			User contactUser = EVPPortalUtil.fetchContactUser(this, evpRequestOrganization.getOrganizationId());

			evpServiceRequest.setContactUserId(contactUser.getUserId());

			String contactUserEmailAddressString = ParamUtil.getString(request, "contactUserEmailAddress");

			EmailAddress contactUserEmailAddress = EVPPortalUtil.fetchUserEmailAddress(this, contactUser, contactUserEmailAddressString);

			evpServiceRequest.setContactEmailAddressId(contactUserEmailAddress.getEmailAddressId());

			String contactUserPhoneString = ParamUtil.getString(request, "contactUserPhone");

			Phone contactUserPhone = EVPPortalUtil.fetchUserPhone(this, contactUser, contactUserPhoneString);

			evpServiceRequest.setContactPhoneId(contactUserPhone.getPhoneId());

			evpServiceRequest.setPurpose(EVPUtil.getCheckedTypesString(request, EVPConstants.PURPOSE_TYPES, "purpose"));

			Address requestOrganizationAddress = EVPPortalUtil.fetchAddress(this, evpRequestOrganization);

			evpServiceRequest.setRequestOrganizationAddressId(requestOrganizationAddress.getAddressId());

			String url = ParamUtil.getString(request, "url");

			Website requestOrganizationWebsite = EVPPortalUtil.fetchOrganizationWebsite(this, evpRequestOrganization, url);

			evpServiceRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsite.getWebsiteId());
		}
		else {
			User contactUser = UserLocalServiceUtil.getUser(evpServiceRequest.getContactUserId());

			OrganizationLocalServiceUtil.addUserOrganization(contactUser.getUserId(), subsidiaryEVPDivision.getOrganizationId());

			Role organizationContactRole = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

			UserGroupRoleLocalServiceUtil.addUserGroupRoles(contactUser.getUserId(), subsidiaryEVPDivision.getOrganizationGroupId(), new long[] {organizationContactRole.getRoleId()});
		}

		String evpServiceRequestDescription = ParamUtil.getString(request, "evpServiceRequestDescription");

		evpServiceRequest.setDescription(evpServiceRequestDescription);

		EVPEmployee evpEmployee = EVPEmployeeLocalServiceUtil.getEVPEmployeeByEmployeeUserId(user.getUserId());

		evpServiceRequest.setManagerUserId(evpEmployee.getManagerUserId());

		Date requestedEndDate = EVPUtil.fetchDate(request, "requestedEndDateString");

		evpServiceRequest.setRequestedEndDate(requestedEndDate);

		Date requestedStartDate = EVPUtil.fetchDate(request, "requestedStartDateString");

		evpServiceRequest.setRequestedStartDate(requestedStartDate);

		int requestedTotalHours = ParamUtil.getInteger(request, "requestedTotalHours");

		evpServiceRequest.setRequestedTotalHours(requestedTotalHours);

		evpServiceRequest.setSubsidiaryGroupId(subsidiaryEVPDivision.getOrganizationGroupId());

		updateModel(evpServiceRequest);

		_setCreatorUserPhone(evpServiceRequest.getUserId());

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addServiceRequestVariables(this, evpServiceRequest.getEvpServiceRequestId(), StringPool.BLANK);

		EVPWorkflowUtil.startWorkflowInstance(themeDisplay, actionRequest, evpServiceRequest, workflowContext, subsidiaryEVPDivision.getOrganizationGroupId());

		EVPWorkflowUtil.registerReindexCallback(indexer, evpServiceRequest);

		ResourceLocalServiceUtil.addResources(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), user.getUserId(), EVPServiceRequest.class.getName(), evpServiceRequest.getEvpServiceRequestId(), false, true, true);

		redirectTo(EVPUtil.getSubmissionConfirmationURL(this, evpServiceRequest.getEvpServiceRequestId(), duplicateOrganization));
	}

	public void create() throws Exception {
		EVPValidator.validateEVPParticipation(user, -1, themeDisplay, request);

		_setConstantsMaps();

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPServiceRequest evpServiceRequest = EVPServiceRequestLocalServiceUtil.createEVPServiceRequest(0);

		_setClonedAttributes(evpServiceRequest, "cloneableEVPServiceRequestId");

		evpServiceRequest.setEmploymentType(EVPUtil.getEmploymentType(user.getUserId()));

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, user, themeDisplay));
	}

	public void delete() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_validateDelete(evpServiceRequest);

		ResourceLocalServiceUtil.deleteResource(evpServiceRequest, ResourceConstants.SCOPE_INDIVIDUAL);

		EVPServiceRequestLocalServiceUtil.deleteEVPServiceRequest(evpServiceRequest);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void edit() throws Exception {
		_setConstantsMaps();

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		renderRequest.setAttribute("portletURL", portletURL);
	}

	public void feedback() throws Exception {
		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		renderRequest.setAttribute("portletURL", portletURL);
	}

	public void index() throws Exception {
		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPDivisionLocalServiceUtil", new EVPDivisionLocalServiceUtil());
		renderRequest.setAttribute("EVPUtil", new EVPUtil());
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		try {
			EVPValidator.validateEVPParticipation(user, -1, themeDisplay, request);
		}
		catch (AlloyException e) {
			renderRequest.setAttribute("participationError", e.getMessage());
		}

		Map<String, Serializable> attributes = new HashMap<String, Serializable>();

		attributes.put("creatorUserId", user.getUserId());

		String orderByCol = ParamUtil.getString(request, "orderByCol", "createDate");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "desc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("creatorUserFullName_sortable", true),
			new Sort("createDate", true)
		};

		String statusFilter = ParamUtil.getString(request, "statusFilter", EVPWorkflowConstants.STATUS_LABEL_ACTIVE);

		renderRequest.setAttribute("statusFilter", statusFilter);

		attributes.put("statusFilter", statusFilter);

		AlloySearchResult alloySearchResult = search(attributes, null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPServiceRequestComposite> evpServiceRequestComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPServiceRequestComposite.class, new Class<?>[] {EVPServiceRequest.class, ThemeDisplay.class}, new Object[] {themeDisplay});

		renderRequest.setAttribute("evpServiceRequestComposites", evpServiceRequestComposites);

		renderRequest.setAttribute("searchableServiceLabels", EVPWorkflowConstants.getSearchableServiceLabels());
	}

	public void setOwnStatus() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_validateSetOwnStatus(evpServiceRequest);

		evpServiceRequest = _updateEVPServiceRequest(evpServiceRequest);

		long workflowTaskId = EVPWorkflowUtil.getFirstWorkflowTaskIdForUser(themeDisplay, evpServiceRequest, evpServiceRequest.getSubsidiaryGroupId());

		String transitionName = ParamUtil.getString(request, "transitionName");

		String comments = ParamUtil.getString(request, "comments");

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addServiceRequestVariables(this, evpServiceRequest.getEvpServiceRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpServiceRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(indexer, evpServiceRequest);

		addSuccessMessage();
	}

	public void update() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_validateUpdate(evpServiceRequest);

		_updateEVPServiceRequest(evpServiceRequest);

		addSuccessMessage();
	}

	public void updateFeedback() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_validateUpdateFeedback(evpServiceRequest);

		updateModel(evpServiceRequest);

		String comments = ParamUtil.getString(request, "comments");

		if (Validator.isNotNull(comments)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		String transitionName = ParamUtil.getString(request, "transitionName");

		long workflowTaskId = 0;

		List<WorkflowTask> workflowTasks = EVPWorkflowUtil.getWorkflowTasks(evpServiceRequest.getCompanyId(), EVPServiceRequest.class.getName(), evpServiceRequest.getEvpServiceRequestId());

		for (WorkflowTask workflowTask : workflowTasks) {
			List<String> transitionNames = WorkflowTaskManagerUtil.getNextTransitionNames(evpServiceRequest.getCompanyId(), evpServiceRequest.getUserId(), workflowTask.getWorkflowTaskId());

			if (transitionNames.contains(transitionName)) {
				workflowTaskId = workflowTask.getWorkflowTaskId();

				break;
			}
		}

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addServiceRequestVariables(this, evpServiceRequest.getEvpServiceRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpServiceRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(evpServiceRequest);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void updateProof() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_setProofFields(evpServiceRequest, null, StringPool.BLANK, true);

		updateModelIgnoreRequest(evpServiceRequest);

		String comments = ParamUtil.getString(request, "comments");

		if (Validator.isNotNull(comments)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		List<Integer> forkStatuses = EVPKaleoForkInstanceUtil.getStatuses(evpServiceRequest.getEvpServiceRequestId());

		if (forkStatuses.contains(EVPWorkflowConstants.SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION) || forkStatuses.contains(EVPWorkflowConstants.SERVICE_STATUS_PENDING_PROOF_FORM)) {
			_transitionProofWorkflow(evpServiceRequest, comments);
		}

		long childEVPServiceRequestsCount = ParamUtil.getInteger(request, "childEVPServiceRequstCompositesCount");

		for (int x = 0; x < childEVPServiceRequestsCount; x++) {
			long childEVPServiceRequestId = ParamUtil.getLong(request, "id" + x);

			EVPServiceRequest childEVPServiceRequest = EVPServiceRequestLocalServiceUtil.fetchEVPServiceRequest(childEVPServiceRequestId);

			_setProofFields(childEVPServiceRequest, null, String.valueOf(x), true);

			updateModelIgnoreRequest(childEVPServiceRequest);

			List<Integer> childForkStatuses = EVPKaleoForkInstanceUtil.getStatuses(childEVPServiceRequestId);

			if (childForkStatuses.contains(EVPWorkflowConstants.SERVICE_STATUS_PENDING_PROOF_FORM)) {
				_transitionProofWorkflow(childEVPServiceRequest, StringPool.BLANK);
			}
		}

		addSuccessMessage();

		render("../success");
	}

	public void verify() throws Exception {
		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		List<Integer> forkStatuses = EVPKaleoForkInstanceUtil.getStatuses(evpServiceRequest.getEvpServiceRequestId());

		if (forkStatuses.contains(EVPWorkflowConstants.SERVICE_STATUS_PENDING_PROOF_FORM)) {
			List<EVPServiceRequest> childEVPServiceRequests = alloyServiceInvoker.executeDynamicQuery(new Object[] {"parentEVPServiceRequestId", evpServiceRequest.getEvpServiceRequestId(), "status", EVPWorkflowConstants.SERVICE_STATUS_FEEDBACK_PROOF_FORK});

			renderRequest.setAttribute("childEVPServiceRequestComposites", EVPCompositeUtil.getComposites(childEVPServiceRequests, EVPServiceRequestComposite.class, new Class<?>[] {EVPServiceRequest.class, ThemeDisplay.class}, new Object[] {themeDisplay}));
		}

		renderRequest.setAttribute("portletURL", portletURL);
	}

	public void view() throws Exception {
		_setConstantsMaps();

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		if (SessionMessages.contains(request, EVPConstants.SESSION_MESSAGES_KEY_DUPLICATE_ORGANIZATION)) {
			renderRequest.setAttribute("duplicateOrganization", true);

			SessionMessages.clear(request);
		}

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		renderRequest.setAttribute("portletURL", portletURL);
	}

	protected Indexer buildIndexer() {
		return EVPServiceRequestIndexer.getInstance();
	}

	@Override
	protected MessageListener buildSchedulerMessageListener() {
		return EVPServiceRequestSchedulerMessageListener.getInstance(this);
	}

	@Override
	protected Trigger getSchedulerTrigger() {
		return new CronTrigger(getSchedulerJobName(), getMessageListenerGroupName(), "0 0 8 * * ?");
	}

	private EVPServiceRequest _fetchEVPServiceRequest() throws Exception {
		long evpServiceRequestId = ParamUtil.getLong(request, "id");

		return EVPServiceRequestLocalServiceUtil.fetchEVPServiceRequest(evpServiceRequestId);
	}

	private String _redirectToView(long evpServiceRequestId) throws Exception {
		HttpServletRequest servletRequest = PortalUtil.getHttpServletRequest(actionRequest);

		SessionMessages.add(servletRequest, EVPConstants.SESSION_MESSAGES_KEY_DUPLICATE_ORGANIZATION);

		return HttpUtil.addParameter(ParamUtil.getString(request, "viewEVPServiceRequestURL"), PortalUtil.getPortletNamespace(PortletKeys.EVP) + "id", evpServiceRequestId);
	}

	private void _setClonedAttributes(EVPServiceRequest evpServiceRequest, String paramName) throws Exception {
		long cloneableEVPServiceRequestId = ParamUtil.getLong(request, paramName);

		EVPServiceRequest cloneableEVPServiceRequest = EVPServiceRequestLocalServiceUtil.fetchEVPServiceRequest(cloneableEVPServiceRequestId);

		if (cloneableEVPServiceRequest != null) {
			evpServiceRequest.setBehalfOf(cloneableEVPServiceRequest.getBehalfOf());
			evpServiceRequest.setBehalfOfOther(cloneableEVPServiceRequest.getBehalfOfOther());
			evpServiceRequest.setContactEmailAddressId(cloneableEVPServiceRequest.getContactEmailAddressId());
			evpServiceRequest.setContactPhoneId(cloneableEVPServiceRequest.getContactPhoneId());
			evpServiceRequest.setContactUserId(cloneableEVPServiceRequest.getContactUserId());
			evpServiceRequest.setDescription(cloneableEVPServiceRequest.getDescription());
			evpServiceRequest.setEvpRequestOrganizationId(cloneableEVPServiceRequest.getEvpRequestOrganizationId());
			evpServiceRequest.setPurpose(cloneableEVPServiceRequest.getPurpose());
			evpServiceRequest.setPurposeOther(cloneableEVPServiceRequest.getPurposeOther());
			evpServiceRequest.setRequestedEndDate(cloneableEVPServiceRequest.getRequestedEndDate());
			evpServiceRequest.setRequestedStartDate(cloneableEVPServiceRequest.getRequestedStartDate());
			evpServiceRequest.setRequestedTotalHours(cloneableEVPServiceRequest.getRequestedTotalHours());
			evpServiceRequest.setRequestOrganizationAddressId(cloneableEVPServiceRequest.getRequestOrganizationAddressId());
			evpServiceRequest.setRequestOrganizationWebsiteId(cloneableEVPServiceRequest.getRequestOrganizationWebsiteId());

			evpServiceRequest.setParentEVPServiceRequestId(cloneableEVPServiceRequest.getEvpServiceRequestId());
		}
	}

	private void _setConstantsMaps() throws Exception {
		renderRequest.setAttribute("behalfOfTypeMap", EVPUtil.getBehalfOfTypeMap());
		renderRequest.setAttribute("employmentTypeMap", EVPUtil.getEmploymentTypeMap());
		renderRequest.setAttribute("purposeTypeMap", EVPUtil.getPurposeTypeMap());
	}

	private void _setCreatorUserPhone(long creatorUserId) throws Exception {
		String creatorUserPhoneString = ParamUtil.getString(request, "creatorUserPhone");

		User creatorUser = UserLocalServiceUtil.getUser(creatorUserId);

		List<Phone> creatorUserPhones = PhoneLocalServiceUtil.getPhones(themeDisplay.getCompanyId(), Contact.class.getName(), creatorUser.getContactId());

		for (Phone creatorUserPhone : creatorUserPhones) {
			if (creatorUserPhone.getPrimary()) {
				creatorUserPhone.setNumber(creatorUserPhoneString);

				PhoneLocalServiceUtil.updatePhone(creatorUserPhone.getPhoneId(), creatorUserPhoneString, creatorUserPhone.getExtension(), creatorUserPhone.getTypeId(), creatorUserPhone.getPrimary());

				return;
			}
		}

		PhoneLocalServiceUtil.addPhone(user.getUserId(), Contact.class.getName(), creatorUser.getContactId(), creatorUserPhoneString, StringPool.BLANK, EVPPortalUtil.getListTypeId(ListTypeConstants.CONTACT_PHONE, "personal"), true, new ServiceContext());
	}

	private void _setProofFields(EVPServiceRequest evpServiceRequest, DateFormat dateFormat, String index, boolean validationRequired) throws Exception {
		if (validationRequired) {
			_validateUpdateProof(evpServiceRequest, index);
		}

		if (dateFormat == null) {
			evpServiceRequest.setConfirmedEndDate(EVPUtil.fetchDate(request, "confirmedEndDateString" + index));
			evpServiceRequest.setConfirmedStartDate(EVPUtil.fetchDate(request, "confirmedStartDateString" + index));
		}
		else {
			evpServiceRequest.setConfirmedEndDate(EVPUtil.fetchDate(request, "confirmedEndDateString" + index, dateFormat));
			evpServiceRequest.setConfirmedStartDate(EVPUtil.fetchDate(request, "confirmedStartDateString" + index, dateFormat));
		}

		int confirmedTotalHours = ParamUtil.getInteger(request, "confirmedTotalHours" + index);

		evpServiceRequest.setConfirmedTotalHours(confirmedTotalHours);

		String contactBenefit = ParamUtil.getString(request, "contactBenefit");

		evpServiceRequest.setContactBenefit(contactBenefit);

		String contactComments = ParamUtil.getString(request, "contactComments");

		evpServiceRequest.setContactComments(contactComments);

		evpServiceRequest.setHash(null);
	}

	private void _transitionProofWorkflow(EVPServiceRequest evpServiceRequest, String comments) throws Exception {
		long workflowTaskId = EVPWorkflowUtil.getFirstWorkflowTaskIdForUser(themeDisplay, evpServiceRequest, evpServiceRequest.getSubsidiaryGroupId());

		String transitionName = ParamUtil.getString(request, "transitionName");

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addServiceRequestVariables(this, evpServiceRequest.getEvpServiceRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpServiceRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(indexer, evpServiceRequest);
	}

	private EVPServiceRequest _updateEVPServiceRequest(EVPServiceRequest evpServiceRequest) throws Exception {
		evpServiceRequest.setBehalfOf(EVPUtil.getCheckedTypesString(request, EVPConstants.BEHALF_OF_TYPES, "behalfOf"));

		String comments = ParamUtil.getString(request, "comments");

		if (Validator.isNotNull(comments)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		String evpServiceRequestDescription = ParamUtil.getString(request, "evpServiceRequestDescription");

		evpServiceRequest.setDescription(evpServiceRequestDescription);

		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(evpServiceRequest.getEvpRequestOrganizationId());

		String evpRequestOrganizationDescription = ParamUtil.getString(request, "evpRequestOrganizationDescription");

		String taxIdentificationNumber = ParamUtil.getString(request, "taxIdentificationNumber");

		int organizationNonprofitType = EVPRequestOrganizationUtil.getNonprofitType(taxIdentificationNumber);

		String redirect = StringPool.BLANK;

		if (EVPPermission.contains(themeDisplay, evpRequestOrganization, "update")) {
			String organizationName = ParamUtil.getString(request, "organizationName");

			Organization organization = EVPRequestOrganizationUtil.fetchOrganization(themeDisplay, organizationName);

			evpRequestOrganization = EVPRequestOrganizationUtil.fetchRequestOrganization(organization.getOrganizationId());

			updateModel(evpRequestOrganization, "organizationId", organization.getOrganizationId(), "description", evpRequestOrganizationDescription, "nonprofitType", organizationNonprofitType);

			Address requestOrganizationAddress = EVPPortalUtil.fetchAddress(this, evpRequestOrganization);

			evpServiceRequest.setRequestOrganizationAddressId(requestOrganizationAddress.getAddressId());

			String url = ParamUtil.getString(request, "url");

			Website requestOrganizationWebsite = EVPPortalUtil.fetchOrganizationWebsite(this, evpRequestOrganization, url);

			evpServiceRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsite.getWebsiteId());

			redirect = ParamUtil.getString(request, "redirect");
		}
		else if (!Validator.equals(evpRequestOrganization.getTaxIdentificationNumber(), taxIdentificationNumber) || !Validator.equals(evpRequestOrganization.getDescription(), evpRequestOrganizationDescription) || (evpRequestOrganization.getNonprofitType() != organizationNonprofitType)) {
			redirect = _redirectToView(evpServiceRequest.getEvpServiceRequestId());
		}

		evpServiceRequest.setEvpRequestOrganizationId(evpRequestOrganization.getEvpRequestOrganizationId());

		User contactUser = EVPPortalUtil.fetchContactUser(this, evpRequestOrganization.getOrganizationId());

		evpServiceRequest.setContactUserId(contactUser.getUserId());

		String contactUserEmailAddressString = ParamUtil.getString(request, "contactUserEmailAddress");

		EmailAddress contactUserEmailAddress = EVPPortalUtil.fetchUserEmailAddress(this, contactUser, contactUserEmailAddressString);

		evpServiceRequest.setContactEmailAddressId(contactUserEmailAddress.getEmailAddressId());

		String contactUserPhoneString = ParamUtil.getString(request, "contactUserPhone");

		Phone contactUserPhone = EVPPortalUtil.fetchUserPhone(this, contactUser, contactUserPhoneString);

		evpServiceRequest.setContactPhoneId(contactUserPhone.getPhoneId());

		String managerUserEmailAddress = ParamUtil.getString(request, "managerUserEmailAddress");

		if (Validator.isNotNull(managerUserEmailAddress) && EVPPermission.contains(themeDisplay, "service_requests", "override_manager")) {
			User user = EVPPortalUtil.fetchUser(themeDisplay, managerUserEmailAddress);

			evpServiceRequest.setManagerUserId(user.getUserId());
		}

		evpServiceRequest.setPurpose(EVPUtil.getCheckedTypesString(request, EVPConstants.PURPOSE_TYPES, "purpose"));

		Date requestedEndDate = EVPUtil.fetchDate(request, "requestedEndDateString");

		evpServiceRequest.setRequestedEndDate(requestedEndDate);

		Date requestedStartDate = EVPUtil.fetchDate(request, "requestedStartDateString");

		evpServiceRequest.setRequestedStartDate(requestedStartDate);

		int requestedTotalHours = ParamUtil.getInteger(request, "requestedTotalHours");

		evpServiceRequest.setRequestedTotalHours(requestedTotalHours);

		if (Validator.isNotNull(ParamUtil.getString(request, "confirmedStartDateString"))) {
			_setProofFields(evpServiceRequest, DateFormatFactoryUtil.getSimpleDateFormat("MM/dd/yyyy"), StringPool.BLANK, false);
		}

		updateModel(evpServiceRequest);

		_setCreatorUserPhone(evpServiceRequest.getUserId());

		redirectTo(redirect);

		return evpServiceRequest;
	}

	private void _validateAdd(EVPServiceRequest evpServiceRequest) throws Exception {
		_validateFields(evpServiceRequest);

		_validateManager(user.getUserId());
	}

	private void _validateDelete(EVPServiceRequest evpServiceRequest) throws Exception {
		_validateEVPServiceRequest(evpServiceRequest);
	}

	private void _validateEVPServiceRequest(EVPServiceRequest evpServiceRequest) throws Exception {
		if (evpServiceRequest == null) {
			throw new AlloyException("the-service-request-does-not-exist");
		}
	}

	private void _validateFields(EVPServiceRequest evpServiceRequest) throws Exception {
		User creatorUser = UserLocalServiceUtil.getUser(evpServiceRequest.getUserId());

		_validateServiceHours(creatorUser, evpServiceRequest);

		EVPValidator.validateEVPParticipation(creatorUser, request);

		EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(creatorUser.getUserId());

		if (evpServiceRequest.getParentEVPServiceRequestId() <= 0) {
			String creatorUserPhoneString = ParamUtil.getString(request, "creatorUserPhone");

			if (Validator.isNull(creatorUserPhoneString)) {
				throw new AlloyException("the-phone-number-is-invalid");
			}
			else if (creatorUserPhoneString.length() > EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT) {
				throw new AlloyException(translate("the-phone-number-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT));
			}

			boolean serviceRequestContactPhoneRequired = GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_SERVICE_REQUEST_CONTACT_PHONE_REQUIRED));

			EVPValidator.validateEVPRequestOrganization(creatorUser, request, serviceRequestContactPhoneRequired);

			EVPValidator.validateEVPRequest(request);
		}

		boolean userHasSetAnyDatePermission = EVPPermission.contains(themeDisplay, "service_requests", "setAnyDate", subsidiaryEVPDivision.getOrganizationGroupId());

		Date requestedStartDate = EVPUtil.fetchDate(request, "requestedStartDateString");

		if (!CalendarUtil.afterByDay(requestedStartDate, new Date()) && !userHasSetAnyDatePermission) {
			throw new AlloyException("the-requested-start-date-must-be-after-today's-date");
		}

		if (CalendarUtil.beforeByDay(EVPUtil.fetchDate(request, "requestedEndDateString"), requestedStartDate) && !userHasSetAnyDatePermission) {
			throw new AlloyException("the-requested-end-date-must-be-after-or-equal-to-the-request-start-date");
		}

		int requestedTotalHours = ParamUtil.getInteger(request, "requestedTotalHours");

		if (requestedTotalHours <= 0) {
			throw new AlloyException("total-hours-requested-is-invalid");
		}

		String evpServiceRequestDescription = ParamUtil.getString(request, "evpServiceRequestDescription");

		if (Validator.isNull(evpServiceRequestDescription)) {
			throw new AlloyException("a-description-of-the-service-to-be-performed-is-required");
		}
		else if (evpServiceRequestDescription.length() > EVPConstants.MAX_FIELD_LENGTH_TEXTAREA) {
			throw new AlloyException(translate("the-service-description-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_TEXTAREA));
		}
	}

	private void _validateManager(long userId) throws Exception {
		String managerUserEmailAddress = ParamUtil.getString(request, "managerUserEmailAddress");

		if (Validator.isNotNull(managerUserEmailAddress) && EVPPermission.contains(themeDisplay, "service_requests", "override_manager")) {
			User user = EVPPortalUtil.fetchUser(themeDisplay, managerUserEmailAddress);

			if (user == null) {
				throw new AlloyException(translate("the-manager-email-x-does-not-exist", managerUserEmailAddress));
			}

			return;
		}

		EVPEmployee evpEmployee = EVPEmployeeLocalServiceUtil.fetchEVPEmployeeByEmployeeUserId(userId);

		if ((evpEmployee == null) || (evpEmployee.getManagerUserId() == 0)) {
			throw new AlloyException("we-were-not-able-to-retrieve-your-manager's-information.-please-contact-evp-global@liferay.com-for-assistance.");
		}
	}

	private void _validateServiceHours(User creatorUser, EVPServiceRequest evpServiceRequest) throws Exception {
		Date requestedStartDate = EVPUtil.fetchDate(request, "requestedStartDateString");

		Calendar requestedStartDateCalendar = EVPUtil.getCalendar(requestedStartDate);

		Date requestedEndDate = EVPUtil.fetchDate(request, "requestedEndDateString");

		Calendar requestedEndDateCalendar = EVPUtil.getCalendar(requestedEndDate);

		if (requestedStartDateCalendar.get(Calendar.YEAR) != requestedEndDateCalendar.get(Calendar.YEAR)) {
			throw new AlloyException("you-can-only-request-service-hours-for-a-single-year.-please-submit-separate-requests-for-the-portions-of-your-service-that-you-will-complete-in-each-year");
		}

		int requestedTotalHours = ParamUtil.getInteger(request, "requestedTotalHours");

		ExpandoValue expandoValue = ExpandoValueLocalServiceUtil.getValue(user.getCompanyId(), User.class.getName(), ExpandoTableConstants.DEFAULT_TABLE_NAME, EVPConstants.EVP_OVERRIDE_STATUS_EXPANDO_COLUMN, user.getUserId());

		if ((expandoValue == null) || !ArrayUtil.contains(expandoValue.getStringArray(), EVPConstants.OVERRIDE_TYPE_ELIGIBLE)) {
			int maxServiceHours = 0;

			EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(creatorUser.getUserId());

			if (evpServiceRequest.getEmploymentType() == EVPConstants.EMPLOYMENT_TYPE_FULL_TIME) {
				maxServiceHours = GetterUtil.getInteger(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_FULL_TIME_SERVICE_HOURS));
			}
			else if (evpServiceRequest.getEmploymentType() == EVPConstants.EMPLOYMENT_TYPE_PART_TIME) {
				maxServiceHours = GetterUtil.getInteger(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_PART_TIME_SERVICE_HOURS));
			}
			else if (evpServiceRequest.getEmploymentType() == EVPConstants.EMPLOYMENT_TYPE_TEMPORARY) {
				maxServiceHours = GetterUtil.getInteger(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_TEMPORARY_SERVICE_HOURS));
			}

			int totalHoursUsed = EVPUtil.getUsersTotalServiceHoursUsed(creatorUser.getUserId(), requestedStartDateCalendar.get(Calendar.YEAR), evpServiceRequest.getEvpServiceRequestId());

			int serviceHours = maxServiceHours - totalHoursUsed;

			if (serviceHours < requestedTotalHours) {
				throw new AlloyException(translate("available-service-hours-exceeded-you-only-have-x-service-hours-left-for-this-year", serviceHours));
			}
		}

		int totalDays = DateUtil.getDaysBetween(requestedStartDateCalendar.getTime(), requestedEndDateCalendar.getTime()) + 1;

		if ((requestedTotalHours <= 0) || (requestedTotalHours > (totalDays * 8))) {
			throw new AlloyException("total-hours-requested-is-invalid");
		}
	}

	private void _validateSetOwnStatus(EVPServiceRequest evpServiceRequest) throws Exception {
		_validateUpdateEVPServiceRequest(evpServiceRequest);
	}

	private void _validateUpdate(EVPServiceRequest evpServiceRequest) throws Exception {
		_validateUpdateEVPServiceRequest(evpServiceRequest);
	}

	private void _validateUpdateEVPServiceRequest(EVPServiceRequest evpServiceRequest) throws Exception {
		_validateEVPServiceRequest(evpServiceRequest);

		EVPValidator.validateComment(request, "comments", true);

		_validateFields(evpServiceRequest);

		_validateManager(evpServiceRequest.getUserId());
	}

	private void _validateUpdateFeedback(EVPServiceRequest evpServiceRequest) throws Exception {
		List<Integer> forkStatuses = EVPKaleoForkInstanceUtil.getStatuses(evpServiceRequest.getEvpServiceRequestId());

		if ((evpServiceRequest.getUserId() != themeDisplay.getUserId()) || forkStatuses.contains(EVPWorkflowConstants.SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER)) {
			EVPValidator.validateComment(request, "comments", true);
		}
		else {
			EVPValidator.validateComment(request, "comments", false);
		}

		String feedbackDescription = ParamUtil.getString(request, "feedbackDescription");

		if (Validator.isNull(feedbackDescription)) {
			throw new AlloyException("a-description-of-what-you-did-is-required");
		}

		String employeeBenefit = ParamUtil.getString(request, "employeeBenefit");

		if (Validator.isNull(employeeBenefit)) {
			throw new AlloyException("a-description-of-how-you-were-positively-affected-is-required");
		}

		String recipientBenefit = ParamUtil.getString(request, "recipientBenefit");

		if (Validator.isNull(recipientBenefit)) {
			throw new AlloyException("a-description-of-how-the-people-you-served-were-positively-affected-is-required");
		}
	}

	private void _validateUpdateProof(EVPServiceRequest evpServiceRequest, String index) throws Exception {
		String comments = ParamUtil.getString(request, "comments");

		if (comments.length() > EVPConstants.MAX_FIELD_LENGTH_TEXTAREA) {
			throw new AlloyException(translate("the-comments-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_TEXTAREA));
		}

		if (evpServiceRequest.getStatus() == EVPWorkflowConstants.SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION) {
			if (Validator.isNull(comments)) {
				throw new AlloyException("a-comment-is-required");
			}
		}

		Date confirmedStartDate = EVPUtil.fetchDate(request, "confirmedStartDateString" + index);

		if (Validator.isNull(confirmedStartDate)) {
			throw new AlloyException("start-date-of-the-service-is-required");
		}

		if (CalendarUtil.beforeByDay(EVPUtil.fetchDate(request, "confirmedEndDateString"  + index), confirmedStartDate)) {
			throw new AlloyException("the-end-date-must-be-after-or-equal-to-the-start-date");
		}

		int confirmedTotalHours = ParamUtil.getInteger(request, "confirmedTotalHours"  + index);

		if (confirmedTotalHours <= 0) {
			throw new AlloyException("total-hours-is-invalid");
		}

		String contactBenefit = ParamUtil.getString(request, "contactBenefit");

		if (Validator.isNull(contactBenefit)) {
			throw new AlloyException("a-description-of-how-our-employees-service-benefited-your-organization-is-required");
		}
		else if (contactBenefit.length() > EVPConstants.MAX_FIELD_LENGTH_TEXTAREA) {
			throw new AlloyException(translate("the-character-length-for-the-description-of-how-our-employees-service-benefited-your-organization-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_TEXTAREA));
		}

		String contactComments = ParamUtil.getString(request, "contactComments");

		if (contactComments.length() > EVPConstants.MAX_FIELD_LENGTH_TEXTAREA) {
			throw new AlloyException(translate("the-feedback-comments-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_TEXTAREA));
		}
	}

}
%>
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
<%@ include file="/WEB-INF/jsp/util/evp_grant_request_indexer.jspf" %>

<%!
public class AlloyControllerImpl extends EVPAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPGrantRequest.class);
		setPermissioned(true);
	}

	public void add() throws Exception {
		EVPGrantRequest evpGrantRequest = EVPGrantRequestLocalServiceUtil.createEVPGrantRequest(0);

		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);

		request = uploadPortletRequest;

		_setClonedAttributes(evpGrantRequest, "parentEVPGrantRequestId");

		evpGrantRequest.setCreateDate(new Date());
		evpGrantRequest.setEmploymentType(EVPUtil.getEmploymentType(user.getUserId()));
		evpGrantRequest.setUserId(user.getUserId());

		_validateAdd(evpGrantRequest);

		boolean duplicateOrganization = false;

		EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(user.getUserId());

		if (evpGrantRequest.getParentEVPGrantRequestId() <= 0) {
			evpGrantRequest.setBehalfOf(EVPUtil.getCheckedTypesString(request, EVPConstants.BEHALF_OF_TYPES, "behalfOf"));

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

			evpGrantRequest.setEvpRequestOrganizationId(evpRequestOrganization.getEvpRequestOrganizationId());

			User contactUser = EVPPortalUtil.fetchContactUser(this, evpRequestOrganization.getOrganizationId());

			evpGrantRequest.setContactUserId(contactUser.getUserId());

			String contactUserEmailAddressString = ParamUtil.getString(request, "contactUserEmailAddress");

			EmailAddress contactUserEmailAddress = EVPPortalUtil.fetchUserEmailAddress(this, contactUser, contactUserEmailAddressString);

			evpGrantRequest.setContactEmailAddressId(contactUserEmailAddress.getEmailAddressId());

			String contactUserPhoneString = ParamUtil.getString(request, "contactUserPhone");

			Phone contactUserPhone = EVPPortalUtil.fetchUserPhone(this, contactUser, contactUserPhoneString);

			evpGrantRequest.setContactPhoneId(contactUserPhone.getPhoneId());

			evpGrantRequest.setPurpose(EVPUtil.getCheckedTypesString(request, EVPConstants.PURPOSE_TYPES, "purpose"));

			Address requestOrganizationAddress = EVPPortalUtil.fetchAddress(this, evpRequestOrganization);

			evpGrantRequest.setRequestOrganizationAddressId(requestOrganizationAddress.getAddressId());

			String url = ParamUtil.getString(request, "url");

			Website requestOrganizationWebsite = EVPPortalUtil.fetchOrganizationWebsite(this, evpRequestOrganization, url);

			evpGrantRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsite.getWebsiteId());
		}
		else {
			User contactUser = UserLocalServiceUtil.getUser(evpGrantRequest.getContactUserId());

			OrganizationLocalServiceUtil.addUserOrganization(contactUser.getUserId(), subsidiaryEVPDivision.getOrganizationId());

			Role organizationContactRole = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), EVPRoleConstants.ROLE_NAME_ORGANIZATION_CONTACT);

			UserGroupRoleLocalServiceUtil.addUserGroupRoles(contactUser.getUserId(), subsidiaryEVPDivision.getOrganizationGroupId(), new long[] {organizationContactRole.getRoleId()});
		}

		String evpGrantRequestDescription = ParamUtil.getString(request, "evpGrantRequestDescription");

		evpGrantRequest.setDescription(evpGrantRequestDescription);

		evpGrantRequest.setSubsidiaryGroupId(subsidiaryEVPDivision.getOrganizationGroupId());

		updateModel(evpGrantRequest);

		_updateEVPGrantTransactions(evpGrantRequest);

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addGrantRequestVariables(this, evpGrantRequest.getEvpGrantRequestId(), StringPool.BLANK);

		EVPWorkflowUtil.startWorkflowInstance(themeDisplay, actionRequest, evpGrantRequest, workflowContext, subsidiaryEVPDivision.getOrganizationGroupId());

		_setCreatorUserPhone(evpGrantRequest.getUserId());

		EVPWorkflowUtil.registerReindexCallback(indexer, evpGrantRequest);

		ResourceLocalServiceUtil.addResources(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), user.getUserId(), EVPGrantRequest.class.getName(), evpGrantRequest.getEvpGrantRequestId(), false, true, true);

		redirectTo(EVPUtil.getSubmissionConfirmationURL(this, evpGrantRequest.getEvpGrantRequestId(), duplicateOrganization));
	}

	public void create() throws Exception {
		EVPValidator.validateEVPParticipation(user, -1, themeDisplay, request);

		_setConstantsMaps();

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPDivisionLocalServiceUtil", new EVPDivisionLocalServiceUtil());
		renderRequest.setAttribute("EVPGrantTransactionConstants", getConstantsBean(EVPGrantTransactionConstants.class));
		renderRequest.setAttribute("EVPUtil", new EVPUtil());
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPGrantRequest evpGrantRequest = EVPGrantRequestLocalServiceUtil.createEVPGrantRequest(0);

		_setClonedAttributes(evpGrantRequest, "cloneableEVPGrantRequestId");

		long cloneableEVPGrantRequestId = ParamUtil.getLong(request, "cloneableEVPGrantRequestId");

		evpGrantRequest.setEvpGrantRequestId(cloneableEVPGrantRequestId);

		evpGrantRequest.setEmploymentType(EVPUtil.getEmploymentType(user.getUserId()));

		renderRequest.setAttribute("evpGrantRequestComposite", new EVPGrantRequestComposite(evpGrantRequest, user, themeDisplay));
	}

	public void delete() throws Exception {
		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_validateDelete(evpGrantRequest);

		ResourceLocalServiceUtil.deleteResource(evpGrantRequest, ResourceConstants.SCOPE_INDIVIDUAL);

		EVPGrantRequestLocalServiceUtil.deleteEVPGrantRequest(evpGrantRequest);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void edit() throws Exception {
		_setConstantsMaps();

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPDivisionLocalServiceUtil", new EVPDivisionLocalServiceUtil());
		renderRequest.setAttribute("EVPGrantTransactionConstants", getConstantsBean(EVPGrantTransactionConstants.class));
		renderRequest.setAttribute("EVPUtil", new EVPUtil());
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		renderRequest.setAttribute("evpGrantRequestComposite", new EVPGrantRequestComposite(evpGrantRequest, themeDisplay));
	}

	public void index() throws Exception {
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

		String statusFilter = ParamUtil.getString(request, "statusFilter", EVPWorkflowConstants.STATUS_LABEL_ACTIVE);

		renderRequest.setAttribute("statusFilter", statusFilter);

		attributes.put("statusFilter", statusFilter);

		String orderByCol = ParamUtil.getString(request, "orderByCol", "createDate");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "desc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("creatorUserFullName_sortable", false),
			new Sort("createDate", true)
		};

		AlloySearchResult alloySearchResult = search(attributes, null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPGrantRequestComposite> evpGrantRequestComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPGrantRequestComposite.class, new Class<?>[] {EVPGrantRequest.class, ThemeDisplay.class}, new Object[] {themeDisplay});

		renderRequest.setAttribute("evpGrantRequestComposites", evpGrantRequestComposites);

		renderRequest.setAttribute("grantTypeMap", EVPUtil.getGrantTypeMap(user.getUserId()));

		renderRequest.setAttribute("searchableGrantLabels", EVPWorkflowConstants.getSearchableGrantLabels());
	}

	public void setOwnStatus() throws Exception {
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);

		request = uploadPortletRequest;

		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_validateSetOwnStatus(evpGrantRequest);

		evpGrantRequest = _updateEVPGrantRequest(evpGrantRequest);

		long workflowTaskId = EVPWorkflowUtil.getFirstWorkflowTaskIdForUser(themeDisplay, evpGrantRequest, evpGrantRequest.getSubsidiaryGroupId());

		String transitionName = ParamUtil.getString(request, "transitionName");

		String comments = ParamUtil.getString(request, "comments");

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addGrantRequestVariables(this, evpGrantRequest.getEvpGrantRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpGrantRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(indexer, evpGrantRequest);

		addSuccessMessage();
	}

	public void update() throws Exception {
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(actionRequest);

		request = uploadPortletRequest;

		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_validateUpdate(evpGrantRequest);

		_updateEVPGrantRequest(evpGrantRequest);

		addSuccessMessage();
	}

	public void view() throws Exception {
		_setConstantsMaps();

		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		if (SessionMessages.contains(request, EVPConstants.SESSION_MESSAGES_KEY_DUPLICATE_ORGANIZATION)) {
			renderRequest.setAttribute("duplicateOrganization", true);

			SessionMessages.clear(request);
		}

		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		renderRequest.setAttribute("evpGrantRequestComposite", new EVPGrantRequestComposite(evpGrantRequest, themeDisplay));

		renderRequest.setAttribute("portletURL", portletURL);
	}

	@Override
	protected Indexer buildIndexer() {
		return EVPGrantRequestIndexer.getInstance();
	}

	private double _addAll(double... addends) {
		double sum = 0;

		for (double addend : addends) {
			sum = BigDecimalUtil.add(sum, addend);
		}

		return sum;
	}

	private EVPGrantRequest _fetchEVPGrantRequest() throws Exception {
		long evpGrantRequestId = ParamUtil.getLong(request, "id");

		return EVPGrantRequestLocalServiceUtil.fetchEVPGrantRequest(evpGrantRequestId);
	}

	private EVPGrantTransaction _fetchEVPGrantTransaction(long evpGrantRequestId, int transactionType) throws Exception {
		AlloyServiceInvoker evpGrantTransactionAlloyServiceInvoker = new AlloyServiceInvoker(EVPGrantTransaction.class.getName());

		List<EVPGrantTransaction> evpGrantTransactions = evpGrantTransactionAlloyServiceInvoker.executeDynamicQuery(new Object[] {"evpGrantRequestId", evpGrantRequestId, "grantType", transactionType});

		if (!evpGrantTransactions.isEmpty()) {
			return evpGrantTransactions.get(0);
		}

		return EVPGrantTransactionLocalServiceUtil.createEVPGrantTransaction(0);
	}

	private String _redirectToView(long evpGrantRequestId) throws Exception {
		HttpServletRequest servletRequest = PortalUtil.getHttpServletRequest(actionRequest);

		SessionMessages.add(servletRequest, EVPConstants.SESSION_MESSAGES_KEY_DUPLICATE_ORGANIZATION);

		return HttpUtil.addParameter(ParamUtil.getString(request, "viewEVPGrantRequestURL"), PortalUtil.getPortletNamespace(PortletKeys.EVP) + "id", evpGrantRequestId);
	}

	private void _setClonedAttributes(EVPGrantRequest evpGrantRequest, String paramName) throws Exception {
		long cloneableEVPGrantRequestId = ParamUtil.getLong(request, paramName);

		EVPGrantRequest cloneableEVPGrantRequest = EVPGrantRequestLocalServiceUtil.fetchEVPGrantRequest(cloneableEVPGrantRequestId);

		if (cloneableEVPGrantRequest != null) {
			evpGrantRequest.setBehalfOf(cloneableEVPGrantRequest.getBehalfOf());
			evpGrantRequest.setBehalfOfOther(cloneableEVPGrantRequest.getBehalfOfOther());
			evpGrantRequest.setContactEmailAddressId(cloneableEVPGrantRequest.getContactEmailAddressId());
			evpGrantRequest.setContactPhoneId(cloneableEVPGrantRequest.getContactPhoneId());
			evpGrantRequest.setContactUserId(cloneableEVPGrantRequest.getContactUserId());
			evpGrantRequest.setDescription(cloneableEVPGrantRequest.getDescription());
			evpGrantRequest.setEvpRequestOrganizationId(cloneableEVPGrantRequest.getEvpRequestOrganizationId());
			evpGrantRequest.setPurpose(cloneableEVPGrantRequest.getPurpose());
			evpGrantRequest.setPurposeOther(cloneableEVPGrantRequest.getPurposeOther());
			evpGrantRequest.setRequestOrganizationAddressId(cloneableEVPGrantRequest.getRequestOrganizationAddressId());
			evpGrantRequest.setRequestOrganizationWebsiteId(cloneableEVPGrantRequest.getRequestOrganizationWebsiteId());

			evpGrantRequest.setParentEVPGrantRequestId(cloneableEVPGrantRequest.getEvpGrantRequestId());
		}
	}

	private void _setConstantsMaps() throws Exception {
		renderRequest.setAttribute("behalfOfTypeMap", EVPUtil.getBehalfOfTypeMap());
		renderRequest.setAttribute("employmentTypeMap", EVPUtil.getEmploymentTypeMap());
		renderRequest.setAttribute("grantTypeMap", EVPUtil.getGrantTypeMap(user.getUserId()));
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

	private EVPGrantRequest _updateEVPGrantRequest(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateUpdate(evpGrantRequest);

		evpGrantRequest.setBehalfOf(EVPUtil.getCheckedTypesString(request, EVPConstants.BEHALF_OF_TYPES, "behalfOf"));

		String comments = ParamUtil.getString(request, "comments");

		if (Validator.isNotNull(comments)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		String description = ParamUtil.getString(request, "evpGrantRequestDescription");

		evpGrantRequest.setDescription(description);

		EVPRequestOrganization evpRequestOrganization = EVPRequestOrganizationLocalServiceUtil.getEVPRequestOrganization(evpGrantRequest.getEvpRequestOrganizationId());

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

			evpGrantRequest.setRequestOrganizationAddressId(requestOrganizationAddress.getAddressId());

			String url = ParamUtil.getString(request, "url");

			Website requestOrganizationWebsite = EVPPortalUtil.fetchOrganizationWebsite(this, evpRequestOrganization, url);

			evpGrantRequest.setRequestOrganizationWebsiteId(requestOrganizationWebsite.getWebsiteId());

			redirect = ParamUtil.getString(request, "redirect");
		}
		else if (!Validator.equals(evpRequestOrganization.getTaxIdentificationNumber(), taxIdentificationNumber) || !Validator.equals(evpRequestOrganization.getDescription(), evpRequestOrganizationDescription) || (evpRequestOrganization.getNonprofitType() != organizationNonprofitType)) {
			redirect = _redirectToView(evpGrantRequest.getEvpGrantRequestId());
		}

		evpGrantRequest.setEvpRequestOrganizationId(evpRequestOrganization.getEvpRequestOrganizationId());

		User contactUser = EVPPortalUtil.fetchContactUser(this, evpRequestOrganization.getOrganizationId());

		evpGrantRequest.setContactUserId(contactUser.getUserId());

		String contactUserEmailAddressString = ParamUtil.getString(request, "contactUserEmailAddress");

		EmailAddress contactUserEmailAddress = EVPPortalUtil.fetchUserEmailAddress(this, contactUser, contactUserEmailAddressString);

		evpGrantRequest.setContactEmailAddressId(contactUserEmailAddress.getEmailAddressId());

		String contactUserPhoneString = ParamUtil.getString(request, "contactUserPhone");

		Phone contactUserPhone = EVPPortalUtil.fetchUserPhone(this, contactUser, contactUserPhoneString);

		evpGrantRequest.setContactPhoneId(contactUserPhone.getPhoneId());

		evpGrantRequest.setPurpose(EVPUtil.getCheckedTypesString(request, EVPConstants.PURPOSE_TYPES, "purpose"));

		updateModel(evpGrantRequest);

		_setCreatorUserPhone(evpGrantRequest.getUserId());

		_updateEVPGrantTransactions(evpGrantRequest);

		redirectTo(redirect);

		return evpGrantRequest;
	}

	private void _updateEVPGrantTransactions(EVPGrantRequest evpGrantRequest) throws Exception {
		EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(evpGrantRequest.getUserId());

		long subsidiaryEVPDivisionGroupId = subsidiaryEVPDivision.getOrganizationGroupId();

		for (int transactionType : EVPGrantTransactionConstants.GRANT_TYPES) {
			EVPGrantTransaction evpGrantTransaction = _fetchEVPGrantTransaction(evpGrantRequest.getEvpGrantRequestId(), transactionType);

			boolean typeChecked = ParamUtil.getBoolean(request, "grantType" + transactionType);

			if (typeChecked) {
				boolean subsidiaryPortletPropsValue = GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(subsidiaryEVPDivision.getCompanyId(), subsidiaryEVPDivisionGroupId, EVPGrantTransactionConstants.getEvpGrantTransactionsPortletPropKeys(transactionType)));

				if (!subsidiaryPortletPropsValue) {
					throw new AlloyException(translate("your-subsidiary-does-not-offer-x-grants", EVPGrantTransactionConstants.getGrantTypeLabel(transactionType)));
				}

				double transactionAmount = ParamUtil.getDouble(request, transactionType + "Amount");

				transactionAmount = BigDecimalUtil.scale(transactionAmount, 0, RoundingMode.UP);

				evpGrantTransaction.setAmount(transactionAmount);

				if (GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivisionGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED))) {
					String transactionBankBICCode = ParamUtil.getString(request, transactionType + "BankBICCode");

					evpGrantTransaction.setBankBICCode(transactionBankBICCode);

					String transactionBankIBANCode = ParamUtil.getString(request, transactionType + "BankIBANCode");

					evpGrantTransaction.setBankIBANCode(transactionBankIBANCode);

					String transactionBankName = ParamUtil.getString(request, transactionType + "BankName");

					evpGrantTransaction.setBankName(transactionBankName);

					String transactionPurposeOfUse = ParamUtil.getString(request, transactionType + "PurposeOfUse");

					evpGrantTransaction.setPurposeOfUse(transactionPurposeOfUse);
				}

				evpGrantTransaction.setCurrencyCode(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivisionGroupId, PortletPropsKeys.SUBSIDIARY_CONFIGURATION_CURRENCY_CODE));
				evpGrantTransaction.setEvpGrantRequestId(evpGrantRequest.getEvpGrantRequestId());
				evpGrantTransaction.setGrantType(transactionType);

				String transactionNote = ParamUtil.getString(request, transactionType + "Note");

				evpGrantTransaction.setNote(transactionNote);

				if (transactionType == EVPGrantTransactionConstants.GRANT_TYPE_MATCHING) {
					UploadPortletRequest uploadPortletRequest = (UploadPortletRequest)request;

					File matchingGrantReceiptFile = uploadPortletRequest.getFile("matchingGrantReceiptFile");

					if ((matchingGrantReceiptFile != null) && matchingGrantReceiptFile.exists()) {
						String matchingGrantReceiptFileName = uploadPortletRequest.getFileName("matchingGrantReceiptFile");

						EVPGrantRequestUtil.addReceiptFile(themeDisplay, evpGrantTransaction, matchingGrantReceiptFile, matchingGrantReceiptFileName);
					}
					else if (evpGrantTransaction.isNew()) {
						throw new AlloyException("a-matching-donation-receipt-is-required");
					}
				}

				updateModel(evpGrantTransaction);
			}
			else {
				EVPGrantTransactionLocalServiceUtil.deleteEVPGrantTransaction(evpGrantTransaction);
			}
		}
	}

	private void _validateAdd(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateFields(evpGrantRequest);
	}

	private void _validateDelete(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateEVPGrantRequest(evpGrantRequest);
	}

	private void _validateEVPGrantRequest(EVPGrantRequest evpGrantRequest) throws Exception {
		if (evpGrantRequest == null) {
			throw new AlloyException("the-grant-request-does-not-exist");
		}
	}

	private void _validateFieldLength(int fieldLength, int maxFieldLength, String message, Object[] arguments) throws Exception {
		if (fieldLength > maxFieldLength) {
			throw new AlloyException(translate(message, arguments));
		}
	}

	private void _validateFields(EVPGrantRequest evpGrantRequest) throws Exception {
		User creatorUser = UserLocalServiceUtil.getUser(evpGrantRequest.getUserId());

		EVPValidator.validateEVPParticipation(creatorUser, request);

		if (evpGrantRequest.getParentEVPGrantRequestId() <= 0) {
			String creatorUserPhoneString = ParamUtil.getString(request, "creatorUserPhone");

			if (Validator.isNull(creatorUserPhoneString)) {
				throw new AlloyException("the-phone-number-is-invalid");
			}

			_validateFieldLength(creatorUserPhoneString.length(), EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT, "the-phone-number-character-length-exceeded-x-characters", new Object[] {EVPConstants.MAX_FIELD_LENGTH_PORTAL_DEFAULT});

			EVPValidator.validateEVPRequestOrganization(creatorUser, request, false);

			EVPValidator.validateEVPRequest(request);
		}

		boolean atLeastOneChecked = false;

		EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(creatorUser.getUserId());

		for (int transactionType : EVPGrantTransactionConstants.GRANT_TYPES) {
			boolean typeChecked = ParamUtil.getBoolean(request, "grantType" + transactionType);

			if (!typeChecked) {
				continue;
			}

			atLeastOneChecked = true;

			double transactionAmount = ParamUtil.getDouble(request, transactionType + "Amount");

			if (transactionAmount <= 0) {
				throw new AlloyException(translate("the-x-grant-amount-is-required", EVPGrantTransactionConstants.getGrantTypeLabel(transactionType)));
			}

			String transactionNote = ParamUtil.getString(request, transactionType + "Note");

			EVPGrantTransaction evpGrantTransaction = _fetchEVPGrantTransaction(evpGrantRequest.getEvpGrantRequestId(), transactionType);

			_validateFieldLength(transactionNote.length(), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT, "the-x-grant-check-memo-character-length-exceeded-x-characters", new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT});

			if (GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED)) && (transactionType != EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP)) {
				String transactionBankBICCode = ParamUtil.getString(request, transactionType + "BankBICCode");

				if (Validator.isNull(transactionBankBICCode)) {
					throw new AlloyException(translate("the-x-bank-bic-code-is-required", EVPGrantTransactionConstants.getGrantTypeLabel(transactionType)));
				}

				_validateFieldLength(transactionBankBICCode.length(), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT, "the-x-bank-BIC-code-character-length-exceeded-x-characters", new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT});

				String transactionBankIBANCode = ParamUtil.getString(request, transactionType + "BankIBANCode");

				if (Validator.isNull(transactionBankIBANCode)) {
					throw new AlloyException(translate("the-x-bank-iban-code-is-required", EVPGrantTransactionConstants.getGrantTypeLabel(transactionType)));
				}

				_validateFieldLength(transactionBankIBANCode.length(), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT, "the-x-bank-IBAN-code-character-length-exceeded-x-characters", new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT});

				String transactionBankName = ParamUtil.getString(request, transactionType + "BankName");

				if (Validator.isNull(transactionBankName)) {
					throw new AlloyException(translate("the-x-bank-name-is-required", EVPGrantTransactionConstants.getGrantTypeLabel(transactionType)));
				}

				_validateFieldLength(transactionBankName.length(), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT, "the-x-bank-name-character-length-exceeded-x-characters", new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT});

				String transactionPurposeOfUse = ParamUtil.getString(request, transactionType + "PurposeOfUse");

				_validateFieldLength(transactionPurposeOfUse.length(), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT, "the-x-purpose-of-use-character-length-exceeded-x-characters", new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT});
			}

			Calendar createDateCalendar = EVPUtil.getCalendar(evpGrantRequest.getCreateDate());

			double currentTransactionsAmount = EVPUtil.getUsersTotalGrantAmountUsed(evpGrantRequest.getUserId(), createDateCalendar.get(Calendar.YEAR), evpGrantRequest.getEvpGrantRequestId());

			double matchingTransactionAmount = ParamUtil.getDouble(request, EVPGrantTransactionConstants.GRANT_TYPE_MATCHING + "Amount");
			double proposedTransactionAmount = ParamUtil.getDouble(request, EVPGrantTransactionConstants.GRANT_TYPE_PROPOSED + "Amount");
			double sponsorshipTransactionAmount = ParamUtil.getDouble(request, EVPGrantTransactionConstants.GRANT_TYPE_SPONSORSHIP + "Amount");

			double totalTransactionAmount = _addAll(currentTransactionsAmount, matchingTransactionAmount, proposedTransactionAmount, sponsorshipTransactionAmount);

			int maximumCombinedGrantAmount = GetterUtil.getInteger(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_MAXIMUM_COMBINED_GRANT_AMOUNT));

			if (totalTransactionAmount > maximumCombinedGrantAmount) {
				double grantAmountLeft = BigDecimalUtil.subtract(maximumCombinedGrantAmount, currentTransactionsAmount);

				throw new AlloyException(translate("available-grant-amount-exceeded-you-only-have-x-left-for-this-year", EVPGrantRequestUtil.formatGrantAmount(grantAmountLeft, subsidiaryEVPDivision)));
			}

			if (transactionType == EVPGrantTransactionConstants.GRANT_TYPE_MATCHING) {
				UploadPortletRequest uploadPortletRequest = (UploadPortletRequest)request;

				String fullFileName = uploadPortletRequest.getFullFileName("matchingGrantReceiptFile");

				if (Validator.isNull(fullFileName)) {
					if (evpGrantRequest.getEvpGrantRequestId() == 0) {
						throw new AlloyException("a-receipt-for-the-matching-grant-is-required");
					}
				}
				else {
					File matchingGrantReceiptFile = uploadPortletRequest.getFile("matchingGrantReceiptFile");

					String[] allowedContentTypes = {ContentTypes.IMAGE_JPEG, "image/png", "image/gif", ContentTypes.APPLICATION_PDF, ContentTypes.APPLICATION_MSWORD, "application/vnd.openxmlformats-officedocument.wordprocessingml.document"};

					String contentType = MimeTypesUtil.getContentType(matchingGrantReceiptFile);

					if (!ArrayUtil.contains(allowedContentTypes, contentType)) {
						throw new AlloyException("the-file-extension-for-your-matching-grant-receipt-must-be-doc-docx-gif-jpeg-pdf-or-png");
					}
				}
			}
		}

		if (!atLeastOneChecked) {
			throw new AlloyException("please-select-at-least-one-grant-request-type");
		}

		String evpGrantRequestDescription = ParamUtil.getString(request, "evpGrantRequestDescription");

		if (Validator.isNull(evpGrantRequestDescription)) {
			throw new AlloyException("a-description-of-the-grant-requested-is-required");
		}

		_validateFieldLength(evpGrantRequestDescription.length(), EVPConstants.MAX_FIELD_LENGTH_TEXTAREA, "the-grant-description-character-length-exceeded-x-characters", new Object[] {EVPConstants.MAX_FIELD_LENGTH_TEXTAREA});
	}

	private void _validateSetOwnStatus(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateUpdateEVPGrantRequest(evpGrantRequest);
	}

	private void _validateUpdate(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateUpdateEVPGrantRequest(evpGrantRequest);
	}

	private void _validateUpdateEVPGrantRequest(EVPGrantRequest evpGrantRequest) throws Exception {
		_validateEVPGrantRequest(evpGrantRequest);

		EVPValidator.validateComment(request, "comments", true);

		_validateFields(evpGrantRequest);
	}

}
%>
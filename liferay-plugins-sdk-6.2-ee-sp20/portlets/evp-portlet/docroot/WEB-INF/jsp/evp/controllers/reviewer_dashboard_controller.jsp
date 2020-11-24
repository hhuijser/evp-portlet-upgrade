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
		setPermissioned(true);
	}

	public void addComment() throws Exception {
		EVPValidator.validateComment(request, "extraComments", true);

		EVPUtil.addCommentsToDiscussion(request, "extraComments");

		long subsidiaryGroupId = ParamUtil.getLong(request, "subsidiaryGroupId");
		String body = ParamUtil.getString(request, "extraComments");
		String className = ParamUtil.getString(request, "className");
		long classPK = ParamUtil.getLong(request, "classPK");

		EmailUtil.sendEVPTeamCommentEmail(this, subsidiaryGroupId, user.getFullName(), body, className, classPK);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void editGrant() throws Exception {
		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_setConstantsMaps(evpGrantRequest.getUserId());

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPGrantTransactionConstants", getConstantsBean(EVPGrantTransactionConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		renderRequest.setAttribute("evpGrantRequestComposite", new EVPGrantRequestComposite(evpGrantRequest, themeDisplay));

		render("../grant_requests/edit");
	}

	public void editService() throws Exception {
		_setConstantsMaps(0);

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPGrantTransactionConstants", getConstantsBean(EVPGrantTransactionConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletKeys", getConstantsBean(PortletKeys.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		renderRequest.setAttribute("portletURL", portletURL);

		render("../service_requests/edit");
	}

	public void indexGrant() throws Exception {
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		Indexer evpGrantRequestIndexer = IndexerRegistryUtil.nullSafeGetIndexer(EVPGrantRequest.class);

		AlloyServiceInvoker evpGrantRequestAlloyServiceInvoker = new AlloyServiceInvoker(EVPGrantRequest.class.getName());

		Map<String, Serializable> attributes = new HashMap<String, Serializable>();

		attributes.put("excludableUserId", user.getUserId());

		List<EVPDivision> reviewerSubsidiaryEVPDivisions = new ArrayList<EVPDivision>();

		List<EVPDivision> subsidiaryEVPDivisions = EVPDivisionUtil.getEVPDivisions(EVPDivisionConstants.TYPE_SUBSIDIARY);

		for (EVPDivision subsidiaryEVPDivision : subsidiaryEVPDivisions) {
			if (EVPPermission.contains(themeDisplay, "grant_requests", "index", subsidiaryEVPDivision.getOrganizationGroupId())) {
				reviewerSubsidiaryEVPDivisions.add(subsidiaryEVPDivision);
			}
		}

		String orderByCol = ParamUtil.getString(request, "orderByCol", "createDate");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "desc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("creatorUserFullName_sortable", false),
			new Sort("createDate_sortable", true)
		};

		String statusFilter = ParamUtil.getString(request, "statusFilter", EVPWorkflowConstants.STATUS_LABEL_ACTIVE);

		renderRequest.setAttribute("statusFilter", statusFilter);

		attributes.put("statusFilter", statusFilter);

		AlloySearchResult alloySearchResult = search(evpGrantRequestIndexer, evpGrantRequestAlloyServiceInvoker, request, portletRequest, null, attributes, null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPGrantRequestComposite> evpGrantRequestComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPGrantRequestComposite.class, new Class<?>[] {EVPGrantRequest.class, ThemeDisplay.class}, new Object[] {themeDisplay});

		renderRequest.setAttribute("evpGrantRequestComposites", evpGrantRequestComposites);

		renderRequest.setAttribute("grantTypeMap", EVPUtil.getGrantTypeMap(reviewerSubsidiaryEVPDivisions));

		renderRequest.setAttribute("searchableGrantLabels", EVPWorkflowConstants.getSearchableGrantLabels());

		render("../grant_requests/index");
	}

	public void indexService() throws Exception {
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));

		Indexer evpServiceRequestIndexer = IndexerRegistryUtil.nullSafeGetIndexer(EVPServiceRequest.class);

		AlloyServiceInvoker evpServiceRequestAlloyServiceInvoker = new AlloyServiceInvoker(EVPServiceRequest.class.getName());

		Map<String, Serializable> attributes = new HashMap<String, Serializable>();

		attributes.put("excludableUserId", user.getUserId());

		String statusFilter = ParamUtil.getString(request, "statusFilter", EVPWorkflowConstants.STATUS_LABEL_ACTIVE);

		renderRequest.setAttribute("statusFilter", statusFilter);

		attributes.put("statusFilter", statusFilter);

		String orderByCol = ParamUtil.getString(request, "orderByCol", "createDate");

		renderRequest.setAttribute("orderByCol", orderByCol);

		String orderByType = ParamUtil.getString(request, "orderByType", "desc");

		renderRequest.setAttribute("orderByType", orderByType);

		Sort[] sorts = {
			new Sort(orderByCol, orderByType.equals("desc")),
			new Sort("creatorUserFullName_sortable", true),
			new Sort("createDate", true)
		};

		AlloySearchResult alloySearchResult = search(evpServiceRequestIndexer, evpServiceRequestAlloyServiceInvoker, request, portletRequest, null, attributes, null, sorts);

		renderRequest.setAttribute("alloySearchResult", alloySearchResult);

		List<EVPServiceRequestComposite> evpServiceRequestComposites = EVPCompositeUtil.getComposites(alloySearchResult.getBaseModels(), EVPServiceRequestComposite.class, new Class<?>[] {EVPServiceRequest.class, ThemeDisplay.class}, new Object[] {themeDisplay});

		renderRequest.setAttribute("evpServiceRequestComposites", evpServiceRequestComposites);

		renderRequest.setAttribute("searchableServiceLabels", EVPWorkflowConstants.getSearchableServiceLabels());

		render("../service_requests/index");
	}

	public void setGrantStatus() throws Exception {
		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_validateSetGrantStatus(evpGrantRequest);

		long workflowTaskId = ParamUtil.getLong(request, "workflowTaskId");

		String transitionName = ParamUtil.getString(request, "transitionName");

		if (Validator.equals(transitionName, EVPWorkflowConstants.GRANT_TRANSITION_MARK_AS_CHECK_SENT)) {
			EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(evpGrantRequest.getUserId());

			List<EVPGrantTransaction> evpGrantTransactions = _fetchEVPGrantTransactions(evpGrantRequest.getEvpGrantRequestId());

			_validateEvpGrantTransaction(evpGrantTransactions);

			for (EVPGrantTransaction evpGrantTransaction : evpGrantTransactions) {
				String evpGrantTransactionType = EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType());

				Date date = EVPUtil.fetchDate(request, evpGrantTransactionType + "Date");

				evpGrantTransaction.setDate(date);

				String number = ParamUtil.getString(request, evpGrantTransactionType + "Number");

				evpGrantTransaction.setNumber(number);

				updateModel(evpGrantTransaction);
			}
		}

		String comments = ParamUtil.getString(request, "comments", EVPUtil.getWorkflowTaskComments(request));

		if (Validator.isNotNull(comments)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addGrantRequestVariables(this, evpGrantRequest.getEvpGrantRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpGrantRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(evpGrantRequest);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void setServiceStatus() throws Exception {
		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		_validateSetServiceStatus(evpServiceRequest);

		long workflowTaskId = ParamUtil.getLong(request, "workflowTaskId");

		String transitionName = ParamUtil.getString(request, "transitionName");

		if (transitionName.equals(EVPWorkflowConstants.SERVICE_TRANSITION_REQUEST_INFO_FROM_SERVICE_ORGANIZATION) || transitionName.equals(EVPWorkflowConstants.SERVICE_TRANSITION_SERVICE_COMPLETED)) {
			String contactUserHash = EVPUtil.generateHash(evpServiceRequest.getEvpServiceRequestId());

			evpServiceRequest.setHash(contactUserHash);

			updateModel(evpServiceRequest);
		}

		String comments = ParamUtil.getString(request, "comments", EVPUtil.getWorkflowTaskComments(request));

		if (transitionName.equals(EVPWorkflowConstants.SERVICE_TRANSITION_RESEND_ORGANIZATION_EMAIL)) {
			EVPServiceRequestComposite evpServiceRequestComposite = new EVPServiceRequestComposite(evpServiceRequest, themeDisplay);

			comments = evpServiceRequestComposite.getMostRecentComment();
		}

		Map<String, Serializable> workflowContext = EVPWorkflowContextVariablesUtil.addServiceRequestVariables(this, evpServiceRequest.getEvpServiceRequestId(), comments);

		EVPWorkflowUtil.transitionWorkflowTask(themeDisplay, workflowTaskId, transitionName, StringPool.BLANK, workflowContext, evpServiceRequest.getSubsidiaryGroupId());

		EVPWorkflowUtil.registerReindexCallback(evpServiceRequest);

		if (Validator.isNotNull(comments) && !transitionName.equals(EVPWorkflowConstants.SERVICE_TRANSITION_RESEND_ORGANIZATION_EMAIL)) {
			EVPUtil.addCommentsToDiscussion(request);
		}

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void viewGrant() throws Exception {
		EVPGrantRequest evpGrantRequest = _fetchEVPGrantRequest();

		_setConstantsMaps(evpGrantRequest.getUserId());

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));
		renderRequest.setAttribute("EVPGrantTransactionConstants", getConstantsBean(EVPGrantTransactionConstants.class));
		renderRequest.setAttribute("EVPWorkflowConstants", getConstantsBean(EVPWorkflowConstants.class));
		renderRequest.setAttribute("PortletPropsKeys", getConstantsBean(PortletPropsKeys.class));

		if (evpGrantRequest.getStatus() != 0) {
			List<WorkflowTask> workflowTasks = EVPWorkflowUtil.getWorkflowTasks(themeDisplay.getCompanyId(), EVPGrantRequest.class.getName(), evpGrantRequest.getEvpGrantRequestId());

			List<EVPWorkflowTaskComposite> evpWorkflowTaskComposites = EVPCompositeUtil.getComposites(workflowTasks, EVPWorkflowTaskComposite.class, new Class<?>[] {WorkflowTask.class, ThemeDisplay.class, long.class}, new Object[] {themeDisplay, evpGrantRequest.getUserId()});

			renderRequest.setAttribute("evpWorkflowTaskComposites", evpWorkflowTaskComposites);
		}

		renderRequest.setAttribute("evpGrantRequestComposite", new EVPGrantRequestComposite(evpGrantRequest, themeDisplay));

		portletURL.setParameter("id", String.valueOf(evpGrantRequest.getEvpGrantRequestId()));

		renderRequest.setAttribute("portletURL", portletURL);

		render("../grant_requests/view");
	}

	public void viewService() throws Exception {
		_setConstantsMaps(0);

		renderRequest.setAttribute("EVPConstants", getConstantsBean(EVPConstants.class));

		EVPServiceRequest evpServiceRequest = _fetchEVPServiceRequest();

		if (evpServiceRequest.getStatus() != 0) {
			List<WorkflowTask> workflowTasks = EVPWorkflowUtil.getWorkflowTasks(themeDisplay.getCompanyId(), EVPServiceRequest.class.getName(), evpServiceRequest.getEvpServiceRequestId());

			List<EVPWorkflowTaskComposite> evpWorkflowTaskComposites = EVPCompositeUtil.getComposites(workflowTasks, EVPWorkflowTaskComposite.class, new Class<?>[] {WorkflowTask.class, ThemeDisplay.class, long.class}, new Object[] {themeDisplay, evpServiceRequest.getUserId()});

			renderRequest.setAttribute("evpWorkflowTaskComposites", evpWorkflowTaskComposites);
		}

		renderRequest.setAttribute("evpServiceRequestComposite", new EVPServiceRequestComposite(evpServiceRequest, themeDisplay));

		portletURL.setParameter("id", String.valueOf(evpServiceRequest.getEvpServiceRequestId()));

		renderRequest.setAttribute("portletURL", portletURL);

		render("../service_requests/view");
	}

	@Override
	protected boolean hasPermission() {
		if (!permissioned) {
			return true;
		}

		if (!EVPPermission.contains(themeDisplay, controllerPath, "access")) {
			return false;
		}

		String action = StringUtil.replace(actionPath, new String[] {"Grant", "Service"}, new String[] {StringPool.BLANK, StringPool.BLANK});

		long id = ParamUtil.getLong(request, "id");

		try {
			if (id > 0) {
				BaseModel<?> baseModel = null;

				if (actionPath.contains("Grant")) {
					baseModel = EVPGrantRequestLocalServiceUtil.getEVPGrantRequest(id);
				}
				else if (actionPath.contains("Service")) {
					baseModel = EVPServiceRequestLocalServiceUtil.getEVPServiceRequest(id);
				}

				return EVPPermission.contains(themeDisplay, baseModel, action);
			}
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}

		String controller = controllerPath;

		if (actionPath.contains("Grant")) {
			controller = "grant_requests";
		}
		else if (actionPath.contains("Service")) {
			controller = "service_requests";
		}

		return EVPPermission.contains(themeDisplay, controller, action);
	}

	private EVPGrantRequest _fetchEVPGrantRequest() throws Exception {
		long evpGrantRequestId = ParamUtil.getLong(request, "id");

		return EVPGrantRequestLocalServiceUtil.fetchEVPGrantRequest(evpGrantRequestId);
	}

	private List<EVPGrantTransaction> _fetchEVPGrantTransactions(long evpGrantRequestId) throws Exception {
		AlloyServiceInvoker evpGrantTransactionAlloyServiceInvoker = new AlloyServiceInvoker(EVPGrantTransaction.class.getName());

		return evpGrantTransactionAlloyServiceInvoker.executeDynamicQuery(new Object[] {"evpGrantRequestId", evpGrantRequestId});
	}

	private EVPServiceRequest _fetchEVPServiceRequest() throws Exception {
		long evpServiceRequestId = ParamUtil.getLong(request, "id");

		return EVPServiceRequestLocalServiceUtil.fetchEVPServiceRequest(evpServiceRequestId);
	}

	private void _setConstantsMaps(long userId) throws Exception {
		renderRequest.setAttribute("behalfOfTypeMap", EVPUtil.getBehalfOfTypeMap());
		renderRequest.setAttribute("employmentTypeMap", EVPUtil.getEmploymentTypeMap());

		if (userId > 0) {
			renderRequest.setAttribute("grantTypeMap", EVPUtil.getGrantTypeMap(userId));
		}

		renderRequest.setAttribute("purposeTypeMap", EVPUtil.getPurposeTypeMap());
	}

	private void _validateEvpGrantTransaction(List<EVPGrantTransaction> evpGrantTransactions) throws Exception {
		for (EVPGrantTransaction evpGrantTransaction : evpGrantTransactions) {
			String comments = ParamUtil.getString(request, "comments");

			if (comments.length() > EVPConstants.MAX_FIELD_LENGTH_TEXTAREA) {
				throw new AlloyException(translate("the-comments-character-length-exceeded-x-characters", EVPConstants.MAX_FIELD_LENGTH_TEXTAREA));
			}

			String evpGrantTransactionType = EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType());

			EVPDivision subsidiaryEVPDivision = EVPDivisionUtil.getSubsidiaryEVPDivision(evpGrantTransaction.getUserId());

			boolean grantRequestBankWire = GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED));

			String dateString = ParamUtil.getString(request, evpGrantTransactionType + "Date");

			if (Validator.isNull(dateString)) {
				StringBundler sb = new StringBundler(4);

				sb.append("the-");
				sb.append(evpGrantTransactionType);

				if (GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED))) {
					sb.append("-transaction");
				}
				else {
					sb.append("-check");
				}

				sb.append("-date-is-required");

				throw new AlloyException(sb.toString());
			}

			String number = ParamUtil.getString(request, evpGrantTransactionType + "Number");

			if (Validator.isNull(number)) {
				StringBundler sb = new StringBundler(4);

				sb.append("the-");
				sb.append(evpGrantTransactionType);

				if (GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED))) {
					sb.append("-transaction");
				}
				else {
					sb.append("-check");
				}

				sb.append("-number-is-required");

				throw new AlloyException(sb.toString());
			}
			else if (number.length() > EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT) {
				String message = "the-x-check-number-character-length-exceeded-x-characters";

				if (GetterUtil.getBoolean(EVPDivisionLocalServiceUtil.getSubsidiaryPortletPropsValue(themeDisplay.getCompanyId(), subsidiaryEVPDivision.getOrganizationGroupId(), PortletPropsKeys.SUBSIDIARY_CONFIGURATION_GRANT_BANK_WIRE_ENABLED))) {
					message = "the-x-transaction-number-character-length-exceeded-x-characters";
				}

				throw new AlloyException(translate(message, new Object[] {EVPGrantTransactionConstants.getGrantTypeLabel(evpGrantTransaction.getGrantType()), EVPConstants.MAX_FIELD_LENGTH_PORTLET_DEFAULT}));
			}
		}
	}

	private void _validateSetGrantStatus(EVPGrantRequest evpGrantRequest) throws Exception {
		if (evpGrantRequest.getUserId() == user.getUserId()) {
			throw new AlloyException("reviewers-are-not-allowed-to-transition-their-own-grant-request");
		}

		EVPValidator.validateComment(request, EVPWorkflowConstants.SERVICE_TRANSITIONS_COMMENTS_REQUIRED);
	}

	private void _validateSetServiceStatus(EVPServiceRequest evpServiceRequest) throws Exception {
		if (evpServiceRequest.getUserId() == user.getUserId()) {
			throw new AlloyException("reviewers-are-not-allowed-to-transition-their-own-service-request");
		}

		EVPValidator.validateComment(request, EVPWorkflowConstants.SERVICE_TRANSITIONS_COMMENTS_REQUIRED);
	}

}
%>
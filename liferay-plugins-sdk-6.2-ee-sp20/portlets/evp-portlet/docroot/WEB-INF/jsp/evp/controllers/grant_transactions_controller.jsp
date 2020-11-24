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
public class AlloyControllerImpl extends BaseAlloyControllerImpl {

	public AlloyControllerImpl() {
		setAlloyServiceInvokerClass(EVPGrantTransaction.class);
	}

	public void add() throws Exception {
		EVPGrantTransaction evpGrantTransaction = EVPGrantTransactionLocalServiceUtil.createEVPGrantTransaction(0);

		_validateAdd();

		updateModel(evpGrantTransaction);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void create() throws Exception {
		EVPGrantTransaction evpGrantTransaction = EVPGrantTransactionLocalServiceUtil.createEVPGrantTransaction(0);

		renderRequest.setAttribute("evpGrantTransaction", evpGrantTransaction);
	}

	public void delete() throws Exception {
		EVPGrantTransaction evpGrantTransaction = _fetchEVPGrantTransaction();

		_validateDelete(evpGrantTransaction);

		EVPGrantTransactionLocalServiceUtil.deleteEVPGrantTransaction(evpGrantTransaction);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	public void edit() throws Exception {
		EVPGrantTransaction evpGrantTransaction = _fetchEVPGrantTransaction();

		renderRequest.setAttribute("evpGrantTransaction", evpGrantTransaction);
	}

	public void index() throws Exception {
		renderRequest.setAttribute("portletURL", portletURL);

		SearchContainer<EVPGrantTransaction> searchContainer = new SearchContainer<EVPGrantTransaction>(portletRequest, portletURL, null, null);

		List<EVPGrantTransaction> evpGrantTransactions = alloyServiceInvoker.executeDynamicQuery(new Object[] {"companyId", themeDisplay.getCompanyId()}, searchContainer.getStart(), searchContainer.getEnd(), null);

		renderRequest.setAttribute("evpGrantTransactions", evpGrantTransactions);

		long evpGrantTransactionsCount = alloyServiceInvoker.executeDynamicQueryCount(new Object[] {"companyId", themeDisplay.getCompanyId()});

		renderRequest.setAttribute("evpGrantTransactionsCount", evpGrantTransactionsCount);
	}

	public void update() throws Exception {
		EVPGrantTransaction evpGrantTransaction = _fetchEVPGrantTransaction();

		_validateUpdate(evpGrantTransaction);

		updateModel(evpGrantTransaction);

		addSuccessMessage();

		String redirect = ParamUtil.getString(request, "redirect");

		redirectTo(redirect);
	}

	private EVPGrantTransaction _fetchEVPGrantTransaction() throws Exception {
		long evpGrantTransactionId = ParamUtil.getLong(request, "id");

		return EVPGrantTransactionLocalServiceUtil.fetchEVPGrantTransaction(evpGrantTransactionId);
	}

	private void _validateAdd() throws Exception {
	}

	private void _validateDelete(EVPGrantTransaction evpGrantTransaction) throws Exception {
		_validateEVPGrantTransaction(evpGrantTransaction);
	}

	private void _validateEVPGrantTransaction(EVPGrantTransaction evpGrantTransaction) throws Exception {
		if (evpGrantTransaction == null) {
			throw new AlloyException("the-grant-request-does-not-exist");
		}
	}

	private void _validateUpdate(EVPGrantTransaction evpGrantTransaction) throws Exception {
		_validateEVPGrantTransaction(evpGrantTransaction);
	}

}
%>
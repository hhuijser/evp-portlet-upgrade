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

package com.liferay.evp.service;

import com.liferay.portal.service.ServiceWrapper;

/**
 * Provides a wrapper for {@link EVPGrantRequestLocalService}.
 *
 * @author Val Nagy
 * @see EVPGrantRequestLocalService
 * @generated
 */
public class EVPGrantRequestLocalServiceWrapper
	implements EVPGrantRequestLocalService,
		ServiceWrapper<EVPGrantRequestLocalService> {
	public EVPGrantRequestLocalServiceWrapper(
		EVPGrantRequestLocalService evpGrantRequestLocalService) {
		_evpGrantRequestLocalService = evpGrantRequestLocalService;
	}

	/**
	* Adds the e v p grant request to the database. Also notifies the appropriate model listeners.
	*
	* @param evpGrantRequest the e v p grant request
	* @return the e v p grant request that was added
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest addEVPGrantRequest(
		com.liferay.evp.model.EVPGrantRequest evpGrantRequest)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.addEVPGrantRequest(evpGrantRequest);
	}

	/**
	* Creates a new e v p grant request with the primary key. Does not add the e v p grant request to the database.
	*
	* @param evpGrantRequestId the primary key for the new e v p grant request
	* @return the new e v p grant request
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest createEVPGrantRequest(
		long evpGrantRequestId) {
		return _evpGrantRequestLocalService.createEVPGrantRequest(evpGrantRequestId);
	}

	/**
	* Deletes the e v p grant request with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpGrantRequestId the primary key of the e v p grant request
	* @return the e v p grant request that was removed
	* @throws PortalException if a e v p grant request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest deleteEVPGrantRequest(
		long evpGrantRequestId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.deleteEVPGrantRequest(evpGrantRequestId);
	}

	/**
	* Deletes the e v p grant request from the database. Also notifies the appropriate model listeners.
	*
	* @param evpGrantRequest the e v p grant request
	* @return the e v p grant request that was removed
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest deleteEVPGrantRequest(
		com.liferay.evp.model.EVPGrantRequest evpGrantRequest)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.deleteEVPGrantRequest(evpGrantRequest);
	}

	@Override
	public com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery() {
		return _evpGrantRequestLocalService.dynamicQuery();
	}

	/**
	* Performs a dynamic query on the database and returns the matching rows.
	*
	* @param dynamicQuery the dynamic query
	* @return the matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.dynamicQuery(dynamicQuery);
	}

	/**
	* Performs a dynamic query on the database and returns a range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPGrantRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @return the range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.dynamicQuery(dynamicQuery, start,
			end);
	}

	/**
	* Performs a dynamic query on the database and returns an ordered range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPGrantRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.dynamicQuery(dynamicQuery, start,
			end, orderByComparator);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.dynamicQueryCount(dynamicQuery);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @param projection the projection to apply to the query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery,
		com.liferay.portal.kernel.dao.orm.Projection projection)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.dynamicQueryCount(dynamicQuery,
			projection);
	}

	@Override
	public com.liferay.evp.model.EVPGrantRequest fetchEVPGrantRequest(
		long evpGrantRequestId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.fetchEVPGrantRequest(evpGrantRequestId);
	}

	/**
	* Returns the e v p grant request with the primary key.
	*
	* @param evpGrantRequestId the primary key of the e v p grant request
	* @return the e v p grant request
	* @throws PortalException if a e v p grant request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest getEVPGrantRequest(
		long evpGrantRequestId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.getEVPGrantRequest(evpGrantRequestId);
	}

	@Override
	public com.liferay.portal.model.PersistedModel getPersistedModel(
		java.io.Serializable primaryKeyObj)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.getPersistedModel(primaryKeyObj);
	}

	/**
	* Returns a range of all the e v p grant requests.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPGrantRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p grant requests
	* @param end the upper bound of the range of e v p grant requests (not inclusive)
	* @return the range of e v p grant requests
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.util.List<com.liferay.evp.model.EVPGrantRequest> getEVPGrantRequests(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.getEVPGrantRequests(start, end);
	}

	/**
	* Returns the number of e v p grant requests.
	*
	* @return the number of e v p grant requests
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public int getEVPGrantRequestsCount()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.getEVPGrantRequestsCount();
	}

	/**
	* Updates the e v p grant request in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param evpGrantRequest the e v p grant request
	* @return the e v p grant request that was updated
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public com.liferay.evp.model.EVPGrantRequest updateEVPGrantRequest(
		com.liferay.evp.model.EVPGrantRequest evpGrantRequest)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantRequestLocalService.updateEVPGrantRequest(evpGrantRequest);
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	@Override
	public java.lang.String getBeanIdentifier() {
		return _evpGrantRequestLocalService.getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	@Override
	public void setBeanIdentifier(java.lang.String beanIdentifier) {
		_evpGrantRequestLocalService.setBeanIdentifier(beanIdentifier);
	}

	@Override
	public java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return _evpGrantRequestLocalService.invokeMethod(name, parameterTypes,
			arguments);
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedService}
	 */
	public EVPGrantRequestLocalService getWrappedEVPGrantRequestLocalService() {
		return _evpGrantRequestLocalService;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #setWrappedService}
	 */
	public void setWrappedEVPGrantRequestLocalService(
		EVPGrantRequestLocalService evpGrantRequestLocalService) {
		_evpGrantRequestLocalService = evpGrantRequestLocalService;
	}

	@Override
	public EVPGrantRequestLocalService getWrappedService() {
		return _evpGrantRequestLocalService;
	}

	@Override
	public void setWrappedService(
		EVPGrantRequestLocalService evpGrantRequestLocalService) {
		_evpGrantRequestLocalService = evpGrantRequestLocalService;
	}

	private EVPGrantRequestLocalService _evpGrantRequestLocalService;
}
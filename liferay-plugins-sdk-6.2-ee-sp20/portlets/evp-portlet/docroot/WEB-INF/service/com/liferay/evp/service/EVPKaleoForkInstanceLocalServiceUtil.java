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

import com.liferay.portal.kernel.bean.PortletBeanLocatorUtil;
import com.liferay.portal.kernel.util.ReferenceRegistry;
import com.liferay.portal.service.InvokableLocalService;

/**
 * Provides the local service utility for EVPKaleoForkInstance. This utility wraps
 * {@link com.liferay.evp.service.impl.EVPKaleoForkInstanceLocalServiceImpl} and is the
 * primary access point for service operations in application layer code running
 * on the local server. Methods of this service will not have security checks
 * based on the propagated JAAS credentials because this service can only be
 * accessed from within the same VM.
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstanceLocalService
 * @see com.liferay.evp.service.base.EVPKaleoForkInstanceLocalServiceBaseImpl
 * @see com.liferay.evp.service.impl.EVPKaleoForkInstanceLocalServiceImpl
 * @generated
 */
public class EVPKaleoForkInstanceLocalServiceUtil {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify this class directly. Add custom service methods to {@link com.liferay.evp.service.impl.EVPKaleoForkInstanceLocalServiceImpl} and rerun ServiceBuilder to regenerate this class.
	 */

	/**
	* Adds the e v p kaleo fork instance to the database. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstance the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was added
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance addEVPKaleoForkInstance(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().addEVPKaleoForkInstance(evpKaleoForkInstance);
	}

	/**
	* Creates a new e v p kaleo fork instance with the primary key. Does not add the e v p kaleo fork instance to the database.
	*
	* @param evpKaleoForkInstanceId the primary key for the new e v p kaleo fork instance
	* @return the new e v p kaleo fork instance
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance createEVPKaleoForkInstance(
		long evpKaleoForkInstanceId) {
		return getService().createEVPKaleoForkInstance(evpKaleoForkInstanceId);
	}

	/**
	* Deletes the e v p kaleo fork instance with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was removed
	* @throws PortalException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance deleteEVPKaleoForkInstance(
		long evpKaleoForkInstanceId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().deleteEVPKaleoForkInstance(evpKaleoForkInstanceId);
	}

	/**
	* Deletes the e v p kaleo fork instance from the database. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstance the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was removed
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance deleteEVPKaleoForkInstance(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().deleteEVPKaleoForkInstance(evpKaleoForkInstance);
	}

	public static com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery() {
		return getService().dynamicQuery();
	}

	/**
	* Performs a dynamic query on the database and returns the matching rows.
	*
	* @param dynamicQuery the dynamic query
	* @return the matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQuery(dynamicQuery);
	}

	/**
	* Performs a dynamic query on the database and returns a range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPKaleoForkInstanceModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @return the range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQuery(dynamicQuery, start, end);
	}

	/**
	* Performs a dynamic query on the database and returns an ordered range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPKaleoForkInstanceModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService()
				   .dynamicQuery(dynamicQuery, start, end, orderByComparator);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	public static long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQueryCount(dynamicQuery);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @param projection the projection to apply to the query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	public static long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery,
		com.liferay.portal.kernel.dao.orm.Projection projection)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQueryCount(dynamicQuery, projection);
	}

	public static com.liferay.evp.model.EVPKaleoForkInstance fetchEVPKaleoForkInstance(
		long evpKaleoForkInstanceId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().fetchEVPKaleoForkInstance(evpKaleoForkInstanceId);
	}

	/**
	* Returns the e v p kaleo fork instance with the primary key.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance
	* @throws PortalException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance getEVPKaleoForkInstance(
		long evpKaleoForkInstanceId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPKaleoForkInstance(evpKaleoForkInstanceId);
	}

	public static com.liferay.portal.model.PersistedModel getPersistedModel(
		java.io.Serializable primaryKeyObj)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getPersistedModel(primaryKeyObj);
	}

	/**
	* Returns a range of all the e v p kaleo fork instances.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPKaleoForkInstanceModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p kaleo fork instances
	* @param end the upper bound of the range of e v p kaleo fork instances (not inclusive)
	* @return the range of e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> getEVPKaleoForkInstances(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPKaleoForkInstances(start, end);
	}

	/**
	* Returns the number of e v p kaleo fork instances.
	*
	* @return the number of e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public static int getEVPKaleoForkInstancesCount()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPKaleoForkInstancesCount();
	}

	/**
	* Updates the e v p kaleo fork instance in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstance the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was updated
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance updateEVPKaleoForkInstance(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().updateEVPKaleoForkInstance(evpKaleoForkInstance);
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	public static java.lang.String getBeanIdentifier() {
		return getService().getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	public static void setBeanIdentifier(java.lang.String beanIdentifier) {
		getService().setBeanIdentifier(beanIdentifier);
	}

	public static java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return getService().invokeMethod(name, parameterTypes, arguments);
	}

	public static com.liferay.evp.model.EVPKaleoForkInstance addEVPKaleoForkInstance(
		int status, int type,
		java.util.Map<java.lang.String, java.io.Serializable> workflowContext,
		com.liferay.portal.service.ServiceContext serviceContext)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService()
				   .addEVPKaleoForkInstance(status, type, workflowContext,
			serviceContext);
	}

	public static void clearService() {
		_service = null;
	}

	public static EVPKaleoForkInstanceLocalService getService() {
		if (_service == null) {
			InvokableLocalService invokableLocalService = (InvokableLocalService)PortletBeanLocatorUtil.locate(ClpSerializer.getServletContextName(),
					EVPKaleoForkInstanceLocalService.class.getName());

			if (invokableLocalService instanceof EVPKaleoForkInstanceLocalService) {
				_service = (EVPKaleoForkInstanceLocalService)invokableLocalService;
			}
			else {
				_service = new EVPKaleoForkInstanceLocalServiceClp(invokableLocalService);
			}

			ReferenceRegistry.registerReference(EVPKaleoForkInstanceLocalServiceUtil.class,
				"_service");
		}

		return _service;
	}

	/**
	 * @deprecated As of 6.2.0
	 */
	public void setService(EVPKaleoForkInstanceLocalService service) {
	}

	private static EVPKaleoForkInstanceLocalService _service;
}
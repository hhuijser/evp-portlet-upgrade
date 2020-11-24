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

package com.liferay.evp.service.persistence;

import com.liferay.evp.model.EVPKaleoForkInstance;

import com.liferay.portal.kernel.bean.PortletBeanLocatorUtil;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.ReferenceRegistry;
import com.liferay.portal.service.ServiceContext;

import java.util.List;

/**
 * The persistence utility for the e v p kaleo fork instance service. This utility wraps {@link EVPKaleoForkInstancePersistenceImpl} and provides direct access to the database for CRUD operations. This utility should only be used by the service layer, as it must operate within a transaction. Never access this utility in a JSP, controller, model, or other front-end class.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstancePersistence
 * @see EVPKaleoForkInstancePersistenceImpl
 * @generated
 */
public class EVPKaleoForkInstanceUtil {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify this class directly. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#clearCache()
	 */
	public static void clearCache() {
		getPersistence().clearCache();
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#clearCache(com.liferay.portal.model.BaseModel)
	 */
	public static void clearCache(EVPKaleoForkInstance evpKaleoForkInstance) {
		getPersistence().clearCache(evpKaleoForkInstance);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#countWithDynamicQuery(DynamicQuery)
	 */
	public static long countWithDynamicQuery(DynamicQuery dynamicQuery)
		throws SystemException {
		return getPersistence().countWithDynamicQuery(dynamicQuery);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#findWithDynamicQuery(DynamicQuery)
	 */
	public static List<EVPKaleoForkInstance> findWithDynamicQuery(
		DynamicQuery dynamicQuery) throws SystemException {
		return getPersistence().findWithDynamicQuery(dynamicQuery);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#findWithDynamicQuery(DynamicQuery, int, int)
	 */
	public static List<EVPKaleoForkInstance> findWithDynamicQuery(
		DynamicQuery dynamicQuery, int start, int end)
		throws SystemException {
		return getPersistence().findWithDynamicQuery(dynamicQuery, start, end);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#findWithDynamicQuery(DynamicQuery, int, int, OrderByComparator)
	 */
	public static List<EVPKaleoForkInstance> findWithDynamicQuery(
		DynamicQuery dynamicQuery, int start, int end,
		OrderByComparator orderByComparator) throws SystemException {
		return getPersistence()
				   .findWithDynamicQuery(dynamicQuery, start, end,
			orderByComparator);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#update(com.liferay.portal.model.BaseModel)
	 */
	public static EVPKaleoForkInstance update(
		EVPKaleoForkInstance evpKaleoForkInstance) throws SystemException {
		return getPersistence().update(evpKaleoForkInstance);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#update(com.liferay.portal.model.BaseModel, ServiceContext)
	 */
	public static EVPKaleoForkInstance update(
		EVPKaleoForkInstance evpKaleoForkInstance, ServiceContext serviceContext)
		throws SystemException {
		return getPersistence().update(evpKaleoForkInstance, serviceContext);
	}

	/**
	* Caches the e v p kaleo fork instance in the entity cache if it is enabled.
	*
	* @param evpKaleoForkInstance the e v p kaleo fork instance
	*/
	public static void cacheResult(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance) {
		getPersistence().cacheResult(evpKaleoForkInstance);
	}

	/**
	* Caches the e v p kaleo fork instances in the entity cache if it is enabled.
	*
	* @param evpKaleoForkInstances the e v p kaleo fork instances
	*/
	public static void cacheResult(
		java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> evpKaleoForkInstances) {
		getPersistence().cacheResult(evpKaleoForkInstances);
	}

	/**
	* Creates a new e v p kaleo fork instance with the primary key. Does not add the e v p kaleo fork instance to the database.
	*
	* @param evpKaleoForkInstanceId the primary key for the new e v p kaleo fork instance
	* @return the new e v p kaleo fork instance
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance create(
		long evpKaleoForkInstanceId) {
		return getPersistence().create(evpKaleoForkInstanceId);
	}

	/**
	* Removes the e v p kaleo fork instance with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was removed
	* @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance remove(
		long evpKaleoForkInstanceId)
		throws com.liferay.evp.NoSuchKaleoForkInstanceException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().remove(evpKaleoForkInstanceId);
	}

	public static com.liferay.evp.model.EVPKaleoForkInstance updateImpl(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().updateImpl(evpKaleoForkInstance);
	}

	/**
	* Returns the e v p kaleo fork instance with the primary key or throws a {@link com.liferay.evp.NoSuchKaleoForkInstanceException} if it could not be found.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance
	* @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance findByPrimaryKey(
		long evpKaleoForkInstanceId)
		throws com.liferay.evp.NoSuchKaleoForkInstanceException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findByPrimaryKey(evpKaleoForkInstanceId);
	}

	/**
	* Returns the e v p kaleo fork instance with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance, or <code>null</code> if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPKaleoForkInstance fetchByPrimaryKey(
		long evpKaleoForkInstanceId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().fetchByPrimaryKey(evpKaleoForkInstanceId);
	}

	/**
	* Returns all the e v p kaleo fork instances.
	*
	* @return the e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll();
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
	public static java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll(start, end);
	}

	/**
	* Returns an ordered range of all the e v p kaleo fork instances.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPKaleoForkInstanceModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p kaleo fork instances
	* @param end the upper bound of the range of e v p kaleo fork instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll(start, end, orderByComparator);
	}

	/**
	* Removes all the e v p kaleo fork instances from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public static void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		getPersistence().removeAll();
	}

	/**
	* Returns the number of e v p kaleo fork instances.
	*
	* @return the number of e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public static int countAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().countAll();
	}

	public static EVPKaleoForkInstancePersistence getPersistence() {
		if (_persistence == null) {
			_persistence = (EVPKaleoForkInstancePersistence)PortletBeanLocatorUtil.locate(com.liferay.evp.service.ClpSerializer.getServletContextName(),
					EVPKaleoForkInstancePersistence.class.getName());

			ReferenceRegistry.registerReference(EVPKaleoForkInstanceUtil.class,
				"_persistence");
		}

		return _persistence;
	}

	/**
	 * @deprecated As of 6.2.0
	 */
	public void setPersistence(EVPKaleoForkInstancePersistence persistence) {
	}

	private static EVPKaleoForkInstancePersistence _persistence;
}
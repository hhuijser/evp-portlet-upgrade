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

import com.liferay.portal.service.persistence.BasePersistence;

/**
 * The persistence interface for the e v p kaleo fork instance service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstancePersistenceImpl
 * @see EVPKaleoForkInstanceUtil
 * @generated
 */
public interface EVPKaleoForkInstancePersistence extends BasePersistence<EVPKaleoForkInstance> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. Always use {@link EVPKaleoForkInstanceUtil} to access the e v p kaleo fork instance persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this interface.
	 */

	/**
	* Caches the e v p kaleo fork instance in the entity cache if it is enabled.
	*
	* @param evpKaleoForkInstance the e v p kaleo fork instance
	*/
	public void cacheResult(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance);

	/**
	* Caches the e v p kaleo fork instances in the entity cache if it is enabled.
	*
	* @param evpKaleoForkInstances the e v p kaleo fork instances
	*/
	public void cacheResult(
		java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> evpKaleoForkInstances);

	/**
	* Creates a new e v p kaleo fork instance with the primary key. Does not add the e v p kaleo fork instance to the database.
	*
	* @param evpKaleoForkInstanceId the primary key for the new e v p kaleo fork instance
	* @return the new e v p kaleo fork instance
	*/
	public com.liferay.evp.model.EVPKaleoForkInstance create(
		long evpKaleoForkInstanceId);

	/**
	* Removes the e v p kaleo fork instance with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance that was removed
	* @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPKaleoForkInstance remove(
		long evpKaleoForkInstanceId)
		throws com.liferay.evp.NoSuchKaleoForkInstanceException,
			com.liferay.portal.kernel.exception.SystemException;

	public com.liferay.evp.model.EVPKaleoForkInstance updateImpl(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p kaleo fork instance with the primary key or throws a {@link com.liferay.evp.NoSuchKaleoForkInstanceException} if it could not be found.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance
	* @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPKaleoForkInstance findByPrimaryKey(
		long evpKaleoForkInstanceId)
		throws com.liferay.evp.NoSuchKaleoForkInstanceException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p kaleo fork instance with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	* @return the e v p kaleo fork instance, or <code>null</code> if a e v p kaleo fork instance with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPKaleoForkInstance fetchByPrimaryKey(
		long evpKaleoForkInstanceId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p kaleo fork instances.
	*
	* @return the e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll()
		throws com.liferay.portal.kernel.exception.SystemException;

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
	public java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

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
	public java.util.List<com.liferay.evp.model.EVPKaleoForkInstance> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p kaleo fork instances from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p kaleo fork instances.
	*
	* @return the number of e v p kaleo fork instances
	* @throws SystemException if a system exception occurred
	*/
	public int countAll()
		throws com.liferay.portal.kernel.exception.SystemException;
}
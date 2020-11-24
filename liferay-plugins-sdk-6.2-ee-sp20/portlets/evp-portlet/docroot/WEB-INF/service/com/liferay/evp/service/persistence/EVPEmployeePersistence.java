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

import com.liferay.evp.model.EVPEmployee;

import com.liferay.portal.service.persistence.BasePersistence;

/**
 * The persistence interface for the e v p employee service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPEmployeePersistenceImpl
 * @see EVPEmployeeUtil
 * @generated
 */
public interface EVPEmployeePersistence extends BasePersistence<EVPEmployee> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. Always use {@link EVPEmployeeUtil} to access the e v p employee persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this interface.
	 */

	/**
	* Returns the e v p employee where employeeUserId = &#63; or throws a {@link com.liferay.evp.NoSuchEmployeeException} if it could not be found.
	*
	* @param employeeUserId the employee user ID
	* @return the matching e v p employee
	* @throws com.liferay.evp.NoSuchEmployeeException if a matching e v p employee could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee findByEmployeeUserId(
		long employeeUserId)
		throws com.liferay.evp.NoSuchEmployeeException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p employee where employeeUserId = &#63; or returns <code>null</code> if it could not be found. Uses the finder cache.
	*
	* @param employeeUserId the employee user ID
	* @return the matching e v p employee, or <code>null</code> if a matching e v p employee could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee fetchByEmployeeUserId(
		long employeeUserId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p employee where employeeUserId = &#63; or returns <code>null</code> if it could not be found, optionally using the finder cache.
	*
	* @param employeeUserId the employee user ID
	* @param retrieveFromCache whether to use the finder cache
	* @return the matching e v p employee, or <code>null</code> if a matching e v p employee could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee fetchByEmployeeUserId(
		long employeeUserId, boolean retrieveFromCache)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes the e v p employee where employeeUserId = &#63; from the database.
	*
	* @param employeeUserId the employee user ID
	* @return the e v p employee that was removed
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee removeByEmployeeUserId(
		long employeeUserId)
		throws com.liferay.evp.NoSuchEmployeeException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p employees where employeeUserId = &#63;.
	*
	* @param employeeUserId the employee user ID
	* @return the number of matching e v p employees
	* @throws SystemException if a system exception occurred
	*/
	public int countByEmployeeUserId(long employeeUserId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Caches the e v p employee in the entity cache if it is enabled.
	*
	* @param evpEmployee the e v p employee
	*/
	public void cacheResult(com.liferay.evp.model.EVPEmployee evpEmployee);

	/**
	* Caches the e v p employees in the entity cache if it is enabled.
	*
	* @param evpEmployees the e v p employees
	*/
	public void cacheResult(
		java.util.List<com.liferay.evp.model.EVPEmployee> evpEmployees);

	/**
	* Creates a new e v p employee with the primary key. Does not add the e v p employee to the database.
	*
	* @param evpEmployeeId the primary key for the new e v p employee
	* @return the new e v p employee
	*/
	public com.liferay.evp.model.EVPEmployee create(long evpEmployeeId);

	/**
	* Removes the e v p employee with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpEmployeeId the primary key of the e v p employee
	* @return the e v p employee that was removed
	* @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee remove(long evpEmployeeId)
		throws com.liferay.evp.NoSuchEmployeeException,
			com.liferay.portal.kernel.exception.SystemException;

	public com.liferay.evp.model.EVPEmployee updateImpl(
		com.liferay.evp.model.EVPEmployee evpEmployee)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p employee with the primary key or throws a {@link com.liferay.evp.NoSuchEmployeeException} if it could not be found.
	*
	* @param evpEmployeeId the primary key of the e v p employee
	* @return the e v p employee
	* @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee findByPrimaryKey(
		long evpEmployeeId)
		throws com.liferay.evp.NoSuchEmployeeException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p employee with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpEmployeeId the primary key of the e v p employee
	* @return the e v p employee, or <code>null</code> if a e v p employee with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPEmployee fetchByPrimaryKey(
		long evpEmployeeId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p employees.
	*
	* @return the e v p employees
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPEmployee> findAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p employees.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPEmployeeModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p employees
	* @param end the upper bound of the range of e v p employees (not inclusive)
	* @return the range of e v p employees
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPEmployee> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p employees.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPEmployeeModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p employees
	* @param end the upper bound of the range of e v p employees (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of e v p employees
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPEmployee> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p employees from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p employees.
	*
	* @return the number of e v p employees
	* @throws SystemException if a system exception occurred
	*/
	public int countAll()
		throws com.liferay.portal.kernel.exception.SystemException;
}
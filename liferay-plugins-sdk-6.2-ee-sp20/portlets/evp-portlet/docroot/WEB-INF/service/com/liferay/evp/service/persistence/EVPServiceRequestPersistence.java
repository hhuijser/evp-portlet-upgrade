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

import com.liferay.evp.model.EVPServiceRequest;

import com.liferay.portal.service.persistence.BasePersistence;

/**
 * The persistence interface for the e v p service request service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPServiceRequestPersistenceImpl
 * @see EVPServiceRequestUtil
 * @generated
 */
public interface EVPServiceRequestPersistence extends BasePersistence<EVPServiceRequest> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. Always use {@link EVPServiceRequestUtil} to access the e v p service request persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this interface.
	 */

	/**
	* Returns all the e v p service requests where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @return the matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int status)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p service requests where companyId = &#63; and status &ne; &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param status the status
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @return the range of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int status, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p service requests where companyId = &#63; and status &ne; &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param status the status
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int status, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the first e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p service request
	* @throws com.liferay.evp.NoSuchServiceRequestException if a matching e v p service request could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest findByC_S_First(
		long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the first e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p service request, or <code>null</code> if a matching e v p service request could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest fetchByC_S_First(
		long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the last e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p service request
	* @throws com.liferay.evp.NoSuchServiceRequestException if a matching e v p service request could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest findByC_S_Last(
		long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the last e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p service request, or <code>null</code> if a matching e v p service request could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest fetchByC_S_Last(
		long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p service requests before and after the current e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	*
	* @param evpServiceRequestId the primary key of the current e v p service request
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p service request
	* @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest[] findByC_S_PrevAndNext(
		long evpServiceRequestId, long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @return the matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int status)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param status the status
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @return the range of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int status, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p service requests that the user has permissions to view where companyId = &#63; and status &ne; &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param status the status
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int status, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p service requests before and after the current e v p service request in the ordered set of e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	*
	* @param evpServiceRequestId the primary key of the current e v p service request
	* @param companyId the company ID
	* @param status the status
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p service request
	* @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest[] filterFindByC_S_PrevAndNext(
		long evpServiceRequestId, long companyId, int status,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @return the matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int[] statuses)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @return the range of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int[] statuses, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> filterFindByC_S(
		long companyId, int[] statuses, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p service requests where companyId = &#63; and status &ne; all &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @return the matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int[] statuses)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p service requests where companyId = &#63; and status &ne; all &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @return the range of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int[] statuses, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p service requests where companyId = &#63; and status &ne; all &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findByC_S(
		long companyId, int[] statuses, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p service requests where companyId = &#63; and status &ne; &#63; from the database.
	*
	* @param companyId the company ID
	* @param status the status
	* @throws SystemException if a system exception occurred
	*/
	public void removeByC_S(long companyId, int status)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p service requests where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @return the number of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public int countByC_S(long companyId, int status)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p service requests where companyId = &#63; and status &ne; all &#63;.
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @return the number of matching e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public int countByC_S(long companyId, int[] statuses)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	*
	* @param companyId the company ID
	* @param status the status
	* @return the number of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public int filterCountByC_S(long companyId, int status)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	*
	* @param companyId the company ID
	* @param statuses the statuses
	* @return the number of matching e v p service requests that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public int filterCountByC_S(long companyId, int[] statuses)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Caches the e v p service request in the entity cache if it is enabled.
	*
	* @param evpServiceRequest the e v p service request
	*/
	public void cacheResult(
		com.liferay.evp.model.EVPServiceRequest evpServiceRequest);

	/**
	* Caches the e v p service requests in the entity cache if it is enabled.
	*
	* @param evpServiceRequests the e v p service requests
	*/
	public void cacheResult(
		java.util.List<com.liferay.evp.model.EVPServiceRequest> evpServiceRequests);

	/**
	* Creates a new e v p service request with the primary key. Does not add the e v p service request to the database.
	*
	* @param evpServiceRequestId the primary key for the new e v p service request
	* @return the new e v p service request
	*/
	public com.liferay.evp.model.EVPServiceRequest create(
		long evpServiceRequestId);

	/**
	* Removes the e v p service request with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpServiceRequestId the primary key of the e v p service request
	* @return the e v p service request that was removed
	* @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest remove(
		long evpServiceRequestId)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	public com.liferay.evp.model.EVPServiceRequest updateImpl(
		com.liferay.evp.model.EVPServiceRequest evpServiceRequest)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p service request with the primary key or throws a {@link com.liferay.evp.NoSuchServiceRequestException} if it could not be found.
	*
	* @param evpServiceRequestId the primary key of the e v p service request
	* @return the e v p service request
	* @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest findByPrimaryKey(
		long evpServiceRequestId)
		throws com.liferay.evp.NoSuchServiceRequestException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p service request with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpServiceRequestId the primary key of the e v p service request
	* @return the e v p service request, or <code>null</code> if a e v p service request with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPServiceRequest fetchByPrimaryKey(
		long evpServiceRequestId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p service requests.
	*
	* @return the e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p service requests.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @return the range of e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p service requests.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPServiceRequestModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p service requests
	* @param end the upper bound of the range of e v p service requests (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPServiceRequest> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p service requests from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p service requests.
	*
	* @return the number of e v p service requests
	* @throws SystemException if a system exception occurred
	*/
	public int countAll()
		throws com.liferay.portal.kernel.exception.SystemException;
}
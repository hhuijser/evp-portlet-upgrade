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

import com.liferay.evp.model.EVPRequestOrganization;

import com.liferay.portal.service.persistence.BasePersistence;

/**
 * The persistence interface for the e v p request organization service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPRequestOrganizationPersistenceImpl
 * @see EVPRequestOrganizationUtil
 * @generated
 */
public interface EVPRequestOrganizationPersistence extends BasePersistence<EVPRequestOrganization> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. Always use {@link EVPRequestOrganizationUtil} to access the e v p request organization persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this interface.
	 */

	/**
	* Returns all the e v p request organizations where companyId = &#63;.
	*
	* @param companyId the company ID
	* @return the matching e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findByCompanyId(
		long companyId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p request organizations where companyId = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @return the range of matching e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findByCompanyId(
		long companyId, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p request organizations where companyId = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findByCompanyId(
		long companyId, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the first e v p request organization in the ordered set where companyId = &#63;.
	*
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p request organization
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a matching e v p request organization could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization findByCompanyId_First(
		long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the first e v p request organization in the ordered set where companyId = &#63;.
	*
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p request organization, or <code>null</code> if a matching e v p request organization could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization fetchByCompanyId_First(
		long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the last e v p request organization in the ordered set where companyId = &#63;.
	*
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p request organization
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a matching e v p request organization could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization findByCompanyId_Last(
		long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the last e v p request organization in the ordered set where companyId = &#63;.
	*
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p request organization, or <code>null</code> if a matching e v p request organization could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization fetchByCompanyId_Last(
		long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p request organizations before and after the current e v p request organization in the ordered set where companyId = &#63;.
	*
	* @param evpRequestOrganizationId the primary key of the current e v p request organization
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p request organization
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization[] findByCompanyId_PrevAndNext(
		long evpRequestOrganizationId, long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p request organizations that the user has permission to view where companyId = &#63;.
	*
	* @param companyId the company ID
	* @return the matching e v p request organizations that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> filterFindByCompanyId(
		long companyId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p request organizations that the user has permission to view where companyId = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @return the range of matching e v p request organizations that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> filterFindByCompanyId(
		long companyId, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p request organizations that the user has permissions to view where companyId = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p request organizations that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> filterFindByCompanyId(
		long companyId, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p request organizations before and after the current e v p request organization in the ordered set of e v p request organizations that the user has permission to view where companyId = &#63;.
	*
	* @param evpRequestOrganizationId the primary key of the current e v p request organization
	* @param companyId the company ID
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p request organization
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization[] filterFindByCompanyId_PrevAndNext(
		long evpRequestOrganizationId, long companyId,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p request organizations where companyId = &#63; from the database.
	*
	* @param companyId the company ID
	* @throws SystemException if a system exception occurred
	*/
	public void removeByCompanyId(long companyId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p request organizations where companyId = &#63;.
	*
	* @param companyId the company ID
	* @return the number of matching e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public int countByCompanyId(long companyId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p request organizations that the user has permission to view where companyId = &#63;.
	*
	* @param companyId the company ID
	* @return the number of matching e v p request organizations that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public int filterCountByCompanyId(long companyId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Caches the e v p request organization in the entity cache if it is enabled.
	*
	* @param evpRequestOrganization the e v p request organization
	*/
	public void cacheResult(
		com.liferay.evp.model.EVPRequestOrganization evpRequestOrganization);

	/**
	* Caches the e v p request organizations in the entity cache if it is enabled.
	*
	* @param evpRequestOrganizations the e v p request organizations
	*/
	public void cacheResult(
		java.util.List<com.liferay.evp.model.EVPRequestOrganization> evpRequestOrganizations);

	/**
	* Creates a new e v p request organization with the primary key. Does not add the e v p request organization to the database.
	*
	* @param evpRequestOrganizationId the primary key for the new e v p request organization
	* @return the new e v p request organization
	*/
	public com.liferay.evp.model.EVPRequestOrganization create(
		long evpRequestOrganizationId);

	/**
	* Removes the e v p request organization with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpRequestOrganizationId the primary key of the e v p request organization
	* @return the e v p request organization that was removed
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization remove(
		long evpRequestOrganizationId)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	public com.liferay.evp.model.EVPRequestOrganization updateImpl(
		com.liferay.evp.model.EVPRequestOrganization evpRequestOrganization)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p request organization with the primary key or throws a {@link com.liferay.evp.NoSuchRequestOrganizationException} if it could not be found.
	*
	* @param evpRequestOrganizationId the primary key of the e v p request organization
	* @return the e v p request organization
	* @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization findByPrimaryKey(
		long evpRequestOrganizationId)
		throws com.liferay.evp.NoSuchRequestOrganizationException,
			com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the e v p request organization with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpRequestOrganizationId the primary key of the e v p request organization
	* @return the e v p request organization, or <code>null</code> if a e v p request organization with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.evp.model.EVPRequestOrganization fetchByPrimaryKey(
		long evpRequestOrganizationId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the e v p request organizations.
	*
	* @return the e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the e v p request organizations.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @return the range of e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the e v p request organizations.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p request organizations
	* @param end the upper bound of the range of e v p request organizations (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.evp.model.EVPRequestOrganization> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the e v p request organizations from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of e v p request organizations.
	*
	* @return the number of e v p request organizations
	* @throws SystemException if a system exception occurred
	*/
	public int countAll()
		throws com.liferay.portal.kernel.exception.SystemException;
}
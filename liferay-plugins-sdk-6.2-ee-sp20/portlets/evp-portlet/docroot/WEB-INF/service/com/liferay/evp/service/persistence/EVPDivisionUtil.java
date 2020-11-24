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

import com.liferay.evp.model.EVPDivision;

import com.liferay.portal.kernel.bean.PortletBeanLocatorUtil;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.ReferenceRegistry;
import com.liferay.portal.service.ServiceContext;

import java.util.List;

/**
 * The persistence utility for the e v p division service. This utility wraps {@link EVPDivisionPersistenceImpl} and provides direct access to the database for CRUD operations. This utility should only be used by the service layer, as it must operate within a transaction. Never access this utility in a JSP, controller, model, or other front-end class.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPDivisionPersistence
 * @see EVPDivisionPersistenceImpl
 * @generated
 */
public class EVPDivisionUtil {
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
	public static void clearCache(EVPDivision evpDivision) {
		getPersistence().clearCache(evpDivision);
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
	public static List<EVPDivision> findWithDynamicQuery(
		DynamicQuery dynamicQuery) throws SystemException {
		return getPersistence().findWithDynamicQuery(dynamicQuery);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#findWithDynamicQuery(DynamicQuery, int, int)
	 */
	public static List<EVPDivision> findWithDynamicQuery(
		DynamicQuery dynamicQuery, int start, int end)
		throws SystemException {
		return getPersistence().findWithDynamicQuery(dynamicQuery, start, end);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#findWithDynamicQuery(DynamicQuery, int, int, OrderByComparator)
	 */
	public static List<EVPDivision> findWithDynamicQuery(
		DynamicQuery dynamicQuery, int start, int end,
		OrderByComparator orderByComparator) throws SystemException {
		return getPersistence()
				   .findWithDynamicQuery(dynamicQuery, start, end,
			orderByComparator);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#update(com.liferay.portal.model.BaseModel)
	 */
	public static EVPDivision update(EVPDivision evpDivision)
		throws SystemException {
		return getPersistence().update(evpDivision);
	}

	/**
	 * @see com.liferay.portal.service.persistence.BasePersistence#update(com.liferay.portal.model.BaseModel, ServiceContext)
	 */
	public static EVPDivision update(EVPDivision evpDivision,
		ServiceContext serviceContext) throws SystemException {
		return getPersistence().update(evpDivision, serviceContext);
	}

	/**
	* Returns all the e v p divisions where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @return the matching e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findByC_T(
		long companyId, int type)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findByC_T(companyId, type);
	}

	/**
	* Returns a range of all the e v p divisions where companyId = &#63; and type = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param type the type
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @return the range of matching e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findByC_T(
		long companyId, int type, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findByC_T(companyId, type, start, end);
	}

	/**
	* Returns an ordered range of all the e v p divisions where companyId = &#63; and type = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param type the type
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findByC_T(
		long companyId, int type, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .findByC_T(companyId, type, start, end, orderByComparator);
	}

	/**
	* Returns the first e v p division in the ordered set where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p division
	* @throws com.liferay.evp.NoSuchDivisionException if a matching e v p division could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision findByC_T_First(
		long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .findByC_T_First(companyId, type, orderByComparator);
	}

	/**
	* Returns the first e v p division in the ordered set where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the first matching e v p division, or <code>null</code> if a matching e v p division could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision fetchByC_T_First(
		long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .fetchByC_T_First(companyId, type, orderByComparator);
	}

	/**
	* Returns the last e v p division in the ordered set where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p division
	* @throws com.liferay.evp.NoSuchDivisionException if a matching e v p division could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision findByC_T_Last(
		long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .findByC_T_Last(companyId, type, orderByComparator);
	}

	/**
	* Returns the last e v p division in the ordered set where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the last matching e v p division, or <code>null</code> if a matching e v p division could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision fetchByC_T_Last(
		long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .fetchByC_T_Last(companyId, type, orderByComparator);
	}

	/**
	* Returns the e v p divisions before and after the current e v p division in the ordered set where companyId = &#63; and type = &#63;.
	*
	* @param evpDivisionId the primary key of the current e v p division
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p division
	* @throws com.liferay.evp.NoSuchDivisionException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision[] findByC_T_PrevAndNext(
		long evpDivisionId, long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .findByC_T_PrevAndNext(evpDivisionId, companyId, type,
			orderByComparator);
	}

	/**
	* Returns all the e v p divisions that the user has permission to view where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @return the matching e v p divisions that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> filterFindByC_T(
		long companyId, int type)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().filterFindByC_T(companyId, type);
	}

	/**
	* Returns a range of all the e v p divisions that the user has permission to view where companyId = &#63; and type = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param type the type
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @return the range of matching e v p divisions that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> filterFindByC_T(
		long companyId, int type, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().filterFindByC_T(companyId, type, start, end);
	}

	/**
	* Returns an ordered range of all the e v p divisions that the user has permissions to view where companyId = &#63; and type = &#63;.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param companyId the company ID
	* @param type the type
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching e v p divisions that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> filterFindByC_T(
		long companyId, int type, int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .filterFindByC_T(companyId, type, start, end,
			orderByComparator);
	}

	/**
	* Returns the e v p divisions before and after the current e v p division in the ordered set of e v p divisions that the user has permission to view where companyId = &#63; and type = &#63;.
	*
	* @param evpDivisionId the primary key of the current e v p division
	* @param companyId the company ID
	* @param type the type
	* @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	* @return the previous, current, and next e v p division
	* @throws com.liferay.evp.NoSuchDivisionException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision[] filterFindByC_T_PrevAndNext(
		long evpDivisionId, long companyId, int type,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence()
				   .filterFindByC_T_PrevAndNext(evpDivisionId, companyId, type,
			orderByComparator);
	}

	/**
	* Removes all the e v p divisions where companyId = &#63; and type = &#63; from the database.
	*
	* @param companyId the company ID
	* @param type the type
	* @throws SystemException if a system exception occurred
	*/
	public static void removeByC_T(long companyId, int type)
		throws com.liferay.portal.kernel.exception.SystemException {
		getPersistence().removeByC_T(companyId, type);
	}

	/**
	* Returns the number of e v p divisions where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @return the number of matching e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static int countByC_T(long companyId, int type)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().countByC_T(companyId, type);
	}

	/**
	* Returns the number of e v p divisions that the user has permission to view where companyId = &#63; and type = &#63;.
	*
	* @param companyId the company ID
	* @param type the type
	* @return the number of matching e v p divisions that the user has permission to view
	* @throws SystemException if a system exception occurred
	*/
	public static int filterCountByC_T(long companyId, int type)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().filterCountByC_T(companyId, type);
	}

	/**
	* Caches the e v p division in the entity cache if it is enabled.
	*
	* @param evpDivision the e v p division
	*/
	public static void cacheResult(
		com.liferay.evp.model.EVPDivision evpDivision) {
		getPersistence().cacheResult(evpDivision);
	}

	/**
	* Caches the e v p divisions in the entity cache if it is enabled.
	*
	* @param evpDivisions the e v p divisions
	*/
	public static void cacheResult(
		java.util.List<com.liferay.evp.model.EVPDivision> evpDivisions) {
		getPersistence().cacheResult(evpDivisions);
	}

	/**
	* Creates a new e v p division with the primary key. Does not add the e v p division to the database.
	*
	* @param evpDivisionId the primary key for the new e v p division
	* @return the new e v p division
	*/
	public static com.liferay.evp.model.EVPDivision create(long evpDivisionId) {
		return getPersistence().create(evpDivisionId);
	}

	/**
	* Removes the e v p division with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpDivisionId the primary key of the e v p division
	* @return the e v p division that was removed
	* @throws com.liferay.evp.NoSuchDivisionException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision remove(long evpDivisionId)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().remove(evpDivisionId);
	}

	public static com.liferay.evp.model.EVPDivision updateImpl(
		com.liferay.evp.model.EVPDivision evpDivision)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().updateImpl(evpDivision);
	}

	/**
	* Returns the e v p division with the primary key or throws a {@link com.liferay.evp.NoSuchDivisionException} if it could not be found.
	*
	* @param evpDivisionId the primary key of the e v p division
	* @return the e v p division
	* @throws com.liferay.evp.NoSuchDivisionException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision findByPrimaryKey(
		long evpDivisionId)
		throws com.liferay.evp.NoSuchDivisionException,
			com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findByPrimaryKey(evpDivisionId);
	}

	/**
	* Returns the e v p division with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param evpDivisionId the primary key of the e v p division
	* @return the e v p division, or <code>null</code> if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision fetchByPrimaryKey(
		long evpDivisionId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().fetchByPrimaryKey(evpDivisionId);
	}

	/**
	* Returns all the e v p divisions.
	*
	* @return the e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll();
	}

	/**
	* Returns a range of all the e v p divisions.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @return the range of e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findAll(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll(start, end);
	}

	/**
	* Returns an ordered range of all the e v p divisions.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of e v p divisions
	* @param end the upper bound of the range of e v p divisions (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static java.util.List<com.liferay.evp.model.EVPDivision> findAll(
		int start, int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().findAll(start, end, orderByComparator);
	}

	/**
	* Removes all the e v p divisions from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public static void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		getPersistence().removeAll();
	}

	/**
	* Returns the number of e v p divisions.
	*
	* @return the number of e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static int countAll()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getPersistence().countAll();
	}

	public static EVPDivisionPersistence getPersistence() {
		if (_persistence == null) {
			_persistence = (EVPDivisionPersistence)PortletBeanLocatorUtil.locate(com.liferay.evp.service.ClpSerializer.getServletContextName(),
					EVPDivisionPersistence.class.getName());

			ReferenceRegistry.registerReference(EVPDivisionUtil.class,
				"_persistence");
		}

		return _persistence;
	}

	/**
	 * @deprecated As of 6.2.0
	 */
	public void setPersistence(EVPDivisionPersistence persistence) {
	}

	private static EVPDivisionPersistence _persistence;
}
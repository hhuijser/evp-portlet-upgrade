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

import com.liferay.evp.NoSuchRequestOrganizationException;
import com.liferay.evp.model.EVPRequestOrganization;
import com.liferay.evp.model.impl.EVPRequestOrganizationImpl;
import com.liferay.evp.model.impl.EVPRequestOrganizationModelImpl;

import com.liferay.portal.kernel.cache.CacheRegistryUtil;
import com.liferay.portal.kernel.dao.orm.EntityCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderPath;
import com.liferay.portal.kernel.dao.orm.Query;
import com.liferay.portal.kernel.dao.orm.QueryPos;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.dao.orm.SQLQuery;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.InstanceFactory;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.UnmodifiableList;
import com.liferay.portal.model.CacheModel;
import com.liferay.portal.model.ModelListener;
import com.liferay.portal.security.permission.InlineSQLHelperUtil;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The persistence implementation for the e v p request organization service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPRequestOrganizationPersistence
 * @see EVPRequestOrganizationUtil
 * @generated
 */
public class EVPRequestOrganizationPersistenceImpl extends BasePersistenceImpl<EVPRequestOrganization>
	implements EVPRequestOrganizationPersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link EVPRequestOrganizationUtil} to access the e v p request organization persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = EVPRequestOrganizationImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_BY_COMPANYID =
		new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findByCompanyId",
			new String[] {
				Long.class.getName(),
				
			Integer.class.getName(), Integer.class.getName(),
				OrderByComparator.class.getName()
			});
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_BY_COMPANYID =
		new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findByCompanyId",
			new String[] { Long.class.getName() },
			EVPRequestOrganizationModelImpl.COMPANYID_COLUMN_BITMASK);
	public static final FinderPath FINDER_PATH_COUNT_BY_COMPANYID = new FinderPath(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countByCompanyId",
			new String[] { Long.class.getName() });

	/**
	 * Returns all the e v p request organizations where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @return the matching e v p request organizations
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPRequestOrganization> findByCompanyId(long companyId)
		throws SystemException {
		return findByCompanyId(companyId, QueryUtil.ALL_POS, QueryUtil.ALL_POS,
			null);
	}

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
	@Override
	public List<EVPRequestOrganization> findByCompanyId(long companyId,
		int start, int end) throws SystemException {
		return findByCompanyId(companyId, start, end, null);
	}

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
	@Override
	public List<EVPRequestOrganization> findByCompanyId(long companyId,
		int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		boolean pagination = true;
		FinderPath finderPath = null;
		Object[] finderArgs = null;

		if ((start == QueryUtil.ALL_POS) && (end == QueryUtil.ALL_POS) &&
				(orderByComparator == null)) {
			pagination = false;
			finderPath = FINDER_PATH_WITHOUT_PAGINATION_FIND_BY_COMPANYID;
			finderArgs = new Object[] { companyId };
		}
		else {
			finderPath = FINDER_PATH_WITH_PAGINATION_FIND_BY_COMPANYID;
			finderArgs = new Object[] { companyId, start, end, orderByComparator };
		}

		List<EVPRequestOrganization> list = (List<EVPRequestOrganization>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if ((list != null) && !list.isEmpty()) {
			for (EVPRequestOrganization evpRequestOrganization : list) {
				if ((companyId != evpRequestOrganization.getCompanyId())) {
					list = null;

					break;
				}
			}
		}

		if (list == null) {
			StringBundler query = null;

			if (orderByComparator != null) {
				query = new StringBundler(3 +
						(orderByComparator.getOrderByFields().length * 3));
			}
			else {
				query = new StringBundler(3);
			}

			query.append(_SQL_SELECT_EVPREQUESTORGANIZATION_WHERE);

			query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

			if (orderByComparator != null) {
				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);
			}
			else
			 if (pagination) {
				query.append(EVPRequestOrganizationModelImpl.ORDER_BY_JPQL);
			}

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				if (!pagination) {
					list = (List<EVPRequestOrganization>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPRequestOrganization>(list);
				}
				else {
					list = (List<EVPRequestOrganization>)QueryUtil.list(q,
							getDialect(), start, end);
				}

				cacheResult(list);

				FinderCacheUtil.putResult(finderPath, finderArgs, list);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(finderPath, finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return list;
	}

	/**
	 * Returns the first e v p request organization in the ordered set where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the first matching e v p request organization
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a matching e v p request organization could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization findByCompanyId_First(long companyId,
		OrderByComparator orderByComparator)
		throws NoSuchRequestOrganizationException, SystemException {
		EVPRequestOrganization evpRequestOrganization = fetchByCompanyId_First(companyId,
				orderByComparator);

		if (evpRequestOrganization != null) {
			return evpRequestOrganization;
		}

		StringBundler msg = new StringBundler(4);

		msg.append(_NO_SUCH_ENTITY_WITH_KEY);

		msg.append("companyId=");
		msg.append(companyId);

		msg.append(StringPool.CLOSE_CURLY_BRACE);

		throw new NoSuchRequestOrganizationException(msg.toString());
	}

	/**
	 * Returns the first e v p request organization in the ordered set where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the first matching e v p request organization, or <code>null</code> if a matching e v p request organization could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization fetchByCompanyId_First(long companyId,
		OrderByComparator orderByComparator) throws SystemException {
		List<EVPRequestOrganization> list = findByCompanyId(companyId, 0, 1,
				orderByComparator);

		if (!list.isEmpty()) {
			return list.get(0);
		}

		return null;
	}

	/**
	 * Returns the last e v p request organization in the ordered set where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the last matching e v p request organization
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a matching e v p request organization could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization findByCompanyId_Last(long companyId,
		OrderByComparator orderByComparator)
		throws NoSuchRequestOrganizationException, SystemException {
		EVPRequestOrganization evpRequestOrganization = fetchByCompanyId_Last(companyId,
				orderByComparator);

		if (evpRequestOrganization != null) {
			return evpRequestOrganization;
		}

		StringBundler msg = new StringBundler(4);

		msg.append(_NO_SUCH_ENTITY_WITH_KEY);

		msg.append("companyId=");
		msg.append(companyId);

		msg.append(StringPool.CLOSE_CURLY_BRACE);

		throw new NoSuchRequestOrganizationException(msg.toString());
	}

	/**
	 * Returns the last e v p request organization in the ordered set where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the last matching e v p request organization, or <code>null</code> if a matching e v p request organization could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization fetchByCompanyId_Last(long companyId,
		OrderByComparator orderByComparator) throws SystemException {
		int count = countByCompanyId(companyId);

		if (count == 0) {
			return null;
		}

		List<EVPRequestOrganization> list = findByCompanyId(companyId,
				count - 1, count, orderByComparator);

		if (!list.isEmpty()) {
			return list.get(0);
		}

		return null;
	}

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
	@Override
	public EVPRequestOrganization[] findByCompanyId_PrevAndNext(
		long evpRequestOrganizationId, long companyId,
		OrderByComparator orderByComparator)
		throws NoSuchRequestOrganizationException, SystemException {
		EVPRequestOrganization evpRequestOrganization = findByPrimaryKey(evpRequestOrganizationId);

		Session session = null;

		try {
			session = openSession();

			EVPRequestOrganization[] array = new EVPRequestOrganizationImpl[3];

			array[0] = getByCompanyId_PrevAndNext(session,
					evpRequestOrganization, companyId, orderByComparator, true);

			array[1] = evpRequestOrganization;

			array[2] = getByCompanyId_PrevAndNext(session,
					evpRequestOrganization, companyId, orderByComparator, false);

			return array;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	protected EVPRequestOrganization getByCompanyId_PrevAndNext(
		Session session, EVPRequestOrganization evpRequestOrganization,
		long companyId, OrderByComparator orderByComparator, boolean previous) {
		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(6 +
					(orderByComparator.getOrderByFields().length * 6));
		}
		else {
			query = new StringBundler(3);
		}

		query.append(_SQL_SELECT_EVPREQUESTORGANIZATION_WHERE);

		query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

		if (orderByComparator != null) {
			String[] orderByConditionFields = orderByComparator.getOrderByConditionFields();

			if (orderByConditionFields.length > 0) {
				query.append(WHERE_AND);
			}

			for (int i = 0; i < orderByConditionFields.length; i++) {
				query.append(_ORDER_BY_ENTITY_ALIAS);
				query.append(orderByConditionFields[i]);

				if ((i + 1) < orderByConditionFields.length) {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(WHERE_GREATER_THAN_HAS_NEXT);
					}
					else {
						query.append(WHERE_LESSER_THAN_HAS_NEXT);
					}
				}
				else {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(WHERE_GREATER_THAN);
					}
					else {
						query.append(WHERE_LESSER_THAN);
					}
				}
			}

			query.append(ORDER_BY_CLAUSE);

			String[] orderByFields = orderByComparator.getOrderByFields();

			for (int i = 0; i < orderByFields.length; i++) {
				query.append(_ORDER_BY_ENTITY_ALIAS);
				query.append(orderByFields[i]);

				if ((i + 1) < orderByFields.length) {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(ORDER_BY_ASC_HAS_NEXT);
					}
					else {
						query.append(ORDER_BY_DESC_HAS_NEXT);
					}
				}
				else {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(ORDER_BY_ASC);
					}
					else {
						query.append(ORDER_BY_DESC);
					}
				}
			}
		}
		else {
			query.append(EVPRequestOrganizationModelImpl.ORDER_BY_JPQL);
		}

		String sql = query.toString();

		Query q = session.createQuery(sql);

		q.setFirstResult(0);
		q.setMaxResults(2);

		QueryPos qPos = QueryPos.getInstance(q);

		qPos.add(companyId);

		if (orderByComparator != null) {
			Object[] values = orderByComparator.getOrderByConditionValues(evpRequestOrganization);

			for (Object value : values) {
				qPos.add(value);
			}
		}

		List<EVPRequestOrganization> list = q.list();

		if (list.size() == 2) {
			return list.get(1);
		}
		else {
			return null;
		}
	}

	/**
	 * Returns all the e v p request organizations that the user has permission to view where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @return the matching e v p request organizations that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPRequestOrganization> filterFindByCompanyId(long companyId)
		throws SystemException {
		return filterFindByCompanyId(companyId, QueryUtil.ALL_POS,
			QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPRequestOrganization> filterFindByCompanyId(long companyId,
		int start, int end) throws SystemException {
		return filterFindByCompanyId(companyId, start, end, null);
	}

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
	@Override
	public List<EVPRequestOrganization> filterFindByCompanyId(long companyId,
		int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return findByCompanyId(companyId, start, end, orderByComparator);
		}

		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(3 +
					(orderByComparator.getOrderByFields().length * 3));
		}
		else {
			query = new StringBundler(3);
		}

		if (getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_WHERE);
		}
		else {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_1);
		}

		query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

		if (!getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_2);
		}

		if (orderByComparator != null) {
			if (getDB().isSupportsInlineDistinct()) {
				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator, true);
			}
			else {
				appendOrderByComparator(query, _ORDER_BY_ENTITY_TABLE,
					orderByComparator, true);
			}
		}
		else {
			if (getDB().isSupportsInlineDistinct()) {
				query.append(EVPRequestOrganizationModelImpl.ORDER_BY_JPQL);
			}
			else {
				query.append(EVPRequestOrganizationModelImpl.ORDER_BY_SQL);
			}
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPRequestOrganization.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			if (getDB().isSupportsInlineDistinct()) {
				q.addEntity(_FILTER_ENTITY_ALIAS,
					EVPRequestOrganizationImpl.class);
			}
			else {
				q.addEntity(_FILTER_ENTITY_TABLE,
					EVPRequestOrganizationImpl.class);
			}

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			return (List<EVPRequestOrganization>)QueryUtil.list(q,
				getDialect(), start, end);
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

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
	@Override
	public EVPRequestOrganization[] filterFindByCompanyId_PrevAndNext(
		long evpRequestOrganizationId, long companyId,
		OrderByComparator orderByComparator)
		throws NoSuchRequestOrganizationException, SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return findByCompanyId_PrevAndNext(evpRequestOrganizationId,
				companyId, orderByComparator);
		}

		EVPRequestOrganization evpRequestOrganization = findByPrimaryKey(evpRequestOrganizationId);

		Session session = null;

		try {
			session = openSession();

			EVPRequestOrganization[] array = new EVPRequestOrganizationImpl[3];

			array[0] = filterGetByCompanyId_PrevAndNext(session,
					evpRequestOrganization, companyId, orderByComparator, true);

			array[1] = evpRequestOrganization;

			array[2] = filterGetByCompanyId_PrevAndNext(session,
					evpRequestOrganization, companyId, orderByComparator, false);

			return array;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	protected EVPRequestOrganization filterGetByCompanyId_PrevAndNext(
		Session session, EVPRequestOrganization evpRequestOrganization,
		long companyId, OrderByComparator orderByComparator, boolean previous) {
		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(6 +
					(orderByComparator.getOrderByFields().length * 6));
		}
		else {
			query = new StringBundler(3);
		}

		if (getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_WHERE);
		}
		else {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_1);
		}

		query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

		if (!getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_2);
		}

		if (orderByComparator != null) {
			String[] orderByConditionFields = orderByComparator.getOrderByConditionFields();

			if (orderByConditionFields.length > 0) {
				query.append(WHERE_AND);
			}

			for (int i = 0; i < orderByConditionFields.length; i++) {
				if (getDB().isSupportsInlineDistinct()) {
					query.append(_ORDER_BY_ENTITY_ALIAS);
				}
				else {
					query.append(_ORDER_BY_ENTITY_TABLE);
				}

				query.append(orderByConditionFields[i]);

				if ((i + 1) < orderByConditionFields.length) {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(WHERE_GREATER_THAN_HAS_NEXT);
					}
					else {
						query.append(WHERE_LESSER_THAN_HAS_NEXT);
					}
				}
				else {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(WHERE_GREATER_THAN);
					}
					else {
						query.append(WHERE_LESSER_THAN);
					}
				}
			}

			query.append(ORDER_BY_CLAUSE);

			String[] orderByFields = orderByComparator.getOrderByFields();

			for (int i = 0; i < orderByFields.length; i++) {
				if (getDB().isSupportsInlineDistinct()) {
					query.append(_ORDER_BY_ENTITY_ALIAS);
				}
				else {
					query.append(_ORDER_BY_ENTITY_TABLE);
				}

				query.append(orderByFields[i]);

				if ((i + 1) < orderByFields.length) {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(ORDER_BY_ASC_HAS_NEXT);
					}
					else {
						query.append(ORDER_BY_DESC_HAS_NEXT);
					}
				}
				else {
					if (orderByComparator.isAscending() ^ previous) {
						query.append(ORDER_BY_ASC);
					}
					else {
						query.append(ORDER_BY_DESC);
					}
				}
			}
		}
		else {
			if (getDB().isSupportsInlineDistinct()) {
				query.append(EVPRequestOrganizationModelImpl.ORDER_BY_JPQL);
			}
			else {
				query.append(EVPRequestOrganizationModelImpl.ORDER_BY_SQL);
			}
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPRequestOrganization.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		SQLQuery q = session.createSQLQuery(sql);

		q.setFirstResult(0);
		q.setMaxResults(2);

		if (getDB().isSupportsInlineDistinct()) {
			q.addEntity(_FILTER_ENTITY_ALIAS, EVPRequestOrganizationImpl.class);
		}
		else {
			q.addEntity(_FILTER_ENTITY_TABLE, EVPRequestOrganizationImpl.class);
		}

		QueryPos qPos = QueryPos.getInstance(q);

		qPos.add(companyId);

		if (orderByComparator != null) {
			Object[] values = orderByComparator.getOrderByConditionValues(evpRequestOrganization);

			for (Object value : values) {
				qPos.add(value);
			}
		}

		List<EVPRequestOrganization> list = q.list();

		if (list.size() == 2) {
			return list.get(1);
		}
		else {
			return null;
		}
	}

	/**
	 * Removes all the e v p request organizations where companyId = &#63; from the database.
	 *
	 * @param companyId the company ID
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeByCompanyId(long companyId) throws SystemException {
		for (EVPRequestOrganization evpRequestOrganization : findByCompanyId(
				companyId, QueryUtil.ALL_POS, QueryUtil.ALL_POS, null)) {
			remove(evpRequestOrganization);
		}
	}

	/**
	 * Returns the number of e v p request organizations where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @return the number of matching e v p request organizations
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countByCompanyId(long companyId) throws SystemException {
		FinderPath finderPath = FINDER_PATH_COUNT_BY_COMPANYID;

		Object[] finderArgs = new Object[] { companyId };

		Long count = (Long)FinderCacheUtil.getResult(finderPath, finderArgs,
				this);

		if (count == null) {
			StringBundler query = new StringBundler(2);

			query.append(_SQL_COUNT_EVPREQUESTORGANIZATION_WHERE);

			query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				count = (Long)q.uniqueResult();

				FinderCacheUtil.putResult(finderPath, finderArgs, count);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(finderPath, finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return count.intValue();
	}

	/**
	 * Returns the number of e v p request organizations that the user has permission to view where companyId = &#63;.
	 *
	 * @param companyId the company ID
	 * @return the number of matching e v p request organizations that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int filterCountByCompanyId(long companyId) throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return countByCompanyId(companyId);
		}

		StringBundler query = new StringBundler(2);

		query.append(_FILTER_SQL_COUNT_EVPREQUESTORGANIZATION_WHERE);

		query.append(_FINDER_COLUMN_COMPANYID_COMPANYID_2);

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPRequestOrganization.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			q.addScalar(COUNT_COLUMN_NAME,
				com.liferay.portal.kernel.dao.orm.Type.LONG);

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			Long count = (Long)q.uniqueResult();

			return count.intValue();
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	private static final String _FINDER_COLUMN_COMPANYID_COMPANYID_2 = "evpRequestOrganization.companyId = ?";

	public EVPRequestOrganizationPersistenceImpl() {
		setModelClass(EVPRequestOrganization.class);
	}

	/**
	 * Caches the e v p request organization in the entity cache if it is enabled.
	 *
	 * @param evpRequestOrganization the e v p request organization
	 */
	@Override
	public void cacheResult(EVPRequestOrganization evpRequestOrganization) {
		EntityCacheUtil.putResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			evpRequestOrganization.getPrimaryKey(), evpRequestOrganization);

		evpRequestOrganization.resetOriginalValues();
	}

	/**
	 * Caches the e v p request organizations in the entity cache if it is enabled.
	 *
	 * @param evpRequestOrganizations the e v p request organizations
	 */
	@Override
	public void cacheResult(
		List<EVPRequestOrganization> evpRequestOrganizations) {
		for (EVPRequestOrganization evpRequestOrganization : evpRequestOrganizations) {
			if (EntityCacheUtil.getResult(
						EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
						EVPRequestOrganizationImpl.class,
						evpRequestOrganization.getPrimaryKey()) == null) {
				cacheResult(evpRequestOrganization);
			}
			else {
				evpRequestOrganization.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all e v p request organizations.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(EVPRequestOrganizationImpl.class.getName());
		}

		EntityCacheUtil.clearCache(EVPRequestOrganizationImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the e v p request organization.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(EVPRequestOrganization evpRequestOrganization) {
		EntityCacheUtil.removeResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			evpRequestOrganization.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	@Override
	public void clearCache(List<EVPRequestOrganization> evpRequestOrganizations) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (EVPRequestOrganization evpRequestOrganization : evpRequestOrganizations) {
			EntityCacheUtil.removeResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
				EVPRequestOrganizationImpl.class,
				evpRequestOrganization.getPrimaryKey());
		}
	}

	/**
	 * Creates a new e v p request organization with the primary key. Does not add the e v p request organization to the database.
	 *
	 * @param evpRequestOrganizationId the primary key for the new e v p request organization
	 * @return the new e v p request organization
	 */
	@Override
	public EVPRequestOrganization create(long evpRequestOrganizationId) {
		EVPRequestOrganization evpRequestOrganization = new EVPRequestOrganizationImpl();

		evpRequestOrganization.setNew(true);
		evpRequestOrganization.setPrimaryKey(evpRequestOrganizationId);

		return evpRequestOrganization;
	}

	/**
	 * Removes the e v p request organization with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param evpRequestOrganizationId the primary key of the e v p request organization
	 * @return the e v p request organization that was removed
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization remove(long evpRequestOrganizationId)
		throws NoSuchRequestOrganizationException, SystemException {
		return remove((Serializable)evpRequestOrganizationId);
	}

	/**
	 * Removes the e v p request organization with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the e v p request organization
	 * @return the e v p request organization that was removed
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization remove(Serializable primaryKey)
		throws NoSuchRequestOrganizationException, SystemException {
		Session session = null;

		try {
			session = openSession();

			EVPRequestOrganization evpRequestOrganization = (EVPRequestOrganization)session.get(EVPRequestOrganizationImpl.class,
					primaryKey);

			if (evpRequestOrganization == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchRequestOrganizationException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(evpRequestOrganization);
		}
		catch (NoSuchRequestOrganizationException nsee) {
			throw nsee;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	@Override
	protected EVPRequestOrganization removeImpl(
		EVPRequestOrganization evpRequestOrganization)
		throws SystemException {
		evpRequestOrganization = toUnwrappedModel(evpRequestOrganization);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(evpRequestOrganization)) {
				evpRequestOrganization = (EVPRequestOrganization)session.get(EVPRequestOrganizationImpl.class,
						evpRequestOrganization.getPrimaryKeyObj());
			}

			if (evpRequestOrganization != null) {
				session.delete(evpRequestOrganization);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (evpRequestOrganization != null) {
			clearCache(evpRequestOrganization);
		}

		return evpRequestOrganization;
	}

	@Override
	public EVPRequestOrganization updateImpl(
		com.liferay.evp.model.EVPRequestOrganization evpRequestOrganization)
		throws SystemException {
		evpRequestOrganization = toUnwrappedModel(evpRequestOrganization);

		boolean isNew = evpRequestOrganization.isNew();

		EVPRequestOrganizationModelImpl evpRequestOrganizationModelImpl = (EVPRequestOrganizationModelImpl)evpRequestOrganization;

		Session session = null;

		try {
			session = openSession();

			if (evpRequestOrganization.isNew()) {
				session.save(evpRequestOrganization);

				evpRequestOrganization.setNew(false);
			}
			else {
				session.merge(evpRequestOrganization);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);

		if (isNew || !EVPRequestOrganizationModelImpl.COLUMN_BITMASK_ENABLED) {
			FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
		}

		else {
			if ((evpRequestOrganizationModelImpl.getColumnBitmask() &
					FINDER_PATH_WITHOUT_PAGINATION_FIND_BY_COMPANYID.getColumnBitmask()) != 0) {
				Object[] args = new Object[] {
						evpRequestOrganizationModelImpl.getOriginalCompanyId()
					};

				FinderCacheUtil.removeResult(FINDER_PATH_COUNT_BY_COMPANYID,
					args);
				FinderCacheUtil.removeResult(FINDER_PATH_WITHOUT_PAGINATION_FIND_BY_COMPANYID,
					args);

				args = new Object[] {
						evpRequestOrganizationModelImpl.getCompanyId()
					};

				FinderCacheUtil.removeResult(FINDER_PATH_COUNT_BY_COMPANYID,
					args);
				FinderCacheUtil.removeResult(FINDER_PATH_WITHOUT_PAGINATION_FIND_BY_COMPANYID,
					args);
			}
		}

		EntityCacheUtil.putResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
			EVPRequestOrganizationImpl.class,
			evpRequestOrganization.getPrimaryKey(), evpRequestOrganization);

		return evpRequestOrganization;
	}

	protected EVPRequestOrganization toUnwrappedModel(
		EVPRequestOrganization evpRequestOrganization) {
		if (evpRequestOrganization instanceof EVPRequestOrganizationImpl) {
			return evpRequestOrganization;
		}

		EVPRequestOrganizationImpl evpRequestOrganizationImpl = new EVPRequestOrganizationImpl();

		evpRequestOrganizationImpl.setNew(evpRequestOrganization.isNew());
		evpRequestOrganizationImpl.setPrimaryKey(evpRequestOrganization.getPrimaryKey());

		evpRequestOrganizationImpl.setEvpRequestOrganizationId(evpRequestOrganization.getEvpRequestOrganizationId());
		evpRequestOrganizationImpl.setCompanyId(evpRequestOrganization.getCompanyId());
		evpRequestOrganizationImpl.setUserId(evpRequestOrganization.getUserId());
		evpRequestOrganizationImpl.setUserName(evpRequestOrganization.getUserName());
		evpRequestOrganizationImpl.setCreateDate(evpRequestOrganization.getCreateDate());
		evpRequestOrganizationImpl.setModifiedDate(evpRequestOrganization.getModifiedDate());
		evpRequestOrganizationImpl.setOrganizationId(evpRequestOrganization.getOrganizationId());
		evpRequestOrganizationImpl.setSubsidiaryGroupId(evpRequestOrganization.getSubsidiaryGroupId());
		evpRequestOrganizationImpl.setDescription(evpRequestOrganization.getDescription());
		evpRequestOrganizationImpl.setTaxIdentificationNumber(evpRequestOrganization.getTaxIdentificationNumber());
		evpRequestOrganizationImpl.setNonprofitType(evpRequestOrganization.getNonprofitType());
		evpRequestOrganizationImpl.setVerified(evpRequestOrganization.isVerified());
		evpRequestOrganizationImpl.setShared(evpRequestOrganization.isShared());

		return evpRequestOrganizationImpl;
	}

	/**
	 * Returns the e v p request organization with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p request organization
	 * @return the e v p request organization
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization findByPrimaryKey(Serializable primaryKey)
		throws NoSuchRequestOrganizationException, SystemException {
		EVPRequestOrganization evpRequestOrganization = fetchByPrimaryKey(primaryKey);

		if (evpRequestOrganization == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchRequestOrganizationException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return evpRequestOrganization;
	}

	/**
	 * Returns the e v p request organization with the primary key or throws a {@link com.liferay.evp.NoSuchRequestOrganizationException} if it could not be found.
	 *
	 * @param evpRequestOrganizationId the primary key of the e v p request organization
	 * @return the e v p request organization
	 * @throws com.liferay.evp.NoSuchRequestOrganizationException if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization findByPrimaryKey(
		long evpRequestOrganizationId)
		throws NoSuchRequestOrganizationException, SystemException {
		return findByPrimaryKey((Serializable)evpRequestOrganizationId);
	}

	/**
	 * Returns the e v p request organization with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p request organization
	 * @return the e v p request organization, or <code>null</code> if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		EVPRequestOrganization evpRequestOrganization = (EVPRequestOrganization)EntityCacheUtil.getResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
				EVPRequestOrganizationImpl.class, primaryKey);

		if (evpRequestOrganization == _nullEVPRequestOrganization) {
			return null;
		}

		if (evpRequestOrganization == null) {
			Session session = null;

			try {
				session = openSession();

				evpRequestOrganization = (EVPRequestOrganization)session.get(EVPRequestOrganizationImpl.class,
						primaryKey);

				if (evpRequestOrganization != null) {
					cacheResult(evpRequestOrganization);
				}
				else {
					EntityCacheUtil.putResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
						EVPRequestOrganizationImpl.class, primaryKey,
						_nullEVPRequestOrganization);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(EVPRequestOrganizationModelImpl.ENTITY_CACHE_ENABLED,
					EVPRequestOrganizationImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return evpRequestOrganization;
	}

	/**
	 * Returns the e v p request organization with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param evpRequestOrganizationId the primary key of the e v p request organization
	 * @return the e v p request organization, or <code>null</code> if a e v p request organization with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPRequestOrganization fetchByPrimaryKey(
		long evpRequestOrganizationId) throws SystemException {
		return fetchByPrimaryKey((Serializable)evpRequestOrganizationId);
	}

	/**
	 * Returns all the e v p request organizations.
	 *
	 * @return the e v p request organizations
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPRequestOrganization> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPRequestOrganization> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
	}

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
	@Override
	public List<EVPRequestOrganization> findAll(int start, int end,
		OrderByComparator orderByComparator) throws SystemException {
		boolean pagination = true;
		FinderPath finderPath = null;
		Object[] finderArgs = null;

		if ((start == QueryUtil.ALL_POS) && (end == QueryUtil.ALL_POS) &&
				(orderByComparator == null)) {
			pagination = false;
			finderPath = FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL;
			finderArgs = FINDER_ARGS_EMPTY;
		}
		else {
			finderPath = FINDER_PATH_WITH_PAGINATION_FIND_ALL;
			finderArgs = new Object[] { start, end, orderByComparator };
		}

		List<EVPRequestOrganization> list = (List<EVPRequestOrganization>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_EVPREQUESTORGANIZATION);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_EVPREQUESTORGANIZATION;

				if (pagination) {
					sql = sql.concat(EVPRequestOrganizationModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<EVPRequestOrganization>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPRequestOrganization>(list);
				}
				else {
					list = (List<EVPRequestOrganization>)QueryUtil.list(q,
							getDialect(), start, end);
				}

				cacheResult(list);

				FinderCacheUtil.putResult(finderPath, finderArgs, list);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(finderPath, finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return list;
	}

	/**
	 * Removes all the e v p request organizations from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (EVPRequestOrganization evpRequestOrganization : findAll()) {
			remove(evpRequestOrganization);
		}
	}

	/**
	 * Returns the number of e v p request organizations.
	 *
	 * @return the number of e v p request organizations
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countAll() throws SystemException {
		Long count = (Long)FinderCacheUtil.getResult(FINDER_PATH_COUNT_ALL,
				FINDER_ARGS_EMPTY, this);

		if (count == null) {
			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(_SQL_COUNT_EVPREQUESTORGANIZATION);

				count = (Long)q.uniqueResult();

				FinderCacheUtil.putResult(FINDER_PATH_COUNT_ALL,
					FINDER_ARGS_EMPTY, count);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(FINDER_PATH_COUNT_ALL,
					FINDER_ARGS_EMPTY);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return count.intValue();
	}

	/**
	 * Initializes the e v p request organization persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.com.liferay.evp.model.EVPRequestOrganization")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<EVPRequestOrganization>> listenersList = new ArrayList<ModelListener<EVPRequestOrganization>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<EVPRequestOrganization>)InstanceFactory.newInstance(
							getClassLoader(), listenerClassName));
				}

				listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
			}
			catch (Exception e) {
				_log.error(e);
			}
		}
	}

	public void destroy() {
		EntityCacheUtil.removeCache(EVPRequestOrganizationImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_EVPREQUESTORGANIZATION = "SELECT evpRequestOrganization FROM EVPRequestOrganization evpRequestOrganization";
	private static final String _SQL_SELECT_EVPREQUESTORGANIZATION_WHERE = "SELECT evpRequestOrganization FROM EVPRequestOrganization evpRequestOrganization WHERE ";
	private static final String _SQL_COUNT_EVPREQUESTORGANIZATION = "SELECT COUNT(evpRequestOrganization) FROM EVPRequestOrganization evpRequestOrganization";
	private static final String _SQL_COUNT_EVPREQUESTORGANIZATION_WHERE = "SELECT COUNT(evpRequestOrganization) FROM EVPRequestOrganization evpRequestOrganization WHERE ";
	private static final String _FILTER_ENTITY_TABLE_FILTER_PK_COLUMN = "evpRequestOrganization.evpRequestOrganizationId";
	private static final String _FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_WHERE = "SELECT DISTINCT {evpRequestOrganization.*} FROM EVPRequestOrganization evpRequestOrganization WHERE ";
	private static final String _FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_1 =
		"SELECT {EVPRequestOrganization.*} FROM (SELECT DISTINCT evpRequestOrganization.evpRequestOrganizationId FROM EVPRequestOrganization evpRequestOrganization WHERE ";
	private static final String _FILTER_SQL_SELECT_EVPREQUESTORGANIZATION_NO_INLINE_DISTINCT_WHERE_2 =
		") TEMP_TABLE INNER JOIN EVPRequestOrganization ON TEMP_TABLE.evpRequestOrganizationId = EVPRequestOrganization.evpRequestOrganizationId";
	private static final String _FILTER_SQL_COUNT_EVPREQUESTORGANIZATION_WHERE = "SELECT COUNT(DISTINCT evpRequestOrganization.evpRequestOrganizationId) AS COUNT_VALUE FROM EVPRequestOrganization evpRequestOrganization WHERE ";
	private static final String _FILTER_ENTITY_ALIAS = "evpRequestOrganization";
	private static final String _FILTER_ENTITY_TABLE = "EVPRequestOrganization";
	private static final String _ORDER_BY_ENTITY_ALIAS = "evpRequestOrganization.";
	private static final String _ORDER_BY_ENTITY_TABLE = "EVPRequestOrganization.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No EVPRequestOrganization exists with the primary key ";
	private static final String _NO_SUCH_ENTITY_WITH_KEY = "No EVPRequestOrganization exists with the key {";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(EVPRequestOrganizationPersistenceImpl.class);
	private static EVPRequestOrganization _nullEVPRequestOrganization = new EVPRequestOrganizationImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<EVPRequestOrganization> toCacheModel() {
				return _nullEVPRequestOrganizationCacheModel;
			}
		};

	private static CacheModel<EVPRequestOrganization> _nullEVPRequestOrganizationCacheModel =
		new CacheModel<EVPRequestOrganization>() {
			@Override
			public EVPRequestOrganization toEntityModel() {
				return _nullEVPRequestOrganization;
			}
		};
}
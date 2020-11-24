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

import com.liferay.evp.NoSuchServiceRequestException;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.model.impl.EVPServiceRequestImpl;
import com.liferay.evp.model.impl.EVPServiceRequestModelImpl;

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
import com.liferay.portal.kernel.util.ArrayUtil;
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
 * The persistence implementation for the e v p service request service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPServiceRequestPersistence
 * @see EVPServiceRequestUtil
 * @generated
 */
public class EVPServiceRequestPersistenceImpl extends BasePersistenceImpl<EVPServiceRequest>
	implements EVPServiceRequestPersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link EVPServiceRequestUtil} to access the e v p service request persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = EVPServiceRequestImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestModelImpl.FINDER_CACHE_ENABLED,
			EVPServiceRequestImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestModelImpl.FINDER_CACHE_ENABLED,
			EVPServiceRequestImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_BY_C_S = new FinderPath(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestModelImpl.FINDER_CACHE_ENABLED,
			EVPServiceRequestImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findByC_S",
			new String[] {
				Long.class.getName(), Integer.class.getName(),
				
			Integer.class.getName(), Integer.class.getName(),
				OrderByComparator.class.getName()
			});
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_COUNT_BY_C_S = new FinderPath(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "countByC_S",
			new String[] { Long.class.getName(), Integer.class.getName() });

	/**
	 * Returns all the e v p service requests where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @return the matching e v p service requests
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int status)
		throws SystemException {
		return findByC_S(companyId, status, QueryUtil.ALL_POS,
			QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int status,
		int start, int end) throws SystemException {
		return findByC_S(companyId, status, start, end, null);
	}

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
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int status,
		int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		boolean pagination = true;
		FinderPath finderPath = null;
		Object[] finderArgs = null;

		finderPath = FINDER_PATH_WITH_PAGINATION_FIND_BY_C_S;
		finderArgs = new Object[] {
				companyId, status,
				
				start, end, orderByComparator
			};

		List<EVPServiceRequest> list = (List<EVPServiceRequest>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if ((list != null) && !list.isEmpty()) {
			for (EVPServiceRequest evpServiceRequest : list) {
				if ((companyId != evpServiceRequest.getCompanyId()) ||
						(status == evpServiceRequest.getStatus())) {
					list = null;

					break;
				}
			}
		}

		if (list == null) {
			StringBundler query = null;

			if (orderByComparator != null) {
				query = new StringBundler(4 +
						(orderByComparator.getOrderByFields().length * 3));
			}
			else {
				query = new StringBundler(4);
			}

			query.append(_SQL_SELECT_EVPSERVICEREQUEST_WHERE);

			query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

			query.append(_FINDER_COLUMN_C_S_STATUS_2);

			if (orderByComparator != null) {
				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);
			}
			else
			 if (pagination) {
				query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
			}

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				qPos.add(status);

				if (!pagination) {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPServiceRequest>(list);
				}
				else {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
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
	 * Returns the first e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the first matching e v p service request
	 * @throws com.liferay.evp.NoSuchServiceRequestException if a matching e v p service request could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest findByC_S_First(long companyId, int status,
		OrderByComparator orderByComparator)
		throws NoSuchServiceRequestException, SystemException {
		EVPServiceRequest evpServiceRequest = fetchByC_S_First(companyId,
				status, orderByComparator);

		if (evpServiceRequest != null) {
			return evpServiceRequest;
		}

		StringBundler msg = new StringBundler(6);

		msg.append(_NO_SUCH_ENTITY_WITH_KEY);

		msg.append("companyId=");
		msg.append(companyId);

		msg.append(", status=");
		msg.append(status);

		msg.append(StringPool.CLOSE_CURLY_BRACE);

		throw new NoSuchServiceRequestException(msg.toString());
	}

	/**
	 * Returns the first e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the first matching e v p service request, or <code>null</code> if a matching e v p service request could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest fetchByC_S_First(long companyId, int status,
		OrderByComparator orderByComparator) throws SystemException {
		List<EVPServiceRequest> list = findByC_S(companyId, status, 0, 1,
				orderByComparator);

		if (!list.isEmpty()) {
			return list.get(0);
		}

		return null;
	}

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
	@Override
	public EVPServiceRequest findByC_S_Last(long companyId, int status,
		OrderByComparator orderByComparator)
		throws NoSuchServiceRequestException, SystemException {
		EVPServiceRequest evpServiceRequest = fetchByC_S_Last(companyId,
				status, orderByComparator);

		if (evpServiceRequest != null) {
			return evpServiceRequest;
		}

		StringBundler msg = new StringBundler(6);

		msg.append(_NO_SUCH_ENTITY_WITH_KEY);

		msg.append("companyId=");
		msg.append(companyId);

		msg.append(", status=");
		msg.append(status);

		msg.append(StringPool.CLOSE_CURLY_BRACE);

		throw new NoSuchServiceRequestException(msg.toString());
	}

	/**
	 * Returns the last e v p service request in the ordered set where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @param orderByComparator the comparator to order the set by (optionally <code>null</code>)
	 * @return the last matching e v p service request, or <code>null</code> if a matching e v p service request could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest fetchByC_S_Last(long companyId, int status,
		OrderByComparator orderByComparator) throws SystemException {
		int count = countByC_S(companyId, status);

		if (count == 0) {
			return null;
		}

		List<EVPServiceRequest> list = findByC_S(companyId, status, count - 1,
				count, orderByComparator);

		if (!list.isEmpty()) {
			return list.get(0);
		}

		return null;
	}

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
	@Override
	public EVPServiceRequest[] findByC_S_PrevAndNext(long evpServiceRequestId,
		long companyId, int status, OrderByComparator orderByComparator)
		throws NoSuchServiceRequestException, SystemException {
		EVPServiceRequest evpServiceRequest = findByPrimaryKey(evpServiceRequestId);

		Session session = null;

		try {
			session = openSession();

			EVPServiceRequest[] array = new EVPServiceRequestImpl[3];

			array[0] = getByC_S_PrevAndNext(session, evpServiceRequest,
					companyId, status, orderByComparator, true);

			array[1] = evpServiceRequest;

			array[2] = getByC_S_PrevAndNext(session, evpServiceRequest,
					companyId, status, orderByComparator, false);

			return array;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	protected EVPServiceRequest getByC_S_PrevAndNext(Session session,
		EVPServiceRequest evpServiceRequest, long companyId, int status,
		OrderByComparator orderByComparator, boolean previous) {
		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(6 +
					(orderByComparator.getOrderByFields().length * 6));
		}
		else {
			query = new StringBundler(3);
		}

		query.append(_SQL_SELECT_EVPSERVICEREQUEST_WHERE);

		query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

		query.append(_FINDER_COLUMN_C_S_STATUS_2);

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
			query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
		}

		String sql = query.toString();

		Query q = session.createQuery(sql);

		q.setFirstResult(0);
		q.setMaxResults(2);

		QueryPos qPos = QueryPos.getInstance(q);

		qPos.add(companyId);

		qPos.add(status);

		if (orderByComparator != null) {
			Object[] values = orderByComparator.getOrderByConditionValues(evpServiceRequest);

			for (Object value : values) {
				qPos.add(value);
			}
		}

		List<EVPServiceRequest> list = q.list();

		if (list.size() == 2) {
			return list.get(1);
		}
		else {
			return null;
		}
	}

	/**
	 * Returns all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @return the matching e v p service requests that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId, int status)
		throws SystemException {
		return filterFindByC_S(companyId, status, QueryUtil.ALL_POS,
			QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId, int status,
		int start, int end) throws SystemException {
		return filterFindByC_S(companyId, status, start, end, null);
	}

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
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId, int status,
		int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return findByC_S(companyId, status, start, end, orderByComparator);
		}

		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(4 +
					(orderByComparator.getOrderByFields().length * 3));
		}
		else {
			query = new StringBundler(4);
		}

		if (getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_WHERE);
		}
		else {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_1);
		}

		query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

		query.append(_FINDER_COLUMN_C_S_STATUS_2);

		if (!getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_2);
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
				query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
			}
			else {
				query.append(EVPServiceRequestModelImpl.ORDER_BY_SQL);
			}
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPServiceRequest.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			if (getDB().isSupportsInlineDistinct()) {
				q.addEntity(_FILTER_ENTITY_ALIAS, EVPServiceRequestImpl.class);
			}
			else {
				q.addEntity(_FILTER_ENTITY_TABLE, EVPServiceRequestImpl.class);
			}

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			qPos.add(status);

			return (List<EVPServiceRequest>)QueryUtil.list(q, getDialect(),
				start, end);
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

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
	@Override
	public EVPServiceRequest[] filterFindByC_S_PrevAndNext(
		long evpServiceRequestId, long companyId, int status,
		OrderByComparator orderByComparator)
		throws NoSuchServiceRequestException, SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return findByC_S_PrevAndNext(evpServiceRequestId, companyId,
				status, orderByComparator);
		}

		EVPServiceRequest evpServiceRequest = findByPrimaryKey(evpServiceRequestId);

		Session session = null;

		try {
			session = openSession();

			EVPServiceRequest[] array = new EVPServiceRequestImpl[3];

			array[0] = filterGetByC_S_PrevAndNext(session, evpServiceRequest,
					companyId, status, orderByComparator, true);

			array[1] = evpServiceRequest;

			array[2] = filterGetByC_S_PrevAndNext(session, evpServiceRequest,
					companyId, status, orderByComparator, false);

			return array;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	protected EVPServiceRequest filterGetByC_S_PrevAndNext(Session session,
		EVPServiceRequest evpServiceRequest, long companyId, int status,
		OrderByComparator orderByComparator, boolean previous) {
		StringBundler query = null;

		if (orderByComparator != null) {
			query = new StringBundler(6 +
					(orderByComparator.getOrderByFields().length * 6));
		}
		else {
			query = new StringBundler(3);
		}

		if (getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_WHERE);
		}
		else {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_1);
		}

		query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

		query.append(_FINDER_COLUMN_C_S_STATUS_2);

		if (!getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_2);
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
				query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
			}
			else {
				query.append(EVPServiceRequestModelImpl.ORDER_BY_SQL);
			}
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPServiceRequest.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		SQLQuery q = session.createSQLQuery(sql);

		q.setFirstResult(0);
		q.setMaxResults(2);

		if (getDB().isSupportsInlineDistinct()) {
			q.addEntity(_FILTER_ENTITY_ALIAS, EVPServiceRequestImpl.class);
		}
		else {
			q.addEntity(_FILTER_ENTITY_TABLE, EVPServiceRequestImpl.class);
		}

		QueryPos qPos = QueryPos.getInstance(q);

		qPos.add(companyId);

		qPos.add(status);

		if (orderByComparator != null) {
			Object[] values = orderByComparator.getOrderByConditionValues(evpServiceRequest);

			for (Object value : values) {
				qPos.add(value);
			}
		}

		List<EVPServiceRequest> list = q.list();

		if (list.size() == 2) {
			return list.get(1);
		}
		else {
			return null;
		}
	}

	/**
	 * Returns all the e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	 *
	 * @param companyId the company ID
	 * @param statuses the statuses
	 * @return the matching e v p service requests that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId,
		int[] statuses) throws SystemException {
		return filterFindByC_S(companyId, statuses, QueryUtil.ALL_POS,
			QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId,
		int[] statuses, int start, int end) throws SystemException {
		return filterFindByC_S(companyId, statuses, start, end, null);
	}

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
	@Override
	public List<EVPServiceRequest> filterFindByC_S(long companyId,
		int[] statuses, int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return findByC_S(companyId, statuses, start, end, orderByComparator);
		}

		StringBundler query = new StringBundler();

		if (getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_WHERE);
		}
		else {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_1);
		}

		boolean conjunctionable = false;

		if (conjunctionable) {
			query.append(WHERE_AND);
		}

		query.append(_FINDER_COLUMN_C_S_COMPANYID_5);

		conjunctionable = true;

		if ((statuses == null) || (statuses.length > 0)) {
			if (conjunctionable) {
				query.append(WHERE_AND);
			}

			query.append(StringPool.OPEN_PARENTHESIS);

			for (int i = 0; i < statuses.length; i++) {
				query.append(_FINDER_COLUMN_C_S_STATUS_5);

				if ((i + 1) < statuses.length) {
					query.append(WHERE_AND);
				}
			}

			query.append(StringPool.CLOSE_PARENTHESIS);

			conjunctionable = true;
		}

		if (!getDB().isSupportsInlineDistinct()) {
			query.append(_FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_2);
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
				query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
			}
			else {
				query.append(EVPServiceRequestModelImpl.ORDER_BY_SQL);
			}
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPServiceRequest.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			if (getDB().isSupportsInlineDistinct()) {
				q.addEntity(_FILTER_ENTITY_ALIAS, EVPServiceRequestImpl.class);
			}
			else {
				q.addEntity(_FILTER_ENTITY_TABLE, EVPServiceRequestImpl.class);
			}

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			if (statuses != null) {
				qPos.add(statuses);
			}

			return (List<EVPServiceRequest>)QueryUtil.list(q, getDialect(),
				start, end);
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

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
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int[] statuses)
		throws SystemException {
		return findByC_S(companyId, statuses, QueryUtil.ALL_POS,
			QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int[] statuses,
		int start, int end) throws SystemException {
		return findByC_S(companyId, statuses, start, end, null);
	}

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
	@Override
	public List<EVPServiceRequest> findByC_S(long companyId, int[] statuses,
		int start, int end, OrderByComparator orderByComparator)
		throws SystemException {
		if ((statuses != null) && (statuses.length == 1)) {
			return findByC_S(companyId, statuses[0], start, end,
				orderByComparator);
		}

		boolean pagination = true;
		Object[] finderArgs = null;

		if ((start == QueryUtil.ALL_POS) && (end == QueryUtil.ALL_POS) &&
				(orderByComparator == null)) {
			pagination = false;
			finderArgs = new Object[] { companyId, StringUtil.merge(statuses) };
		}
		else {
			finderArgs = new Object[] {
					companyId, StringUtil.merge(statuses),
					
					start, end, orderByComparator
				};
		}

		List<EVPServiceRequest> list = (List<EVPServiceRequest>)FinderCacheUtil.getResult(FINDER_PATH_WITH_PAGINATION_FIND_BY_C_S,
				finderArgs, this);

		if ((list != null) && !list.isEmpty()) {
			for (EVPServiceRequest evpServiceRequest : list) {
				if ((companyId != evpServiceRequest.getCompanyId()) ||
						!ArrayUtil.contains(statuses,
							evpServiceRequest.getStatus())) {
					list = null;

					break;
				}
			}
		}

		if (list == null) {
			StringBundler query = new StringBundler();

			query.append(_SQL_SELECT_EVPSERVICEREQUEST_WHERE);

			boolean conjunctionable = false;

			if (conjunctionable) {
				query.append(WHERE_AND);
			}

			query.append(_FINDER_COLUMN_C_S_COMPANYID_5);

			conjunctionable = true;

			if ((statuses == null) || (statuses.length > 0)) {
				if (conjunctionable) {
					query.append(WHERE_AND);
				}

				query.append(StringPool.OPEN_PARENTHESIS);

				for (int i = 0; i < statuses.length; i++) {
					query.append(_FINDER_COLUMN_C_S_STATUS_5);

					if ((i + 1) < statuses.length) {
						query.append(WHERE_AND);
					}
				}

				query.append(StringPool.CLOSE_PARENTHESIS);

				conjunctionable = true;
			}

			if (orderByComparator != null) {
				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);
			}
			else
			 if (pagination) {
				query.append(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
			}

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				if (statuses != null) {
					qPos.add(statuses);
				}

				if (!pagination) {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPServiceRequest>(list);
				}
				else {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
							getDialect(), start, end);
				}

				cacheResult(list);

				FinderCacheUtil.putResult(FINDER_PATH_WITH_PAGINATION_FIND_BY_C_S,
					finderArgs, list);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(FINDER_PATH_WITH_PAGINATION_FIND_BY_C_S,
					finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return list;
	}

	/**
	 * Removes all the e v p service requests where companyId = &#63; and status &ne; &#63; from the database.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeByC_S(long companyId, int status)
		throws SystemException {
		for (EVPServiceRequest evpServiceRequest : findByC_S(companyId, status,
				QueryUtil.ALL_POS, QueryUtil.ALL_POS, null)) {
			remove(evpServiceRequest);
		}
	}

	/**
	 * Returns the number of e v p service requests where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @return the number of matching e v p service requests
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countByC_S(long companyId, int status) throws SystemException {
		FinderPath finderPath = FINDER_PATH_WITH_PAGINATION_COUNT_BY_C_S;

		Object[] finderArgs = new Object[] { companyId, status };

		Long count = (Long)FinderCacheUtil.getResult(finderPath, finderArgs,
				this);

		if (count == null) {
			StringBundler query = new StringBundler(3);

			query.append(_SQL_COUNT_EVPSERVICEREQUEST_WHERE);

			query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

			query.append(_FINDER_COLUMN_C_S_STATUS_2);

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				qPos.add(status);

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
	 * Returns the number of e v p service requests where companyId = &#63; and status &ne; all &#63;.
	 *
	 * @param companyId the company ID
	 * @param statuses the statuses
	 * @return the number of matching e v p service requests
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countByC_S(long companyId, int[] statuses)
		throws SystemException {
		Object[] finderArgs = new Object[] { companyId, StringUtil.merge(statuses) };

		Long count = (Long)FinderCacheUtil.getResult(FINDER_PATH_WITH_PAGINATION_COUNT_BY_C_S,
				finderArgs, this);

		if (count == null) {
			StringBundler query = new StringBundler();

			query.append(_SQL_COUNT_EVPSERVICEREQUEST_WHERE);

			boolean conjunctionable = false;

			if (conjunctionable) {
				query.append(WHERE_AND);
			}

			query.append(_FINDER_COLUMN_C_S_COMPANYID_5);

			conjunctionable = true;

			if ((statuses == null) || (statuses.length > 0)) {
				if (conjunctionable) {
					query.append(WHERE_AND);
				}

				query.append(StringPool.OPEN_PARENTHESIS);

				for (int i = 0; i < statuses.length; i++) {
					query.append(_FINDER_COLUMN_C_S_STATUS_5);

					if ((i + 1) < statuses.length) {
						query.append(WHERE_AND);
					}
				}

				query.append(StringPool.CLOSE_PARENTHESIS);

				conjunctionable = true;
			}

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(companyId);

				if (statuses != null) {
					qPos.add(statuses);
				}

				count = (Long)q.uniqueResult();

				FinderCacheUtil.putResult(FINDER_PATH_WITH_PAGINATION_COUNT_BY_C_S,
					finderArgs, count);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(FINDER_PATH_WITH_PAGINATION_COUNT_BY_C_S,
					finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return count.intValue();
	}

	/**
	 * Returns the number of e v p service requests that the user has permission to view where companyId = &#63; and status &ne; &#63;.
	 *
	 * @param companyId the company ID
	 * @param status the status
	 * @return the number of matching e v p service requests that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int filterCountByC_S(long companyId, int status)
		throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return countByC_S(companyId, status);
		}

		StringBundler query = new StringBundler(3);

		query.append(_FILTER_SQL_COUNT_EVPSERVICEREQUEST_WHERE);

		query.append(_FINDER_COLUMN_C_S_COMPANYID_2);

		query.append(_FINDER_COLUMN_C_S_STATUS_2);

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPServiceRequest.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			q.addScalar(COUNT_COLUMN_NAME,
				com.liferay.portal.kernel.dao.orm.Type.LONG);

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			qPos.add(status);

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

	/**
	 * Returns the number of e v p service requests that the user has permission to view where companyId = &#63; and status &ne; all &#63;.
	 *
	 * @param companyId the company ID
	 * @param statuses the statuses
	 * @return the number of matching e v p service requests that the user has permission to view
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int filterCountByC_S(long companyId, int[] statuses)
		throws SystemException {
		if (!InlineSQLHelperUtil.isEnabled()) {
			return countByC_S(companyId, statuses);
		}

		StringBundler query = new StringBundler();

		query.append(_FILTER_SQL_COUNT_EVPSERVICEREQUEST_WHERE);

		boolean conjunctionable = false;

		if (conjunctionable) {
			query.append(WHERE_AND);
		}

		query.append(_FINDER_COLUMN_C_S_COMPANYID_5);

		conjunctionable = true;

		if ((statuses == null) || (statuses.length > 0)) {
			if (conjunctionable) {
				query.append(WHERE_AND);
			}

			query.append(StringPool.OPEN_PARENTHESIS);

			for (int i = 0; i < statuses.length; i++) {
				query.append(_FINDER_COLUMN_C_S_STATUS_5);

				if ((i + 1) < statuses.length) {
					query.append(WHERE_AND);
				}
			}

			query.append(StringPool.CLOSE_PARENTHESIS);

			conjunctionable = true;
		}

		String sql = InlineSQLHelperUtil.replacePermissionCheck(query.toString(),
				EVPServiceRequest.class.getName(),
				_FILTER_ENTITY_TABLE_FILTER_PK_COLUMN);

		Session session = null;

		try {
			session = openSession();

			SQLQuery q = session.createSQLQuery(sql);

			q.addScalar(COUNT_COLUMN_NAME,
				com.liferay.portal.kernel.dao.orm.Type.LONG);

			QueryPos qPos = QueryPos.getInstance(q);

			qPos.add(companyId);

			if (statuses != null) {
				qPos.add(statuses);
			}

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

	private static final String _FINDER_COLUMN_C_S_COMPANYID_2 = "evpServiceRequest.companyId = ? AND ";
	private static final String _FINDER_COLUMN_C_S_COMPANYID_5 = "(" +
		removeConjunction(_FINDER_COLUMN_C_S_COMPANYID_2) + ")";
	private static final String _FINDER_COLUMN_C_S_STATUS_2 = "evpServiceRequest.status != ?";
	private static final String _FINDER_COLUMN_C_S_STATUS_5 = "(" +
		removeConjunction(_FINDER_COLUMN_C_S_STATUS_2) + ")";

	public EVPServiceRequestPersistenceImpl() {
		setModelClass(EVPServiceRequest.class);
	}

	/**
	 * Caches the e v p service request in the entity cache if it is enabled.
	 *
	 * @param evpServiceRequest the e v p service request
	 */
	@Override
	public void cacheResult(EVPServiceRequest evpServiceRequest) {
		EntityCacheUtil.putResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestImpl.class, evpServiceRequest.getPrimaryKey(),
			evpServiceRequest);

		evpServiceRequest.resetOriginalValues();
	}

	/**
	 * Caches the e v p service requests in the entity cache if it is enabled.
	 *
	 * @param evpServiceRequests the e v p service requests
	 */
	@Override
	public void cacheResult(List<EVPServiceRequest> evpServiceRequests) {
		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			if (EntityCacheUtil.getResult(
						EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
						EVPServiceRequestImpl.class,
						evpServiceRequest.getPrimaryKey()) == null) {
				cacheResult(evpServiceRequest);
			}
			else {
				evpServiceRequest.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all e v p service requests.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(EVPServiceRequestImpl.class.getName());
		}

		EntityCacheUtil.clearCache(EVPServiceRequestImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the e v p service request.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(EVPServiceRequest evpServiceRequest) {
		EntityCacheUtil.removeResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestImpl.class, evpServiceRequest.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	@Override
	public void clearCache(List<EVPServiceRequest> evpServiceRequests) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (EVPServiceRequest evpServiceRequest : evpServiceRequests) {
			EntityCacheUtil.removeResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
				EVPServiceRequestImpl.class, evpServiceRequest.getPrimaryKey());
		}
	}

	/**
	 * Creates a new e v p service request with the primary key. Does not add the e v p service request to the database.
	 *
	 * @param evpServiceRequestId the primary key for the new e v p service request
	 * @return the new e v p service request
	 */
	@Override
	public EVPServiceRequest create(long evpServiceRequestId) {
		EVPServiceRequest evpServiceRequest = new EVPServiceRequestImpl();

		evpServiceRequest.setNew(true);
		evpServiceRequest.setPrimaryKey(evpServiceRequestId);

		return evpServiceRequest;
	}

	/**
	 * Removes the e v p service request with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param evpServiceRequestId the primary key of the e v p service request
	 * @return the e v p service request that was removed
	 * @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest remove(long evpServiceRequestId)
		throws NoSuchServiceRequestException, SystemException {
		return remove((Serializable)evpServiceRequestId);
	}

	/**
	 * Removes the e v p service request with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the e v p service request
	 * @return the e v p service request that was removed
	 * @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest remove(Serializable primaryKey)
		throws NoSuchServiceRequestException, SystemException {
		Session session = null;

		try {
			session = openSession();

			EVPServiceRequest evpServiceRequest = (EVPServiceRequest)session.get(EVPServiceRequestImpl.class,
					primaryKey);

			if (evpServiceRequest == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchServiceRequestException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(evpServiceRequest);
		}
		catch (NoSuchServiceRequestException nsee) {
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
	protected EVPServiceRequest removeImpl(EVPServiceRequest evpServiceRequest)
		throws SystemException {
		evpServiceRequest = toUnwrappedModel(evpServiceRequest);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(evpServiceRequest)) {
				evpServiceRequest = (EVPServiceRequest)session.get(EVPServiceRequestImpl.class,
						evpServiceRequest.getPrimaryKeyObj());
			}

			if (evpServiceRequest != null) {
				session.delete(evpServiceRequest);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (evpServiceRequest != null) {
			clearCache(evpServiceRequest);
		}

		return evpServiceRequest;
	}

	@Override
	public EVPServiceRequest updateImpl(
		com.liferay.evp.model.EVPServiceRequest evpServiceRequest)
		throws SystemException {
		evpServiceRequest = toUnwrappedModel(evpServiceRequest);

		boolean isNew = evpServiceRequest.isNew();

		Session session = null;

		try {
			session = openSession();

			if (evpServiceRequest.isNew()) {
				session.save(evpServiceRequest);

				evpServiceRequest.setNew(false);
			}
			else {
				session.merge(evpServiceRequest);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);

		if (isNew || !EVPServiceRequestModelImpl.COLUMN_BITMASK_ENABLED) {
			FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
		}

		EntityCacheUtil.putResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
			EVPServiceRequestImpl.class, evpServiceRequest.getPrimaryKey(),
			evpServiceRequest);

		return evpServiceRequest;
	}

	protected EVPServiceRequest toUnwrappedModel(
		EVPServiceRequest evpServiceRequest) {
		if (evpServiceRequest instanceof EVPServiceRequestImpl) {
			return evpServiceRequest;
		}

		EVPServiceRequestImpl evpServiceRequestImpl = new EVPServiceRequestImpl();

		evpServiceRequestImpl.setNew(evpServiceRequest.isNew());
		evpServiceRequestImpl.setPrimaryKey(evpServiceRequest.getPrimaryKey());

		evpServiceRequestImpl.setEvpServiceRequestId(evpServiceRequest.getEvpServiceRequestId());
		evpServiceRequestImpl.setCompanyId(evpServiceRequest.getCompanyId());
		evpServiceRequestImpl.setUserId(evpServiceRequest.getUserId());
		evpServiceRequestImpl.setUserName(evpServiceRequest.getUserName());
		evpServiceRequestImpl.setCreateDate(evpServiceRequest.getCreateDate());
		evpServiceRequestImpl.setModifiedDate(evpServiceRequest.getModifiedDate());
		evpServiceRequestImpl.setContactEmailAddressId(evpServiceRequest.getContactEmailAddressId());
		evpServiceRequestImpl.setContactPhoneId(evpServiceRequest.getContactPhoneId());
		evpServiceRequestImpl.setContactUserId(evpServiceRequest.getContactUserId());
		evpServiceRequestImpl.setEvpRequestOrganizationId(evpServiceRequest.getEvpRequestOrganizationId());
		evpServiceRequestImpl.setManagerUserId(evpServiceRequest.getManagerUserId());
		evpServiceRequestImpl.setParentEVPServiceRequestId(evpServiceRequest.getParentEVPServiceRequestId());
		evpServiceRequestImpl.setRequestOrganizationAddressId(evpServiceRequest.getRequestOrganizationAddressId());
		evpServiceRequestImpl.setRequestOrganizationWebsiteId(evpServiceRequest.getRequestOrganizationWebsiteId());
		evpServiceRequestImpl.setSubsidiaryGroupId(evpServiceRequest.getSubsidiaryGroupId());
		evpServiceRequestImpl.setDescription(evpServiceRequest.getDescription());
		evpServiceRequestImpl.setEmploymentType(evpServiceRequest.getEmploymentType());
		evpServiceRequestImpl.setEmploymentHoursPerWeek(evpServiceRequest.getEmploymentHoursPerWeek());
		evpServiceRequestImpl.setPurpose(evpServiceRequest.getPurpose());
		evpServiceRequestImpl.setPurposeOther(evpServiceRequest.getPurposeOther());
		evpServiceRequestImpl.setBehalfOf(evpServiceRequest.getBehalfOf());
		evpServiceRequestImpl.setBehalfOfOther(evpServiceRequest.getBehalfOfOther());
		evpServiceRequestImpl.setRequestedStartDate(evpServiceRequest.getRequestedStartDate());
		evpServiceRequestImpl.setRequestedEndDate(evpServiceRequest.getRequestedEndDate());
		evpServiceRequestImpl.setRequestedTotalHours(evpServiceRequest.getRequestedTotalHours());
		evpServiceRequestImpl.setPromoteTrip(evpServiceRequest.isPromoteTrip());
		evpServiceRequestImpl.setConfirmedStartDate(evpServiceRequest.getConfirmedStartDate());
		evpServiceRequestImpl.setConfirmedEndDate(evpServiceRequest.getConfirmedEndDate());
		evpServiceRequestImpl.setConfirmedTotalHours(evpServiceRequest.getConfirmedTotalHours());
		evpServiceRequestImpl.setContactBenefit(evpServiceRequest.getContactBenefit());
		evpServiceRequestImpl.setContactComments(evpServiceRequest.getContactComments());
		evpServiceRequestImpl.setHash(evpServiceRequest.getHash());
		evpServiceRequestImpl.setFeedbackDescription(evpServiceRequest.getFeedbackDescription());
		evpServiceRequestImpl.setEmployeeBenefit(evpServiceRequest.getEmployeeBenefit());
		evpServiceRequestImpl.setRecipientBenefit(evpServiceRequest.getRecipientBenefit());
		evpServiceRequestImpl.setShareStory(evpServiceRequest.isShareStory());
		evpServiceRequestImpl.setStatus(evpServiceRequest.getStatus());
		evpServiceRequestImpl.setStatusByUserId(evpServiceRequest.getStatusByUserId());
		evpServiceRequestImpl.setStatusByUserName(evpServiceRequest.getStatusByUserName());
		evpServiceRequestImpl.setStatusDate(evpServiceRequest.getStatusDate());

		return evpServiceRequestImpl;
	}

	/**
	 * Returns the e v p service request with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p service request
	 * @return the e v p service request
	 * @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest findByPrimaryKey(Serializable primaryKey)
		throws NoSuchServiceRequestException, SystemException {
		EVPServiceRequest evpServiceRequest = fetchByPrimaryKey(primaryKey);

		if (evpServiceRequest == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchServiceRequestException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return evpServiceRequest;
	}

	/**
	 * Returns the e v p service request with the primary key or throws a {@link com.liferay.evp.NoSuchServiceRequestException} if it could not be found.
	 *
	 * @param evpServiceRequestId the primary key of the e v p service request
	 * @return the e v p service request
	 * @throws com.liferay.evp.NoSuchServiceRequestException if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest findByPrimaryKey(long evpServiceRequestId)
		throws NoSuchServiceRequestException, SystemException {
		return findByPrimaryKey((Serializable)evpServiceRequestId);
	}

	/**
	 * Returns the e v p service request with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p service request
	 * @return the e v p service request, or <code>null</code> if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		EVPServiceRequest evpServiceRequest = (EVPServiceRequest)EntityCacheUtil.getResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
				EVPServiceRequestImpl.class, primaryKey);

		if (evpServiceRequest == _nullEVPServiceRequest) {
			return null;
		}

		if (evpServiceRequest == null) {
			Session session = null;

			try {
				session = openSession();

				evpServiceRequest = (EVPServiceRequest)session.get(EVPServiceRequestImpl.class,
						primaryKey);

				if (evpServiceRequest != null) {
					cacheResult(evpServiceRequest);
				}
				else {
					EntityCacheUtil.putResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
						EVPServiceRequestImpl.class, primaryKey,
						_nullEVPServiceRequest);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(EVPServiceRequestModelImpl.ENTITY_CACHE_ENABLED,
					EVPServiceRequestImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return evpServiceRequest;
	}

	/**
	 * Returns the e v p service request with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param evpServiceRequestId the primary key of the e v p service request
	 * @return the e v p service request, or <code>null</code> if a e v p service request with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPServiceRequest fetchByPrimaryKey(long evpServiceRequestId)
		throws SystemException {
		return fetchByPrimaryKey((Serializable)evpServiceRequestId);
	}

	/**
	 * Returns all the e v p service requests.
	 *
	 * @return the e v p service requests
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPServiceRequest> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPServiceRequest> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
	}

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
	@Override
	public List<EVPServiceRequest> findAll(int start, int end,
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

		List<EVPServiceRequest> list = (List<EVPServiceRequest>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_EVPSERVICEREQUEST);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_EVPSERVICEREQUEST;

				if (pagination) {
					sql = sql.concat(EVPServiceRequestModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPServiceRequest>(list);
				}
				else {
					list = (List<EVPServiceRequest>)QueryUtil.list(q,
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
	 * Removes all the e v p service requests from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (EVPServiceRequest evpServiceRequest : findAll()) {
			remove(evpServiceRequest);
		}
	}

	/**
	 * Returns the number of e v p service requests.
	 *
	 * @return the number of e v p service requests
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

				Query q = session.createQuery(_SQL_COUNT_EVPSERVICEREQUEST);

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
	 * Initializes the e v p service request persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.com.liferay.evp.model.EVPServiceRequest")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<EVPServiceRequest>> listenersList = new ArrayList<ModelListener<EVPServiceRequest>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<EVPServiceRequest>)InstanceFactory.newInstance(
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
		EntityCacheUtil.removeCache(EVPServiceRequestImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_EVPSERVICEREQUEST = "SELECT evpServiceRequest FROM EVPServiceRequest evpServiceRequest";
	private static final String _SQL_SELECT_EVPSERVICEREQUEST_WHERE = "SELECT evpServiceRequest FROM EVPServiceRequest evpServiceRequest WHERE ";
	private static final String _SQL_COUNT_EVPSERVICEREQUEST = "SELECT COUNT(evpServiceRequest) FROM EVPServiceRequest evpServiceRequest";
	private static final String _SQL_COUNT_EVPSERVICEREQUEST_WHERE = "SELECT COUNT(evpServiceRequest) FROM EVPServiceRequest evpServiceRequest WHERE ";
	private static final String _FILTER_ENTITY_TABLE_FILTER_PK_COLUMN = "evpServiceRequest.evpServiceRequestId";
	private static final String _FILTER_SQL_SELECT_EVPSERVICEREQUEST_WHERE = "SELECT DISTINCT {evpServiceRequest.*} FROM EVPServiceRequest evpServiceRequest WHERE ";
	private static final String _FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_1 =
		"SELECT {EVPServiceRequest.*} FROM (SELECT DISTINCT evpServiceRequest.evpServiceRequestId FROM EVPServiceRequest evpServiceRequest WHERE ";
	private static final String _FILTER_SQL_SELECT_EVPSERVICEREQUEST_NO_INLINE_DISTINCT_WHERE_2 =
		") TEMP_TABLE INNER JOIN EVPServiceRequest ON TEMP_TABLE.evpServiceRequestId = EVPServiceRequest.evpServiceRequestId";
	private static final String _FILTER_SQL_COUNT_EVPSERVICEREQUEST_WHERE = "SELECT COUNT(DISTINCT evpServiceRequest.evpServiceRequestId) AS COUNT_VALUE FROM EVPServiceRequest evpServiceRequest WHERE ";
	private static final String _FILTER_ENTITY_ALIAS = "evpServiceRequest";
	private static final String _FILTER_ENTITY_TABLE = "EVPServiceRequest";
	private static final String _ORDER_BY_ENTITY_ALIAS = "evpServiceRequest.";
	private static final String _ORDER_BY_ENTITY_TABLE = "EVPServiceRequest.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No EVPServiceRequest exists with the primary key ";
	private static final String _NO_SUCH_ENTITY_WITH_KEY = "No EVPServiceRequest exists with the key {";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(EVPServiceRequestPersistenceImpl.class);
	private static EVPServiceRequest _nullEVPServiceRequest = new EVPServiceRequestImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<EVPServiceRequest> toCacheModel() {
				return _nullEVPServiceRequestCacheModel;
			}
		};

	private static CacheModel<EVPServiceRequest> _nullEVPServiceRequestCacheModel =
		new CacheModel<EVPServiceRequest>() {
			@Override
			public EVPServiceRequest toEntityModel() {
				return _nullEVPServiceRequest;
			}
		};
}
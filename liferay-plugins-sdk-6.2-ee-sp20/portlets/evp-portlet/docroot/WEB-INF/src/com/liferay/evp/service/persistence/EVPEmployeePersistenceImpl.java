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

import com.liferay.evp.NoSuchEmployeeException;
import com.liferay.evp.model.EVPEmployee;
import com.liferay.evp.model.impl.EVPEmployeeImpl;
import com.liferay.evp.model.impl.EVPEmployeeModelImpl;

import com.liferay.portal.kernel.cache.CacheRegistryUtil;
import com.liferay.portal.kernel.dao.orm.EntityCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderPath;
import com.liferay.portal.kernel.dao.orm.Query;
import com.liferay.portal.kernel.dao.orm.QueryPos;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
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
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The persistence implementation for the e v p employee service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPEmployeePersistence
 * @see EVPEmployeeUtil
 * @generated
 */
public class EVPEmployeePersistenceImpl extends BasePersistenceImpl<EVPEmployee>
	implements EVPEmployeePersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link EVPEmployeeUtil} to access the e v p employee persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = EVPEmployeeImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeModelImpl.FINDER_CACHE_ENABLED, EVPEmployeeImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeModelImpl.FINDER_CACHE_ENABLED, EVPEmployeeImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);
	public static final FinderPath FINDER_PATH_FETCH_BY_EMPLOYEEUSERID = new FinderPath(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeModelImpl.FINDER_CACHE_ENABLED, EVPEmployeeImpl.class,
			FINDER_CLASS_NAME_ENTITY, "fetchByEmployeeUserId",
			new String[] { Long.class.getName() },
			EVPEmployeeModelImpl.EMPLOYEEUSERID_COLUMN_BITMASK);
	public static final FinderPath FINDER_PATH_COUNT_BY_EMPLOYEEUSERID = new FinderPath(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countByEmployeeUserId",
			new String[] { Long.class.getName() });

	/**
	 * Returns the e v p employee where employeeUserId = &#63; or throws a {@link com.liferay.evp.NoSuchEmployeeException} if it could not be found.
	 *
	 * @param employeeUserId the employee user ID
	 * @return the matching e v p employee
	 * @throws com.liferay.evp.NoSuchEmployeeException if a matching e v p employee could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee findByEmployeeUserId(long employeeUserId)
		throws NoSuchEmployeeException, SystemException {
		EVPEmployee evpEmployee = fetchByEmployeeUserId(employeeUserId);

		if (evpEmployee == null) {
			StringBundler msg = new StringBundler(4);

			msg.append(_NO_SUCH_ENTITY_WITH_KEY);

			msg.append("employeeUserId=");
			msg.append(employeeUserId);

			msg.append(StringPool.CLOSE_CURLY_BRACE);

			if (_log.isWarnEnabled()) {
				_log.warn(msg.toString());
			}

			throw new NoSuchEmployeeException(msg.toString());
		}

		return evpEmployee;
	}

	/**
	 * Returns the e v p employee where employeeUserId = &#63; or returns <code>null</code> if it could not be found. Uses the finder cache.
	 *
	 * @param employeeUserId the employee user ID
	 * @return the matching e v p employee, or <code>null</code> if a matching e v p employee could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee fetchByEmployeeUserId(long employeeUserId)
		throws SystemException {
		return fetchByEmployeeUserId(employeeUserId, true);
	}

	/**
	 * Returns the e v p employee where employeeUserId = &#63; or returns <code>null</code> if it could not be found, optionally using the finder cache.
	 *
	 * @param employeeUserId the employee user ID
	 * @param retrieveFromCache whether to use the finder cache
	 * @return the matching e v p employee, or <code>null</code> if a matching e v p employee could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee fetchByEmployeeUserId(long employeeUserId,
		boolean retrieveFromCache) throws SystemException {
		Object[] finderArgs = new Object[] { employeeUserId };

		Object result = null;

		if (retrieveFromCache) {
			result = FinderCacheUtil.getResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
					finderArgs, this);
		}

		if (result instanceof EVPEmployee) {
			EVPEmployee evpEmployee = (EVPEmployee)result;

			if ((employeeUserId != evpEmployee.getEmployeeUserId())) {
				result = null;
			}
		}

		if (result == null) {
			StringBundler query = new StringBundler(3);

			query.append(_SQL_SELECT_EVPEMPLOYEE_WHERE);

			query.append(_FINDER_COLUMN_EMPLOYEEUSERID_EMPLOYEEUSERID_2);

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(employeeUserId);

				List<EVPEmployee> list = q.list();

				if (list.isEmpty()) {
					FinderCacheUtil.putResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
						finderArgs, list);
				}
				else {
					EVPEmployee evpEmployee = list.get(0);

					result = evpEmployee;

					cacheResult(evpEmployee);

					if ((evpEmployee.getEmployeeUserId() != employeeUserId)) {
						FinderCacheUtil.putResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
							finderArgs, evpEmployee);
					}
				}
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
					finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		if (result instanceof List<?>) {
			return null;
		}
		else {
			return (EVPEmployee)result;
		}
	}

	/**
	 * Removes the e v p employee where employeeUserId = &#63; from the database.
	 *
	 * @param employeeUserId the employee user ID
	 * @return the e v p employee that was removed
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee removeByEmployeeUserId(long employeeUserId)
		throws NoSuchEmployeeException, SystemException {
		EVPEmployee evpEmployee = findByEmployeeUserId(employeeUserId);

		return remove(evpEmployee);
	}

	/**
	 * Returns the number of e v p employees where employeeUserId = &#63;.
	 *
	 * @param employeeUserId the employee user ID
	 * @return the number of matching e v p employees
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countByEmployeeUserId(long employeeUserId)
		throws SystemException {
		FinderPath finderPath = FINDER_PATH_COUNT_BY_EMPLOYEEUSERID;

		Object[] finderArgs = new Object[] { employeeUserId };

		Long count = (Long)FinderCacheUtil.getResult(finderPath, finderArgs,
				this);

		if (count == null) {
			StringBundler query = new StringBundler(2);

			query.append(_SQL_COUNT_EVPEMPLOYEE_WHERE);

			query.append(_FINDER_COLUMN_EMPLOYEEUSERID_EMPLOYEEUSERID_2);

			String sql = query.toString();

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				QueryPos qPos = QueryPos.getInstance(q);

				qPos.add(employeeUserId);

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

	private static final String _FINDER_COLUMN_EMPLOYEEUSERID_EMPLOYEEUSERID_2 = "evpEmployee.employeeUserId = ?";

	public EVPEmployeePersistenceImpl() {
		setModelClass(EVPEmployee.class);
	}

	/**
	 * Caches the e v p employee in the entity cache if it is enabled.
	 *
	 * @param evpEmployee the e v p employee
	 */
	@Override
	public void cacheResult(EVPEmployee evpEmployee) {
		EntityCacheUtil.putResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeImpl.class, evpEmployee.getPrimaryKey(), evpEmployee);

		FinderCacheUtil.putResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
			new Object[] { evpEmployee.getEmployeeUserId() }, evpEmployee);

		evpEmployee.resetOriginalValues();
	}

	/**
	 * Caches the e v p employees in the entity cache if it is enabled.
	 *
	 * @param evpEmployees the e v p employees
	 */
	@Override
	public void cacheResult(List<EVPEmployee> evpEmployees) {
		for (EVPEmployee evpEmployee : evpEmployees) {
			if (EntityCacheUtil.getResult(
						EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
						EVPEmployeeImpl.class, evpEmployee.getPrimaryKey()) == null) {
				cacheResult(evpEmployee);
			}
			else {
				evpEmployee.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all e v p employees.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(EVPEmployeeImpl.class.getName());
		}

		EntityCacheUtil.clearCache(EVPEmployeeImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the e v p employee.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(EVPEmployee evpEmployee) {
		EntityCacheUtil.removeResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeImpl.class, evpEmployee.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		clearUniqueFindersCache(evpEmployee);
	}

	@Override
	public void clearCache(List<EVPEmployee> evpEmployees) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (EVPEmployee evpEmployee : evpEmployees) {
			EntityCacheUtil.removeResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
				EVPEmployeeImpl.class, evpEmployee.getPrimaryKey());

			clearUniqueFindersCache(evpEmployee);
		}
	}

	protected void cacheUniqueFindersCache(EVPEmployee evpEmployee) {
		if (evpEmployee.isNew()) {
			Object[] args = new Object[] { evpEmployee.getEmployeeUserId() };

			FinderCacheUtil.putResult(FINDER_PATH_COUNT_BY_EMPLOYEEUSERID,
				args, Long.valueOf(1));
			FinderCacheUtil.putResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
				args, evpEmployee);
		}
		else {
			EVPEmployeeModelImpl evpEmployeeModelImpl = (EVPEmployeeModelImpl)evpEmployee;

			if ((evpEmployeeModelImpl.getColumnBitmask() &
					FINDER_PATH_FETCH_BY_EMPLOYEEUSERID.getColumnBitmask()) != 0) {
				Object[] args = new Object[] { evpEmployee.getEmployeeUserId() };

				FinderCacheUtil.putResult(FINDER_PATH_COUNT_BY_EMPLOYEEUSERID,
					args, Long.valueOf(1));
				FinderCacheUtil.putResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
					args, evpEmployee);
			}
		}
	}

	protected void clearUniqueFindersCache(EVPEmployee evpEmployee) {
		EVPEmployeeModelImpl evpEmployeeModelImpl = (EVPEmployeeModelImpl)evpEmployee;

		Object[] args = new Object[] { evpEmployee.getEmployeeUserId() };

		FinderCacheUtil.removeResult(FINDER_PATH_COUNT_BY_EMPLOYEEUSERID, args);
		FinderCacheUtil.removeResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID, args);

		if ((evpEmployeeModelImpl.getColumnBitmask() &
				FINDER_PATH_FETCH_BY_EMPLOYEEUSERID.getColumnBitmask()) != 0) {
			args = new Object[] { evpEmployeeModelImpl.getOriginalEmployeeUserId() };

			FinderCacheUtil.removeResult(FINDER_PATH_COUNT_BY_EMPLOYEEUSERID,
				args);
			FinderCacheUtil.removeResult(FINDER_PATH_FETCH_BY_EMPLOYEEUSERID,
				args);
		}
	}

	/**
	 * Creates a new e v p employee with the primary key. Does not add the e v p employee to the database.
	 *
	 * @param evpEmployeeId the primary key for the new e v p employee
	 * @return the new e v p employee
	 */
	@Override
	public EVPEmployee create(long evpEmployeeId) {
		EVPEmployee evpEmployee = new EVPEmployeeImpl();

		evpEmployee.setNew(true);
		evpEmployee.setPrimaryKey(evpEmployeeId);

		return evpEmployee;
	}

	/**
	 * Removes the e v p employee with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param evpEmployeeId the primary key of the e v p employee
	 * @return the e v p employee that was removed
	 * @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee remove(long evpEmployeeId)
		throws NoSuchEmployeeException, SystemException {
		return remove((Serializable)evpEmployeeId);
	}

	/**
	 * Removes the e v p employee with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the e v p employee
	 * @return the e v p employee that was removed
	 * @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee remove(Serializable primaryKey)
		throws NoSuchEmployeeException, SystemException {
		Session session = null;

		try {
			session = openSession();

			EVPEmployee evpEmployee = (EVPEmployee)session.get(EVPEmployeeImpl.class,
					primaryKey);

			if (evpEmployee == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchEmployeeException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(evpEmployee);
		}
		catch (NoSuchEmployeeException nsee) {
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
	protected EVPEmployee removeImpl(EVPEmployee evpEmployee)
		throws SystemException {
		evpEmployee = toUnwrappedModel(evpEmployee);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(evpEmployee)) {
				evpEmployee = (EVPEmployee)session.get(EVPEmployeeImpl.class,
						evpEmployee.getPrimaryKeyObj());
			}

			if (evpEmployee != null) {
				session.delete(evpEmployee);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (evpEmployee != null) {
			clearCache(evpEmployee);
		}

		return evpEmployee;
	}

	@Override
	public EVPEmployee updateImpl(com.liferay.evp.model.EVPEmployee evpEmployee)
		throws SystemException {
		evpEmployee = toUnwrappedModel(evpEmployee);

		boolean isNew = evpEmployee.isNew();

		Session session = null;

		try {
			session = openSession();

			if (evpEmployee.isNew()) {
				session.save(evpEmployee);

				evpEmployee.setNew(false);
			}
			else {
				session.merge(evpEmployee);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);

		if (isNew || !EVPEmployeeModelImpl.COLUMN_BITMASK_ENABLED) {
			FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
		}

		EntityCacheUtil.putResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
			EVPEmployeeImpl.class, evpEmployee.getPrimaryKey(), evpEmployee);

		clearUniqueFindersCache(evpEmployee);
		cacheUniqueFindersCache(evpEmployee);

		return evpEmployee;
	}

	protected EVPEmployee toUnwrappedModel(EVPEmployee evpEmployee) {
		if (evpEmployee instanceof EVPEmployeeImpl) {
			return evpEmployee;
		}

		EVPEmployeeImpl evpEmployeeImpl = new EVPEmployeeImpl();

		evpEmployeeImpl.setNew(evpEmployee.isNew());
		evpEmployeeImpl.setPrimaryKey(evpEmployee.getPrimaryKey());

		evpEmployeeImpl.setEvpEmployeeId(evpEmployee.getEvpEmployeeId());
		evpEmployeeImpl.setCompanyId(evpEmployee.getCompanyId());
		evpEmployeeImpl.setUserId(evpEmployee.getUserId());
		evpEmployeeImpl.setUserName(evpEmployee.getUserName());
		evpEmployeeImpl.setCreateDate(evpEmployee.getCreateDate());
		evpEmployeeImpl.setModifiedDate(evpEmployee.getModifiedDate());
		evpEmployeeImpl.setEmployeeUserId(evpEmployee.getEmployeeUserId());
		evpEmployeeImpl.setManagerUserId(evpEmployee.getManagerUserId());
		evpEmployeeImpl.setSubsidiaryEVPDivisionId(evpEmployee.getSubsidiaryEVPDivisionId());
		evpEmployeeImpl.setEmploymentType(evpEmployee.getEmploymentType());
		evpEmployeeImpl.setHireDate(evpEmployee.getHireDate());

		return evpEmployeeImpl;
	}

	/**
	 * Returns the e v p employee with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p employee
	 * @return the e v p employee
	 * @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee findByPrimaryKey(Serializable primaryKey)
		throws NoSuchEmployeeException, SystemException {
		EVPEmployee evpEmployee = fetchByPrimaryKey(primaryKey);

		if (evpEmployee == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchEmployeeException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return evpEmployee;
	}

	/**
	 * Returns the e v p employee with the primary key or throws a {@link com.liferay.evp.NoSuchEmployeeException} if it could not be found.
	 *
	 * @param evpEmployeeId the primary key of the e v p employee
	 * @return the e v p employee
	 * @throws com.liferay.evp.NoSuchEmployeeException if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee findByPrimaryKey(long evpEmployeeId)
		throws NoSuchEmployeeException, SystemException {
		return findByPrimaryKey((Serializable)evpEmployeeId);
	}

	/**
	 * Returns the e v p employee with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p employee
	 * @return the e v p employee, or <code>null</code> if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		EVPEmployee evpEmployee = (EVPEmployee)EntityCacheUtil.getResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
				EVPEmployeeImpl.class, primaryKey);

		if (evpEmployee == _nullEVPEmployee) {
			return null;
		}

		if (evpEmployee == null) {
			Session session = null;

			try {
				session = openSession();

				evpEmployee = (EVPEmployee)session.get(EVPEmployeeImpl.class,
						primaryKey);

				if (evpEmployee != null) {
					cacheResult(evpEmployee);
				}
				else {
					EntityCacheUtil.putResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
						EVPEmployeeImpl.class, primaryKey, _nullEVPEmployee);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(EVPEmployeeModelImpl.ENTITY_CACHE_ENABLED,
					EVPEmployeeImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return evpEmployee;
	}

	/**
	 * Returns the e v p employee with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param evpEmployeeId the primary key of the e v p employee
	 * @return the e v p employee, or <code>null</code> if a e v p employee with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPEmployee fetchByPrimaryKey(long evpEmployeeId)
		throws SystemException {
		return fetchByPrimaryKey((Serializable)evpEmployeeId);
	}

	/**
	 * Returns all the e v p employees.
	 *
	 * @return the e v p employees
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPEmployee> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
	}

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
	@Override
	public List<EVPEmployee> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
	}

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
	@Override
	public List<EVPEmployee> findAll(int start, int end,
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

		List<EVPEmployee> list = (List<EVPEmployee>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_EVPEMPLOYEE);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_EVPEMPLOYEE;

				if (pagination) {
					sql = sql.concat(EVPEmployeeModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<EVPEmployee>)QueryUtil.list(q, getDialect(),
							start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPEmployee>(list);
				}
				else {
					list = (List<EVPEmployee>)QueryUtil.list(q, getDialect(),
							start, end);
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
	 * Removes all the e v p employees from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (EVPEmployee evpEmployee : findAll()) {
			remove(evpEmployee);
		}
	}

	/**
	 * Returns the number of e v p employees.
	 *
	 * @return the number of e v p employees
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

				Query q = session.createQuery(_SQL_COUNT_EVPEMPLOYEE);

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
	 * Initializes the e v p employee persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.com.liferay.evp.model.EVPEmployee")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<EVPEmployee>> listenersList = new ArrayList<ModelListener<EVPEmployee>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<EVPEmployee>)InstanceFactory.newInstance(
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
		EntityCacheUtil.removeCache(EVPEmployeeImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_EVPEMPLOYEE = "SELECT evpEmployee FROM EVPEmployee evpEmployee";
	private static final String _SQL_SELECT_EVPEMPLOYEE_WHERE = "SELECT evpEmployee FROM EVPEmployee evpEmployee WHERE ";
	private static final String _SQL_COUNT_EVPEMPLOYEE = "SELECT COUNT(evpEmployee) FROM EVPEmployee evpEmployee";
	private static final String _SQL_COUNT_EVPEMPLOYEE_WHERE = "SELECT COUNT(evpEmployee) FROM EVPEmployee evpEmployee WHERE ";
	private static final String _ORDER_BY_ENTITY_ALIAS = "evpEmployee.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No EVPEmployee exists with the primary key ";
	private static final String _NO_SUCH_ENTITY_WITH_KEY = "No EVPEmployee exists with the key {";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(EVPEmployeePersistenceImpl.class);
	private static EVPEmployee _nullEVPEmployee = new EVPEmployeeImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<EVPEmployee> toCacheModel() {
				return _nullEVPEmployeeCacheModel;
			}
		};

	private static CacheModel<EVPEmployee> _nullEVPEmployeeCacheModel = new CacheModel<EVPEmployee>() {
			@Override
			public EVPEmployee toEntityModel() {
				return _nullEVPEmployee;
			}
		};
}
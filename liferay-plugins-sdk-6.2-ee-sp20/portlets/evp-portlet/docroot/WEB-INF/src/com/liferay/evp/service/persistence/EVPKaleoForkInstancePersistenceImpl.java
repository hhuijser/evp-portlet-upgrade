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

import com.liferay.evp.NoSuchKaleoForkInstanceException;
import com.liferay.evp.model.EVPKaleoForkInstance;
import com.liferay.evp.model.impl.EVPKaleoForkInstanceImpl;
import com.liferay.evp.model.impl.EVPKaleoForkInstanceModelImpl;

import com.liferay.portal.kernel.cache.CacheRegistryUtil;
import com.liferay.portal.kernel.dao.orm.EntityCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderPath;
import com.liferay.portal.kernel.dao.orm.Query;
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
import com.liferay.portal.kernel.util.SetUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.UnmodifiableList;
import com.liferay.portal.model.CacheModel;
import com.liferay.portal.model.ModelListener;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/**
 * The persistence implementation for the e v p kaleo fork instance service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstancePersistence
 * @see EVPKaleoForkInstanceUtil
 * @generated
 */
public class EVPKaleoForkInstancePersistenceImpl extends BasePersistenceImpl<EVPKaleoForkInstance>
	implements EVPKaleoForkInstancePersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link EVPKaleoForkInstanceUtil} to access the e v p kaleo fork instance persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = EVPKaleoForkInstanceImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceModelImpl.FINDER_CACHE_ENABLED,
			EVPKaleoForkInstanceImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceModelImpl.FINDER_CACHE_ENABLED,
			EVPKaleoForkInstanceImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);

	public EVPKaleoForkInstancePersistenceImpl() {
		setModelClass(EVPKaleoForkInstance.class);
	}

	/**
	 * Caches the e v p kaleo fork instance in the entity cache if it is enabled.
	 *
	 * @param evpKaleoForkInstance the e v p kaleo fork instance
	 */
	@Override
	public void cacheResult(EVPKaleoForkInstance evpKaleoForkInstance) {
		EntityCacheUtil.putResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceImpl.class,
			evpKaleoForkInstance.getPrimaryKey(), evpKaleoForkInstance);

		evpKaleoForkInstance.resetOriginalValues();
	}

	/**
	 * Caches the e v p kaleo fork instances in the entity cache if it is enabled.
	 *
	 * @param evpKaleoForkInstances the e v p kaleo fork instances
	 */
	@Override
	public void cacheResult(List<EVPKaleoForkInstance> evpKaleoForkInstances) {
		for (EVPKaleoForkInstance evpKaleoForkInstance : evpKaleoForkInstances) {
			if (EntityCacheUtil.getResult(
						EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
						EVPKaleoForkInstanceImpl.class,
						evpKaleoForkInstance.getPrimaryKey()) == null) {
				cacheResult(evpKaleoForkInstance);
			}
			else {
				evpKaleoForkInstance.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all e v p kaleo fork instances.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(EVPKaleoForkInstanceImpl.class.getName());
		}

		EntityCacheUtil.clearCache(EVPKaleoForkInstanceImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the e v p kaleo fork instance.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(EVPKaleoForkInstance evpKaleoForkInstance) {
		EntityCacheUtil.removeResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceImpl.class, evpKaleoForkInstance.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	@Override
	public void clearCache(List<EVPKaleoForkInstance> evpKaleoForkInstances) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (EVPKaleoForkInstance evpKaleoForkInstance : evpKaleoForkInstances) {
			EntityCacheUtil.removeResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
				EVPKaleoForkInstanceImpl.class,
				evpKaleoForkInstance.getPrimaryKey());
		}
	}

	/**
	 * Creates a new e v p kaleo fork instance with the primary key. Does not add the e v p kaleo fork instance to the database.
	 *
	 * @param evpKaleoForkInstanceId the primary key for the new e v p kaleo fork instance
	 * @return the new e v p kaleo fork instance
	 */
	@Override
	public EVPKaleoForkInstance create(long evpKaleoForkInstanceId) {
		EVPKaleoForkInstance evpKaleoForkInstance = new EVPKaleoForkInstanceImpl();

		evpKaleoForkInstance.setNew(true);
		evpKaleoForkInstance.setPrimaryKey(evpKaleoForkInstanceId);

		return evpKaleoForkInstance;
	}

	/**
	 * Removes the e v p kaleo fork instance with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance that was removed
	 * @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance remove(long evpKaleoForkInstanceId)
		throws NoSuchKaleoForkInstanceException, SystemException {
		return remove((Serializable)evpKaleoForkInstanceId);
	}

	/**
	 * Removes the e v p kaleo fork instance with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance that was removed
	 * @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance remove(Serializable primaryKey)
		throws NoSuchKaleoForkInstanceException, SystemException {
		Session session = null;

		try {
			session = openSession();

			EVPKaleoForkInstance evpKaleoForkInstance = (EVPKaleoForkInstance)session.get(EVPKaleoForkInstanceImpl.class,
					primaryKey);

			if (evpKaleoForkInstance == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchKaleoForkInstanceException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(evpKaleoForkInstance);
		}
		catch (NoSuchKaleoForkInstanceException nsee) {
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
	protected EVPKaleoForkInstance removeImpl(
		EVPKaleoForkInstance evpKaleoForkInstance) throws SystemException {
		evpKaleoForkInstance = toUnwrappedModel(evpKaleoForkInstance);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(evpKaleoForkInstance)) {
				evpKaleoForkInstance = (EVPKaleoForkInstance)session.get(EVPKaleoForkInstanceImpl.class,
						evpKaleoForkInstance.getPrimaryKeyObj());
			}

			if (evpKaleoForkInstance != null) {
				session.delete(evpKaleoForkInstance);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (evpKaleoForkInstance != null) {
			clearCache(evpKaleoForkInstance);
		}

		return evpKaleoForkInstance;
	}

	@Override
	public EVPKaleoForkInstance updateImpl(
		com.liferay.evp.model.EVPKaleoForkInstance evpKaleoForkInstance)
		throws SystemException {
		evpKaleoForkInstance = toUnwrappedModel(evpKaleoForkInstance);

		boolean isNew = evpKaleoForkInstance.isNew();

		Session session = null;

		try {
			session = openSession();

			if (evpKaleoForkInstance.isNew()) {
				session.save(evpKaleoForkInstance);

				evpKaleoForkInstance.setNew(false);
			}
			else {
				session.merge(evpKaleoForkInstance);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);

		if (isNew) {
			FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
		}

		EntityCacheUtil.putResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
			EVPKaleoForkInstanceImpl.class,
			evpKaleoForkInstance.getPrimaryKey(), evpKaleoForkInstance);

		return evpKaleoForkInstance;
	}

	protected EVPKaleoForkInstance toUnwrappedModel(
		EVPKaleoForkInstance evpKaleoForkInstance) {
		if (evpKaleoForkInstance instanceof EVPKaleoForkInstanceImpl) {
			return evpKaleoForkInstance;
		}

		EVPKaleoForkInstanceImpl evpKaleoForkInstanceImpl = new EVPKaleoForkInstanceImpl();

		evpKaleoForkInstanceImpl.setNew(evpKaleoForkInstance.isNew());
		evpKaleoForkInstanceImpl.setPrimaryKey(evpKaleoForkInstance.getPrimaryKey());

		evpKaleoForkInstanceImpl.setEvpKaleoForkInstanceId(evpKaleoForkInstance.getEvpKaleoForkInstanceId());
		evpKaleoForkInstanceImpl.setCompanyId(evpKaleoForkInstance.getCompanyId());
		evpKaleoForkInstanceImpl.setUserId(evpKaleoForkInstance.getUserId());
		evpKaleoForkInstanceImpl.setUserName(evpKaleoForkInstance.getUserName());
		evpKaleoForkInstanceImpl.setCreateDate(evpKaleoForkInstance.getCreateDate());
		evpKaleoForkInstanceImpl.setModifiedDate(evpKaleoForkInstance.getModifiedDate());
		evpKaleoForkInstanceImpl.setClassNameId(evpKaleoForkInstance.getClassNameId());
		evpKaleoForkInstanceImpl.setClassPK(evpKaleoForkInstance.getClassPK());
		evpKaleoForkInstanceImpl.setType(evpKaleoForkInstance.getType());
		evpKaleoForkInstanceImpl.setStatus(evpKaleoForkInstance.getStatus());

		return evpKaleoForkInstanceImpl;
	}

	/**
	 * Returns the e v p kaleo fork instance with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance
	 * @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance findByPrimaryKey(Serializable primaryKey)
		throws NoSuchKaleoForkInstanceException, SystemException {
		EVPKaleoForkInstance evpKaleoForkInstance = fetchByPrimaryKey(primaryKey);

		if (evpKaleoForkInstance == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchKaleoForkInstanceException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return evpKaleoForkInstance;
	}

	/**
	 * Returns the e v p kaleo fork instance with the primary key or throws a {@link com.liferay.evp.NoSuchKaleoForkInstanceException} if it could not be found.
	 *
	 * @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance
	 * @throws com.liferay.evp.NoSuchKaleoForkInstanceException if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance findByPrimaryKey(long evpKaleoForkInstanceId)
		throws NoSuchKaleoForkInstanceException, SystemException {
		return findByPrimaryKey((Serializable)evpKaleoForkInstanceId);
	}

	/**
	 * Returns the e v p kaleo fork instance with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance, or <code>null</code> if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		EVPKaleoForkInstance evpKaleoForkInstance = (EVPKaleoForkInstance)EntityCacheUtil.getResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
				EVPKaleoForkInstanceImpl.class, primaryKey);

		if (evpKaleoForkInstance == _nullEVPKaleoForkInstance) {
			return null;
		}

		if (evpKaleoForkInstance == null) {
			Session session = null;

			try {
				session = openSession();

				evpKaleoForkInstance = (EVPKaleoForkInstance)session.get(EVPKaleoForkInstanceImpl.class,
						primaryKey);

				if (evpKaleoForkInstance != null) {
					cacheResult(evpKaleoForkInstance);
				}
				else {
					EntityCacheUtil.putResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
						EVPKaleoForkInstanceImpl.class, primaryKey,
						_nullEVPKaleoForkInstance);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(EVPKaleoForkInstanceModelImpl.ENTITY_CACHE_ENABLED,
					EVPKaleoForkInstanceImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return evpKaleoForkInstance;
	}

	/**
	 * Returns the e v p kaleo fork instance with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param evpKaleoForkInstanceId the primary key of the e v p kaleo fork instance
	 * @return the e v p kaleo fork instance, or <code>null</code> if a e v p kaleo fork instance with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPKaleoForkInstance fetchByPrimaryKey(long evpKaleoForkInstanceId)
		throws SystemException {
		return fetchByPrimaryKey((Serializable)evpKaleoForkInstanceId);
	}

	/**
	 * Returns all the e v p kaleo fork instances.
	 *
	 * @return the e v p kaleo fork instances
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPKaleoForkInstance> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
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
	@Override
	public List<EVPKaleoForkInstance> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
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
	@Override
	public List<EVPKaleoForkInstance> findAll(int start, int end,
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

		List<EVPKaleoForkInstance> list = (List<EVPKaleoForkInstance>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_EVPKALEOFORKINSTANCE);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_EVPKALEOFORKINSTANCE;

				if (pagination) {
					sql = sql.concat(EVPKaleoForkInstanceModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<EVPKaleoForkInstance>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPKaleoForkInstance>(list);
				}
				else {
					list = (List<EVPKaleoForkInstance>)QueryUtil.list(q,
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
	 * Removes all the e v p kaleo fork instances from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (EVPKaleoForkInstance evpKaleoForkInstance : findAll()) {
			remove(evpKaleoForkInstance);
		}
	}

	/**
	 * Returns the number of e v p kaleo fork instances.
	 *
	 * @return the number of e v p kaleo fork instances
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

				Query q = session.createQuery(_SQL_COUNT_EVPKALEOFORKINSTANCE);

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

	@Override
	protected Set<String> getBadColumnNames() {
		return _badColumnNames;
	}

	/**
	 * Initializes the e v p kaleo fork instance persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.com.liferay.evp.model.EVPKaleoForkInstance")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<EVPKaleoForkInstance>> listenersList = new ArrayList<ModelListener<EVPKaleoForkInstance>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<EVPKaleoForkInstance>)InstanceFactory.newInstance(
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
		EntityCacheUtil.removeCache(EVPKaleoForkInstanceImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_EVPKALEOFORKINSTANCE = "SELECT evpKaleoForkInstance FROM EVPKaleoForkInstance evpKaleoForkInstance";
	private static final String _SQL_COUNT_EVPKALEOFORKINSTANCE = "SELECT COUNT(evpKaleoForkInstance) FROM EVPKaleoForkInstance evpKaleoForkInstance";
	private static final String _ORDER_BY_ENTITY_ALIAS = "evpKaleoForkInstance.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No EVPKaleoForkInstance exists with the primary key ";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(EVPKaleoForkInstancePersistenceImpl.class);
	private static Set<String> _badColumnNames = SetUtil.fromArray(new String[] {
				"type"
			});
	private static EVPKaleoForkInstance _nullEVPKaleoForkInstance = new EVPKaleoForkInstanceImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<EVPKaleoForkInstance> toCacheModel() {
				return _nullEVPKaleoForkInstanceCacheModel;
			}
		};

	private static CacheModel<EVPKaleoForkInstance> _nullEVPKaleoForkInstanceCacheModel =
		new CacheModel<EVPKaleoForkInstance>() {
			@Override
			public EVPKaleoForkInstance toEntityModel() {
				return _nullEVPKaleoForkInstance;
			}
		};
}
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

import com.liferay.evp.NoSuchGrantTransactionException;
import com.liferay.evp.model.EVPGrantTransaction;
import com.liferay.evp.model.impl.EVPGrantTransactionImpl;
import com.liferay.evp.model.impl.EVPGrantTransactionModelImpl;

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
 * The persistence implementation for the e v p grant transaction service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Val Nagy
 * @see EVPGrantTransactionPersistence
 * @see EVPGrantTransactionUtil
 * @generated
 */
public class EVPGrantTransactionPersistenceImpl extends BasePersistenceImpl<EVPGrantTransaction>
	implements EVPGrantTransactionPersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link EVPGrantTransactionUtil} to access the e v p grant transaction persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = EVPGrantTransactionImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionModelImpl.FINDER_CACHE_ENABLED,
			EVPGrantTransactionImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionModelImpl.FINDER_CACHE_ENABLED,
			EVPGrantTransactionImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);

	public EVPGrantTransactionPersistenceImpl() {
		setModelClass(EVPGrantTransaction.class);
	}

	/**
	 * Caches the e v p grant transaction in the entity cache if it is enabled.
	 *
	 * @param evpGrantTransaction the e v p grant transaction
	 */
	@Override
	public void cacheResult(EVPGrantTransaction evpGrantTransaction) {
		EntityCacheUtil.putResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionImpl.class, evpGrantTransaction.getPrimaryKey(),
			evpGrantTransaction);

		evpGrantTransaction.resetOriginalValues();
	}

	/**
	 * Caches the e v p grant transactions in the entity cache if it is enabled.
	 *
	 * @param evpGrantTransactions the e v p grant transactions
	 */
	@Override
	public void cacheResult(List<EVPGrantTransaction> evpGrantTransactions) {
		for (EVPGrantTransaction evpGrantTransaction : evpGrantTransactions) {
			if (EntityCacheUtil.getResult(
						EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
						EVPGrantTransactionImpl.class,
						evpGrantTransaction.getPrimaryKey()) == null) {
				cacheResult(evpGrantTransaction);
			}
			else {
				evpGrantTransaction.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all e v p grant transactions.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(EVPGrantTransactionImpl.class.getName());
		}

		EntityCacheUtil.clearCache(EVPGrantTransactionImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the e v p grant transaction.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(EVPGrantTransaction evpGrantTransaction) {
		EntityCacheUtil.removeResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionImpl.class, evpGrantTransaction.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	@Override
	public void clearCache(List<EVPGrantTransaction> evpGrantTransactions) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (EVPGrantTransaction evpGrantTransaction : evpGrantTransactions) {
			EntityCacheUtil.removeResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
				EVPGrantTransactionImpl.class,
				evpGrantTransaction.getPrimaryKey());
		}
	}

	/**
	 * Creates a new e v p grant transaction with the primary key. Does not add the e v p grant transaction to the database.
	 *
	 * @param evpGrantTransactionId the primary key for the new e v p grant transaction
	 * @return the new e v p grant transaction
	 */
	@Override
	public EVPGrantTransaction create(long evpGrantTransactionId) {
		EVPGrantTransaction evpGrantTransaction = new EVPGrantTransactionImpl();

		evpGrantTransaction.setNew(true);
		evpGrantTransaction.setPrimaryKey(evpGrantTransactionId);

		return evpGrantTransaction;
	}

	/**
	 * Removes the e v p grant transaction with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param evpGrantTransactionId the primary key of the e v p grant transaction
	 * @return the e v p grant transaction that was removed
	 * @throws com.liferay.evp.NoSuchGrantTransactionException if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction remove(long evpGrantTransactionId)
		throws NoSuchGrantTransactionException, SystemException {
		return remove((Serializable)evpGrantTransactionId);
	}

	/**
	 * Removes the e v p grant transaction with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the e v p grant transaction
	 * @return the e v p grant transaction that was removed
	 * @throws com.liferay.evp.NoSuchGrantTransactionException if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction remove(Serializable primaryKey)
		throws NoSuchGrantTransactionException, SystemException {
		Session session = null;

		try {
			session = openSession();

			EVPGrantTransaction evpGrantTransaction = (EVPGrantTransaction)session.get(EVPGrantTransactionImpl.class,
					primaryKey);

			if (evpGrantTransaction == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchGrantTransactionException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(evpGrantTransaction);
		}
		catch (NoSuchGrantTransactionException nsee) {
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
	protected EVPGrantTransaction removeImpl(
		EVPGrantTransaction evpGrantTransaction) throws SystemException {
		evpGrantTransaction = toUnwrappedModel(evpGrantTransaction);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(evpGrantTransaction)) {
				evpGrantTransaction = (EVPGrantTransaction)session.get(EVPGrantTransactionImpl.class,
						evpGrantTransaction.getPrimaryKeyObj());
			}

			if (evpGrantTransaction != null) {
				session.delete(evpGrantTransaction);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (evpGrantTransaction != null) {
			clearCache(evpGrantTransaction);
		}

		return evpGrantTransaction;
	}

	@Override
	public EVPGrantTransaction updateImpl(
		com.liferay.evp.model.EVPGrantTransaction evpGrantTransaction)
		throws SystemException {
		evpGrantTransaction = toUnwrappedModel(evpGrantTransaction);

		boolean isNew = evpGrantTransaction.isNew();

		Session session = null;

		try {
			session = openSession();

			if (evpGrantTransaction.isNew()) {
				session.save(evpGrantTransaction);

				evpGrantTransaction.setNew(false);
			}
			else {
				session.merge(evpGrantTransaction);
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

		EntityCacheUtil.putResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
			EVPGrantTransactionImpl.class, evpGrantTransaction.getPrimaryKey(),
			evpGrantTransaction);

		return evpGrantTransaction;
	}

	protected EVPGrantTransaction toUnwrappedModel(
		EVPGrantTransaction evpGrantTransaction) {
		if (evpGrantTransaction instanceof EVPGrantTransactionImpl) {
			return evpGrantTransaction;
		}

		EVPGrantTransactionImpl evpGrantTransactionImpl = new EVPGrantTransactionImpl();

		evpGrantTransactionImpl.setNew(evpGrantTransaction.isNew());
		evpGrantTransactionImpl.setPrimaryKey(evpGrantTransaction.getPrimaryKey());

		evpGrantTransactionImpl.setEvpGrantTransactionId(evpGrantTransaction.getEvpGrantTransactionId());
		evpGrantTransactionImpl.setCompanyId(evpGrantTransaction.getCompanyId());
		evpGrantTransactionImpl.setUserId(evpGrantTransaction.getUserId());
		evpGrantTransactionImpl.setUserName(evpGrantTransaction.getUserName());
		evpGrantTransactionImpl.setCreateDate(evpGrantTransaction.getCreateDate());
		evpGrantTransactionImpl.setModifiedDate(evpGrantTransaction.getModifiedDate());
		evpGrantTransactionImpl.setEvpGrantRequestId(evpGrantTransaction.getEvpGrantRequestId());
		evpGrantTransactionImpl.setFileEntryId(evpGrantTransaction.getFileEntryId());
		evpGrantTransactionImpl.setGrantType(evpGrantTransaction.getGrantType());
		evpGrantTransactionImpl.setAmount(evpGrantTransaction.getAmount());
		evpGrantTransactionImpl.setCurrencyCode(evpGrantTransaction.getCurrencyCode());
		evpGrantTransactionImpl.setDate(evpGrantTransaction.getDate());
		evpGrantTransactionImpl.setNote(evpGrantTransaction.getNote());
		evpGrantTransactionImpl.setNumber(evpGrantTransaction.getNumber());
		evpGrantTransactionImpl.setBankBICCode(evpGrantTransaction.getBankBICCode());
		evpGrantTransactionImpl.setBankIBANCode(evpGrantTransaction.getBankIBANCode());
		evpGrantTransactionImpl.setBankName(evpGrantTransaction.getBankName());
		evpGrantTransactionImpl.setPurposeOfUse(evpGrantTransaction.getPurposeOfUse());

		return evpGrantTransactionImpl;
	}

	/**
	 * Returns the e v p grant transaction with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p grant transaction
	 * @return the e v p grant transaction
	 * @throws com.liferay.evp.NoSuchGrantTransactionException if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction findByPrimaryKey(Serializable primaryKey)
		throws NoSuchGrantTransactionException, SystemException {
		EVPGrantTransaction evpGrantTransaction = fetchByPrimaryKey(primaryKey);

		if (evpGrantTransaction == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchGrantTransactionException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return evpGrantTransaction;
	}

	/**
	 * Returns the e v p grant transaction with the primary key or throws a {@link com.liferay.evp.NoSuchGrantTransactionException} if it could not be found.
	 *
	 * @param evpGrantTransactionId the primary key of the e v p grant transaction
	 * @return the e v p grant transaction
	 * @throws com.liferay.evp.NoSuchGrantTransactionException if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction findByPrimaryKey(long evpGrantTransactionId)
		throws NoSuchGrantTransactionException, SystemException {
		return findByPrimaryKey((Serializable)evpGrantTransactionId);
	}

	/**
	 * Returns the e v p grant transaction with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the e v p grant transaction
	 * @return the e v p grant transaction, or <code>null</code> if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		EVPGrantTransaction evpGrantTransaction = (EVPGrantTransaction)EntityCacheUtil.getResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
				EVPGrantTransactionImpl.class, primaryKey);

		if (evpGrantTransaction == _nullEVPGrantTransaction) {
			return null;
		}

		if (evpGrantTransaction == null) {
			Session session = null;

			try {
				session = openSession();

				evpGrantTransaction = (EVPGrantTransaction)session.get(EVPGrantTransactionImpl.class,
						primaryKey);

				if (evpGrantTransaction != null) {
					cacheResult(evpGrantTransaction);
				}
				else {
					EntityCacheUtil.putResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
						EVPGrantTransactionImpl.class, primaryKey,
						_nullEVPGrantTransaction);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(EVPGrantTransactionModelImpl.ENTITY_CACHE_ENABLED,
					EVPGrantTransactionImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return evpGrantTransaction;
	}

	/**
	 * Returns the e v p grant transaction with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param evpGrantTransactionId the primary key of the e v p grant transaction
	 * @return the e v p grant transaction, or <code>null</code> if a e v p grant transaction with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public EVPGrantTransaction fetchByPrimaryKey(long evpGrantTransactionId)
		throws SystemException {
		return fetchByPrimaryKey((Serializable)evpGrantTransactionId);
	}

	/**
	 * Returns all the e v p grant transactions.
	 *
	 * @return the e v p grant transactions
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPGrantTransaction> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
	}

	/**
	 * Returns a range of all the e v p grant transactions.
	 *
	 * <p>
	 * Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPGrantTransactionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	 * </p>
	 *
	 * @param start the lower bound of the range of e v p grant transactions
	 * @param end the upper bound of the range of e v p grant transactions (not inclusive)
	 * @return the range of e v p grant transactions
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPGrantTransaction> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
	}

	/**
	 * Returns an ordered range of all the e v p grant transactions.
	 *
	 * <p>
	 * Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPGrantTransactionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	 * </p>
	 *
	 * @param start the lower bound of the range of e v p grant transactions
	 * @param end the upper bound of the range of e v p grant transactions (not inclusive)
	 * @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	 * @return the ordered range of e v p grant transactions
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<EVPGrantTransaction> findAll(int start, int end,
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

		List<EVPGrantTransaction> list = (List<EVPGrantTransaction>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_EVPGRANTTRANSACTION);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_EVPGRANTTRANSACTION;

				if (pagination) {
					sql = sql.concat(EVPGrantTransactionModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<EVPGrantTransaction>)QueryUtil.list(q,
							getDialect(), start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<EVPGrantTransaction>(list);
				}
				else {
					list = (List<EVPGrantTransaction>)QueryUtil.list(q,
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
	 * Removes all the e v p grant transactions from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (EVPGrantTransaction evpGrantTransaction : findAll()) {
			remove(evpGrantTransaction);
		}
	}

	/**
	 * Returns the number of e v p grant transactions.
	 *
	 * @return the number of e v p grant transactions
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

				Query q = session.createQuery(_SQL_COUNT_EVPGRANTTRANSACTION);

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
	 * Initializes the e v p grant transaction persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.com.liferay.evp.model.EVPGrantTransaction")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<EVPGrantTransaction>> listenersList = new ArrayList<ModelListener<EVPGrantTransaction>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<EVPGrantTransaction>)InstanceFactory.newInstance(
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
		EntityCacheUtil.removeCache(EVPGrantTransactionImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_EVPGRANTTRANSACTION = "SELECT evpGrantTransaction FROM EVPGrantTransaction evpGrantTransaction";
	private static final String _SQL_COUNT_EVPGRANTTRANSACTION = "SELECT COUNT(evpGrantTransaction) FROM EVPGrantTransaction evpGrantTransaction";
	private static final String _ORDER_BY_ENTITY_ALIAS = "evpGrantTransaction.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No EVPGrantTransaction exists with the primary key ";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(EVPGrantTransactionPersistenceImpl.class);
	private static Set<String> _badColumnNames = SetUtil.fromArray(new String[] {
				"date", "number"
			});
	private static EVPGrantTransaction _nullEVPGrantTransaction = new EVPGrantTransactionImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<EVPGrantTransaction> toCacheModel() {
				return _nullEVPGrantTransactionCacheModel;
			}
		};

	private static CacheModel<EVPGrantTransaction> _nullEVPGrantTransactionCacheModel =
		new CacheModel<EVPGrantTransaction>() {
			@Override
			public EVPGrantTransaction toEntityModel() {
				return _nullEVPGrantTransaction;
			}
		};
}
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

package com.liferay.evp.service;

import com.liferay.portal.kernel.bean.PortletBeanLocatorUtil;
import com.liferay.portal.kernel.util.ReferenceRegistry;
import com.liferay.portal.service.InvokableLocalService;

/**
 * Provides the local service utility for EVPDivision. This utility wraps
 * {@link com.liferay.evp.service.impl.EVPDivisionLocalServiceImpl} and is the
 * primary access point for service operations in application layer code running
 * on the local server. Methods of this service will not have security checks
 * based on the propagated JAAS credentials because this service can only be
 * accessed from within the same VM.
 *
 * @author Val Nagy
 * @see EVPDivisionLocalService
 * @see com.liferay.evp.service.base.EVPDivisionLocalServiceBaseImpl
 * @see com.liferay.evp.service.impl.EVPDivisionLocalServiceImpl
 * @generated
 */
public class EVPDivisionLocalServiceUtil {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify this class directly. Add custom service methods to {@link com.liferay.evp.service.impl.EVPDivisionLocalServiceImpl} and rerun ServiceBuilder to regenerate this class.
	 */

	/**
	* Adds the e v p division to the database. Also notifies the appropriate model listeners.
	*
	* @param evpDivision the e v p division
	* @return the e v p division that was added
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision addEVPDivision(
		com.liferay.evp.model.EVPDivision evpDivision)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().addEVPDivision(evpDivision);
	}

	/**
	* Creates a new e v p division with the primary key. Does not add the e v p division to the database.
	*
	* @param evpDivisionId the primary key for the new e v p division
	* @return the new e v p division
	*/
	public static com.liferay.evp.model.EVPDivision createEVPDivision(
		long evpDivisionId) {
		return getService().createEVPDivision(evpDivisionId);
	}

	/**
	* Deletes the e v p division with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param evpDivisionId the primary key of the e v p division
	* @return the e v p division that was removed
	* @throws PortalException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision deleteEVPDivision(
		long evpDivisionId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().deleteEVPDivision(evpDivisionId);
	}

	/**
	* Deletes the e v p division from the database. Also notifies the appropriate model listeners.
	*
	* @param evpDivision the e v p division
	* @return the e v p division that was removed
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision deleteEVPDivision(
		com.liferay.evp.model.EVPDivision evpDivision)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().deleteEVPDivision(evpDivision);
	}

	public static com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery() {
		return getService().dynamicQuery();
	}

	/**
	* Performs a dynamic query on the database and returns the matching rows.
	*
	* @param dynamicQuery the dynamic query
	* @return the matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQuery(dynamicQuery);
	}

	/**
	* Performs a dynamic query on the database and returns a range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @return the range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQuery(dynamicQuery, start, end);
	}

	/**
	* Performs a dynamic query on the database and returns an ordered range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link com.liferay.evp.model.impl.EVPDivisionModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public static java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService()
				   .dynamicQuery(dynamicQuery, start, end, orderByComparator);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	public static long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQueryCount(dynamicQuery);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @param projection the projection to apply to the query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	public static long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery,
		com.liferay.portal.kernel.dao.orm.Projection projection)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().dynamicQueryCount(dynamicQuery, projection);
	}

	public static com.liferay.evp.model.EVPDivision fetchEVPDivision(
		long evpDivisionId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().fetchEVPDivision(evpDivisionId);
	}

	/**
	* Returns the e v p division with the primary key.
	*
	* @param evpDivisionId the primary key of the e v p division
	* @return the e v p division
	* @throws PortalException if a e v p division with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision getEVPDivision(
		long evpDivisionId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPDivision(evpDivisionId);
	}

	public static com.liferay.portal.model.PersistedModel getPersistedModel(
		java.io.Serializable primaryKeyObj)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getPersistedModel(primaryKeyObj);
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
	public static java.util.List<com.liferay.evp.model.EVPDivision> getEVPDivisions(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPDivisions(start, end);
	}

	/**
	* Returns the number of e v p divisions.
	*
	* @return the number of e v p divisions
	* @throws SystemException if a system exception occurred
	*/
	public static int getEVPDivisionsCount()
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPDivisionsCount();
	}

	/**
	* Updates the e v p division in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param evpDivision the e v p division
	* @return the e v p division that was updated
	* @throws SystemException if a system exception occurred
	*/
	public static com.liferay.evp.model.EVPDivision updateEVPDivision(
		com.liferay.evp.model.EVPDivision evpDivision)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().updateEVPDivision(evpDivision);
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	public static java.lang.String getBeanIdentifier() {
		return getService().getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	public static void setBeanIdentifier(java.lang.String beanIdentifier) {
		getService().setBeanIdentifier(beanIdentifier);
	}

	public static java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return getService().invokeMethod(name, parameterTypes, arguments);
	}

	public static java.lang.String fetchSubsidiaryPortletPropsValue(
		long companyId, long groupId, java.lang.String portletPropsKey)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService()
				   .fetchSubsidiaryPortletPropsValue(companyId, groupId,
			portletPropsKey);
	}

	public static java.util.Map<java.lang.String, java.lang.Object> getEVPStats(
		long companyId, long userId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getEVPStats(companyId, userId);
	}

	public static com.liferay.evp.model.EVPDivision getSubsidiaryEVPDivision(
		long userId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return getService().getSubsidiaryEVPDivision(userId);
	}

	public static java.lang.String getSubsidiaryPortletPropsValue(
		long companyId, long subsidiaryGroupId, java.lang.String portletPropsKey)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService()
				   .getSubsidiaryPortletPropsValue(companyId,
			subsidiaryGroupId, portletPropsKey);
	}

	public static java.util.Map<java.lang.String, java.lang.Object> getSubsidiaryPortletPropsValues(
		long companyId, long groupId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return getService().getSubsidiaryPortletPropsValues(companyId, groupId);
	}

	public static void clearService() {
		_service = null;
	}

	public static EVPDivisionLocalService getService() {
		if (_service == null) {
			InvokableLocalService invokableLocalService = (InvokableLocalService)PortletBeanLocatorUtil.locate(ClpSerializer.getServletContextName(),
					EVPDivisionLocalService.class.getName());

			if (invokableLocalService instanceof EVPDivisionLocalService) {
				_service = (EVPDivisionLocalService)invokableLocalService;
			}
			else {
				_service = new EVPDivisionLocalServiceClp(invokableLocalService);
			}

			ReferenceRegistry.registerReference(EVPDivisionLocalServiceUtil.class,
				"_service");
		}

		return _service;
	}

	/**
	 * @deprecated As of 6.2.0
	 */
	public void setService(EVPDivisionLocalService service) {
	}

	private static EVPDivisionLocalService _service;
}
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

package com.liferay.evp.model;

import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.ModelWrapper;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link EVPEmployee}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPEmployee
 * @generated
 */
public class EVPEmployeeWrapper implements EVPEmployee,
	ModelWrapper<EVPEmployee> {
	public EVPEmployeeWrapper(EVPEmployee evpEmployee) {
		_evpEmployee = evpEmployee;
	}

	@Override
	public Class<?> getModelClass() {
		return EVPEmployee.class;
	}

	@Override
	public String getModelClassName() {
		return EVPEmployee.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpEmployeeId", getEvpEmployeeId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("employeeUserId", getEmployeeUserId());
		attributes.put("managerUserId", getManagerUserId());
		attributes.put("subsidiaryEVPDivisionId", getSubsidiaryEVPDivisionId());
		attributes.put("employmentType", getEmploymentType());
		attributes.put("hireDate", getHireDate());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpEmployeeId = (Long)attributes.get("evpEmployeeId");

		if (evpEmployeeId != null) {
			setEvpEmployeeId(evpEmployeeId);
		}

		Long companyId = (Long)attributes.get("companyId");

		if (companyId != null) {
			setCompanyId(companyId);
		}

		Long userId = (Long)attributes.get("userId");

		if (userId != null) {
			setUserId(userId);
		}

		String userName = (String)attributes.get("userName");

		if (userName != null) {
			setUserName(userName);
		}

		Date createDate = (Date)attributes.get("createDate");

		if (createDate != null) {
			setCreateDate(createDate);
		}

		Date modifiedDate = (Date)attributes.get("modifiedDate");

		if (modifiedDate != null) {
			setModifiedDate(modifiedDate);
		}

		Long employeeUserId = (Long)attributes.get("employeeUserId");

		if (employeeUserId != null) {
			setEmployeeUserId(employeeUserId);
		}

		Long managerUserId = (Long)attributes.get("managerUserId");

		if (managerUserId != null) {
			setManagerUserId(managerUserId);
		}

		Long subsidiaryEVPDivisionId = (Long)attributes.get(
				"subsidiaryEVPDivisionId");

		if (subsidiaryEVPDivisionId != null) {
			setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
		}

		Integer employmentType = (Integer)attributes.get("employmentType");

		if (employmentType != null) {
			setEmploymentType(employmentType);
		}

		Date hireDate = (Date)attributes.get("hireDate");

		if (hireDate != null) {
			setHireDate(hireDate);
		}
	}

	/**
	* Returns the primary key of this e v p employee.
	*
	* @return the primary key of this e v p employee
	*/
	@Override
	public long getPrimaryKey() {
		return _evpEmployee.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p employee.
	*
	* @param primaryKey the primary key of this e v p employee
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpEmployee.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp employee ID of this e v p employee.
	*
	* @return the evp employee ID of this e v p employee
	*/
	@Override
	public long getEvpEmployeeId() {
		return _evpEmployee.getEvpEmployeeId();
	}

	/**
	* Sets the evp employee ID of this e v p employee.
	*
	* @param evpEmployeeId the evp employee ID of this e v p employee
	*/
	@Override
	public void setEvpEmployeeId(long evpEmployeeId) {
		_evpEmployee.setEvpEmployeeId(evpEmployeeId);
	}

	/**
	* Returns the company ID of this e v p employee.
	*
	* @return the company ID of this e v p employee
	*/
	@Override
	public long getCompanyId() {
		return _evpEmployee.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p employee.
	*
	* @param companyId the company ID of this e v p employee
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpEmployee.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p employee.
	*
	* @return the user ID of this e v p employee
	*/
	@Override
	public long getUserId() {
		return _evpEmployee.getUserId();
	}

	/**
	* Sets the user ID of this e v p employee.
	*
	* @param userId the user ID of this e v p employee
	*/
	@Override
	public void setUserId(long userId) {
		_evpEmployee.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p employee.
	*
	* @return the user uuid of this e v p employee
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpEmployee.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p employee.
	*
	* @param userUuid the user uuid of this e v p employee
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpEmployee.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p employee.
	*
	* @return the user name of this e v p employee
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpEmployee.getUserName();
	}

	/**
	* Sets the user name of this e v p employee.
	*
	* @param userName the user name of this e v p employee
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpEmployee.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p employee.
	*
	* @return the create date of this e v p employee
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpEmployee.getCreateDate();
	}

	/**
	* Sets the create date of this e v p employee.
	*
	* @param createDate the create date of this e v p employee
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpEmployee.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p employee.
	*
	* @return the modified date of this e v p employee
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpEmployee.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p employee.
	*
	* @param modifiedDate the modified date of this e v p employee
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpEmployee.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the employee user ID of this e v p employee.
	*
	* @return the employee user ID of this e v p employee
	*/
	@Override
	public long getEmployeeUserId() {
		return _evpEmployee.getEmployeeUserId();
	}

	/**
	* Sets the employee user ID of this e v p employee.
	*
	* @param employeeUserId the employee user ID of this e v p employee
	*/
	@Override
	public void setEmployeeUserId(long employeeUserId) {
		_evpEmployee.setEmployeeUserId(employeeUserId);
	}

	/**
	* Returns the employee user uuid of this e v p employee.
	*
	* @return the employee user uuid of this e v p employee
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getEmployeeUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpEmployee.getEmployeeUserUuid();
	}

	/**
	* Sets the employee user uuid of this e v p employee.
	*
	* @param employeeUserUuid the employee user uuid of this e v p employee
	*/
	@Override
	public void setEmployeeUserUuid(java.lang.String employeeUserUuid) {
		_evpEmployee.setEmployeeUserUuid(employeeUserUuid);
	}

	/**
	* Returns the manager user ID of this e v p employee.
	*
	* @return the manager user ID of this e v p employee
	*/
	@Override
	public long getManagerUserId() {
		return _evpEmployee.getManagerUserId();
	}

	/**
	* Sets the manager user ID of this e v p employee.
	*
	* @param managerUserId the manager user ID of this e v p employee
	*/
	@Override
	public void setManagerUserId(long managerUserId) {
		_evpEmployee.setManagerUserId(managerUserId);
	}

	/**
	* Returns the manager user uuid of this e v p employee.
	*
	* @return the manager user uuid of this e v p employee
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getManagerUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpEmployee.getManagerUserUuid();
	}

	/**
	* Sets the manager user uuid of this e v p employee.
	*
	* @param managerUserUuid the manager user uuid of this e v p employee
	*/
	@Override
	public void setManagerUserUuid(java.lang.String managerUserUuid) {
		_evpEmployee.setManagerUserUuid(managerUserUuid);
	}

	/**
	* Returns the subsidiary e v p division ID of this e v p employee.
	*
	* @return the subsidiary e v p division ID of this e v p employee
	*/
	@Override
	public long getSubsidiaryEVPDivisionId() {
		return _evpEmployee.getSubsidiaryEVPDivisionId();
	}

	/**
	* Sets the subsidiary e v p division ID of this e v p employee.
	*
	* @param subsidiaryEVPDivisionId the subsidiary e v p division ID of this e v p employee
	*/
	@Override
	public void setSubsidiaryEVPDivisionId(long subsidiaryEVPDivisionId) {
		_evpEmployee.setSubsidiaryEVPDivisionId(subsidiaryEVPDivisionId);
	}

	/**
	* Returns the employment type of this e v p employee.
	*
	* @return the employment type of this e v p employee
	*/
	@Override
	public int getEmploymentType() {
		return _evpEmployee.getEmploymentType();
	}

	/**
	* Sets the employment type of this e v p employee.
	*
	* @param employmentType the employment type of this e v p employee
	*/
	@Override
	public void setEmploymentType(int employmentType) {
		_evpEmployee.setEmploymentType(employmentType);
	}

	/**
	* Returns the hire date of this e v p employee.
	*
	* @return the hire date of this e v p employee
	*/
	@Override
	public java.util.Date getHireDate() {
		return _evpEmployee.getHireDate();
	}

	/**
	* Sets the hire date of this e v p employee.
	*
	* @param hireDate the hire date of this e v p employee
	*/
	@Override
	public void setHireDate(java.util.Date hireDate) {
		_evpEmployee.setHireDate(hireDate);
	}

	@Override
	public boolean isNew() {
		return _evpEmployee.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpEmployee.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpEmployee.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpEmployee.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpEmployee.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpEmployee.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpEmployee.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpEmployee.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpEmployee.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpEmployee.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpEmployee.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPEmployeeWrapper((EVPEmployee)_evpEmployee.clone());
	}

	@Override
	public int compareTo(com.liferay.evp.model.EVPEmployee evpEmployee) {
		return _evpEmployee.compareTo(evpEmployee);
	}

	@Override
	public int hashCode() {
		return _evpEmployee.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPEmployee> toCacheModel() {
		return _evpEmployee.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPEmployee toEscapedModel() {
		return new EVPEmployeeWrapper(_evpEmployee.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPEmployee toUnescapedModel() {
		return new EVPEmployeeWrapper(_evpEmployee.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpEmployee.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpEmployee.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpEmployee.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPEmployeeWrapper)) {
			return false;
		}

		EVPEmployeeWrapper evpEmployeeWrapper = (EVPEmployeeWrapper)obj;

		if (Validator.equals(_evpEmployee, evpEmployeeWrapper._evpEmployee)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPEmployee getWrappedEVPEmployee() {
		return _evpEmployee;
	}

	@Override
	public EVPEmployee getWrappedModel() {
		return _evpEmployee;
	}

	@Override
	public void resetOriginalValues() {
		_evpEmployee.resetOriginalValues();
	}

	private EVPEmployee _evpEmployee;
}
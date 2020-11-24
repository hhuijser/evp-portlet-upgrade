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
 * This class is a wrapper for {@link EVPGrantTransaction}.
 * </p>
 *
 * @author Val Nagy
 * @see EVPGrantTransaction
 * @generated
 */
public class EVPGrantTransactionWrapper implements EVPGrantTransaction,
	ModelWrapper<EVPGrantTransaction> {
	public EVPGrantTransactionWrapper(EVPGrantTransaction evpGrantTransaction) {
		_evpGrantTransaction = evpGrantTransaction;
	}

	@Override
	public Class<?> getModelClass() {
		return EVPGrantTransaction.class;
	}

	@Override
	public String getModelClassName() {
		return EVPGrantTransaction.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("evpGrantTransactionId", getEvpGrantTransactionId());
		attributes.put("companyId", getCompanyId());
		attributes.put("userId", getUserId());
		attributes.put("userName", getUserName());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("evpGrantRequestId", getEvpGrantRequestId());
		attributes.put("fileEntryId", getFileEntryId());
		attributes.put("grantType", getGrantType());
		attributes.put("amount", getAmount());
		attributes.put("currencyCode", getCurrencyCode());
		attributes.put("date", getDate());
		attributes.put("note", getNote());
		attributes.put("number", getNumber());
		attributes.put("bankBICCode", getBankBICCode());
		attributes.put("bankIBANCode", getBankIBANCode());
		attributes.put("bankName", getBankName());
		attributes.put("purposeOfUse", getPurposeOfUse());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long evpGrantTransactionId = (Long)attributes.get(
				"evpGrantTransactionId");

		if (evpGrantTransactionId != null) {
			setEvpGrantTransactionId(evpGrantTransactionId);
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

		Long evpGrantRequestId = (Long)attributes.get("evpGrantRequestId");

		if (evpGrantRequestId != null) {
			setEvpGrantRequestId(evpGrantRequestId);
		}

		Long fileEntryId = (Long)attributes.get("fileEntryId");

		if (fileEntryId != null) {
			setFileEntryId(fileEntryId);
		}

		Integer grantType = (Integer)attributes.get("grantType");

		if (grantType != null) {
			setGrantType(grantType);
		}

		Double amount = (Double)attributes.get("amount");

		if (amount != null) {
			setAmount(amount);
		}

		String currencyCode = (String)attributes.get("currencyCode");

		if (currencyCode != null) {
			setCurrencyCode(currencyCode);
		}

		Date date = (Date)attributes.get("date");

		if (date != null) {
			setDate(date);
		}

		String note = (String)attributes.get("note");

		if (note != null) {
			setNote(note);
		}

		String number = (String)attributes.get("number");

		if (number != null) {
			setNumber(number);
		}

		String bankBICCode = (String)attributes.get("bankBICCode");

		if (bankBICCode != null) {
			setBankBICCode(bankBICCode);
		}

		String bankIBANCode = (String)attributes.get("bankIBANCode");

		if (bankIBANCode != null) {
			setBankIBANCode(bankIBANCode);
		}

		String bankName = (String)attributes.get("bankName");

		if (bankName != null) {
			setBankName(bankName);
		}

		String purposeOfUse = (String)attributes.get("purposeOfUse");

		if (purposeOfUse != null) {
			setPurposeOfUse(purposeOfUse);
		}
	}

	/**
	* Returns the primary key of this e v p grant transaction.
	*
	* @return the primary key of this e v p grant transaction
	*/
	@Override
	public long getPrimaryKey() {
		return _evpGrantTransaction.getPrimaryKey();
	}

	/**
	* Sets the primary key of this e v p grant transaction.
	*
	* @param primaryKey the primary key of this e v p grant transaction
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_evpGrantTransaction.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the evp grant transaction ID of this e v p grant transaction.
	*
	* @return the evp grant transaction ID of this e v p grant transaction
	*/
	@Override
	public long getEvpGrantTransactionId() {
		return _evpGrantTransaction.getEvpGrantTransactionId();
	}

	/**
	* Sets the evp grant transaction ID of this e v p grant transaction.
	*
	* @param evpGrantTransactionId the evp grant transaction ID of this e v p grant transaction
	*/
	@Override
	public void setEvpGrantTransactionId(long evpGrantTransactionId) {
		_evpGrantTransaction.setEvpGrantTransactionId(evpGrantTransactionId);
	}

	/**
	* Returns the company ID of this e v p grant transaction.
	*
	* @return the company ID of this e v p grant transaction
	*/
	@Override
	public long getCompanyId() {
		return _evpGrantTransaction.getCompanyId();
	}

	/**
	* Sets the company ID of this e v p grant transaction.
	*
	* @param companyId the company ID of this e v p grant transaction
	*/
	@Override
	public void setCompanyId(long companyId) {
		_evpGrantTransaction.setCompanyId(companyId);
	}

	/**
	* Returns the user ID of this e v p grant transaction.
	*
	* @return the user ID of this e v p grant transaction
	*/
	@Override
	public long getUserId() {
		return _evpGrantTransaction.getUserId();
	}

	/**
	* Sets the user ID of this e v p grant transaction.
	*
	* @param userId the user ID of this e v p grant transaction
	*/
	@Override
	public void setUserId(long userId) {
		_evpGrantTransaction.setUserId(userId);
	}

	/**
	* Returns the user uuid of this e v p grant transaction.
	*
	* @return the user uuid of this e v p grant transaction
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _evpGrantTransaction.getUserUuid();
	}

	/**
	* Sets the user uuid of this e v p grant transaction.
	*
	* @param userUuid the user uuid of this e v p grant transaction
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_evpGrantTransaction.setUserUuid(userUuid);
	}

	/**
	* Returns the user name of this e v p grant transaction.
	*
	* @return the user name of this e v p grant transaction
	*/
	@Override
	public java.lang.String getUserName() {
		return _evpGrantTransaction.getUserName();
	}

	/**
	* Sets the user name of this e v p grant transaction.
	*
	* @param userName the user name of this e v p grant transaction
	*/
	@Override
	public void setUserName(java.lang.String userName) {
		_evpGrantTransaction.setUserName(userName);
	}

	/**
	* Returns the create date of this e v p grant transaction.
	*
	* @return the create date of this e v p grant transaction
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _evpGrantTransaction.getCreateDate();
	}

	/**
	* Sets the create date of this e v p grant transaction.
	*
	* @param createDate the create date of this e v p grant transaction
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_evpGrantTransaction.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this e v p grant transaction.
	*
	* @return the modified date of this e v p grant transaction
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _evpGrantTransaction.getModifiedDate();
	}

	/**
	* Sets the modified date of this e v p grant transaction.
	*
	* @param modifiedDate the modified date of this e v p grant transaction
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_evpGrantTransaction.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the evp grant request ID of this e v p grant transaction.
	*
	* @return the evp grant request ID of this e v p grant transaction
	*/
	@Override
	public long getEvpGrantRequestId() {
		return _evpGrantTransaction.getEvpGrantRequestId();
	}

	/**
	* Sets the evp grant request ID of this e v p grant transaction.
	*
	* @param evpGrantRequestId the evp grant request ID of this e v p grant transaction
	*/
	@Override
	public void setEvpGrantRequestId(long evpGrantRequestId) {
		_evpGrantTransaction.setEvpGrantRequestId(evpGrantRequestId);
	}

	/**
	* Returns the file entry ID of this e v p grant transaction.
	*
	* @return the file entry ID of this e v p grant transaction
	*/
	@Override
	public long getFileEntryId() {
		return _evpGrantTransaction.getFileEntryId();
	}

	/**
	* Sets the file entry ID of this e v p grant transaction.
	*
	* @param fileEntryId the file entry ID of this e v p grant transaction
	*/
	@Override
	public void setFileEntryId(long fileEntryId) {
		_evpGrantTransaction.setFileEntryId(fileEntryId);
	}

	/**
	* Returns the grant type of this e v p grant transaction.
	*
	* @return the grant type of this e v p grant transaction
	*/
	@Override
	public int getGrantType() {
		return _evpGrantTransaction.getGrantType();
	}

	/**
	* Sets the grant type of this e v p grant transaction.
	*
	* @param grantType the grant type of this e v p grant transaction
	*/
	@Override
	public void setGrantType(int grantType) {
		_evpGrantTransaction.setGrantType(grantType);
	}

	/**
	* Returns the amount of this e v p grant transaction.
	*
	* @return the amount of this e v p grant transaction
	*/
	@Override
	public double getAmount() {
		return _evpGrantTransaction.getAmount();
	}

	/**
	* Sets the amount of this e v p grant transaction.
	*
	* @param amount the amount of this e v p grant transaction
	*/
	@Override
	public void setAmount(double amount) {
		_evpGrantTransaction.setAmount(amount);
	}

	/**
	* Returns the currency code of this e v p grant transaction.
	*
	* @return the currency code of this e v p grant transaction
	*/
	@Override
	public java.lang.String getCurrencyCode() {
		return _evpGrantTransaction.getCurrencyCode();
	}

	/**
	* Sets the currency code of this e v p grant transaction.
	*
	* @param currencyCode the currency code of this e v p grant transaction
	*/
	@Override
	public void setCurrencyCode(java.lang.String currencyCode) {
		_evpGrantTransaction.setCurrencyCode(currencyCode);
	}

	/**
	* Returns the date of this e v p grant transaction.
	*
	* @return the date of this e v p grant transaction
	*/
	@Override
	public java.util.Date getDate() {
		return _evpGrantTransaction.getDate();
	}

	/**
	* Sets the date of this e v p grant transaction.
	*
	* @param date the date of this e v p grant transaction
	*/
	@Override
	public void setDate(java.util.Date date) {
		_evpGrantTransaction.setDate(date);
	}

	/**
	* Returns the note of this e v p grant transaction.
	*
	* @return the note of this e v p grant transaction
	*/
	@Override
	public java.lang.String getNote() {
		return _evpGrantTransaction.getNote();
	}

	/**
	* Sets the note of this e v p grant transaction.
	*
	* @param note the note of this e v p grant transaction
	*/
	@Override
	public void setNote(java.lang.String note) {
		_evpGrantTransaction.setNote(note);
	}

	/**
	* Returns the number of this e v p grant transaction.
	*
	* @return the number of this e v p grant transaction
	*/
	@Override
	public java.lang.String getNumber() {
		return _evpGrantTransaction.getNumber();
	}

	/**
	* Sets the number of this e v p grant transaction.
	*
	* @param number the number of this e v p grant transaction
	*/
	@Override
	public void setNumber(java.lang.String number) {
		_evpGrantTransaction.setNumber(number);
	}

	/**
	* Returns the bank b i c code of this e v p grant transaction.
	*
	* @return the bank b i c code of this e v p grant transaction
	*/
	@Override
	public java.lang.String getBankBICCode() {
		return _evpGrantTransaction.getBankBICCode();
	}

	/**
	* Sets the bank b i c code of this e v p grant transaction.
	*
	* @param bankBICCode the bank b i c code of this e v p grant transaction
	*/
	@Override
	public void setBankBICCode(java.lang.String bankBICCode) {
		_evpGrantTransaction.setBankBICCode(bankBICCode);
	}

	/**
	* Returns the bank i b a n code of this e v p grant transaction.
	*
	* @return the bank i b a n code of this e v p grant transaction
	*/
	@Override
	public java.lang.String getBankIBANCode() {
		return _evpGrantTransaction.getBankIBANCode();
	}

	/**
	* Sets the bank i b a n code of this e v p grant transaction.
	*
	* @param bankIBANCode the bank i b a n code of this e v p grant transaction
	*/
	@Override
	public void setBankIBANCode(java.lang.String bankIBANCode) {
		_evpGrantTransaction.setBankIBANCode(bankIBANCode);
	}

	/**
	* Returns the bank name of this e v p grant transaction.
	*
	* @return the bank name of this e v p grant transaction
	*/
	@Override
	public java.lang.String getBankName() {
		return _evpGrantTransaction.getBankName();
	}

	/**
	* Sets the bank name of this e v p grant transaction.
	*
	* @param bankName the bank name of this e v p grant transaction
	*/
	@Override
	public void setBankName(java.lang.String bankName) {
		_evpGrantTransaction.setBankName(bankName);
	}

	/**
	* Returns the purpose of use of this e v p grant transaction.
	*
	* @return the purpose of use of this e v p grant transaction
	*/
	@Override
	public java.lang.String getPurposeOfUse() {
		return _evpGrantTransaction.getPurposeOfUse();
	}

	/**
	* Sets the purpose of use of this e v p grant transaction.
	*
	* @param purposeOfUse the purpose of use of this e v p grant transaction
	*/
	@Override
	public void setPurposeOfUse(java.lang.String purposeOfUse) {
		_evpGrantTransaction.setPurposeOfUse(purposeOfUse);
	}

	@Override
	public boolean isNew() {
		return _evpGrantTransaction.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_evpGrantTransaction.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _evpGrantTransaction.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_evpGrantTransaction.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _evpGrantTransaction.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _evpGrantTransaction.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_evpGrantTransaction.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _evpGrantTransaction.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_evpGrantTransaction.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_evpGrantTransaction.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_evpGrantTransaction.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new EVPGrantTransactionWrapper((EVPGrantTransaction)_evpGrantTransaction.clone());
	}

	@Override
	public int compareTo(
		com.liferay.evp.model.EVPGrantTransaction evpGrantTransaction) {
		return _evpGrantTransaction.compareTo(evpGrantTransaction);
	}

	@Override
	public int hashCode() {
		return _evpGrantTransaction.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<com.liferay.evp.model.EVPGrantTransaction> toCacheModel() {
		return _evpGrantTransaction.toCacheModel();
	}

	@Override
	public com.liferay.evp.model.EVPGrantTransaction toEscapedModel() {
		return new EVPGrantTransactionWrapper(_evpGrantTransaction.toEscapedModel());
	}

	@Override
	public com.liferay.evp.model.EVPGrantTransaction toUnescapedModel() {
		return new EVPGrantTransactionWrapper(_evpGrantTransaction.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _evpGrantTransaction.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _evpGrantTransaction.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_evpGrantTransaction.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof EVPGrantTransactionWrapper)) {
			return false;
		}

		EVPGrantTransactionWrapper evpGrantTransactionWrapper = (EVPGrantTransactionWrapper)obj;

		if (Validator.equals(_evpGrantTransaction,
					evpGrantTransactionWrapper._evpGrantTransaction)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public EVPGrantTransaction getWrappedEVPGrantTransaction() {
		return _evpGrantTransaction;
	}

	@Override
	public EVPGrantTransaction getWrappedModel() {
		return _evpGrantTransaction;
	}

	@Override
	public void resetOriginalValues() {
		_evpGrantTransaction.resetOriginalValues();
	}

	private EVPGrantTransaction _evpGrantTransaction;
}
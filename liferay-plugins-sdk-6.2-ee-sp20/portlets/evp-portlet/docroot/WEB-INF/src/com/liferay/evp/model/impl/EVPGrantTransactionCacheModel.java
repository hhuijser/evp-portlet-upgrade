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

package com.liferay.evp.model.impl;

import com.liferay.evp.model.EVPGrantTransaction;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPGrantTransaction in entity cache.
 *
 * @author Val Nagy
 * @see EVPGrantTransaction
 * @generated
 */
public class EVPGrantTransactionCacheModel implements CacheModel<EVPGrantTransaction>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(37);

		sb.append("{evpGrantTransactionId=");
		sb.append(evpGrantTransactionId);
		sb.append(", companyId=");
		sb.append(companyId);
		sb.append(", userId=");
		sb.append(userId);
		sb.append(", userName=");
		sb.append(userName);
		sb.append(", createDate=");
		sb.append(createDate);
		sb.append(", modifiedDate=");
		sb.append(modifiedDate);
		sb.append(", evpGrantRequestId=");
		sb.append(evpGrantRequestId);
		sb.append(", fileEntryId=");
		sb.append(fileEntryId);
		sb.append(", grantType=");
		sb.append(grantType);
		sb.append(", amount=");
		sb.append(amount);
		sb.append(", currencyCode=");
		sb.append(currencyCode);
		sb.append(", date=");
		sb.append(date);
		sb.append(", note=");
		sb.append(note);
		sb.append(", number=");
		sb.append(number);
		sb.append(", bankBICCode=");
		sb.append(bankBICCode);
		sb.append(", bankIBANCode=");
		sb.append(bankIBANCode);
		sb.append(", bankName=");
		sb.append(bankName);
		sb.append(", purposeOfUse=");
		sb.append(purposeOfUse);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPGrantTransaction toEntityModel() {
		EVPGrantTransactionImpl evpGrantTransactionImpl = new EVPGrantTransactionImpl();

		evpGrantTransactionImpl.setEvpGrantTransactionId(evpGrantTransactionId);
		evpGrantTransactionImpl.setCompanyId(companyId);
		evpGrantTransactionImpl.setUserId(userId);

		if (userName == null) {
			evpGrantTransactionImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpGrantTransactionImpl.setCreateDate(null);
		}
		else {
			evpGrantTransactionImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpGrantTransactionImpl.setModifiedDate(null);
		}
		else {
			evpGrantTransactionImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpGrantTransactionImpl.setEvpGrantRequestId(evpGrantRequestId);
		evpGrantTransactionImpl.setFileEntryId(fileEntryId);
		evpGrantTransactionImpl.setGrantType(grantType);
		evpGrantTransactionImpl.setAmount(amount);

		if (currencyCode == null) {
			evpGrantTransactionImpl.setCurrencyCode(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setCurrencyCode(currencyCode);
		}

		if (date == Long.MIN_VALUE) {
			evpGrantTransactionImpl.setDate(null);
		}
		else {
			evpGrantTransactionImpl.setDate(new Date(date));
		}

		if (note == null) {
			evpGrantTransactionImpl.setNote(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setNote(note);
		}

		if (number == null) {
			evpGrantTransactionImpl.setNumber(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setNumber(number);
		}

		if (bankBICCode == null) {
			evpGrantTransactionImpl.setBankBICCode(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setBankBICCode(bankBICCode);
		}

		if (bankIBANCode == null) {
			evpGrantTransactionImpl.setBankIBANCode(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setBankIBANCode(bankIBANCode);
		}

		if (bankName == null) {
			evpGrantTransactionImpl.setBankName(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setBankName(bankName);
		}

		if (purposeOfUse == null) {
			evpGrantTransactionImpl.setPurposeOfUse(StringPool.BLANK);
		}
		else {
			evpGrantTransactionImpl.setPurposeOfUse(purposeOfUse);
		}

		evpGrantTransactionImpl.resetOriginalValues();

		return evpGrantTransactionImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpGrantTransactionId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		evpGrantRequestId = objectInput.readLong();
		fileEntryId = objectInput.readLong();
		grantType = objectInput.readInt();
		amount = objectInput.readDouble();
		currencyCode = objectInput.readUTF();
		date = objectInput.readLong();
		note = objectInput.readUTF();
		number = objectInput.readUTF();
		bankBICCode = objectInput.readUTF();
		bankIBANCode = objectInput.readUTF();
		bankName = objectInput.readUTF();
		purposeOfUse = objectInput.readUTF();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpGrantTransactionId);
		objectOutput.writeLong(companyId);
		objectOutput.writeLong(userId);

		if (userName == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(userName);
		}

		objectOutput.writeLong(createDate);
		objectOutput.writeLong(modifiedDate);
		objectOutput.writeLong(evpGrantRequestId);
		objectOutput.writeLong(fileEntryId);
		objectOutput.writeInt(grantType);
		objectOutput.writeDouble(amount);

		if (currencyCode == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(currencyCode);
		}

		objectOutput.writeLong(date);

		if (note == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(note);
		}

		if (number == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(number);
		}

		if (bankBICCode == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(bankBICCode);
		}

		if (bankIBANCode == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(bankIBANCode);
		}

		if (bankName == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(bankName);
		}

		if (purposeOfUse == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(purposeOfUse);
		}
	}

	public long evpGrantTransactionId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long evpGrantRequestId;
	public long fileEntryId;
	public int grantType;
	public double amount;
	public String currencyCode;
	public long date;
	public String note;
	public String number;
	public String bankBICCode;
	public String bankIBANCode;
	public String bankName;
	public String purposeOfUse;
}
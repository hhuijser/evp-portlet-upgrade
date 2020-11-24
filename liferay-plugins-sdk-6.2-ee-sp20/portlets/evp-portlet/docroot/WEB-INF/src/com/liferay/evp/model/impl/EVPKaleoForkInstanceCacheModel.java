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

import com.liferay.evp.model.EVPKaleoForkInstance;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing EVPKaleoForkInstance in entity cache.
 *
 * @author Val Nagy
 * @see EVPKaleoForkInstance
 * @generated
 */
public class EVPKaleoForkInstanceCacheModel implements CacheModel<EVPKaleoForkInstance>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(21);

		sb.append("{evpKaleoForkInstanceId=");
		sb.append(evpKaleoForkInstanceId);
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
		sb.append(", classNameId=");
		sb.append(classNameId);
		sb.append(", classPK=");
		sb.append(classPK);
		sb.append(", type=");
		sb.append(type);
		sb.append(", status=");
		sb.append(status);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public EVPKaleoForkInstance toEntityModel() {
		EVPKaleoForkInstanceImpl evpKaleoForkInstanceImpl = new EVPKaleoForkInstanceImpl();

		evpKaleoForkInstanceImpl.setEvpKaleoForkInstanceId(evpKaleoForkInstanceId);
		evpKaleoForkInstanceImpl.setCompanyId(companyId);
		evpKaleoForkInstanceImpl.setUserId(userId);

		if (userName == null) {
			evpKaleoForkInstanceImpl.setUserName(StringPool.BLANK);
		}
		else {
			evpKaleoForkInstanceImpl.setUserName(userName);
		}

		if (createDate == Long.MIN_VALUE) {
			evpKaleoForkInstanceImpl.setCreateDate(null);
		}
		else {
			evpKaleoForkInstanceImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			evpKaleoForkInstanceImpl.setModifiedDate(null);
		}
		else {
			evpKaleoForkInstanceImpl.setModifiedDate(new Date(modifiedDate));
		}

		evpKaleoForkInstanceImpl.setClassNameId(classNameId);
		evpKaleoForkInstanceImpl.setClassPK(classPK);
		evpKaleoForkInstanceImpl.setType(type);
		evpKaleoForkInstanceImpl.setStatus(status);

		evpKaleoForkInstanceImpl.resetOriginalValues();

		return evpKaleoForkInstanceImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		evpKaleoForkInstanceId = objectInput.readLong();
		companyId = objectInput.readLong();
		userId = objectInput.readLong();
		userName = objectInput.readUTF();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		classNameId = objectInput.readLong();
		classPK = objectInput.readLong();
		type = objectInput.readInt();
		status = objectInput.readInt();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(evpKaleoForkInstanceId);
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
		objectOutput.writeLong(classNameId);
		objectOutput.writeLong(classPK);
		objectOutput.writeInt(type);
		objectOutput.writeInt(status);
	}

	public long evpKaleoForkInstanceId;
	public long companyId;
	public long userId;
	public String userName;
	public long createDate;
	public long modifiedDate;
	public long classNameId;
	public long classPK;
	public int type;
	public int status;
}
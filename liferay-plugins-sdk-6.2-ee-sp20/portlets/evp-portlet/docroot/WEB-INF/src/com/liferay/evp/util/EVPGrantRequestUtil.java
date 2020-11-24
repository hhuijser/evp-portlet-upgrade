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

package com.liferay.evp.util;

import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portlet.documentlibrary.NoSuchFolderException;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppLocalServiceUtil;

/**
 * @author Ethan Bustad
 */
public class EVPGrantRequestUtil {

	public static Folder getFolder(
			long companyId, long userId, long subsidiaryGroupId,
			long parentFolderId, String folderName)
		throws Exception {

		try {
			return DLAppLocalServiceUtil.getFolder(
				subsidiaryGroupId, parentFolderId, folderName);
		}
		catch (NoSuchFolderException nsfe) {
			if (parentFolderId == DLFolderConstants.DEFAULT_PARENT_FOLDER_ID) {
				userId = UserLocalServiceUtil.getDefaultUserId(companyId);
			}

			return DLAppLocalServiceUtil.addFolder(
				userId, subsidiaryGroupId, parentFolderId, folderName,
				StringPool.BLANK, new ServiceContext());
		}
	}

}
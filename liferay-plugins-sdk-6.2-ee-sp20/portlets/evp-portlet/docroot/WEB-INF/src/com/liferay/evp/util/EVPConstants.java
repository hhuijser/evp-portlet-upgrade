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

/**
 * @author Ethan Bustad
 */
public class EVPConstants {

	public static final String EVP_OVERRIDE_STATUS_EXPANDO_COLUMN =
		"evpOverrideStatus";

	public static final String OVERRIDE_TYPE_DEFAULT = "default";

	public static final String OVERRIDE_TYPE_ELIGIBLE = "eligible";

	public static final String OVERRIDE_TYPE_INELIGIBLE = "ineligible";

	public static final String[] OVERRIDE_TYPES = {
		OVERRIDE_TYPE_DEFAULT, OVERRIDE_TYPE_ELIGIBLE,
		OVERRIDE_TYPE_INELIGIBLE};

	public static final String REQUEST_PARAMETER_NAME_CONTACT_USER_HASH =
		"contactUserHash";

}
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

import com.liferay.evp.model.EVPDivisionClp;
import com.liferay.evp.model.EVPEmployeeClp;
import com.liferay.evp.model.EVPGrantRequestClp;
import com.liferay.evp.model.EVPGrantTransactionClp;
import com.liferay.evp.model.EVPKaleoForkInstanceClp;
import com.liferay.evp.model.EVPRequestOrganizationClp;
import com.liferay.evp.model.EVPServiceRequestClp;

import com.liferay.portal.kernel.io.unsync.UnsyncByteArrayInputStream;
import com.liferay.portal.kernel.io.unsync.UnsyncByteArrayOutputStream;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ClassLoaderObjectInputStream;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.BaseModel;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import java.lang.reflect.Method;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Val Nagy
 */
public class ClpSerializer {
	public static String getServletContextName() {
		if (Validator.isNotNull(_servletContextName)) {
			return _servletContextName;
		}

		synchronized (ClpSerializer.class) {
			if (Validator.isNotNull(_servletContextName)) {
				return _servletContextName;
			}

			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Class<?> portletPropsClass = classLoader.loadClass(
						"com.liferay.util.portlet.PortletProps");

				Method getMethod = portletPropsClass.getMethod("get",
						new Class<?>[] { String.class });

				String portletPropsServletContextName = (String)getMethod.invoke(null,
						"evp-portlet-deployment-context");

				if (Validator.isNotNull(portletPropsServletContextName)) {
					_servletContextName = portletPropsServletContextName;
				}
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info(
						"Unable to locate deployment context from portlet properties");
				}
			}

			if (Validator.isNull(_servletContextName)) {
				try {
					String propsUtilServletContextName = PropsUtil.get(
							"evp-portlet-deployment-context");

					if (Validator.isNotNull(propsUtilServletContextName)) {
						_servletContextName = propsUtilServletContextName;
					}
				}
				catch (Throwable t) {
					if (_log.isInfoEnabled()) {
						_log.info(
							"Unable to locate deployment context from portal properties");
					}
				}
			}

			if (Validator.isNull(_servletContextName)) {
				_servletContextName = "evp-portlet";
			}

			return _servletContextName;
		}
	}

	public static Object translateInput(BaseModel<?> oldModel) {
		Class<?> oldModelClass = oldModel.getClass();

		String oldModelClassName = oldModelClass.getName();

		if (oldModelClassName.equals(EVPDivisionClp.class.getName())) {
			return translateInputEVPDivision(oldModel);
		}

		if (oldModelClassName.equals(EVPEmployeeClp.class.getName())) {
			return translateInputEVPEmployee(oldModel);
		}

		if (oldModelClassName.equals(EVPGrantRequestClp.class.getName())) {
			return translateInputEVPGrantRequest(oldModel);
		}

		if (oldModelClassName.equals(EVPGrantTransactionClp.class.getName())) {
			return translateInputEVPGrantTransaction(oldModel);
		}

		if (oldModelClassName.equals(EVPKaleoForkInstanceClp.class.getName())) {
			return translateInputEVPKaleoForkInstance(oldModel);
		}

		if (oldModelClassName.equals(EVPRequestOrganizationClp.class.getName())) {
			return translateInputEVPRequestOrganization(oldModel);
		}

		if (oldModelClassName.equals(EVPServiceRequestClp.class.getName())) {
			return translateInputEVPServiceRequest(oldModel);
		}

		return oldModel;
	}

	public static Object translateInput(List<Object> oldList) {
		List<Object> newList = new ArrayList<Object>(oldList.size());

		for (int i = 0; i < oldList.size(); i++) {
			Object curObj = oldList.get(i);

			newList.add(translateInput(curObj));
		}

		return newList;
	}

	public static Object translateInputEVPDivision(BaseModel<?> oldModel) {
		EVPDivisionClp oldClpModel = (EVPDivisionClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPDivisionRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPEmployee(BaseModel<?> oldModel) {
		EVPEmployeeClp oldClpModel = (EVPEmployeeClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPEmployeeRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPGrantRequest(BaseModel<?> oldModel) {
		EVPGrantRequestClp oldClpModel = (EVPGrantRequestClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPGrantRequestRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPGrantTransaction(
		BaseModel<?> oldModel) {
		EVPGrantTransactionClp oldClpModel = (EVPGrantTransactionClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPGrantTransactionRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPKaleoForkInstance(
		BaseModel<?> oldModel) {
		EVPKaleoForkInstanceClp oldClpModel = (EVPKaleoForkInstanceClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPKaleoForkInstanceRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPRequestOrganization(
		BaseModel<?> oldModel) {
		EVPRequestOrganizationClp oldClpModel = (EVPRequestOrganizationClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPRequestOrganizationRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInputEVPServiceRequest(BaseModel<?> oldModel) {
		EVPServiceRequestClp oldClpModel = (EVPServiceRequestClp)oldModel;

		BaseModel<?> newModel = oldClpModel.getEVPServiceRequestRemoteModel();

		newModel.setModelAttributes(oldClpModel.getModelAttributes());

		return newModel;
	}

	public static Object translateInput(Object obj) {
		if (obj instanceof BaseModel<?>) {
			return translateInput((BaseModel<?>)obj);
		}
		else if (obj instanceof List<?>) {
			return translateInput((List<Object>)obj);
		}
		else {
			return obj;
		}
	}

	public static Object translateOutput(BaseModel<?> oldModel) {
		Class<?> oldModelClass = oldModel.getClass();

		String oldModelClassName = oldModelClass.getName();

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPDivisionImpl")) {
			return translateOutputEVPDivision(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPEmployeeImpl")) {
			return translateOutputEVPEmployee(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPGrantRequestImpl")) {
			return translateOutputEVPGrantRequest(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPGrantTransactionImpl")) {
			return translateOutputEVPGrantTransaction(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPKaleoForkInstanceImpl")) {
			return translateOutputEVPKaleoForkInstance(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPRequestOrganizationImpl")) {
			return translateOutputEVPRequestOrganization(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		if (oldModelClassName.equals(
					"com.liferay.evp.model.impl.EVPServiceRequestImpl")) {
			return translateOutputEVPServiceRequest(oldModel);
		}
		else if (oldModelClassName.endsWith("Clp")) {
			try {
				ClassLoader classLoader = ClpSerializer.class.getClassLoader();

				Method getClpSerializerClassMethod = oldModelClass.getMethod(
						"getClpSerializerClass");

				Class<?> oldClpSerializerClass = (Class<?>)getClpSerializerClassMethod.invoke(oldModel);

				Class<?> newClpSerializerClass = classLoader.loadClass(oldClpSerializerClass.getName());

				Method translateOutputMethod = newClpSerializerClass.getMethod("translateOutput",
						BaseModel.class);

				Class<?> oldModelModelClass = oldModel.getModelClass();

				Method getRemoteModelMethod = oldModelClass.getMethod("get" +
						oldModelModelClass.getSimpleName() + "RemoteModel");

				Object oldRemoteModel = getRemoteModelMethod.invoke(oldModel);

				BaseModel<?> newModel = (BaseModel<?>)translateOutputMethod.invoke(null,
						oldRemoteModel);

				return newModel;
			}
			catch (Throwable t) {
				if (_log.isInfoEnabled()) {
					_log.info("Unable to translate " + oldModelClassName, t);
				}
			}
		}

		return oldModel;
	}

	public static Object translateOutput(List<Object> oldList) {
		List<Object> newList = new ArrayList<Object>(oldList.size());

		for (int i = 0; i < oldList.size(); i++) {
			Object curObj = oldList.get(i);

			newList.add(translateOutput(curObj));
		}

		return newList;
	}

	public static Object translateOutput(Object obj) {
		if (obj instanceof BaseModel<?>) {
			return translateOutput((BaseModel<?>)obj);
		}
		else if (obj instanceof List<?>) {
			return translateOutput((List<Object>)obj);
		}
		else {
			return obj;
		}
	}

	public static Throwable translateThrowable(Throwable throwable) {
		if (_useReflectionToTranslateThrowable) {
			try {
				UnsyncByteArrayOutputStream unsyncByteArrayOutputStream = new UnsyncByteArrayOutputStream();
				ObjectOutputStream objectOutputStream = new ObjectOutputStream(unsyncByteArrayOutputStream);

				objectOutputStream.writeObject(throwable);

				objectOutputStream.flush();
				objectOutputStream.close();

				UnsyncByteArrayInputStream unsyncByteArrayInputStream = new UnsyncByteArrayInputStream(unsyncByteArrayOutputStream.unsafeGetByteArray(),
						0, unsyncByteArrayOutputStream.size());

				Thread currentThread = Thread.currentThread();

				ClassLoader contextClassLoader = currentThread.getContextClassLoader();

				ObjectInputStream objectInputStream = new ClassLoaderObjectInputStream(unsyncByteArrayInputStream,
						contextClassLoader);

				throwable = (Throwable)objectInputStream.readObject();

				objectInputStream.close();

				return throwable;
			}
			catch (ClassNotFoundException cnfe) {
				if (_log.isInfoEnabled()) {
					_log.info("Do not use reflection to translate throwable");
				}

				_useReflectionToTranslateThrowable = false;
			}
			catch (SecurityException se) {
				if (_log.isInfoEnabled()) {
					_log.info("Do not use reflection to translate throwable");
				}

				_useReflectionToTranslateThrowable = false;
			}
			catch (Throwable throwable2) {
				_log.error(throwable2, throwable2);

				return throwable2;
			}
		}

		Class<?> clazz = throwable.getClass();

		String className = clazz.getName();

		if (className.equals("com.liferay.evp.NoSuchDivisionException")) {
			return new com.liferay.evp.NoSuchDivisionException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals("com.liferay.evp.NoSuchEmployeeException")) {
			return new com.liferay.evp.NoSuchEmployeeException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals("com.liferay.evp.NoSuchGrantRequestException")) {
			return new com.liferay.evp.NoSuchGrantRequestException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals("com.liferay.evp.NoSuchGrantTransactionException")) {
			return new com.liferay.evp.NoSuchGrantTransactionException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals("com.liferay.evp.NoSuchKaleoForkInstanceException")) {
			return new com.liferay.evp.NoSuchKaleoForkInstanceException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals(
					"com.liferay.evp.NoSuchRequestOrganizationException")) {
			return new com.liferay.evp.NoSuchRequestOrganizationException(throwable.getMessage(),
				throwable.getCause());
		}

		if (className.equals("com.liferay.evp.NoSuchServiceRequestException")) {
			return new com.liferay.evp.NoSuchServiceRequestException(throwable.getMessage(),
				throwable.getCause());
		}

		return throwable;
	}

	public static Object translateOutputEVPDivision(BaseModel<?> oldModel) {
		EVPDivisionClp newModel = new EVPDivisionClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPDivisionRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPEmployee(BaseModel<?> oldModel) {
		EVPEmployeeClp newModel = new EVPEmployeeClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPEmployeeRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPGrantRequest(BaseModel<?> oldModel) {
		EVPGrantRequestClp newModel = new EVPGrantRequestClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPGrantRequestRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPGrantTransaction(
		BaseModel<?> oldModel) {
		EVPGrantTransactionClp newModel = new EVPGrantTransactionClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPGrantTransactionRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPKaleoForkInstance(
		BaseModel<?> oldModel) {
		EVPKaleoForkInstanceClp newModel = new EVPKaleoForkInstanceClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPKaleoForkInstanceRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPRequestOrganization(
		BaseModel<?> oldModel) {
		EVPRequestOrganizationClp newModel = new EVPRequestOrganizationClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPRequestOrganizationRemoteModel(oldModel);

		return newModel;
	}

	public static Object translateOutputEVPServiceRequest(BaseModel<?> oldModel) {
		EVPServiceRequestClp newModel = new EVPServiceRequestClp();

		newModel.setModelAttributes(oldModel.getModelAttributes());

		newModel.setEVPServiceRequestRemoteModel(oldModel);

		return newModel;
	}

	private static Log _log = LogFactoryUtil.getLog(ClpSerializer.class);
	private static String _servletContextName;
	private static boolean _useReflectionToTranslateThrowable = true;
}
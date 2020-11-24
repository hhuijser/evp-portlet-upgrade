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

package com.liferay.evp.hook.upgrade.v1_1_0;

import com.liferay.alloy.mvc.AlloyServiceInvoker;
import com.liferay.compat.portal.kernel.upgrade.UpgradeProcess;
import com.liferay.compat.portal.util.PortalUtil;
import com.liferay.evp.model.EVPGrantRequest;
import com.liferay.evp.model.EVPServiceRequest;
import com.liferay.evp.util.EVPWorkflowUtil;
import com.liferay.portal.kernel.bean.BeanPropertiesUtil;
import com.liferay.portal.kernel.dao.orm.DynamicQuery;
import com.liferay.portal.kernel.dao.orm.Property;
import com.liferay.portal.kernel.dao.orm.PropertyFactoryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ArrayUtil;
import com.liferay.portal.kernel.workflow.WorkflowInstance;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.model.WorkflowInstanceLink;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portlet.messageboards.model.MBDiscussion;
import com.liferay.portlet.messageboards.model.MBMessage;
import com.liferay.portlet.messageboards.service.MBDiscussionLocalServiceUtil;
import com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Ethan Bustad
 */
public class UpgradeMBMessage extends UpgradeProcess {

	@Override
	protected void doUpgrade() throws Exception {
		updateMBMessage();
	}

	protected WorkflowInstanceLink fetchWorkflowInstanceLink(
			long workflowInstanceId)
		throws Exception {

		AlloyServiceInvoker workflowInstanceLinkAlloyServiceInvoker =
			new AlloyServiceInvoker(WorkflowInstanceLink.class.getName());

		List<WorkflowInstanceLink> workflowInstanceLinks =
			workflowInstanceLinkAlloyServiceInvoker.executeDynamicQuery(
				new Object[] {"workflowInstanceId", workflowInstanceId});

		if (workflowInstanceLinks.isEmpty()) {
			return null;
		}

		return workflowInstanceLinks.get(0);
	}

	protected void updateMBMessage() throws Exception {
		ServiceContext serviceContext =
			ServiceContextThreadLocal.getServiceContext();

		Map<Long, Long> evpGrantRequestMap =
			(Map<Long, Long>)serviceContext.getAttribute("evpGrantRequestMap");

		Map<Long, Long> evpServiceRequestMap =
			(Map<Long, Long>)serviceContext.getAttribute(
				"evpServiceRequestMap");

		AlloyServiceInvoker mbMessageAlloyServiceInvoker =
			new AlloyServiceInvoker(MBMessage.class.getName());

		DynamicQuery mbMessageDynamicQuery =
			mbMessageAlloyServiceInvoker.buildDynamicQuery();

		Property classNameIdProperty = PropertyFactoryUtil.forName(
			"classNameId");

		List<Long> classNameIds = new ArrayList<Long>();

		for (String className : _CLASS_NAMES_MB_MESSAGE) {
			classNameIds.add(PortalUtil.getClassNameId(className));
		}

		mbMessageDynamicQuery.add(classNameIdProperty.in(classNameIds));

		List<MBMessage> mbMessages =
			mbMessageAlloyServiceInvoker.executeDynamicQuery(
				mbMessageDynamicQuery);

		for (MBMessage mbMessage : mbMessages) {
			String className = null;
			long classPK = 0;

			String originalClassName = mbMessage.getClassName();
			long originalClassPK = mbMessage.getClassPK();

			if (originalClassName.equals(_CLASS_NAME_GENERAL_GRANT_REQUEST)) {
				if (!evpGrantRequestMap.containsKey(originalClassPK)) {
					_log.error(
						"evp_GeneralGrantRequest " + originalClassPK +
							" does not have a corresponding EVPGrantRequest");

					continue;
				}

				className = EVPGrantRequest.class.getName();
				classPK = evpGrantRequestMap.get(originalClassPK);
			}
			else if (originalClassName.equals(
						_CLASS_NAME_GENERAL_SERVICE_REQUEST)) {

				if (!evpServiceRequestMap.containsKey(originalClassPK)) {
					_log.error(
						"evp_GeneralServiceRequest " + originalClassPK +
							" does not have a corresponding EVPServiceRequest");

					continue;
				}

				className = EVPServiceRequest.class.getName();
				classPK = evpServiceRequestMap.get(originalClassPK);
			}
			else {
				className = WorkflowInstance.class.getName();

				String evpRequestClassName = null;
				long evpRequestClassPK = 0;

				WorkflowInstanceLink workflowInstanceLink =
					fetchWorkflowInstanceLink(originalClassPK);

				if (workflowInstanceLink == null) {
					_log.error(
						"No WorkflowInstance found with ID " + originalClassPK);

					continue;
				}

				if (ArrayUtil.contains(
						_CLASS_NAMES_OTHER_GRANT_REQUESTS,
						workflowInstanceLink.getClassName())) {

					if (!evpGrantRequestMap.containsKey(
							workflowInstanceLink.getClassPK())) {

						_log.error(
							"No EVPGrantRequest for evp_GeneralGrantRequest " +
								originalClassPK);

						continue;
					}

					evpRequestClassName = EVPGrantRequest.class.getName();
					evpRequestClassPK = evpGrantRequestMap.get(
						workflowInstanceLink.getClassPK());
				}
				else if (ArrayUtil.contains(
							_CLASS_NAMES_OTHER_SERVICE_REQUESTS,
							workflowInstanceLink.getClassName())) {

					if (!evpServiceRequestMap.containsKey(
							workflowInstanceLink.getClassPK())) {

						_log.error(
							"No EVPServiceRequest for " +
								"evp_GeneralServiceRequest " + originalClassPK);

						continue;
					}

					evpRequestClassName = EVPServiceRequest.class.getName();
					evpRequestClassPK = evpServiceRequestMap.get(
						workflowInstanceLink.getClassPK());
				}

				AlloyServiceInvoker alloyServiceInvoker =
					new AlloyServiceInvoker(evpRequestClassName);

				BaseModel<?> baseModel = alloyServiceInvoker.fetchModel(
					evpRequestClassPK);

				long companyId = BeanPropertiesUtil.getLong(
					baseModel, "companyId");
				long groupId = BeanPropertiesUtil.getLong(
					baseModel, "subsidiaryGroupId");

				classPK = EVPWorkflowUtil.getWorkflowInstanceId(
					companyId, groupId, evpRequestClassName, evpRequestClassPK);
			}

			mbMessage.setClassName(className);
			mbMessage.setClassPK(classPK);

			MBMessageLocalServiceUtil.updateMBMessage(mbMessage);

			try {
				MBDiscussion mbDiscussion =
					MBDiscussionLocalServiceUtil.getDiscussion(
						originalClassName, originalClassPK);

				mbDiscussion.setClassName(className);
				mbDiscussion.setClassPK(classPK);

				MBDiscussionLocalServiceUtil.updateMBDiscussion(mbDiscussion);
			}
			catch (Exception e) {
			}
		}
	}

	private static final String _CLASS_NAME_GENERAL_GRANT_REQUEST =
		"com.liferay.evp.model.GeneralGrantRequest";

	private static final String _CLASS_NAME_GENERAL_SERVICE_REQUEST =
		"com.liferay.evp.model.GeneralServiceRequest";

	private static final String _CLASS_NAME_WORKFLOW_INSTANCE =
		"com.liferay.portal.kernel.workflow.WorkflowInstance";

	private static final String[] _CLASS_NAMES_MB_MESSAGE = {
		_CLASS_NAME_GENERAL_GRANT_REQUEST, _CLASS_NAME_GENERAL_SERVICE_REQUEST,
		_CLASS_NAME_WORKFLOW_INSTANCE
	};

	private static final String[] _CLASS_NAMES_OTHER_GRANT_REQUESTS = {
		"com.liferay.evp.model.BrazilGrantRequest",
		"com.liferay.evp.model.ChinaGrantRequest",
		"com.liferay.evp.model.GermanyGrantRequest",
		"com.liferay.evp.model.SpainGrantRequest",
		"com.liferay.evp.model.USGrantRequest"
	};

	private static final String[] _CLASS_NAMES_OTHER_SERVICE_REQUESTS = {
		"com.liferay.evp.model.BrazilServiceRequest",
		"com.liferay.evp.model.BrazilVolunteerServiceCompletion",
		"com.liferay.evp.model.ChinaServiceRequest",
		"com.liferay.evp.model.ChinaVolunteerServiceCompletion",
		"com.liferay.evp.model.GermanyServiceRequest",
		"com.liferay.evp.model.GermanyVolunteerServiceCompletion",
		"com.liferay.evp.model.SpainServiceRequest",
		"com.liferay.evp.model.SpainVolunteerServiceCompletion",
		"com.liferay.evp.model.USServiceRequest",
		"com.liferay.evp.model.USVolunteerServiceCompletion"
	};

	private static Log _log = LogFactoryUtil.getLog(UpgradeMBMessage.class);

}
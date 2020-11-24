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

import com.liferay.compat.portal.kernel.util.ListUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Val Nagy
 * @author Danny Situ
 */
public class EVPWorkflowConstants {

	public static final String GRANT_LABEL_CANCELLED = "cancelled";

	public static final String GRANT_LABEL_COMPLETED = "completed";

	public static final String GRANT_LABEL_MORE_INFO_FROM_USER =
		"pending-more-information-from-user";

	public static final String GRANT_LABEL_PENDING_FINANCIAL_REVIEW =
		"processing-by-finance";

	public static final String GRANT_LABEL_REJECTED = "rejected";

	public static final String GRANT_LABEL_REQUEST_SUBMITTED =
		"pending-review-by-evp-team";

	public static final String GRANT_LABEL_RESUBMIT = "resubmit";

	public static final String GRANT_LABEL_UNKNOWN = "unknown";

	public static final String
		GRANT_LABEL_VALIDATION_REQUESTED_FROM_COUNTRY_COORDINATOR =
			"pending-review-by-country-coordinator";

	public static final String
		GRANT_LABEL_VALIDATION_REQUESTED_FROM_GLOBAL_EVP =
			"pending-review-by-global-evp-team";

	public static final String GRANT_LABEL_VALIDATION_REQUESTED_FROM_HR =
		"pending-review-by-hr";

	public static final int GRANT_STATUS_CANCELLED = 110;

	public static final int GRANT_STATUS_COMPLETED = 106;

	public static final int GRANT_STATUS_MORE_INFO_FROM_USER = 103;

	public static final int GRANT_STATUS_PENDING_FINANCIAL_REVIEW = 102;

	public static final int GRANT_STATUS_REJECTED = 107;

	public static final int GRANT_STATUS_REQUEST_SUBMITTED = 101;

	public static final int GRANT_STATUS_UNKNOWN = 100;

	public static final int
		GRANT_STATUS_VALIDATION_REQUESTED_FROM_COUNTRY_COORDINATOR = 111;

	public static final int GRANT_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP =
		108;

	public static final int GRANT_STATUS_VALIDATION_REQUESTED_FROM_HR = 104;

	public static final int[] GRANT_STATUSES_COMPLETE =
		{GRANT_STATUS_CANCELLED, GRANT_STATUS_COMPLETED, GRANT_STATUS_REJECTED};

	public static final int[] GRANT_STATUSES_EXCLUDABLE =
		{GRANT_STATUS_CANCELLED, GRANT_STATUS_REJECTED};

	public static final int SERVICE_FORK_TYPE_EVP_TEAM = 3;

	public static final int SERVICE_FORK_TYPE_FEEDBACK = 2;

	public static final int SERVICE_FORK_TYPE_MANAGER = 4;

	public static final int SERVICE_FORK_TYPE_PROOF = 1;

	public static final String SERVICE_LABEL_APPROVED_BY_EVP_TEAM =
		"approved-by-evp-team";

	public static final String SERVICE_LABEL_APPROVED_BY_MANAGER =
		"approved-by-manager";

	public static final String SERVICE_LABEL_APPROVED_BY_MANAGER_AND_EVP_TEAM =
		"approved-by-manager-and-evp-team";

	public static final String
		SERVICE_LABEL_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER =
			"evp-team-requested-more-information-from-user";

	public static final String
		SERVICE_LABEL_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER =
			"manager-requested-more-information-from-user";

	public static final String SERVICE_LABEL_COMPLETED = "completed";

	public static final String SERVICE_LABEL_DISQUALIFIED =
		"service-disqualified";

	public static final String SERVICE_LABEL_FEEDBACK_FORM_APPROVED =
		"approved-feedback-form";

	public static final String
		SERVICE_LABEL_FEEDBACK_PENDING_INFO_FROM_USER =
			"feedback-form-pending-more-information-from-user";

	public static final String SERVICE_LABEL_FEEDBACK_PROOF_FORK =
		"feedback-and-proof-fork";

	public static final String SERVICE_LABEL_MORE_INFO_FROM_USER =
		"pending-more-information-from-user";

	public static final String SERVICE_LABEL_PENDING_FEEDBACK_FORM =
		"waiting-for-feedback-form";

	public static final String SERVICE_LABEL_PENDING_FEEDBACK_FORM_REVIEW =
		"pending-feedback-form-review";

	public static final String
		SERVICE_LABEL_PENDING_INFO_FROM_SERVICE_ORGANIZATION =
			"pending-more-information-from-organization-contact";

	public static final String SERVICE_LABEL_PENDING_PROOF_FORM =
		"waiting-for-proof-of-service-completion-form";

	public static final String SERVICE_LABEL_PENDING_PROOF_FORM_REVIEW =
		"pending-proof-of-service-review";

	public static final String
		SERVICE_LABEL_PENDING_REVIEW_BY_COUNTRY_COORDINATOR =
			"pending-review-by-country-coordinator";

	public static final String SERVICE_LABEL_PENDING_REVIEW_BY_EVP_TEAM =
		"pending-review-by-evp-team";

	public static final String SERVICE_LABEL_PENDING_REVIEW_BY_HR =
		"pending-review-by-hr";

	public static final String SERVICE_LABEL_PENDING_REVIEW_BY_MANAGER =
		"pending-review-by-manager";

	public static final String
		SERVICE_LABEL_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK =
			"pending-review-by-manager-and-evp-team-fork";

	public static final String SERVICE_LABEL_PENDING_SERVICE_COMPLETION =
		"waiting-for-service-completion";

	public static final String SERVICE_LABEL_PROOF_FORM_APPROVED =
		"approved-proof-of-service";

	public static final String SERVICE_LABEL_PROOF_FORM_REJECTED =
		"rejected-proof-of-service";

	public static final String SERVICE_LABEL_REJECTED_BY_COUNTRY_COORDINATOR =
		"rejected-by-country-coordinator";

	public static final String SERVICE_LABEL_REJECTED_BY_EVP_TEAM =
		"rejected-by-evp-team";

	public static final String SERVICE_LABEL_REJECTED_BY_GLOBAL_EVP_TEAM =
		"rejected-by-global-evp-team";

	public static final String SERVICE_LABEL_REJECTED_BY_HR = "rejected-by-hr";

	public static final String SERVICE_LABEL_REJECTED_BY_MANAGER =
		"rejected-by-manager";

	public static final String SERVICE_LABEL_REQUEST_CANCELLED = "cancelled";

	public static final String SERVICE_LABEL_REQUEST_REJECTED = "rejected";

	public static final String SERVICE_LABEL_SERVICE_COMPLETED =
		"service-completed";

	public static final String SERVICE_LABEL_SUBMITTED = "request-submitted";

	public static final String SERVICE_LABEL_UNKNOWN = "unknown";

	public static final String
		SERVICE_LABEL_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM =
			"pending-review-by-global-evp-team";

	public static final int SERVICE_STATUS_APPROVED_BY_EVP_TEAM = 208;

	public static final int SERVICE_STATUS_APPROVED_BY_MANAGER = 206;

	public static final int
		SERVICE_STATUS_APPROVED_BY_MANAGER_AND_EVP_TEAM = 210;

	public static final int
		SERVICE_STATUS_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER = 238;

	public static final int
		SERVICE_STATUS_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER = 239;

	public static final int
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_COUNTRY_COORDINATOR = 245;

	public static final int SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM = 240;

	public static final int
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_GLOBAL_EVP_TEAM = 242;

	public static final int SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_HR = 241;

	public static final int SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_MANAGER = 243;

	public static final int SERVICE_STATUS_COMPLETED = 234;

	public static final int SERVICE_STATUS_DISQUALIFIED = 233;

	public static final int SERVICE_STATUS_FEEDBACK_FORM_APPROVED = 229;

	public static final int
		SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER = 228;

	public static final int SERVICE_STATUS_FEEDBACK_PROOF_FORK = 231;

	public static final int SERVICE_STATUS_GLOBAL_EVP_TEAM_VALIDATED = 224;

	public static final int SERVICE_STATUS_MANAGER_AND_EVP_TEAM_APPROVED = 210;

	public static final int SERVICE_STATUS_MANAGER_APPROVED = 206;

	public static final int SERVICE_STATUS_MANAGER_REJECTED = 207;

	public static final int SERVICE_STATUS_MORE_INFO_FROM_USER = 203;

	public static final int SERVICE_STATUS_PENDING_FEEDBACK_FORM = 227;

	public static final int SERVICE_STATUS_PENDING_FEEDBACK_FORM_REVIEW = 230;

	public static final int
		SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION = 218;

	public static final int SERVICE_STATUS_PENDING_PROOF_FORM = 214;

	public static final int SERVICE_STATUS_PENDING_PROOF_FORM_REVIEW = 215;

	public static final int
		SERVICE_STATUS_PENDING_REVIEW_BY_COUNTRY_COORDINATOR = 244;

	public static final int SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM = 222;

	public static final int SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM_IN_FORK =
		235;

	public static final int SERVICE_STATUS_PENDING_REVIEW_BY_HR = 221;

	public static final int SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER = 237;

	public static final int
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK = 202;

	public static final int SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK =
		236;

	public static final int SERVICE_STATUS_PENDING_SERVICE_COMPLETION = 212;

	public static final int SERVICE_STATUS_PROOF_FORM_APPROVED = 216;

	public static final int SERVICE_STATUS_PROOF_FORM_REJECTED = 217;

	public static final int SERVICE_STATUS_REJECTED_BY_EVP_TEAM = 209;

	public static final int SERVICE_STATUS_REJECTED_BY_MANAGER = 207;

	public static final int SERVICE_STATUS_REQUEST_CANCELLED = 225;

	public static final int SERVICE_STATUS_REQUEST_REJECTED = 211;

	public static final int SERVICE_STATUS_SERVICE_COMPLETED = 213;

	public static final int SERVICE_STATUS_SUBMITTED = 201;

	public static final int SERVICE_STATUS_UNKNOWN = 200;

	public static final int
		SERVICE_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM = 223;

	public static final int[] SERVICE_STATUSES_ACTIVE = {
		SERVICE_STATUS_APPROVED_BY_EVP_TEAM, SERVICE_STATUS_APPROVED_BY_MANAGER,
		SERVICE_STATUS_APPROVED_BY_MANAGER_AND_EVP_TEAM,
		SERVICE_STATUS_FEEDBACK_FORM_APPROVED,
		SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER,
		SERVICE_STATUS_FEEDBACK_PROOF_FORK, SERVICE_STATUS_MORE_INFO_FROM_USER,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM_REVIEW,
		SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION,
		SERVICE_STATUS_PENDING_PROOF_FORM,
		SERVICE_STATUS_PENDING_PROOF_FORM_REVIEW,
		SERVICE_STATUS_PENDING_REVIEW_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM,
		SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM_IN_FORK,
		SERVICE_STATUS_PENDING_REVIEW_BY_HR,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK,
		SERVICE_STATUS_PENDING_SERVICE_COMPLETION,
		SERVICE_STATUS_PROOF_FORM_APPROVED, SERVICE_STATUS_PROOF_FORM_REJECTED,
		SERVICE_STATUS_SUBMITTED,
		SERVICE_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM
	};

	public static final int[] SERVICE_STATUSES_AUTO_JOIN = {
		SERVICE_STATUS_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_GLOBAL_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_HR,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_MANAGER,
		SERVICE_STATUS_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER
	};

	public static final int[] SERVICE_STATUSES_EVP_TEAM = {
		SERVICE_STATUS_APPROVED_BY_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_GLOBAL_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_HR,
		SERVICE_STATUS_PENDING_REVIEW_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM_IN_FORK,
		SERVICE_STATUS_PENDING_REVIEW_BY_HR,
		SERVICE_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM
	};

	public static final int[] SERVICE_STATUSES_EXCLUDABLE = {
		SERVICE_STATUS_REQUEST_CANCELLED, SERVICE_STATUS_REQUEST_REJECTED
	};

	public static final int[] SERVICE_STATUSES_FEEDBACK = {
		SERVICE_STATUS_FEEDBACK_FORM_APPROVED,
		SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM_REVIEW
	};

	public static final int[] SERVICE_STATUSES_FEEDBACK_USER_EDITABLE = {
		SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM
	};

	public static final int[] SERVICE_STATUSES_FORK = {
		SERVICE_STATUS_FEEDBACK_PROOF_FORK,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK
	};

	public static final int[] SERVICE_STATUSES_FORK_TYPES = {
		SERVICE_FORK_TYPE_EVP_TEAM, SERVICE_FORK_TYPE_FEEDBACK,
		SERVICE_FORK_TYPE_MANAGER, SERVICE_FORK_TYPE_PROOF
	};

	public static final int[] SERVICE_STATUSES_INFO_REQUESTED = {
		SERVICE_STATUS_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER,
		SERVICE_STATUS_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER
	};

	public static final int[] SERVICE_STATUSES_MANAGER = {
		SERVICE_STATUS_APPROVED_BY_MANAGER,
		SERVICE_STATUS_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_MANAGER,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK
	};

	public static final int[] SERVICE_STATUSES_MANAGER_USER = {
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK
	};

	public static final int[] SERVICE_STATUSES_ORGANIZATION_CONTACT = {
		SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION,
		SERVICE_STATUS_PENDING_PROOF_FORM
	};

	public static final int[] SERVICE_STATUSES_PROOF = {
		SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION,
		SERVICE_STATUS_PENDING_PROOF_FORM,
		SERVICE_STATUS_PENDING_PROOF_FORM_REVIEW,
		SERVICE_STATUS_PROOF_FORM_APPROVED, SERVICE_STATUS_PROOF_FORM_REJECTED
	};

	public static final int[] SERVICE_STATUSES_REJECTED = {
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_GLOBAL_EVP_TEAM,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_HR,
		SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_MANAGER,
		SERVICE_STATUS_PROOF_FORM_REJECTED, SERVICE_STATUS_REJECTED_BY_EVP_TEAM,
		SERVICE_STATUS_REJECTED_BY_MANAGER, SERVICE_STATUS_REQUEST_REJECTED
	};

	public static final int[] SERVICE_STATUSES_SEARCHABLE = {
		SERVICE_STATUS_APPROVED_BY_EVP_TEAM, SERVICE_STATUS_APPROVED_BY_MANAGER,
		SERVICE_STATUS_COMPLETED, SERVICE_STATUS_DISQUALIFIED,
		SERVICE_STATUS_FEEDBACK_FORM_APPROVED,
		SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER,
		SERVICE_STATUS_FEEDBACK_PROOF_FORK, SERVICE_STATUS_MORE_INFO_FROM_USER,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM,
		SERVICE_STATUS_PENDING_FEEDBACK_FORM_REVIEW,
		SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION,
		SERVICE_STATUS_PENDING_PROOF_FORM,
		SERVICE_STATUS_PENDING_PROOF_FORM_REVIEW,
		SERVICE_STATUS_PENDING_REVIEW_BY_COUNTRY_COORDINATOR,
		SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM,
		SERVICE_STATUS_PENDING_REVIEW_BY_HR,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER,
		SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK,
		SERVICE_STATUS_PENDING_SERVICE_COMPLETION,
		SERVICE_STATUS_PROOF_FORM_APPROVED, SERVICE_STATUS_PROOF_FORM_REJECTED,
		SERVICE_STATUS_REQUEST_CANCELLED, SERVICE_STATUS_REQUEST_REJECTED,
		SERVICE_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM
	};

	public static final String SERVICE_TRANSITION_APPROVE_FEEDBACK_FORM =
		"approve-feedback-form";

	public static final String SERVICE_TRANSITION_APPROVED_BY_EVP_TEAM =
		"approved-by-evp-team";

	public static final String SERVICE_TRANSITION_APPROVED_BY_MANAGER =
		"approved-by-manager";

	public static final String SERVICE_TRANSITION_CANCEL_REQUEST =
		"cancel-request";

	public static final String SERVICE_TRANSITION_COMPLETE_FEEDBACK_FORM =
		"complete-feedback-form";

	public static final String
		SERVICE_TRANSITION_FORCE_SUBMISSION_OF_FEEDBACK_FORM =
			"force-submission-of-feedback-form";

	public static final String SERVICE_TRANSITION_LABEL_APPROVE = "approve";

	public static final String SERVICE_TRANSITION_LABEL_CANCEL = "cancel";

	public static final String SERVICE_TRANSITION_LABEL_MARK_AS_INVALID =
		"invalid";

	public static final String SERVICE_TRANSITION_LABEL_MARK_AS_VALID = "valid";

	public static final String SERVICE_TRANSITION_LABEL_REJECT = "reject";

	public static final String
		SERVICE_TRANSITION_LABEL_REQUEST_GLOBAL_EVP_TEAM_VALIDATION =
			"request-global-evp-team-validation";

	public static final String
		SERVICE_TRANSITION_LABEL_REQUEST_INFO_FROM_ORGANIZATION_CONTACT =
			"request-more-information-from-organization-contact";

	public static final String SERVICE_TRANSITION_LABEL_REQUEST_INFO_FROM_USER =
		"request-more-information-from-user";

	public static final String
		SERVICE_TRANSITION_LABEL_RESEND_ORGANIZATION_EMAIL =
			"resend-organization-email";

	public static final String SERVICE_TRANSITION_LABEL_RESUBMIT = "resubmit";

	public static final String SERVICE_TRANSITION_LABEL_SUBMIT_FEEDBACK_FORM =
		"submit-feedback-form-for-review";

	public static final String SERVICE_TRANSITION_LABEL_SUBMIT_PROOF_FORM =
		"force-submission-of-proof-of-service-completion";

	public static final String SERVICE_TRANSITION_LABEL_USER_FOUR_WEEK_WARNING =
		"send-four-week-warning-email-to-employee";

	public static final String SERVICE_TRANSITION_LABEL_USER_ONE_WEEK_REMINDER =
		"send-one-week-reminder-email-to-employee";

	public static final String SERVICE_TRANSITION_MARK_AS_INVALID =
		"mark-as-invalid";

	public static final String SERVICE_TRANSITION_MARK_AS_VALID =
		"mark-as-valid";

	public static final String SERVICE_TRANSITION_PENDING_FEEDBACK_FORM_REVIEW =
		"pending-feedback-form-review";

	public static final String SERVICE_TRANSITION_PROOF_FORM_APPROVED =
		"approve-proof-of-service-completion-form";

	public static final String SERVICE_TRANSITION_PROOF_OF_SERVICE_REJECTED =
		"reject-proof-of-service-completion-form";

	public static final String SERVICE_TRANSITION_REJECTED_BY_EVP_TEAM =
		"rejected-by-evp-team";

	public static final String SERVICE_TRANSITION_REJECTED_BY_MANAGER =
		"rejected-by-manager";

	public static final String
		SERVICE_TRANSITION_REQUEST_COUNTRY_COORDINATOR_VALIDATION =
			"request-country-coordinator-validation";

	public static final String
		SERVICE_TRANSITION_REQUEST_GLOBAL_EVP_TEAM_VALIDATION =
			"request-global-evp-team-validation";

	public static final String SERVICE_TRANSITION_REQUEST_HR_VALIDATION =
		"request-hr-validation";

	public static final String
		SERVICE_TRANSITION_REQUEST_INFO_FROM_SERVICE_ORGANIZATION =
			"request-more-information-from-service-organization";

	public static final String SERVICE_TRANSITION_REQUEST_INFO_FROM_USER =
		"request-more-information-from-user";

	public static final String SERVICE_TRANSITION_RESEND_ORGANIZATION_EMAIL =
		"resend-organization-email";

	public static final String SERVICE_TRANSITION_RESUBMIT = "resubmit";

	public static final String SERVICE_TRANSITION_SERVICE_COMPLETED =
		"service-completed";

	public static final String SERVICE_TRANSITION_SUBMIT_FEEDBACK_FORM =
		"submit-feedback-form";

	public static final String SERVICE_TRANSITION_SUBMIT_PROOF_FORM =
		"submit-proof-of-service-completion-form";

	public static final String SERVICE_TRANSITION_UNKNOWN = "unknown";

	public static final String SERVICE_TRANSITION_USER_FOUR_WEEK_WARNING =
		"user-four-week-warning";

	public static final String SERVICE_TRANSITION_USER_ONE_WEEK_REMINDER =
		"user-one-week-reminder";

	public static final String[] SERVICE_TRANSITIONS_AUTO_JOIN = {
		SERVICE_TRANSITION_APPROVED_BY_EVP_TEAM,
		SERVICE_TRANSITION_APPROVED_BY_MANAGER,
		SERVICE_TRANSITION_MARK_AS_INVALID, SERVICE_TRANSITION_MARK_AS_VALID,
		SERVICE_TRANSITION_REJECTED_BY_EVP_TEAM,
		SERVICE_TRANSITION_REJECTED_BY_MANAGER,
		SERVICE_TRANSITION_REQUEST_INFO_FROM_USER
	};

	public static final String[] SERVICE_TRANSITIONS_COMMENTS_REQUIRED = {
		SERVICE_TRANSITION_CANCEL_REQUEST, SERVICE_TRANSITION_MARK_AS_INVALID,
		SERVICE_TRANSITION_MARK_AS_VALID,
		SERVICE_TRANSITION_PROOF_OF_SERVICE_REJECTED,
		SERVICE_TRANSITION_REJECTED_BY_EVP_TEAM,
		SERVICE_TRANSITION_REJECTED_BY_MANAGER,
		SERVICE_TRANSITION_REQUEST_COUNTRY_COORDINATOR_VALIDATION,
		SERVICE_TRANSITION_REQUEST_GLOBAL_EVP_TEAM_VALIDATION,
		SERVICE_TRANSITION_REQUEST_HR_VALIDATION,
		SERVICE_TRANSITION_REQUEST_INFO_FROM_SERVICE_ORGANIZATION,
		SERVICE_TRANSITION_REQUEST_INFO_FROM_USER
	};

	public static final String[] SERVICE_TRANSITIONS_PRIVATE_COMMENTS = {
		SERVICE_TRANSITION_MARK_AS_INVALID, SERVICE_TRANSITION_MARK_AS_VALID,
		SERVICE_TRANSITION_REQUEST_COUNTRY_COORDINATOR_VALIDATION,
		SERVICE_TRANSITION_REQUEST_GLOBAL_EVP_TEAM_VALIDATION,
		SERVICE_TRANSITION_REQUEST_HR_VALIDATION
	};

	public static String getGrantStatusLabel(int grantStatus) {
		if (grantStatus == GRANT_STATUS_CANCELLED) {
			return GRANT_LABEL_CANCELLED;
		}
		else if (grantStatus == GRANT_STATUS_COMPLETED) {
			return GRANT_LABEL_COMPLETED;
		}
		else if (grantStatus == GRANT_STATUS_MORE_INFO_FROM_USER) {
			return GRANT_LABEL_MORE_INFO_FROM_USER;
		}
		else if (grantStatus == GRANT_STATUS_PENDING_FINANCIAL_REVIEW) {
			return GRANT_LABEL_PENDING_FINANCIAL_REVIEW;
		}
		else if (grantStatus == GRANT_STATUS_REJECTED) {
			return GRANT_LABEL_REJECTED;
		}
		else if (grantStatus == GRANT_STATUS_REQUEST_SUBMITTED) {
			return GRANT_LABEL_REQUEST_SUBMITTED;
		}
		else if (grantStatus ==
					GRANT_STATUS_VALIDATION_REQUESTED_FROM_COUNTRY_COORDINATOR)
					{

			return GRANT_LABEL_VALIDATION_REQUESTED_FROM_COUNTRY_COORDINATOR;
		}
		else if (grantStatus ==
					GRANT_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP) {

			return GRANT_LABEL_VALIDATION_REQUESTED_FROM_GLOBAL_EVP;
		}
		else if (grantStatus == GRANT_STATUS_VALIDATION_REQUESTED_FROM_HR) {
			return GRANT_LABEL_VALIDATION_REQUESTED_FROM_HR;
		}
		else {
			return GRANT_LABEL_UNKNOWN;
		}
	}

	public static List<String> getSearchableServiceLabels() throws Exception {
		List<String> searchableServiceLabels = new ArrayList<String>();

		for (int serviceStatus :
				EVPWorkflowConstants.SERVICE_STATUSES_SEARCHABLE) {

			searchableServiceLabels.add(getServiceStatusLabel(serviceStatus));
		}

		return ListUtil.sort(searchableServiceLabels);
	}

	public static int getServiceForkTypeInitialStatus(int type)
		throws Exception {

		if (type == SERVICE_FORK_TYPE_EVP_TEAM) {
			return SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM_IN_FORK;
		}
		else if (type == SERVICE_FORK_TYPE_FEEDBACK) {
			return SERVICE_STATUS_PENDING_FEEDBACK_FORM;
		}
		else if (type == SERVICE_FORK_TYPE_PROOF) {
			return SERVICE_STATUS_PENDING_PROOF_FORM;
		}
		else if (type == SERVICE_FORK_TYPE_MANAGER) {
			return SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK;
		}
		else {
			throw new Exception("Invalid service fork type " + type);
		}
	}

	public static int getServiceForkTypeMainStatus(int type) {
		if (type == SERVICE_FORK_TYPE_EVP_TEAM) {
			return SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK;
		}
		else if (type == SERVICE_FORK_TYPE_FEEDBACK) {
			return SERVICE_STATUS_FEEDBACK_PROOF_FORK;
		}
		else if (type == SERVICE_FORK_TYPE_PROOF) {
			return SERVICE_STATUS_FEEDBACK_PROOF_FORK;
		}
		else if (type == SERVICE_FORK_TYPE_MANAGER) {
			return SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK;
		}
		else {
			return SERVICE_STATUS_UNKNOWN;
		}
	}

	public static int[] getServiceForkTypeStatuses(int type) throws Exception {
		if (type == SERVICE_FORK_TYPE_EVP_TEAM) {
			return SERVICE_STATUSES_EVP_TEAM;
		}
		else if (type == SERVICE_FORK_TYPE_FEEDBACK) {
			return SERVICE_STATUSES_FEEDBACK;
		}
		else if (type == SERVICE_FORK_TYPE_PROOF) {
			return SERVICE_STATUSES_PROOF;
		}
		else if (type == SERVICE_FORK_TYPE_MANAGER) {
			return SERVICE_STATUSES_MANAGER;
		}
		else {
			throw new Exception("Invalid service fork type " + type);
		}
	}

	public static String getServiceStatusLabel(int serviceStatus) {
		if (serviceStatus == SERVICE_STATUS_APPROVED_BY_EVP_TEAM) {
			return SERVICE_LABEL_APPROVED_BY_EVP_TEAM;
		}
		else if (serviceStatus == SERVICE_STATUS_APPROVED_BY_MANAGER) {
			return SERVICE_LABEL_APPROVED_BY_MANAGER;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_APPROVED_BY_MANAGER_AND_EVP_TEAM) {

			return SERVICE_LABEL_APPROVED_BY_MANAGER_AND_EVP_TEAM;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_COUNTRY_COORDINATOR) {

			return SERVICE_LABEL_REJECTED_BY_COUNTRY_COORDINATOR;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM) {

			return SERVICE_LABEL_REJECTED_BY_EVP_TEAM;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_GLOBAL_EVP_TEAM) {

			return SERVICE_LABEL_REJECTED_BY_GLOBAL_EVP_TEAM;
		}
		else if (serviceStatus == SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_HR) {
			return SERVICE_LABEL_REJECTED_BY_HR;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_MANAGER) {

			return SERVICE_LABEL_REJECTED_BY_MANAGER;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER)
					{

			return SERVICE_LABEL_AUTO_JOIN_EVP_TEAM_REQUESTED_INFO_FROM_USER;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER) {

			return SERVICE_LABEL_AUTO_JOIN_MANAGER_REQUESTED_INFO_FROM_USER;
		}
		else if (serviceStatus == SERVICE_STATUS_COMPLETED) {
			return SERVICE_LABEL_COMPLETED;
		}
		else if (serviceStatus == SERVICE_STATUS_DISQUALIFIED) {
			return SERVICE_LABEL_DISQUALIFIED;
		}
		else if (serviceStatus == SERVICE_STATUS_FEEDBACK_FORM_APPROVED) {
			return SERVICE_LABEL_FEEDBACK_FORM_APPROVED;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_FEEDBACK_PENDING_INFO_FROM_USER) {

			return SERVICE_LABEL_FEEDBACK_PENDING_INFO_FROM_USER;
		}
		else if (serviceStatus == SERVICE_STATUS_FEEDBACK_PROOF_FORK) {
			return SERVICE_LABEL_FEEDBACK_PROOF_FORK;
		}
		else if (serviceStatus == SERVICE_STATUS_MORE_INFO_FROM_USER) {
			return SERVICE_LABEL_MORE_INFO_FROM_USER;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_FEEDBACK_FORM) {
			return SERVICE_LABEL_PENDING_FEEDBACK_FORM;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_FEEDBACK_FORM_REVIEW) {
			return SERVICE_LABEL_PENDING_FEEDBACK_FORM_REVIEW;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_REVIEW_BY_HR) {
			return SERVICE_LABEL_PENDING_REVIEW_BY_HR;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_INFO_FROM_SERVICE_ORGANIZATION) {

			return SERVICE_LABEL_PENDING_INFO_FROM_SERVICE_ORGANIZATION;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_SERVICE_COMPLETION) {
			return SERVICE_LABEL_PENDING_SERVICE_COMPLETION;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_PROOF_FORM) {
			return SERVICE_LABEL_PENDING_PROOF_FORM;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_PROOF_FORM_REVIEW) {
			return SERVICE_LABEL_PENDING_PROOF_FORM_REVIEW;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_REVIEW_BY_COUNTRY_COORDINATOR) {

			return SERVICE_LABEL_PENDING_REVIEW_BY_COUNTRY_COORDINATOR;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM) {
			return SERVICE_LABEL_PENDING_REVIEW_BY_EVP_TEAM;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK)
				{

			return SERVICE_LABEL_PENDING_REVIEW_BY_MANAGER_AND_EVP_TEAM_FORK;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_REVIEW_BY_EVP_TEAM_IN_FORK) {

			return SERVICE_LABEL_PENDING_REVIEW_BY_EVP_TEAM;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER) {

			return SERVICE_LABEL_PENDING_REVIEW_BY_MANAGER;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_PENDING_REVIEW_BY_MANAGER_IN_FORK) {

			return SERVICE_LABEL_PENDING_REVIEW_BY_MANAGER;
		}
		else if (serviceStatus == SERVICE_STATUS_PENDING_SERVICE_COMPLETION) {
			return SERVICE_LABEL_PENDING_SERVICE_COMPLETION;
		}
		else if (serviceStatus == SERVICE_STATUS_PROOF_FORM_APPROVED) {
			return SERVICE_LABEL_PROOF_FORM_APPROVED;
		}
		else if (serviceStatus == SERVICE_STATUS_PROOF_FORM_REJECTED) {
			return SERVICE_LABEL_PROOF_FORM_REJECTED;
		}
		else if (serviceStatus == SERVICE_STATUS_REJECTED_BY_EVP_TEAM) {
			return SERVICE_LABEL_REJECTED_BY_EVP_TEAM;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_AUTO_JOIN_REJECTED_BY_EVP_TEAM) {

			return SERVICE_LABEL_REJECTED_BY_EVP_TEAM;
		}
		else if (serviceStatus == SERVICE_STATUS_REJECTED_BY_MANAGER) {
			return SERVICE_LABEL_REJECTED_BY_MANAGER;
		}
		else if (serviceStatus == SERVICE_STATUS_REQUEST_CANCELLED) {
			return SERVICE_LABEL_REQUEST_CANCELLED;
		}
		else if (serviceStatus == SERVICE_STATUS_REQUEST_REJECTED) {
			return SERVICE_LABEL_REQUEST_REJECTED;
		}
		else if (serviceStatus == SERVICE_STATUS_SERVICE_COMPLETED) {
			return SERVICE_LABEL_SERVICE_COMPLETED;
		}
		else if (serviceStatus == SERVICE_STATUS_SUBMITTED) {
			return SERVICE_LABEL_SUBMITTED;
		}
		else if (serviceStatus ==
					SERVICE_STATUS_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM) {

			return SERVICE_LABEL_VALIDATION_REQUESTED_FROM_GLOBAL_EVP_TEAM;
		}
		else {
			return SERVICE_LABEL_UNKNOWN;
		}
	}

	public static String getServiceTransitionLabel(String serviceTransition) {
		if (serviceTransition.equals(
				SERVICE_TRANSITION_APPROVE_FEEDBACK_FORM)) {

			return SERVICE_TRANSITION_LABEL_APPROVE;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_APPROVED_BY_EVP_TEAM)) {

			return SERVICE_TRANSITION_LABEL_APPROVE;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_APPROVED_BY_MANAGER)) {

			return SERVICE_TRANSITION_LABEL_APPROVE;
		}
		else if (serviceTransition.equals(SERVICE_TRANSITION_CANCEL_REQUEST)) {
			return SERVICE_TRANSITION_LABEL_CANCEL;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_COMPLETE_FEEDBACK_FORM)) {

			return SERVICE_TRANSITION_LABEL_APPROVE;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_FORCE_SUBMISSION_OF_FEEDBACK_FORM)) {

			return SERVICE_TRANSITION_FORCE_SUBMISSION_OF_FEEDBACK_FORM;
		}
		else if (serviceTransition.equals(SERVICE_TRANSITION_MARK_AS_INVALID)) {
			return SERVICE_TRANSITION_LABEL_MARK_AS_INVALID;
		}
		else if (serviceTransition.equals(SERVICE_TRANSITION_MARK_AS_VALID)) {
			return SERVICE_TRANSITION_LABEL_MARK_AS_VALID;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REQUEST_COUNTRY_COORDINATOR_VALIDATION))
				{

			return SERVICE_TRANSITION_REQUEST_COUNTRY_COORDINATOR_VALIDATION;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REQUEST_GLOBAL_EVP_TEAM_VALIDATION)) {

			return SERVICE_TRANSITION_LABEL_REQUEST_GLOBAL_EVP_TEAM_VALIDATION;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_PROOF_FORM_APPROVED)) {

			return SERVICE_TRANSITION_LABEL_APPROVE;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_PROOF_OF_SERVICE_REJECTED)) {

			return SERVICE_TRANSITION_LABEL_REJECT;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REJECTED_BY_EVP_TEAM)) {

			return SERVICE_TRANSITION_LABEL_REJECT;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REJECTED_BY_MANAGER)) {

			return SERVICE_TRANSITION_LABEL_REJECT;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REQUEST_HR_VALIDATION)) {

			return SERVICE_TRANSITION_REQUEST_HR_VALIDATION;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REQUEST_INFO_FROM_SERVICE_ORGANIZATION)
				) {

			return
				SERVICE_TRANSITION_LABEL_REQUEST_INFO_FROM_ORGANIZATION_CONTACT;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_REQUEST_INFO_FROM_USER)) {

			return SERVICE_TRANSITION_LABEL_REQUEST_INFO_FROM_USER;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_RESEND_ORGANIZATION_EMAIL)) {

			return SERVICE_TRANSITION_LABEL_RESEND_ORGANIZATION_EMAIL;
		}
		else if (serviceTransition.equals(SERVICE_TRANSITION_RESUBMIT)) {
			return SERVICE_TRANSITION_RESUBMIT;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_SERVICE_COMPLETED)) {

			return SERVICE_TRANSITION_SERVICE_COMPLETED;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_SUBMIT_FEEDBACK_FORM)) {

			return SERVICE_TRANSITION_LABEL_SUBMIT_FEEDBACK_FORM;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_SUBMIT_PROOF_FORM)) {

			return SERVICE_TRANSITION_LABEL_SUBMIT_PROOF_FORM;
		}
		else if (serviceTransition.equals(SERVICE_TRANSITION_UNKNOWN)) {
			return SERVICE_TRANSITION_UNKNOWN;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_USER_FOUR_WEEK_WARNING)) {

			return SERVICE_TRANSITION_LABEL_USER_FOUR_WEEK_WARNING;
		}
		else if (serviceTransition.equals(
					SERVICE_TRANSITION_USER_ONE_WEEK_REMINDER)) {

			return SERVICE_TRANSITION_LABEL_USER_ONE_WEEK_REMINDER;
		}
		else {
			return SERVICE_TRANSITION_UNKNOWN;
		}
	}

}
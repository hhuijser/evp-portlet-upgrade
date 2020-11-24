<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>

<%
String closeRedirect = ParamUtil.getString(request, "closeRedirect");

long groupId = ParamUtil.getLong(request, "groupId");
long liveGroupId = ParamUtil.getLong(request, "liveGroupId");
boolean localPublishing = ParamUtil.getBoolean(request, "localPublishing");

PortletURL renderURL = liferayPortletResponse.createRenderURL();

renderURL.setParameter("struts_action", "/layouts_admin/publish_layouts");
renderURL.setParameter("tabs2", "current-and-previous");
renderURL.setParameter("closeRedirect", closeRedirect);
renderURL.setParameter("groupId", String.valueOf(groupId));
renderURL.setParameter("localPublishing", String.valueOf(localPublishing));

String orderByCol = ParamUtil.getString(request, "orderByCol");
String orderByType = ParamUtil.getString(request, "orderByType");

if (Validator.isNotNull(orderByCol) && Validator.isNotNull(orderByType)) {
	portalPreferences.setValue(PortletKeys.BACKGROUND_TASK, "entries-order-by-col", orderByCol);
	portalPreferences.setValue(PortletKeys.BACKGROUND_TASK, "entries-order-by-type", orderByType);
}
else {
	orderByCol = portalPreferences.getValue(PortletKeys.BACKGROUND_TASK, "entries-order-by-col", "create-date");
	orderByType = portalPreferences.getValue(PortletKeys.BACKGROUND_TASK, "entries-order-by-type", "desc");
}

OrderByComparator orderByComparator = BackgroundTaskComparatorFactoryUtil.getBackgroundTaskOrderByComparator(orderByCol, orderByType);

String taskExecutorClassName = localPublishing ? LayoutStagingBackgroundTaskExecutor.class.getName() : LayoutRemoteStagingBackgroundTaskExecutor.class.getName();
%>

<liferay-ui:search-container
	emptyResultsMessage="no-publication-processes-were-found"
	iteratorURL="<%= renderURL %>"
	orderByCol="<%= orderByCol %>"
	orderByComparator="<%= orderByComparator %>"
	orderByType="<%= orderByType %>"
>
	<liferay-ui:search-container-results>

		<%
		List<BackgroundTask> backgroundTasks = BackgroundTaskLocalServiceUtil.getBackgroundTasks(groupId, taskExecutorClassName, QueryUtil.ALL_POS, QueryUtil.ALL_POS, orderByComparator);

		results.addAll(backgroundTasks);

		if (localPublishing) {
			results.addAll(BackgroundTaskLocalServiceUtil.getBackgroundTasks(liveGroupId, taskExecutorClassName, QueryUtil.ALL_POS, QueryUtil.ALL_POS, orderByComparator));
		}

		results.addAll(BackgroundTaskLocalServiceUtil.getBackgroundTasks(liveGroupId, StagingIndexingBackgroundTaskExecutor.class.getName(), BackgroundTaskConstants.STATUS_NEW));

		results.addAll(BackgroundTaskLocalServiceUtil.getBackgroundTasks(liveGroupId, StagingIndexingBackgroundTaskExecutor.class.getName(), BackgroundTaskConstants.STATUS_IN_PROGRESS));

		results.addAll(BackgroundTaskLocalServiceUtil.getBackgroundTasks(liveGroupId, StagingIndexingBackgroundTaskExecutor.class.getName(), BackgroundTaskConstants.STATUS_FAILED));

		results.addAll(BackgroundTaskLocalServiceUtil.getBackgroundTasks(liveGroupId, StagingIndexingBackgroundTaskExecutor.class.getName(), BackgroundTaskConstants.STATUS_QUEUED));

		ListUtil.sort(results, orderByComparator);

		searchContainer.setTotal(results.size());

		results = ListUtil.subList(results, searchContainer.getStart(), searchContainer.getEnd());

		searchContainer.setResults(results);
		%>

	</liferay-ui:search-container-results>

	<liferay-ui:search-container-row
		className="com.liferay.portal.model.BackgroundTask"
		keyProperty="backgroundTaskId"
		modelVar="backgroundTask"
	>
		<liferay-ui:search-container-column-text
			name="user-name"
			value="<%= HtmlUtil.escape(backgroundTask.getUserName()) %>"
		/>

		<liferay-ui:search-container-column-jsp
			cssClass="background-task-status-column"
			name="status"
			path="/html/portlet/layouts_admin/publish_process_message.jsp"
		/>

		<c:if test="<%= localPublishing %>">
			<liferay-ui:search-container-column-text name="type">
				<c:if test="<%= (backgroundTask.getGroupId() == liveGroupId) && (taskExecutorClassName.equals(backgroundTask.getTaskExecutorClassName())) %>">
					<strong class="label label-info">
						<liferay-ui:message key="initial-publication" />
					</strong>
				</c:if>

				<c:if test="<%= StagingIndexingBackgroundTaskExecutor.class.getName().equals(backgroundTask.getTaskExecutorClassName()) %>">
					<strong class="label label-info">
						<liferay-ui:message key="reindex" />
					</strong>
				</c:if>

				<strong class="label label-default">
					<c:choose>
						<c:when test='<%= MapUtil.getBoolean(backgroundTask.getTaskContextMap(), "privateLayout") %>'>
							<liferay-ui:message key="private-pages" />
						</c:when>
						<c:otherwise>
							<liferay-ui:message key="public-pages" />
						</c:otherwise>
					</c:choose>
				</strong>
			</liferay-ui:search-container-column-text>
		</c:if>

		<liferay-ui:search-container-column-date
			name="create-date"
			orderable="<%= true %>"
			value="<%= backgroundTask.getCreateDate() %>"
		/>

		<liferay-ui:search-container-column-date
			name="completion-date"
			orderable="<%= true %>"
			value="<%= backgroundTask.getCompletionDate() %>"
		/>

		<liferay-ui:search-container-column-text>
			<c:if test="<%= !backgroundTask.isInProgress() %>">
				<portlet:actionURL var="deleteBackgroundTaskURL">
					<portlet:param name="struts_action" value="/group_pages/delete_background_task" />
					<portlet:param name="redirect" value="<%= renderURL.toString() %>" />
					<portlet:param name="backgroundTaskId" value="<%= String.valueOf(backgroundTask.getBackgroundTaskId()) %>" />
				</portlet:actionURL>

				<%
				Date completionDate = backgroundTask.getCompletionDate();
				%>

				<liferay-ui:icon-delete
					label="true"
					message='<%= ((completionDate != null) && completionDate.before(new Date())) ? "clear" : "cancel" %>'
					url="<%= deleteBackgroundTaskURL %>"
				/>
			</c:if>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<%
int incompleteBackgroundTaskCount = BackgroundTaskLocalServiceUtil.getBackgroundTasksCount(groupId, taskExecutorClassName, false);

if (localPublishing) {
	incompleteBackgroundTaskCount += BackgroundTaskLocalServiceUtil.getBackgroundTasksCount(liveGroupId, taskExecutorClassName, false);
}
%>

<div class="hide incomplete-process-message">
	<liferay-util:include page="/html/portlet/layouts_admin/incomplete_processes_message.jsp">
		<liferay-util:param name="incompleteBackgroundTaskCount" value="<%= String.valueOf(incompleteBackgroundTaskCount) %>" />
	</liferay-util:include>
</div>
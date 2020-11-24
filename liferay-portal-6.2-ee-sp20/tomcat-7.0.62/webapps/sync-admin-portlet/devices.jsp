<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the applicable 
 * Liferay software end user license agreement ("License Agreement")
 * found on www.liferay.com/legal/eulas. You may also contact Liferay, Inc.
 * for a copy of the License Agreement. You may not use this file except in
 * compliance with the License Agreement. 
 * See the License Agreement for the specific language governing
 * permissions and limitations under the License Agreement, including 
 * but not limited to distribution rights of the Software.
 *
 */
--%>

<%@ include file="/init.jsp" %>

<%
String tabs1 = ParamUtil.getString(request, "tabs1", "devices");

String keywords = ParamUtil.getString(request, "keywords");

int delta = ParamUtil.getInteger(request, "delta", SearchContainer.DEFAULT_DELTA);
String orderByCol = ParamUtil.getString(request, "orderByCol", "userName");
String orderByType = ParamUtil.getString(request, "orderByType", "asc");

OrderByComparator obc = OrderByComparatorFactoryUtil.create("SyncDevice", orderByCol, orderByType.equals("asc"));

PortletURL currentURLObj = PortletURLUtil.getCurrent(liferayPortletRequest, liferayPortletResponse);

String currentURL = currentURLObj.toString();

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("tabs1", tabs1);
portletURL.setParameter("delta", String.valueOf(delta));
%>

<aui:nav-bar>
	<aui:nav-bar-search cssClass="pull-right">
		<aui:form action="<%= portletURL %>" cssClass="form-search" method="post" name="fm1">
			<liferay-ui:input-search placeholder='<%= LanguageUtil.get(locale, "keywords") %>' title='<%= LanguageUtil.get(locale, "keywords") %>' />
		</aui:form>
	</aui:nav-bar-search>
</aui:nav-bar>

<aui:form method="post" name="fm">
	<aui:input name="redirect" type="hidden" value="<%= currentURL %>" />

	<liferay-ui:search-container
		emptyResultsMessage="no-devices-were-found"
		iteratorURL="<%= portletURL %>"
	>

	<%
	searchContainer.setOrderByType(orderByType);
	searchContainer.setOrderByCol(orderByCol);

	List<SyncDevice> syncDevices = new ArrayList<SyncDevice>();

	String portletId = (String)request.getAttribute(WebKeys.PORTLET_ID);

	if (portletId.equals(PortletKeys.SYNC_ADMIN)) {
		syncDevices = SyncDeviceLocalServiceUtil.search(themeDisplay.getCompanyId(), keywords, searchContainer.getStart(), searchContainer.getEnd(), obc);
	}
	else {
		syncDevices = SyncDeviceLocalServiceUtil.getSyncDevices(themeDisplay.getUserId(), searchContainer.getStart(), searchContainer.getEnd(), obc);
	}
	%>

		<liferay-ui:search-container-results
			results="<%= syncDevices %>"
		/>

		<liferay-ui:search-container-row
			className="com.liferay.sync.model.SyncDevice"
			escapedModel="<%= true %>"
			keyProperty="syncDeviceId"
			modelVar="syncDevice"
		>
			<liferay-ui:search-container-column-text
				name="name"
				orderable="<%= true %>"
				orderableProperty="userName"
				property="userName"
			/>

			<%
			String location = syncDevice.getHostname();

			IPInfo ipInfo = IPGeocoderUtil.getIPInfo(location);

			if (ipInfo != null) {
				String city = ipInfo.getCity();

				if (city != null) {
					location = city + " " + location;
				}
			}
			%>

			<liferay-ui:search-container-column-text
				name="location"
				value="<%= location %>"
			/>

			<liferay-ui:search-container-column-text
				name="type"
				orderable="<%= true %>"
			/>

			<liferay-ui:search-container-column-text
				name="build"
				orderable="<%= true %>"
				orderableProperty="buildNumber"
				property="buildNumber"
			/>

			<liferay-ui:search-container-column-date
				name="last-seen"
				orderable="<%= true %>"
				orderableProperty="modifiedDate"
				property="modifiedDate"
			/>

			<liferay-ui:search-container-column-text
				name="status"
				translate="true"
				value="<%= SyncDeviceConstants.getStatusLabel(syncDevice.getStatus()) %>"
			/>

			<liferay-ui:search-container-column-jsp
				align="right"
				cssClass="entry-action"
				path="/devices_action.jsp"
			/>
		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator />
	</liferay-ui:search-container>
</aui:form>
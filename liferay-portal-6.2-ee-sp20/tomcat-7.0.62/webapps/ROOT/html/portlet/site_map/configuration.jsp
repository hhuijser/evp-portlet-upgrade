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

<%@ include file="/html/portlet/site_map/init.jsp" %>

<%
LayoutLister layoutLister = new LayoutLister();

String rootNodeName = StringPool.BLANK;

List<LayoutDescription> layoutDescriptions = layoutLister.getLayoutDescriptions(layout.getGroupId(), layout.isPrivateLayout(), rootNodeName, locale);
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionURL" />

<liferay-portlet:renderURL portletConfiguration="true" var="configurationRenderURL" />

<aui:form action="<%= configurationActionURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= configurationRenderURL %>" />

	<aui:fieldset>
		<aui:select label="root-layout" name="preferences--rootLayoutUuid--">
			<aui:option value="" />

			<%
			for (LayoutDescription layoutDescription : layoutDescriptions) {
				Layout layoutDescriptionLayout = LayoutLocalServiceUtil.fetchLayout(layoutDescription.getPlid());

				if (layoutDescriptionLayout != null) {
			%>

					<aui:option label="<%= layoutDescription.getDisplayName() %>" selected="<%= layoutDescriptionLayout.getUuid().equals(rootLayoutUuid) %>" value="<%= layoutDescriptionLayout.getUuid() %>" />

			<%
				}
			}
			%>

		</aui:select>

		<aui:select name="preferences--displayDepth--">
			<aui:option label="unlimited" value="0" />

			<%
			for (int i = 1; i <= 20; i++) {
			%>

				<aui:option label="<%= i %>" selected="<%= displayDepth == i %>" />

			<%
			}
			%>

		</aui:select>

		<aui:input name="preferences--includeRootInTree--" type="checkbox" value="<%= includeRootInTree %>" />

		<aui:input name="preferences--showCurrentPage--" type="checkbox" value="<%= showCurrentPage %>" />

		<aui:input name="preferences--useHtmlTitle--" type="checkbox" value="<%= useHtmlTitle %>" />

		<aui:input name="preferences--showHiddenPages--" type="checkbox" value="<%= showHiddenPages %>" />

		<div class="display-template">

			<%
			TemplateHandler templateHandler = TemplateHandlerRegistryUtil.getTemplateHandler(LayoutSet.class.getName());
			%>

			<liferay-ui:ddm-template-selector
				classNameId="<%= PortalUtil.getClassNameId(templateHandler.getClassName()) %>"
				displayStyle="<%= displayStyle %>"
				displayStyleGroupId="<%= displayStyleGroupId %>"
				refreshURL="<%= currentURL %>"
				showEmptyOption="<%= true %>"
			/>
		</div>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>
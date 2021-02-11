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
long repositoryId = themeDisplay.getScopeGroupId();

Folder rootFolder = ShindigUtil.getGadgetEditorRootFolder(repositoryId);
%>

<div id="<portlet:namespace />editor"></div>

<aui:script use="opensocial-editor">
	new Liferay.OpenSocial.Editor(
		{
			baseRenderURL: '<%= PortletURLFactoryUtil.create(request, portletDisplay.getId(), themeDisplay.getPlid(), PortletRequest.RENDER_PHASE) %>',

			<portlet:renderURL var="editorGadgetURL" windowState="<%= LiferayWindowState.POP_UP.toString() %>">
				<portlet:param name="mvcPath" value="/admin/edit_gadget.jsp" />
				<portlet:param name="editorGadgetURL" value="editorGadgetURLPlaceholder" />
			</portlet:renderURL>

			editorGadgetURL: '<%= editorGadgetURL %>',
			gadgetPortletId: '<%= portletDisplay.getId() %>',
			gadgetServerBase: '<%= PortalUtil.getPathContext(renderRequest) %>/gadgets/',
			namespace: '<portlet:namespace />',
			publishGadgetPermission: <%= GadgetPermission.contains(themeDisplay.getPermissionChecker(), themeDisplay.getScopeGroupId(), ActionKeys.PUBLISH_GADGET) %>,
			repositoryId: '<%= repositoryId %>',
			resourceURL: '<portlet:resourceURL />',
			rootFolderId: '<%= rootFolder.getFolderId() %>'
		}
	).render('#<portlet:namespace />editor');
</aui:script>
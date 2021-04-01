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

<%@ include file="/html/taglib/init.jsp" %>

<%
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:cssClass"));
String initMethod = (String)request.getAttribute("liferay-ui:input-editor:initMethod");
String name = namespace + GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:name"));

String onChangeMethod = (String)request.getAttribute("liferay-ui:input-editor:onChangeMethod");

if (Validator.isNotNull(onChangeMethod)) {
	onChangeMethod = namespace + onChangeMethod;
}

boolean resizable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-editor:resizable"));
%>

<aui:script use='<%= resizable ? "resize" : "aui-base" %>'>
	window['<%= name %>'] = {
		destroy: function() {
			var editorEl = document.getElementById('<%= name %>');

			if (editorEl) {
				editorEl.parentNode.removeChild(editorEl);
			}

			window['<%= name %>'] = null;
		},

		focus: function() {
			return document.getElementById('<%= name %>').focus();
		},

		getHTML: function() {
			return document.getElementById('<%= name %>').value;
		},

		initEditor: function() {
			<c:if test="<%= Validator.isNotNull(initMethod) %>">
				<%= name %>.setHTML(window['<%= HtmlUtil.escapeJS(namespace + initMethod) %>']());

				<c:if test="<%= resizable && BrowserSnifferUtil.isIe(request) %>">
					new A.Resize(
						{
							handles: 'br',
							node: '#<%= name %>_container',
							wrap: true
						}
					);
				</c:if>
			</c:if>

			window['<%= name %>'].instanceReady = true;
		},

		instanceReady: false,

		setHTML: function(value) {
			document.getElementById('<%= name %>').value = value || '';
		}
	};

	window['<%= name %>'].initEditor();
</aui:script>

<div class="<%= cssClass %>" id="<%= name %>_container">
	<table bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tr>
			<td bgcolor="#FFFFFF" height="100%">
				<textarea class="lfr-editor-textarea" id="<%= name %>" name="<%= name %>" <%= Validator.isNotNull(onChangeMethod) ? "onChange=\"" + HtmlUtil.escapeJS(onChangeMethod) + "(this.value)\"" : StringPool.BLANK %> style="resize:<%= resizable ? "vertical" : "none" %>"></textarea>
			</td>
		</tr>
	</table>
</div>
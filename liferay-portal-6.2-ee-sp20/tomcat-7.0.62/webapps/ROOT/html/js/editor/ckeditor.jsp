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
String portletId = portletDisplay.getRootPortletId();

String mainPath = themeDisplay.getPathMain();

String doAsUserId = themeDisplay.getDoAsUserId();

if (Validator.isNull(doAsUserId)) {
	doAsUserId = Encryptor.encrypt(company.getKeyObj(), String.valueOf(themeDisplay.getUserId()));
}

long doAsGroupId = themeDisplay.getDoAsGroupId();

if (doAsGroupId == 0) {
	doAsGroupId = (Long)request.getAttribute("liferay-ui:input-editor:groupId");
}

String ckEditorConfigFileName = ParamUtil.getString(request, "ckEditorConfigFileName");

if (!_ckEditorConfigFileNames.contains(ckEditorConfigFileName)) {
	ckEditorConfigFileName = "ckconfig.jsp";
}

boolean useCustomDataProcessor = false;

if (!ckEditorConfigFileName.equals("ckconfig.jsp")) {
	useCustomDataProcessor = true;
}

boolean hideImageResizing = ParamUtil.getBoolean(request, "hideImageResizing");

Map<String, String> configParamsMap = (Map<String, String>)request.getAttribute("liferay-ui:input-editor:configParams");
Map<String, String> fileBrowserParamsMap = (Map<String, String>)request.getAttribute("liferay-ui:input-editor:fileBrowserParams");

String configParams = marshallParams(configParamsMap);

String contentsLanguageId = (String)request.getAttribute("liferay-ui:input-editor:contentsLanguageId");
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:cssClass"));
String cssClasses = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:cssClasses"));
String editorImpl = (String)request.getAttribute("liferay-ui:input-editor:editorImpl");
String name = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:name"));
String initMethod = (String)request.getAttribute("liferay-ui:input-editor:initMethod");
boolean inlineEdit = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-editor:inlineEdit"));
String inlineEditSaveURL = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-editor:inlineEditSaveURL"));

String onBlurMethod = (String)request.getAttribute("liferay-ui:input-editor:onBlurMethod");

if (Validator.isNotNull(onBlurMethod)) {
	onBlurMethod = namespace + onBlurMethod;
}

String onChangeMethod = (String)request.getAttribute("liferay-ui:input-editor:onChangeMethod");

if (Validator.isNotNull(onChangeMethod)) {
	onChangeMethod = namespace + onChangeMethod;
}

String onFocusMethod = (String)request.getAttribute("liferay-ui:input-editor:onFocusMethod");

if (Validator.isNotNull(onFocusMethod)) {
	onFocusMethod = namespace + onFocusMethod;
}

boolean resizable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-editor:resizable"));
boolean skipEditorLoading = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-editor:skipEditorLoading"));
String toolbarSet = (String)request.getAttribute("liferay-ui:input-editor:toolbarSet");

if (!inlineEdit) {
	name = namespace + name;
}

String textareaName = HtmlUtil.escapeAttribute(name);

String modules = "aui-node-base";

if (inlineEdit && Validator.isNotNull(inlineEditSaveURL)) {
	textareaName = textareaName + "_original";

	modules += ",inline-editor-ckeditor";
}

name = HtmlUtil.escapeJS(name);
%>

<c:if test="<%= hideImageResizing %>">
	<liferay-util:html-top outputKey="js_editor_ckeditor_hide_image_resizing">
		<style type="text/css">
			a.cke_dialog_tab {
				display: none !important;
			}

			a.cke_dialog_tab_selected {
				display:block !important;
			}
		</style>
	</liferay-util:html-top>
</c:if>

<c:if test="<%= !skipEditorLoading %>">
	<liferay-util:html-top outputKey="js_editor_ckeditor_skip_editor_loading">
		<style type="text/css">
			table.cke_dialog {
				position: absolute !important;
			}
		</style>

		<%
		long javaScriptLastModified = ServletContextUtil.getLastModified(application, "/html/js/", true);
		%>

		<script src="<%= HtmlUtil.escapeAttribute(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathJavaScript() + "/editor/ckeditor/ckeditor.js", javaScriptLastModified)) %>" type="text/javascript"></script>

		<c:if test="<%= inlineEdit && Validator.isNotNull(inlineEditSaveURL) %>">
			<script src="<%= HtmlUtil.escapeAttribute(PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNHost() + themeDisplay.getPathJavaScript() + "/editor/ckeditor/main.js", javaScriptLastModified)) %>" type="text/javascript"></script>
		</c:if>

		<script type="text/javascript">
			Liferay.namespace('EDITORS')['<%= editorImpl %>'] = true;
		</script>
	</liferay-util:html-top>
</c:if>

<aui:script>
	window['<%= name %>'] = {
		destroy: function() {
			CKEDITOR.instances['<%= name %>'].destroy();

			window['<%= name %>'] = null;
		},

		focus: function() {
			CKEDITOR.instances['<%= name %>'].focus();
		},

		getCkData: function() {
			var data;

			if (!window['<%= name %>'].instanceReady && window['<%= HtmlUtil.escapeJS(namespace + initMethod) %>']) {
				data = window['<%= HtmlUtil.escapeJS(namespace + initMethod) %>']();
			}
			else {
				data = CKEDITOR.instances['<%= name %>'].getData();

				if (CKEDITOR.env.gecko && (CKEDITOR.tools.trim(data) == '<br />')) {
					data = '';
				}
			}

			return data;
		},

		getHTML: function() {
			return window['<%= name %>'].getCkData();
		},

		getText: function() {
			return window['<%= name %>'].getCkData();
		},

		instanceReady: false,

		<c:if test="<%= Validator.isNotNull(onBlurMethod) %>">
			onBlurCallback: function() {
				window['<%= HtmlUtil.escapeJS(onBlurMethod) %>'](CKEDITOR.instances['<%= name %>']);
			},
		</c:if>

		<c:if test="<%= Validator.isNotNull(onChangeMethod) %>">
			onChangeCallback: function() {
				var ckEditor = CKEDITOR.instances['<%= name %>'];
				var dirty = ckEditor.checkDirty();

				if (dirty) {
					window['<%= HtmlUtil.escapeJS(onChangeMethod) %>'](window['<%= name %>'].getText());

					ckEditor.resetDirty();
				}
			},
		</c:if>

		<c:if test="<%= Validator.isNotNull(onFocusMethod) %>">
			onFocusCallback: function() {
				window['<%= HtmlUtil.escapeJS(onFocusMethod) %>'](CKEDITOR.instances['<%= name %>']);
			},
		</c:if>

		setHTML: function(value) {
			CKEDITOR.instances['<%= name %>'].setData(value);

			window['<%= name %>']._setStyles();
		}
	};
</aui:script>

<div class="<%= cssClass %>">
	<textarea id="<%= textareaName %>" name="<%= textareaName %>" style="display: none;"></textarea>
</div>

<script type="text/javascript">
	CKEDITOR.disableAutoInline = true;

	CKEDITOR.env.isCompatible = true;
</script>

<aui:script use="<%= modules %>">
	var addAUIClass = function(iframe) {
		if (iframe) {
			var iframeWin = iframe.getDOM().contentWindow;

			if (iframeWin) {
				var iframeDoc = iframeWin.document.documentElement;

				A.one(iframeDoc).addClass('aui');
			}
		}
	};

	window['<%= name %>']._setStyles = function() {
		var ckEditor = A.one('#cke_<%= name %>');

		if (ckEditor) {
			var iframe = ckEditor.one('iframe');

			addAUIClass(iframe);

			var ckePanelDelegate = Liferay.Data['<%= name %>Handle'];

			if (!ckePanelDelegate) {
				var ckePanelDelegate = ckEditor.delegate(
					'click',
					function(event) {
						var panelFrame = A.one('.cke_combopanel .cke_panel_frame');

						addAUIClass(panelFrame);

						ckePanelDelegate.detach();

						Liferay.Data['<%= name %>Handle'] = null;
					},
					'.cke_combo'
				);

				Liferay.Data['<%= name %>Handle'] = ckePanelDelegate;
			}
		}
	};

	<c:if test="<%= inlineEdit && Validator.isNotNull(inlineEditSaveURL) %>">
		var inlineEditor;

		Liferay.on(
			'toggleControls',
			function(event) {
				if (event.src === 'ui') {
					var ckEditor = CKEDITOR.instances['<%= name %>'];

					if (event.enabled && !ckEditor) {
						createEditor();
					}
					else if (ckEditor) {
						inlineEditor.destroy();
						ckEditor.destroy();

						ckEditor = null;

						var editorNode = A.one('#<%= name %>');

						editorNode.removeAttribute('contenteditable');
						editorNode.removeClass('lfr-editable');
					}
				}
			}
		);
	</c:if>

	var createEditor = function() {
		var Util = Liferay.Util;

		var editorNode = A.one('#<%= name %>');

		editorNode.setAttribute('contenteditable', true);

		editorNode.addClass('lfr-editable');

		function getToolbarSet(toolbarSet) {
			if (Util.isPhone()) {
				toolbarSet = 'phone';
			}
			else if (Util.isTablet()) {
				toolbarSet = 'tablet';
			}

			return toolbarSet;
		}

		function initData() {
			<c:if test="<%= Validator.isNotNull(initMethod) && !(inlineEdit && Validator.isNotNull(inlineEditSaveURL)) %>">
				ckEditor.setData(
					window['<%= HtmlUtil.escapeJS(namespace + initMethod) %>'](),
					function() {
						ckEditor.resetDirty();
					}
				);
			</c:if>

			window['<%= name %>']._setStyles();

			window['<%= name %>'].instanceReady = true;
		}

		<%
		StringBundler sb = new StringBundler(8);

		sb.append(mainPath);
		sb.append("/portal/fckeditor?p_p_id=");
		sb.append(portletId);
		sb.append("&doAsUserId=");
		sb.append(doAsUserId);
		sb.append("&doAsGroupId=");
		sb.append(String.valueOf(doAsGroupId));

		String imageConnectorURL = null;
		String urlConnectorURL = null;

		String imageFileBrowserParams = StringPool.BLANK;
		String urlFileBrowserParams = StringPool.BLANK;

		if (Validator.isNull(fileBrowserParamsMap)) {
			imageConnectorURL = HtmlUtil.escapeJS(HtmlUtil.escapeURL(sb.toString()));
			urlConnectorURL = HtmlUtil.escapeJS(HtmlUtil.escapeURL(sb.toString()));
		}
		else {
			String attachmentURLPrefix = StringPool.BLANK;
			String wikiPageResourcePrimKey = StringPool.BLANK;

			if (configParamsMap != null) {
				attachmentURLPrefix = configParamsMap.get("attachmentURLPrefix");
				wikiPageResourcePrimKey = configParamsMap.get("wikiPageResourcePrimKey");
			}

			StringBundler sb1 = new StringBundler(2);

			sb1.append(sb.toString());

			Map<String, String> urlFileBrowserParamsMap = new HashMap<String, String>();

			if (Validator.isNotNull(attachmentURLPrefix)) {
				urlFileBrowserParamsMap.put("attachmentURLPrefix", attachmentURLPrefix);
			}
			String urlTypes = fileBrowserParamsMap.get("URLTypes");

			if (Validator.isNotNull(urlTypes)) {
				urlFileBrowserParamsMap.put("Types", urlTypes);
			}

			String urlType = fileBrowserParamsMap.get("URLType");

			if (Validator.isNotNull(urlType)) {
				urlFileBrowserParamsMap.put("Type", urlType);
			}

			if (Validator.isNotNull(wikiPageResourcePrimKey)) {
				urlFileBrowserParamsMap.put("wikiPageResourcePrimKey", wikiPageResourcePrimKey);
			}

			urlFileBrowserParams = marshallParams(urlFileBrowserParamsMap);

			sb1.append(urlFileBrowserParams);

			urlConnectorURL = HtmlUtil.escapeJS(HtmlUtil.escapeURL(sb1.toString()));

			StringBundler sb2 = new StringBundler(2);

			sb2.append(sb.toString());

			Map<String, String> imageFileBrowserParamsMap = new HashMap<String, String>();

			if (Validator.isNotNull(attachmentURLPrefix)) {
				imageFileBrowserParamsMap.put("attachmentURLPrefix", attachmentURLPrefix);
			}

			String imageTypes = fileBrowserParamsMap.get("ImageTypes");

			if (Validator.isNotNull(imageTypes)) {
				imageFileBrowserParamsMap.put("Types", imageTypes);
			}

			String imageType = fileBrowserParamsMap.get("ImageType");

			if (Validator.isNotNull(imageType)) {
				imageFileBrowserParamsMap.put("Type", imageType);
			}

			if (Validator.isNotNull(wikiPageResourcePrimKey)) {
				imageFileBrowserParamsMap.put("wikiPageResourcePrimKey", wikiPageResourcePrimKey);
			}

			imageFileBrowserParams = marshallParams(imageFileBrowserParamsMap);

			sb2.append(imageFileBrowserParams);

			imageConnectorURL = HtmlUtil.escapeJS(HtmlUtil.escapeURL(sb2.toString()));
		}
		%>

		<c:choose>
			<c:when test="<%= inlineEdit %>">
				CKEDITOR.inline(
			</c:when>
			<c:otherwise>
				CKEDITOR.replace(
			</c:otherwise>
		</c:choose>

			'<%= name %>',
			{
				customConfig: '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(ckEditorConfigFileName)) %>?p_p_id=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(portletId)) %>&p_main_path=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(mainPath)) %>&colorSchemeCssClass=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(themeDisplay.getColorScheme().getCssClass())) %>&contentsLanguageId=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(contentsLanguageId)) %>&cssClasses=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(cssClasses)) %>&cssPath=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(themeDisplay.getPathThemeCss())) %>&doAsGroupId=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(String.valueOf(doAsGroupId))) %>&doAsUserId=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(doAsUserId)) %>&imagesPath=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(themeDisplay.getPathThemeImages())) %>&inlineEdit=<%= inlineEdit %><%= HtmlUtil.escapeJS(configParams) %>&languageId=<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(LocaleUtil.toLanguageId(locale))) %>&name=<%= name %>&resizable=<%= resizable %>',
				filebrowserBrowseUrl: '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/editor/filemanager/browser/liferay/browser.html?Connector=<%= urlConnectorURL %><%= urlFileBrowserParams %>',
				filebrowserImageBrowseUrl: '<%= PortalUtil.getPathContext() %>/html/js/editor/ckeditor/editor/filemanager/browser/liferay/browser.html?Connector=<%= imageConnectorURL %><%= imageFileBrowserParams %>',
				filebrowserUploadUrl: null,
				toolbar: getToolbarSet('<%= TextFormatter.format(HtmlUtil.escapeJS(toolbarSet), TextFormatter.M) %>')
			}
		);

		if (window['<%= name %>Config']) {
			window['<%= name %>Config']();
		}

		var ckEditor = CKEDITOR.instances['<%= name %>'];

		<c:if test="<%= inlineEdit && (Validator.isNotNull(inlineEditSaveURL)) %>">
			inlineEditor = new Liferay.CKEditorInline(
				{
					editor: ckEditor,
					editorName: '<%= name %>',
					namespace: '<portlet:namespace />',
					saveURL: '<%= inlineEditSaveURL %>'
				}
			);
		</c:if>

		var customDataProcessorLoaded = false;

		<c:if test="<%= useCustomDataProcessor %>">
			ckEditor.on(
				'customDataProcessorLoaded',
				function() {
					customDataProcessorLoaded = true;

					if (instanceReady) {
						initData();
					}
				}
			);
		</c:if>

		var instanceReady = false;

		ckEditor.on(
			'instanceReady',
			function() {

				<c:choose>
					<c:when test="<%= useCustomDataProcessor %>">
						instanceReady = true;

						if (customDataProcessorLoaded) {
							initData();
						}
					</c:when>
					<c:otherwise>
						initData();
					</c:otherwise>
				</c:choose>

				<c:if test="<%= Validator.isNotNull(onBlurMethod) %>">
					CKEDITOR.instances['<%= name %>'].on('blur', window['<%= name %>'].onBlurCallback);
				</c:if>

				<c:if test="<%= Validator.isNotNull(onChangeMethod) %>">
					setInterval(
						function() {
							try {
								window['<%= name %>'].onChangeCallback();
							}
							catch (e) {
							}
						},
						300
					);
				</c:if>

				<c:if test="<%= Validator.isNotNull(onFocusMethod) %>">
					CKEDITOR.instances['<%= name %>'].on('focus', window['<%= name %>'].onFocusCallback);
				</c:if>

			}
		);

		ckEditor.on('dataReady', window['<%= name %>']._setStyles);

		<%
		if (toolbarSet.equals("creole")) {
		%>

			Liferay.provide(
				window,
				'<%= name %>creoleDialogHandlers',
				function(event) {
					var A = AUI();

					var MODIFIED = 'modified';

					var SELECTOR_HBOX_FIRST = '.cke_dialog_ui_hbox_first';

					var dialog = event.data.definition.dialog;

					if (dialog.getName() == 'image') {
						var lockButton = A.one('.cke_btn_locked');

						if (lockButton) {
							var imageProperties = lockButton.ancestor(SELECTOR_HBOX_FIRST);

							if (imageProperties) {
								imageProperties.hide();
							}
						}

						var imagePreviewBox = A.one('.ImagePreviewBox');

						if (imagePreviewBox) {
							imagePreviewBox.setStyle('width', 410);
						}
					}
					else if (dialog.getName() == 'cellProperties') {
						var containerNode = A.one('#' + dialog.getElement('cellType').$.id);

						if (!containerNode.getData(MODIFIED)) {
							containerNode.one(SELECTOR_HBOX_FIRST).hide();

							containerNode.one('.cke_dialog_ui_hbox_child').hide();

							var cellTypeWrapper = containerNode.one('.cke_dialog_ui_hbox_last');

							cellTypeWrapper.replaceClass('cke_dialog_ui_hbox_last', 'cke_dialog_ui_hbox_first');

							cellTypeWrapper.setStyle('width', '100%');

							cellTypeWrapper.all('tr').each(
								function(item, index, collection) {
									if (index > 0) {
										item.hide();
									}
								}
							);

							containerNode.setData(MODIFIED, true);
						}
					}
				},
				['aui-base']
			);

			ckEditor.on('dialogShow', window['<%= name %>creoleDialogHandlers']);

		<%
		}
		%>

	};

	<%
	String toogleControlsStatus = GetterUtil.getString(SessionClicks.get(request, "liferay_toggle_controls", "visible"));
	%>

	<c:if test='<%= (inlineEdit && toogleControlsStatus.equals("visible")) || !inlineEdit %>'>;
		createEditor();
	</c:if>

</aui:script>

<%!
public String marshallParams(Map<String, String> params) {
	StringBundler sb = new StringBundler();

	if (params != null) {
		for (Map.Entry<String, String> configParam : params.entrySet()) {
			sb.append(StringPool.AMPERSAND);
			sb.append(configParam.getKey());
			sb.append(StringPool.EQUAL);
			sb.append(HttpUtil.encodeURL(configParam.getValue()));
		}
	}

	return sb.toString();
}

private static Set<String> _ckEditorConfigFileNames = SetUtil.fromArray(new String[] {"ckconfig.jsp", "ckconfig_bbcode.jsp", "ckconfig_creole.jsp"});
%>
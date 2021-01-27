<#-- ---------- Common variables ---------- -->

<#assign
	theme_display = themeDisplay
	portlet_display = portletDisplay

	theme_timestamp = themeDisplay.getTheme().getTimestamp()
	theme_settings = themeDisplay.getThemeSettings()

	root_css_class = "aui " + languageUtil.get(locale, "lang.dir")
	css_class = htmlUtil.escape(theme_display.getColorScheme().getCssClass()) + " yui3-skin-sam"

	liferay_toggle_controls = sessionClicks.get(request, "liferay_toggle_controls", "visible")
/>

<#if layout??>
	<#assign page_group = layout.getGroup() />

	<#if page_group.isStagingGroup()>
		<#assign css_class = css_class + " staging local-staging" />
	<#elseif theme_display.isShowStagingIcon() && page_group.hasStagingGroup()>
		<#assign css_class = css_class + " live-view" />
	<#elseif theme_display.isShowStagingIcon() && page_group.isStagedRemotely()>
		<#assign css_class = css_class + " staging remote-staging" />
	</#if>

	<#if page_group.isControlPanel()>
		<#assign liferay_toggle_controls = "visible" />
	</#if>
</#if>

<#assign liferay_dockbar_pinned = getterUtil.getBoolean(sessionClicks.get(request, "liferay_dockbar_pinned", ""), false) />

<#if liferay_toggle_controls = "visible">
	<#assign css_class = css_class + " controls-visible" />
<#else>
	<#assign css_class = css_class + " controls-hidden" />
</#if>

<#if liferay_dockbar_pinned>
	<#assign css_class = css_class + " lfr-dockbar-pinned" />
</#if>

<#if layoutTypePortlet.hasStateMax()>
	<#assign css_class = css_class + " page-maximized" />
</#if>

<#assign
	css_folder = theme_display.getPathThemeCss()
	images_folder = theme_display.getPathThemeImages()
	javascript_folder = theme_display.getPathThemeJavaScript()
	templates_folder = theme_display.getPathThemeTemplates()

	full_css_path = fullCssPath
	full_templates_path = fullTemplatesPath

	css_main_file = htmlUtil.escape(portalUtil.getStaticResourceURL(request, "${css_folder}/main.css"))
	js_main_file = htmlUtil.escape(portalUtil.getStaticResourceURL(request, "${javascript_folder}/main.js"))

	company_id = company.getCompanyId()
	company_name = company.getName()
	company_logo = htmlUtil.escape(theme_display.getCompanyLogo())
	company_logo_height = theme_display.getCompanyLogoHeight()
	company_logo_width = theme_display.getCompanyLogoWidth()
	company_url = theme_display.getURLHome()
/>

<#if !request.isRequestedSessionIdFromCookie()>
	<#assign company_url = portalUtil.getURLWithSessionId(company_url, request.getSession().getId()) />
</#if>

<#assign
	user_id = user.getUserId()
	is_default_user = user.isDefaultUser()
	user_first_name = user.getFirstName()
	user_middle_name = user.getMiddleName()
	user_last_name = user.getLastName()
	user_name = user.getFullName()
	is_male = user.isMale()
	is_female = user.isFemale()
	user_birthday = user.getBirthday()
	user_email_address = user.getEmailAddress()
	language = locale.getLanguage()
	language_id = user.getLanguageId()
	w3c_language_id = localeUtil.toW3cLanguageId(theme_display.getLanguageId())
	time_zone = user.getTimeZoneId()
	user_greeting = htmlUtil.escape(user.getGreeting())
	user_comments = user.getComments()
	user_login_ip = user.getLoginIP()
	user_last_login_ip = user.getLastLoginIP()

	is_login_redirect_required = portalUtil.isLoginRedirectRequired(request)
	is_signed_in = theme_display.isSignedIn()

	group_id = theme_display.getScopeGroupId()
/>

<#-- ---------- URLs ---------- -->

<#assign show_add_content = theme_display.isShowAddContentIcon() />

<#if show_add_content>
	<#assign
		add_content_text = languageUtil.get(locale, "add-application")
		add_content_url = theme_display.getURLAddContent()

		layout_text = languageUtil.get(locale, "layout-template")
		layout_url = theme_display.getURLLayoutTemplates()
	/>
</#if>

<#assign show_control_panel = theme_display.isShowControlPanelIcon() />

<#if show_control_panel>
	<#assign
		control_panel_text = languageUtil.get(locale, "control-panel")
		control_panel_url = htmlUtil.escape(theme_display.getURLControlPanel())
	/>
</#if>

<#assign show_home = theme_display.isShowHomeIcon() />

<#if show_home>
	<#assign
		home_text = languageUtil.get(locale, "home")
		home_url = htmlUtil.escape(theme_display.getURLHome())
	/>

	<#if !request.isRequestedSessionIdFromCookie()>
		<#assign home_url = htmlUtil.escape(portalUtil.getURLWithSessionId(home_url, request.getSession().getId())) />
	</#if>
</#if>

<#assign show_my_account = theme_display.isShowMyAccountIcon() />

<#if show_my_account>
	<#assign my_account_text = languageUtil.get(locale, "my-account") />
	<#if theme_display.getURLMyAccount()??>
		<#assign my_account_url = htmlUtil.escape(theme_display.getURLMyAccount().toString()) />
	</#if>
</#if>

<#assign
	show_page_settings = theme_display.isShowPageSettingsIcon()
	show_site_settings = theme_display.isShowSiteSettingsIcon()
/>

<#if show_page_settings>
	<#assign page_settings_text = languageUtil.get(locale, "manage-pages") />

	<#if theme_display.getURLPageSettings()??>
		<#assign page_settings_url = htmlUtil.escape(theme_display.getURLPageSettings().toString()) />
	</#if>
</#if>

<#assign show_sign_in = theme_display.isShowSignInIcon() />

<#if show_sign_in>
	<#assign
		sign_in_text = languageUtil.get(locale, "sign-in")
		sign_in_url = htmlUtil.escape(theme_display.getURLSignIn())
	/>
</#if>

<#assign show_sign_out = theme_display.isShowSignOutIcon() />

<#if show_sign_out>
	<#assign
		sign_out_text = languageUtil.get(locale, "sign-out")
		sign_out_url = htmlUtil.escape(theme_display.getURLSignOut())
	/>
</#if>

<#assign show_toggle_controls = theme_display.isSignedIn() />

<#if show_toggle_controls>
	<#assign
		toggle_controls_text = languageUtil.get(locale, "toggle-edit-controls")
		toggle_controls_url = "javascript:;"
	/>
</#if>

<#-- ---------- Page ---------- -->

<#assign
	the_title = ""
	selectable = theme_display.isTilesSelectable()
	is_maximized = layoutTypePortlet.hasStateMax()
	is_freeform = themeDisplay.isFreeformLayout()

	page_javascript_1 = ""
	page_javascript_2 = ""
	page_javascript_3 = ""
/>

<#if layout??>
	<#assign
		page = layout

		is_first_child = page.isFirstChild()
		is_first_parent = page.isFirstParent()

		the_title = languageUtil.get(locale, the_title, page.getName(locale))

		is_portlet_page = false
	/>

	<#if page.getType() = "portlet">
		<#assign is_portlet_page = true />
	</#if>

	<#if is_portlet_page && theme_display.isWapTheme()>
		<#assign
			all_portlets = layoutTypePortlet.getPortlets()
			column_1_portlets = layoutTypePortlet.getAllPortlets("column-1")
			column_2_portlets = layoutTypePortlet.getAllPortlets("column-2")
			column_3_portlets = layoutTypePortlet.getAllPortlets("column-3")
			column_4_portlets = layoutTypePortlet.getAllPortlets("column-4")
			column_5_portlets = layoutTypePortlet.getAllPortlets("column-5")
		/>

		<#if layoutTypePortlet.hasStateMax()>
			<#assign maximized_portlet_id = layoutTypePortlet.getStateMaxPortletId() />
		</#if>
	</#if>

	<#assign typeSettingsProperties = layout.getTypeSettingsProperties() />

	<#if typeSettingsProperties??>
		<#assign page_javascript = typeSettingsProperties["javascript"]! />
	</#if>

	<#assign
		site_name = htmlUtil.escape(page_group.getDescriptiveName())

		community_name = site_name

		is_guest_group = page_group.getName() == "Guest"
	/>

	<#if is_guest_group>
		<#assign css_class = css_class + " guest-site" />
	</#if>

	<#if is_signed_in>
		<#assign css_class = css_class + " signed-in" />
	<#else>
		<#assign css_class = css_class + " signed-out" />
	</#if>

	<#if layout.isPublicLayout()>
		<#assign css_class = css_class + " public-page" />
	<#else>
		<#assign css_class = css_class + " private-page" />
	</#if>

	<#if page_group.isLayoutPrototype()>
		<#assign css_class = css_class + " page-template" />
	</#if>

	<#if page_group.isLayoutSetPrototype()>
		<#assign css_class = css_class + " site-template" />
	</#if>

	<#if page_group.isCompany()>
		<#assign site_type = "company-site" />
	<#elseif page_group.isOrganization()>
		<#assign site_type = "organization-site" />
	<#elseif page_group.isUser()>
		<#assign site_type = "user-site" />
	<#else>
		<#assign site_type = "site" />
	</#if>

	<#assign
		css_class = css_class + " " + site_type

		site_default_public_url = htmlUtil.escape(page_group.getDisplayURL(theme_display, false))

		community_default_public_url = site_default_public_url

		site_default_private_url = htmlUtil.escape(page_group.getDisplayURL(theme_display, true))

		community_default_private_url = site_default_private_url

		site_default_url = site_default_public_url

		community_default_url = site_default_url
	/>

	<#if layout.isPrivateLayout()>
		<#assign
			site_default_url = site_default_private_url

			community_default_url = site_default_url
		/>
	</#if></#if>

<#assign the_title = "" />

<#if layout.getHTMLTitle(locale)??>
	<#assign the_title = layout.getHTMLTitle(locale) />
</#if>

<#if pageTitle??>
	<#assign the_title = pageTitle />
</#if>

<#if pageSubtitle??>
	<#assign the_title = pageSubtitle + " - " + the_title />
</#if>

<#if validator.isNotNull(tilesTitle)>
	<#assign the_title = languageUtil.get(locale, tilesTitle) />
</#if>

<#if page_group.isLayoutPrototype()>
	<#assign the_title = page_group.getDescriptiveName() />
</#if>

<#if validator.isNull(tilesTitle)>
	<#assign the_title = htmlUtil.escape(the_title) />
</#if>

<#if layouts??>
	<#assign pages = layouts />
</#if>

<#-- ---------- Logo ---------- -->

<#assign
	logo_css_class = "logo"
	use_company_logo = !layout.layoutSet.isLogo()
	site_logo_height = company_logo_height
	site_logo_width = company_logo_width
/>

<#if company.getLogoId() == 0 && use_company_logo>
	<#assign logo_css_class = logo_css_class + " default-logo" />
<#else>
	<#assign logo_css_class = logo_css_class + " custom-logo" />
</#if>

<#assign
	show_site_name_supported = getterUtil.getBoolean(theme_settings["show-site-name-supported"]!"", true)

	show_site_name_default = getterUtil.getBoolean(theme_settings["show-site-name-default"]!"", show_site_name_supported)

	show_site_name = getterUtil.getBoolean(layout.layoutSet.getSettingsProperty("showSiteName"), show_site_name_default)

	site_logo = company_logo
	logo_description = htmlUtil.escape(site_name)
/>

<#-- ---------- Navigation ---------- -->

<#assign has_navigation = false />

<#if navItems??>
	<#assign
		nav_items = navItems
		has_navigation = (nav_items?size > 0)
	/>
</#if>
<#assign nav_css_class = "sort-pages modify-pages" />

<#if !has_navigation>
	<#assign nav_css_class = nav_css_class + " hide" />
</#if>

<#-- ---------- Staging ---------- -->

<#assign show_staging = theme_display.isShowStagingIcon() />

<#if show_staging>
	<#assign staging_text = languageUtil.get(locale, "staging") />
</#if>

<#-- ---------- My sites ---------- -->

<#assign
	show_my_sites = user.hasMySites()

	show_my_places = show_my_sites
/>

<#if show_my_sites>
	<#assign
		my_sites_text = languageUtil.get(locale, "my-sites")

		my_places_text = my_sites_text
	/>
</#if>

<#-- ---------- Includes ---------- -->

<#if is_portlet_page && theme_display.isWapTheme()>
	<#assign dir_include = "/wap" />
<#else>
	<#assign dir_include = "/html" />
</#if>

<#assign
	body_bottom_include = "${dir_include}/common/themes/body_bottom.jsp"
	body_top_include = "${dir_include}/common/themes/body_top.jsp"
	bottom_include = "${dir_include}/common/themes/bottom.jsp"
	bottom_ext_include = bottom_include
	content_include = "${dir_include}${tilesContent}"
	top_head_include = "${dir_include}/common/themes/top_head.jsp"
	top_messages_include = "${dir_include}/common/themes/top_messages.jsp"
/>

<#-- ---------- Date ---------- -->

<#assign
	date = dateUtil
	current_time = date.newDate()
	the_year = current_time?date?string("yyyy")
/>

<#-- ---------- Custom init ---------- -->

<#include "${full_templates_path}/init_custom.ftl" />
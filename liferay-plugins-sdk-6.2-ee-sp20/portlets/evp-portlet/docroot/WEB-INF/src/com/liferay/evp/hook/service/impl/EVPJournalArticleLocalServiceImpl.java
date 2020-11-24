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

package com.liferay.evp.hook.service.impl;

import com.liferay.compat.portal.kernel.util.ArrayUtil;
import com.liferay.evp.model.EVPDivision;
import com.liferay.evp.service.EVPDivisionLocalServiceUtil;
import com.liferay.evp.util.PortletPropsValues;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.BigDecimalUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.journal.model.JournalArticle;
import com.liferay.portlet.journal.model.JournalArticleDisplay;
import com.liferay.portlet.journal.service.JournalArticleLocalService;
import com.liferay.portlet.journal.service.JournalArticleLocalServiceWrapper;

import java.math.RoundingMode;

import java.text.DecimalFormat;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Wesley Gong
 */
public class EVPJournalArticleLocalServiceImpl
	extends JournalArticleLocalServiceWrapper {

	public EVPJournalArticleLocalServiceImpl(
		JournalArticleLocalService evpJournalArticleLocalService) {

		super(evpJournalArticleLocalService);
	}

	@Override
	public JournalArticleDisplay getArticleDisplay(
			JournalArticle article, String ddmTemplateKey, String viewMode,
			String languageId, int page, String xmlRequest,
			ThemeDisplay themeDisplay)
		throws PortalException, SystemException {

		JournalArticleDisplay journalArticleDisplay = super.getArticleDisplay(
			article, ddmTemplateKey, viewMode, languageId, page, xmlRequest,
			themeDisplay);

		setJournalArticleDisplayContent(journalArticleDisplay, themeDisplay);

		return journalArticleDisplay;
	}

	@Override
	public JournalArticleDisplay getArticleDisplay(
			long groupId, String articleId, String ddmTemplateKey,
			String viewMode, String languageId, int page, String xmlRequest,
			ThemeDisplay themeDisplay)
		throws PortalException, SystemException {

		JournalArticleDisplay journalArticleDisplay = super.getArticleDisplay(
			groupId, articleId, ddmTemplateKey, viewMode, languageId, page,
			xmlRequest, themeDisplay);

		setJournalArticleDisplayContent(journalArticleDisplay, themeDisplay);

		return journalArticleDisplay;
	}

	protected String getSubsidiaryPortletPropsValue(
			long companyId, EVPDivision subsidiaryEVPDivision,
			String portletPropsKey)
		throws PortalException, SystemException {

		String subsidiaryPortletPropsValue =
			EVPDivisionLocalServiceUtil.fetchSubsidiaryPortletPropsValue(
				companyId, subsidiaryEVPDivision.getOrganizationGroupId(),
				portletPropsKey);

		if (subsidiaryPortletPropsValue == null) {
			return portletPropsKey;
		}

		return subsidiaryPortletPropsValue;
	}

	protected Object getTokenValue(
			long companyId, EVPDivision subsidiaryEVPDivision,
			String portletPropsKey1, String portletPropsKey2, String operator)
		throws PortalException, SystemException {

		String subsidiaryPortletPropsValue1 = getSubsidiaryPortletPropsValue(
			companyId, subsidiaryEVPDivision, portletPropsKey1);

		if (Validator.isNull(portletPropsKey2)) {
			return subsidiaryPortletPropsValue1;
		}

		String subsidiaryPortletPropsValue2 = getSubsidiaryPortletPropsValue(
			companyId, subsidiaryEVPDivision, portletPropsKey2);

		if (operator.equals(StringPool.EQUAL + StringPool.EQUAL)) {
			return subsidiaryPortletPropsValue1.equals(
				subsidiaryPortletPropsValue2);
		}
		else if (operator.equals(StringPool.STAR)) {
			DecimalFormat decimalFormat = new DecimalFormat();

			decimalFormat.setMaximumFractionDigits(0);
			decimalFormat.setMinimumFractionDigits(0);
			decimalFormat.setRoundingMode(RoundingMode.HALF_EVEN);

			double operand1 = GetterUtil.getDouble(
				subsidiaryPortletPropsValue1);
			double operand2 = GetterUtil.getDouble(
				subsidiaryPortletPropsValue2);

			return decimalFormat.format(
				BigDecimalUtil.multiply(operand1, operand2));
		}
		else {
			return StringPool.BLANK;
		}
	}

	protected String replaceChooseAll(String content) {
		StringBuffer stringBuffer = new StringBuffer();

		Matcher chooseMatcher = _choosePattern.matcher(content);

		while (chooseMatcher.find()) {
			String replacement = chooseMatcher.group(1);

			if (replacement == null) {
				chooseMatcher.appendReplacement(stringBuffer, StringPool.BLANK);

				continue;
			}

			Matcher whenTrueMatcher = _whenTruePattern.matcher(replacement);

			if (whenTrueMatcher.find()) {
				replacement = whenTrueMatcher.group(1);
			}
			else {
				Matcher otherwiseMatcher = _otherwisePattern.matcher(
					replacement);

				if (otherwiseMatcher.find()) {
					replacement = otherwiseMatcher.group(1);
				}
			}

			if (replacement == null) {
				replacement = StringPool.BLANK;
			}

			chooseMatcher.appendReplacement(stringBuffer, replacement);
		}

		chooseMatcher.appendTail(stringBuffer);

		return stringBuffer.toString();
	}

	protected String replaceIfAll(String content) {
		StringBuffer stringBuffer = new StringBuffer();

		Matcher ifTrueMatcher = _ifTruePattern.matcher(content);

		while (ifTrueMatcher.find()) {
			String replacement = ifTrueMatcher.group(1);

			if (replacement == null) {
				replacement = StringPool.BLANK;
			}

			ifTrueMatcher.appendReplacement(stringBuffer, replacement);
		}

		ifTrueMatcher.appendTail(stringBuffer);

		return stringBuffer.toString();
	}

	protected String replaceTokens(String content, ThemeDisplay themeDisplay)
		throws PortalException, SystemException {

		EVPDivision subsidiaryEVPDivision =
			EVPDivisionLocalServiceUtil.getSubsidiaryEVPDivision(
				themeDisplay.getUserId());

		StringBuffer stringBuffer = new StringBuffer();

		Matcher tokenMatcher = _tokenPattern.matcher(content);

		while (tokenMatcher.find()) {
			Object tokenValue = getTokenValue(
				themeDisplay.getCompanyId(), subsidiaryEVPDivision,
				tokenMatcher.group(1), tokenMatcher.group(4),
				tokenMatcher.group(3));

			tokenMatcher.appendReplacement(stringBuffer, tokenValue.toString());
		}

		tokenMatcher.appendTail(stringBuffer);

		return stringBuffer.toString();
	}

	protected void setJournalArticleDisplayContent(
			JournalArticleDisplay journalArticleDisplay,
			ThemeDisplay themeDisplay)
		throws PortalException, SystemException {

		if (!ArrayUtil.contains(
				PortletPropsValues.JOURNAL_ARTICLE_PARSE_CONTENT_ARTICLE_IDS,
				journalArticleDisplay.getArticleId())) {

			return;
		}

		String content = journalArticleDisplay.getContent();

		content = replaceTokens(content, themeDisplay);

		content = content.replaceAll(
			_CONDITIONAL_IF_FALSE_START + _ALL_CHARACTERS + _CONDITIONAL_IF_END,
			StringPool.BLANK);

		content = content.replaceAll(
			_CONDITIONAL_WHEN_FALSE_START + _ALL_CHARACTERS +
				_CONDITIONAL_WHEN_END,
			StringPool.BLANK);

		content = replaceChooseAll(content);

		content = replaceIfAll(content);

		journalArticleDisplay.setContent(content);
	}

	private static final String _ALL_CHARACTERS = "([\\s|\\S]*?)";

	private static final String _CONDITIONAL_CHOOSE_END = "&lt;/c:choose&gt;";

	private static final String _CONDITIONAL_CHOOSE_START = "&lt;c:choose&gt;";

	private static final String _CONDITIONAL_IF_END = "&lt;/c:if&gt;";

	private static final String _CONDITIONAL_IF_FALSE_START =
		"&lt;c:if test=\"false\"&gt;";

	private static final String _CONDITIONAL_IF_TRUE_START =
		"&lt;c:if test=\"true\"&gt;";

	private static final String _CONDITIONAL_OTHERWISE_END =
		"&lt;/c:otherwise&gt;";

	private static final String _CONDITIONAL_OTHERWISE_START =
		"&lt;c:otherwise&gt;";

	private static final String _CONDITIONAL_WHEN_END = "&lt;/c:when&gt;";

	private static final String _CONDITIONAL_WHEN_FALSE_START =
		"&lt;c:when test=\"false\"&gt;";

	private static final String _CONDITIONAL_WHEN_TRUE_START =
		"&lt;c:when test=\"true\"&gt;";

	private static final String _REGEX_TOKEN =
		"\\$\\{([0-9a-zA-Z\\.]+)( (==|\\*) ([0-9a-zA-Z\\.]+)){0,1}\\}";

	private static Pattern _choosePattern = Pattern.compile(
		_CONDITIONAL_CHOOSE_START + _ALL_CHARACTERS + _CONDITIONAL_CHOOSE_END);
	private static Pattern _ifTruePattern = Pattern.compile(
		_CONDITIONAL_IF_TRUE_START + _ALL_CHARACTERS + _CONDITIONAL_IF_END);
	private static Pattern _otherwisePattern = Pattern.compile(
		_CONDITIONAL_OTHERWISE_START + _ALL_CHARACTERS +
			_CONDITIONAL_OTHERWISE_END);
	private static Pattern _tokenPattern = Pattern.compile(_REGEX_TOKEN);
	private static Pattern _whenTruePattern = Pattern.compile(
		_CONDITIONAL_WHEN_TRUE_START + _ALL_CHARACTERS + _CONDITIONAL_WHEN_END);

}
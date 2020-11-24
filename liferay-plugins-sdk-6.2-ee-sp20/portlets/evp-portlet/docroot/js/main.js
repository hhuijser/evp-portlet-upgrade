AUI().use(
	function(A) {
		Liferay.namespace('EVP');

		var STR_HASH = '#';

		Liferay.Portlet.EVP = {
			closeWindow: function() {
				var dialog = Liferay.Util.getWindow();

				if (dialog) {
					dialog.hide();
				}
			},

			getDate: function(date) {
				var standardizedDate = new Date(date).setHours(0, 0, 0, 0);

				return standardizedDate;
			},

			getDaysBetween: function(date1, date2) {
				var instance = this;

				date1 = instance.getDate(date1);
				date2 = instance.getDate(date2);

				var dateDiff = date1 - date2;

				return Math.floor(dateDiff / 86400000);
			},

			getEmploymentHoursPerWeek: function(namespace) {
				var namespaceId = STR_HASH + namespace;

				var employmentHoursPerWeek = A.one(namespaceId + 'employmentHoursPerWeek');

				var hours = 0;

				if (employmentHoursPerWeek) {
					hours = A.Lang.toInt(employmentHoursPerWeek.val());

					if (hours) {
						var hoursPerWeekWarning = A.one(namespaceId + 'hoursPerWeekWarning');

						if (hoursPerWeekWarning) {
							hoursPerWeekWarning.hide();
						}
					}
				}

				return hours;
			},

			getLocalizedDate: function(date) {
				return A.Date.format(
					new Date(date),
					{
						format: '%b %d, %Y'
					}
				);
			},

			getValue: function(hiddenFieldId, defaultValue) {
				var instance = this;

				var value = defaultValue;

				var hiddenFieldNode = A.one(hiddenFieldId);

				if (hiddenFieldNode && hiddenFieldNode.val()) {
					value = hiddenFieldNode.val();
				}

				return value;
			},

			openWindow: function(url, title, modal, width, height) {
				Liferay.Util.openWindow(
					{
						dialog: {
							align: Liferay.Util.Window.ALIGN_CENTER,
							height: height,
							modal: modal,
							width: width
						},
						title: title,
						uri: url
					}
				);
			},

			setHiddenInput: function(data) {
				var instance = this;

				var hiddenNode = A.one(STR_HASH + data.namespace + data.node);

				if (hiddenNode) {
					hiddenNode.val(data.value);
				}
			},

			setInputDisabled: function(disabled, exclusions) {
				var instance = this;

				var exclusionList = exclusions || [];

				exclusionList.push('.permanent-editability');

				exclusionList = exclusionList.join(', ');

				var nodeListSelector = ':input:not(' + exclusionList + ')';

				var nodeList = A.all(nodeListSelector);

				Liferay.Util.toggleDisabled(nodeList, disabled);
			},

			setNewDateValue: function(dateRow) {
				var instance = this;

				dateRow.each(
					function(item, index) {
						var currentNode = item.one('a') || item;

						var defaultDate = currentNode.one('.default-time');

						defaultDate = defaultDate.text();

						var date = instance.getLocalizedDate(defaultDate);

						currentNode.text(date);
					}
				);
			},

			toggleOtherInput: function(id) {
				var instance = this;

				var node = A.one(STR_HASH + id);

				if (node) {
					var inputId = node.getData('otherInput');

					if (inputId) {
						var textNode = A.one(STR_HASH + inputId);

						if (textNode) {
							var checked = node.get('checked');

							Liferay.Util.toggleDisabled(textNode, !checked);
						}
					}
				}
			},

			validatePartTimeHoursPerWeek: function(config) {
				var instance = this;

				var namespace = config.namespace;

				var namespaceId = STR_HASH + namespace;

				var disabled = true;
				var validate = true;

				if (instance.getEmploymentHoursPerWeek(namespace) >= config.hoursPerWeek) {
					disabled = false;

					instance.toggleOtherInput(namespaceId + 'purposeOtherCheckboxCheckbox');
					instance.toggleOtherInput(namespaceId + 'behalfOfOtherCheckboxCheckbox');
				}
				else {
					var employmentHoursPerWeek = A.one(namespaceId + 'employmentHoursPerWeek');

					if (employmentHoursPerWeek) {
						employmentHoursPerWeek.set('disabled', false);
					}

					validate = false;
				}

				instance.setInputDisabled(
					disabled,
					[
						namespaceId + 'behalfOfOther',
						namespaceId + 'purposeOther'
					]
				);

				return validate;
			},

			validateRequestedEndDate: function(namespace) {
				var instance = this;

				var validate = true;

				var requestedEndDate = A.one(STR_HASH + namespace + 'requestedEndDateString');
				var requestedStartDate = A.one(STR_HASH + namespace + 'requestedStartDateString');

				if (requestedEndDate && requestedStartDate) {
					var requestedEndDateVal = requestedEndDate.val();
					var requestedStartDateVal = requestedStartDate.val();

					var endDate = instance.getDate(requestedEndDateVal);
					var startDate = instance.getDate(requestedStartDateVal);

					if (endDate < startDate) {
						validate = false;
					}

					return validate;
				}
			},

			validateRequestedStartDate: function(data) {
				var instance = this;

				var validate = true;

				var requestedStartDate = A.one(STR_HASH + data.namespace + 'requestedStartDateString');

				if (requestedStartDate) {
					var requestedStartDateVal = requestedStartDate.val();

					requestedStartDateVal = instance.getDate(requestedStartDateVal);

					var dateDiff = instance.getDaysBetween(requestedStartDateVal, new Date());

					var requestedStartDateWarning = A.one('.requested-start-date-warning');

					if (requestedStartDateWarning) {
						var lessThanThirtyDays = dateDiff < 30 && dateDiff > 0;

						requestedStartDateWarning.toggle(lessThanThirtyDays);
					}

					if (dateDiff < 1 && !data.datePermissions) {
						validate = false;
					}

					return validate;
				}
			}
		};
	}
);
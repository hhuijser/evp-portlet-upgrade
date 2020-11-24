/* global Typekit */

AUI().add(
	'liferay-evp',
	function(A) {
		var ALang = A.Lang;

		var BODY = A.getBody();

		var CSS_ACCORDIAN_DETAILS = 'accordian-details';

		var CSS_ACTIVE = 'active';

		var CSS_ANSWER = 'answer';

		var CSS_CONTROL_GROUP = 'control-group';

		var CSS_DISABLED = 'disabled';

		var CSS_EVP_FORM = 'evp-form';

		var CSS_EVP_PORTLET = 'evp-portlet';

		var CSS_FAQ_CATEGORIES = 'faqs-categories';

		var CSS_FORM_VALIDATOR_STACK = 'form-validator-stack';

		var CSS_HIDE = 'hide';

		var CSS_NAV_SCROLL = 'nav-scroll';

		var CSS_OPEN = 'open';

		var CSS_ORGANIZATION_COLOR = 'organization-color';

		var CSS_PLAYER = 'player';

		var CSS_QUESTION = 'question';

		var CSS_RESULT = 'result';

		var CSS_SEARCH_NODES = 'search-nodes';

		var CSS_TIMELINE_POINT = 'timeline-point';

		var CSS_TIMELINE_SELECTOR_BAR = 'timeline-selector-bar';

		var CSS_TOGGLER_CONTENT_COLLAPSED = 'toggler-content-collapsed';

		var CSS_TOGGLER_CONTENT_EXPANDED = 'toggler-content-expanded';

		var CSS_TOGGLER_HEADER_COLLAPSED = 'toggler-header-collapsed';

		var CSS_TOGGLER_HEADER_EXPANDED = 'toggler-header-expanded';

		var CSS_TRIP_BREAKDOWN_BTN = 'trip-breakdown-btn';

		var CSS_TRIP_DISPLAY = 'trip-display';

		var CSS_TRIP_STORIES = 'trip-stories';

		var CSS_TRIP_WRAPPER = 'trip-wrapper';

		var CSS_UPCOMING_TRIPS = 'upcoming-trips';

		var CSS_VIDEO = 'video';

		var EVENT_CLICK = 'click';

		var EVENT_CLICKOUTSIDE = 'clickoutside';

		var EVENT_MOUSE_ENTER = 'mouseenter';

		var LANG_SHARE_HEADER = Liferay.Language.get('share-this-post');

		var LANG_SHARE_MESSAGE = Liferay.Language.get('copy-the-link-below');

		var LANG_TRIP_INTEREST_CONFORMATION_MESSAGE = Liferay.Language.get('trip-interest-conformation-message');

		var LANG_TRIP_INTEREST_DEFAULT_HEADER = Liferay.Language.get('interested-in-serving-on-this-trip');

		var LANG_TRIP_INTEREST_DEFAULT_MESSAGE = Liferay.Language.get('trip-interest-default-message');

		var LANG_X_IN_Y = Liferay.Language.get('x-in-y');

		var LANG_X_REMAINING = Liferay.Language.get('x-x-remaining');

		var LANG_X_USED = Liferay.Language.get('x-x-used');

		var STR_AUTO = 'auto';

		var STR_BLANK = '';

		var STR_BLUR = 'blur';

		var STR_CLASS = 'class';

		var STR_DATA_HEADER = 'data-header';

		var STR_DATA_HREF = 'data-href';

		var STR_DATA_MESSAGE = 'data-message';

		var STR_DOT = '.';

		var STR_ERROR = 'error';

		var STR_FOCUS = 'focus';

		var STR_HASH = '#';

		var STR_NAVIGATION = 'navigation';

		var STR_OFFSET_HEIGHT = 'offsetHeight';

		var STR_OFFSET_WIDTH = 'offsetWidth';

		var STR_SEARCH_INPUT = 'searchInput';

		var STR_SRC = 'src';

		var STR_STEP = 'step';

		var STR_VALUECHANGE = 'valuechange';

		var SELECTOR_ACCORDIAN_DETAILS = STR_DOT + CSS_ACCORDIAN_DETAILS;

		var SELECTOR_ANSWER = STR_DOT + CSS_ANSWER;

		var SELECTOR_CONTROL_GROUP = STR_DOT + CSS_CONTROL_GROUP;

		var SELECTOR_EVP_FORM = STR_DOT + CSS_EVP_FORM;

		var SELECTOR_EVP_PORTLET = STR_DOT + CSS_EVP_PORTLET;

		var SELECTOR_FAQ_CATEGORIES = STR_DOT + CSS_FAQ_CATEGORIES;

		var SELECTOR_FORM_VALIDATOR_STACK = STR_DOT + CSS_FORM_VALIDATOR_STACK;

		var SELECTOR_NAVIGATION = STR_HASH + STR_NAVIGATION;

		var SELECTOR_ORGANIZATION_COLOR = STR_DOT + CSS_ORGANIZATION_COLOR;

		var SELECTOR_QUESTION = STR_DOT + CSS_QUESTION;

		var SELECTOR_SEARCH_INPUT = STR_HASH + STR_SEARCH_INPUT;

		var SELECTOR_SEARCH_NODES = STR_DOT + CSS_SEARCH_NODES;

		var SELECTOR_TIMELINE_POINT = STR_DOT + CSS_TIMELINE_POINT;

		var SELECTOR_TIMELINE_SELECTOR_BAR = STR_DOT + CSS_TIMELINE_SELECTOR_BAR;

		var SELECTOR_TRIP_BREAKDOWN_BTN = STR_DOT + CSS_TRIP_BREAKDOWN_BTN;

		var SELECTOR_TRIP_DISPLAY = STR_DOT + CSS_TRIP_DISPLAY;

		var SELECTOR_TRIP_STORIES = STR_DOT + CSS_TRIP_STORIES;

		var SELECTOR_TRIP_WRAPPER = STR_DOT + CSS_TRIP_WRAPPER;

		var SELECTOR_UPCOMING_TRIPS = STR_DOT + CSS_UPCOMING_TRIPS;

		var SELECTOR_VIDEO = STR_DOT + CSS_VIDEO;

		var UA = A.UA;

		var MOBILE = UA.mobile;

		var WIN = A.getWin();

		var header = A.one('.banner');

		var headerHeight = 200;

		var navigationHeight = 80;

		var navigationScrolledHeight = 0;

		var scrollAnim;

		var winPositionStart = 0;

		var EVP = function() {
		};

		EVP.prototype = {
			initializer: function() {
				var instance = this;

				instance.initContribute();
				instance.initEvpHistoryTimeline();
				instance.initEvpProcessInfographic();
				instance.initFormValidator();
				instance.initFullContentArticle();
				instance.initGridPopUp();
				instance.initNav();
				instance.initOrganizationIconHover();
				instance.initPopUp();
				instance.initPortletRefreshHandler();
				instance.initRemainingHoursAndFunds();
				instance.initSearch();
				instance.initScroll();
				instance.initSkipBannerContent();
				instance.initToggler();
				instance.initTripInterest();
				instance.initVideos();
			},

			accordianToggler: function(config) {
				var instance = this;

				var container = config.container;
				var content = config.content;
				var header = config.header;
				var togglerGroup = config.togglerGroup;

				if (container.one(content) && container.one(header)) {
					var toggler = new A.TogglerDelegate(
						{
							animated: true,
							closeAllOnExpand: false,
							container: container,
							content: content,
							expanded: false,
							header: header,
							transition: {
								duration: 0.3,
								easing: 'cubic-bezier(0, 0.1, 0, 1)'
							}
						}
					);

					if (config.setGlobal) {
						instance.toggler = toggler;
					}

					toggler.toggleAll = function() {
						var expanded = A.some(
							this.items,
							function(item, index) {
								return item.get('expanded');
							}
						);

						if (expanded) {
							this.collapseAll();
						}
						else {
							this.expandAll();
						}
					};

					if (togglerGroup) {
						toggler.findContentNode = function(header) {
							var node = STR_BLANK;

							var togglerGroupNode = header.ancestor(togglerGroup);

							if (togglerGroupNode) {
								var contentNode = togglerGroupNode.one(content);

								if (contentNode) {
									node = contentNode;
								}
							}

							return node;
						};
					}
				}
			},

			addTransitionCssClass: function(node) {
				setTimeout(
					function() {
						node.addClass('transition-fade-in');
					},
					50
				);
			},

			alignEvpHistoryTimeline: function(timeline, target, container) {
				if (!container) {
					container = timeline.one(SELECTOR_TIMELINE_SELECTOR_BAR);
				}

				if (container) {
					if (!target) {
						target = container.one(STR_DOT + CSS_ACTIVE);
					}

					if (target) {
						var pointOffsetLeft = target.get('offsetLeft');
						var pointWidth = target.get(STR_OFFSET_WIDTH);

						var timelineWidth = timeline.get(STR_OFFSET_WIDTH);

						var timelineCenter = timelineWidth / 2;

						var newLeft = timelineCenter - pointOffsetLeft;

						newLeft -= pointWidth / 2;

						container.setStyle('left', newLeft);
					}
				}
			},

			animateParallaxPanels: function(panels) {
				panels.each(
					function(item, index) {
						var viewportRegion = item.get('viewportRegion');

						if (item.inRegion(viewportRegion, false)) {
							var image = item.one('.parallax-image');

							var pixels = viewportRegion.top / -5;

							var translate = 'translate(0, ' + pixels + 'px)';

							image.setStyle('transform', translate);
						}
					}
				);
			},

			centerNode: function(node) {
				var nodeHeight = node.get(STR_OFFSET_HEIGHT);
				var nodeWidth = node.get(STR_OFFSET_WIDTH);

				var winHeight = WIN.get('innerHeight');
				var winWidth = WIN.get('innerWidth');

				var left = (winWidth / 2) - (nodeWidth / 2);
				var top = (winHeight / 2) - (nodeHeight / 2);

				if (left < 0) {
					left = 0;
				}

				if (top < 0) {
					top = 0;
				}

				node.setStyles(
					{
						'left': left,
						'top': top
					}
				);
			},

			createOKToolbar: function(modal) {
				modal.addToolbar(
					[
						{
							label: Liferay.Language.get('ok'),
							on: {
								click: function() {
									modal.hide();
								}
							}
						}
					]
				);
			},

			createToolbar: function(modal, newToolbar, src, target) {
				var instance = this;

				if (newToolbar && target) {
					modal.addToolbar(
						[
							{
								label: Liferay.Language.get('yes'),
								on: {
									click: function(event) {
										target.attr(STR_DATA_HREF, 'name added');

										instance._externalRequest(src);

										modal.setAttrs(
											{
												bodyContent: LANG_TRIP_INTEREST_CONFORMATION_MESSAGE
											}
										);

										instance.createOKToolbar(modal);
									}
								}
							},
							{
								label: Liferay.Language.get('no'),
								on: {
									click: function() {
										modal.hide();
									}
								}
							}
						]
					);
				}
				else {
					instance.createOKToolbar(modal);
				}
			},

			expandToggler: function(togglerDelegate, togglerWrapper, id) {
				var instance = this;

				togglerDelegate.createAll();

				var togglers = togglerDelegate.items;

				for (var i = 0; i < togglers.length; i++) {
					var toggler = togglers[i];

					var togglerHeader = toggler.get('header');

					if (togglerHeader) {
						var togglerId = togglerHeader.attr('data-toggler-id');

						if (togglerWrapper && togglerId == id.toString()) {
							togglerWrapper.addClass(CSS_ACTIVE);

							instance.loadVideos(togglerHeader);

							toggler.expand();

							break;
						}
					}
				}
			},

			faqs: function(id) {
				var instance = this;

				var sideNav = A.one('.side-nav');

				if (!sideNav || sideNav && !sideNav.hasClass(CSS_DISABLED)) {
					instance.scrollIntoView(id);

					var node = A.one(id);

					if (node) {
						var header = node.one(STR_DOT + CSS_TOGGLER_HEADER_COLLAPSED);

						if (header) {
							header.replaceClass(CSS_TOGGLER_HEADER_COLLAPSED, CSS_TOGGLER_HEADER_EXPANDED);
						}

						var content = node.one(STR_DOT + CSS_TOGGLER_CONTENT_COLLAPSED);

						if (content) {
							content.replaceClass(CSS_TOGGLER_CONTENT_COLLAPSED, CSS_TOGGLER_CONTENT_EXPANDED);
						}
					}

					var navigation = A.one(SELECTOR_NAVIGATION);

					if (navigation) {
						setTimeout(
							function() {
								navigation.addClass(CSS_HIDE);
							},
							250
						);
					}
				}
			},

			getEntryIdParams: function() {
				var search = window.location.search;

				var urlQueryString = search.substring(1);

				var queryStringObj = A.QueryString.parse(urlQueryString);

				var entryIds = queryStringObj.entry_id;

				if (ALang.isNumber(entryIds)) {
					entryIds = [entryIds];
				}

				return entryIds || [];
			},

			getScrollDirection: function() {
				var scrollDirection = 0;

				var winScrollY = WIN.get('scrollY');

				if (winScrollY >= winPositionStart) {
					scrollDirection = 1;
				}

				winPositionStart = winScrollY;

				return scrollDirection;
			},

			getVideoSrc: function(config) {
				var url = config.url;

				if (url) {
					url = url.split('/').pop();

					url = url.replace(/watch\?v=/, STR_BLANK);
				}

				return '//www.youtube.com/embed/' + url + '?wmode=transparent&autoplay=' + config.autoplay + '&modestbranding=1&rel=0&showinfo=0';
			},

			hideEvpProcessDescriptions: function(nodes) {
				nodes.hide();

				nodes.removeClass('transition-fade-in');
			},

			initContribute: function() {
				var contributeModal = A.one('.contribute-modal');

				if (contributeModal) {
					var bodyContent = contributeModal.one('.modal-body-content');
					var headerContent = contributeModal.one('.modal-header-content');

					var modal = new A.Modal(
						{
							bodyContent: bodyContent,
							centered: true,
							headerContent: headerContent,
							height: STR_AUTO,
							render: '.contribute',
							resizable: false,
							visible: false,
							width: 464,
							zIndex: Liferay.zIndex.WINDOW
						}
					).render();

					var contribute = A.one('.contribute');

					if (contribute) {
						contribute.on(
							EVENT_CLICK,
							function() {
								modal.show();
							}
						);

						contribute.on(
							EVENT_CLICKOUTSIDE,
							function() {
								modal.hide();
							}
						);
					}

					var closeModal = A.one('.modal .close-modal');

					if (closeModal) {
						closeModal.on(
							EVENT_CLICK,
							function(event) {
								modal.hide();

								event.stopPropagation();
							}
						);
					}
				}
			},

			initEvpHistoryTimeline: function() {
				var instance = this;

				var evpHistory = A.one('.evp-history');

				if (evpHistory) {
					var timeline = evpHistory.one('.timeline');
					var timelineSelectorBar = evpHistory.one(SELECTOR_TIMELINE_SELECTOR_BAR);

					if (timeline && timelineSelectorBar) {
						var timelinePoint;

						timelineSelectorBar.delegate(
							EVENT_CLICK,
							function(event) {
								var currentTarget = event.currentTarget;

								instance.alignEvpHistoryTimeline(timeline, currentTarget, event.container);

								var year = currentTarget.attr('data-selector');

								var yearNode = timeline.one(STR_DOT + year);

								if (yearNode) {
									var timelineSelectors = timelineSelectorBar.all(SELECTOR_TIMELINE_POINT);

									timelineSelectors.removeClass(CSS_ACTIVE);

									currentTarget.addClass(CSS_ACTIVE);

									var timelineYears = timeline.all(STR_DOT + 'year');

									timelineYears.hide();

									yearNode.show();
								}

								timelinePoint = currentTarget;
							},
							SELECTOR_TIMELINE_POINT
						);

						WIN.on(
							'resize',
							A.throttle(
								A.bind('alignEvpHistoryTimeline', instance, timeline, timelinePoint, timelineSelectorBar),
								100
							),
							instance
						);

						instance.alignEvpHistoryTimeline(timeline, timelinePoint, timelineSelectorBar);
					}
				}
			},

			initEvpProcessInfographic: function() {
				var instance = this;

				var evpProcessInfographic = A.one('.evp-process-infographic');

				if (evpProcessInfographic) {
					var evpProcessDescription = evpProcessInfographic.all('.description');
					var evpProcessImageSteps = evpProcessInfographic.all('.step');

					evpProcessImageSteps.on(
						['touchstart', 'mouseover'],
						A.debounce(
							function(event) {
								var currentTarget = event.currentTarget;

								var cssClass = currentTarget.attr(STR_CLASS);
								var section = currentTarget.attr('data-section');

								var sectionDescription = evpProcessInfographic.one(STR_DOT + section);

								if (sectionDescription && cssClass.indexOf('fill') == -1) {
									evpProcessImageSteps.attr(STR_CLASS, STR_STEP);

									currentTarget.attr(STR_CLASS, 'fill step');

									instance.hideEvpProcessDescriptions(evpProcessDescription);

									sectionDescription.show();

									instance.addTransitionCssClass(sectionDescription);
								}
							},
							50
						)
					);

					evpProcessInfographic.on(
						'mouseleave',
						A.debounce(
							function(event) {
								instance.hideEvpProcessDescriptions(evpProcessDescription);

								evpProcessImageSteps.attr(STR_CLASS, STR_STEP);

								var evpProcessDefault = evpProcessInfographic.one('.default-description');

								if (evpProcessDefault) {
									evpProcessDefault.show();

									instance.addTransitionCssClass(evpProcessDefault);
								}
							},
							100
						)
					);
				}
			},

			initFormValidator: function() {
				var instance = this;

				var evpForm = A.one(SELECTOR_EVP_FORM);

				if (evpForm) {
					evpForm.delegate([STR_BLUR, STR_FOCUS, STR_VALUECHANGE], instance.validateInput, 'input, select, textarea');
				}
			},

			initFullContentArticle: function() {
				var instance = this;

				var tripStories = A.one(SELECTOR_TRIP_STORIES);

				if (!A.one(SELECTOR_TRIP_BREAKDOWN_BTN) && tripStories) {
					var portletNamespace = tripStories.getData('portlet-namespace');

					instance.scrollIntoView('#p_p_id' + portletNamespace);
				}
			},

			initGridPopUp: function() {
				var instance = this;

				var storyModal = A.one('.story-modal');

				if (storyModal) {
					var bodyContent = storyModal.one('.modal-body-content');

					var modal = new A.Modal(
						{
							bodyContent: bodyContent,
							centered: true,
							cssClass: 'grid-modal',
							height: STR_AUTO,
							modal: true,
							render: '.grid',
							resizable: false,
							visible: false,
							width: 944,
							zIndex: Liferay.zIndex.WINDOW
						}
					).render();

					modal.removeToolbar('header');

					var grid = A.one('.grid');

					if (grid && modal) {
						var closeStory = modal.bodyNode.one('.close-story-popup');
						var nextStoryLink = modal.bodyNode.one('.next-story');
						var prevStoryLink = modal.bodyNode.one('.prev-story');

						var toggleModal = function(toggle) {
							if (toggle) {
								modal.show();
							}
							else {
								modal.hide();
							}

							BODY.toggleClass('prevent-scroll', toggle);
						};

						var modalBoundingBox = modal.get('boundingBox');

						if (modalBoundingBox) {
							modalBoundingBox.on(
								EVENT_CLICKOUTSIDE,
								function(event) {
									toggleModal(false);
								}
							);
						}

						var nextStory = function() {
							if (nextStoryLink) {
								var nextIndex = nextStoryLink.attr('data-index');

								setModalContent(nextIndex);
							}
						};

						var prevStory = function() {
							if (prevStoryLink) {
								var prevIndex = prevStoryLink.attr('data-index');

								setModalContent(prevIndex);
							}
						};

						instance._setGridStories();

						var setModalContent = function(index) {
							index = ALang.toInt(index);

							var currentStory = instance.gridStories.filter('[data-index=' + index + ']');

							var currentStorySize = currentStory.size();
							var storiesSize = instance.gridStories.size();

							if (currentStorySize) {
								var storyContent = currentStory.get('node')[0].html();

								modal.bodyNode.one('.story-content-container').html(storyContent);

								if (nextStoryLink) {
									var nextIndex = index + 1;

									if (nextIndex === storiesSize) {
										nextIndex = 0;
									}

									nextStoryLink.attr('data-index', nextIndex);
								}

								if (prevStoryLink) {
									var prevIndex = index - 1;

									if (prevIndex < 0) {
										prevIndex = storiesSize - 1;
									}

									prevStoryLink.attr('data-index', prevIndex);
								}

								instance.centerNode(modalBoundingBox);

								toggleModal(true);
							}
						};

						if (nextStoryLink) {
							nextStoryLink.on(EVENT_CLICK, nextStory);
						}

						if (prevStoryLink) {
							prevStoryLink.on(EVENT_CLICK, prevStory);
						}

						grid.delegate(
							EVENT_CLICK,
							function(event) {
								var target = event.currentTarget;

								var currentStoryIndex = target.attr('data-index');

								setModalContent(currentStoryIndex);

								event.stopPropagation();
							},
							'.grid-square'
						);

						A.on(
							'key',
							function(event) {
								if (modal.get('visible')) {
									var keyCode = event.keyCode;

									if (keyCode == 39) {
										nextStory();
									}
									else if (keyCode == 37) {
										prevStory();
									}
									else {
										toggleModal(false);
									}
								}
							},
							document,
							'down:27,37,39'
						);

						if (closeStory) {
							closeStory.on(
								EVENT_CLICK,
								function() {
									toggleModal(false);
								}
							);
						}

						WIN.on(
							'resize',
							A.throttle(
								A.bind('centerNode', instance, modalBoundingBox),
								100
							),
							instance
						);

						var params = instance.getEntryIdParams();

						if (params.length) {
							var storySelector = '#story_' + params[0];

							var story = grid.one(storySelector);

							if (story) {
								var currentStoryIndex = story.attr('data-index');

								location.hash = storySelector;

								setModalContent(currentStoryIndex);
							}
						}
					}
				}
			},

			initNav: function() {
				var navigation = A.one(SELECTOR_NAVIGATION);

				if (navigation) {
					var navButton = navigation.one('.btn-navbar');

					if (navButton) {
						navButton.on(
							EVENT_CLICK,
							function() {
								navigation.toggleClass(CSS_OPEN);
							}
						);
					}
				}
			},

			initOrganizationIconHover: function() {
				var instance = this;

				var organizationsNode = A.one('.organizations');

				if (organizationsNode) {
					if (MOBILE) {
						var organizationColorNodes = organizationsNode.all(SELECTOR_ORGANIZATION_COLOR);
						var organizationGreyscaleNodes = organizationsNode.all('.organization-grey');

						organizationGreyscaleNodes.hide();
						organizationColorNodes.addClass('mobile');
					}

					organizationsNode.delegate(
						[EVENT_MOUSE_ENTER, 'mouseleave'],
						function(event) {
							var organizationColorNode = event.currentTarget.one(SELECTOR_ORGANIZATION_COLOR);

							if (organizationColorNode) {
								var mouseenter = event.type === EVENT_MOUSE_ENTER;

								organizationColorNode.toggleClass('transition-fade-in', mouseenter);

								if (mouseenter) {
									instance.addTransitionCssClass(organizationColorNode);
								}
							}
						},
						'.organization-content'
					);
				}
			},

			initPopUp: function() {
				var instance = this;

				var preapprovedOrganizationsNode = A.one('.preapproved-organizations');

				if (preapprovedOrganizationsNode) {
					preapprovedOrganizationsNode.delegate(
						EVENT_CLICK,
						function(event) {
							var dataInfo = event.currentTarget.attr('data-info');

							var bodyContent = A.one(dataInfo);

							if (bodyContent) {
								Liferay.Util.openWindow(
									{
										cache: false,
										dialog: {
											align: Liferay.Util.Window.ALIGN_CENTER,
											bodyContent: bodyContent,
											destroyOnClose: true,
											height: 600,
											render: '.organization-info-box',
											width: 400,
											zIndex: 10
										}
									}
								);
							}
						},
						'.more-info-btn'
					);
				}
			},

			initPortletRefreshHandler: function() {
				var instance = this;

				var tripStoriesNode = A.one(SELECTOR_TRIP_STORIES);

				if (tripStoriesNode) {
					var portletId = tripStoriesNode.attr('data-portlet-id');

					if (portletId) {
						var refreshEvent = portletId + ':portletRefreshed';

						Liferay.after(
							refreshEvent,
							function(event) {
								instance.openEntries();
							}
						);
					}
				}
			},

			initRemainingHoursAndFunds: function() {
				var instance = this;

				var progressBarNode = A.one('.progress-bar');

				if (progressBarNode) {
					var percentUsed = 0;

					var total = progressBarNode.attr('data-total');
					var unit = progressBarNode.attr('data-units');
					var used = progressBarNode.attr('data-used');

					var remainingNode = progressBarNode.one('.remaining');

					if (used && total) {
						used = Math.round(used);

						percentUsed = Math.round((used / total) * 100);

						var remaining = total - used;

						if (ALang.isNumber(remaining) && remainingNode && unit) {
							var amountRemaining = ALang.sub(LANG_X_REMAINING, [remaining, unit]);

							var amountUsed = ALang.sub(LANG_X_USED, [used, unit]);

							var amount = ALang.sub(LANG_X_IN_Y, [amountUsed, amountRemaining]);

							remainingNode.html(amount);
						}
					}

					new A.ProgressBar(
						{
							boundingBox: progressBarNode,
							height: 44,
							max: 100,
							min: 0,
							value: percentUsed
						}
					).render();
				}
			},

			initScroll: function() {
				var instance = this;

				var evpPortlet = A.one(SELECTOR_EVP_PORTLET);
				var navigation = A.one(SELECTOR_NAVIGATION);

				var parallaxPanels = A.all('.parallax-panel');

				if (navigation) {
					navigationHeight = navigation.height();
				}

				WIN.on(
					'resize',
					A.throttle(
						A.bind('setHeaderHeight', instance),
						100
					),
					instance
				);

				instance.setHeaderHeight();

				WIN.on(
					['mousewheel', 'scroll'],
					A.throttle(
						A.bind('setNavbarScroll', instance),
						40
					)
				);

				if (!MOBILE && !UA.firefox && !evpPortlet) {
					WIN.on(
						['mousewheel', 'scroll'],
						A.throttle(
							A.bind('animateParallaxPanels', instance, parallaxPanels),
							20
						)
					);
				}

				instance.setNavbarScroll();
			},

			initSearch: function() {
				var instance = this;

				var displayNodes = [];

				var searchInput = A.one(SELECTOR_SEARCH_INPUT);

				var searchNodes = A.all(SELECTOR_SEARCH_NODES);

				var faqSectionHeaders = A.all('.faqs-category > .header');

				var faqSideNav = A.one('.faqs-nav .side-nav');

				var faq = false;

				if (faqSideNav) {
					faq = true;
				}

				if (searchInput) {
					var getDataSource = function() {
						var results = [];

						searchNodes.each(
							function(node, index) {
								var data = displayNodes[index];

								if (!data) {
									data = STR_BLANK;

									var searchContent = node.one('.search-content');

									if (searchContent) {
										data = searchContent.text();
									}

									if (faq) {
										data = node.html();

										data = data.replace(CSS_TOGGLER_HEADER_COLLAPSED, CSS_TOGGLER_HEADER_EXPANDED);
										data = data.replace(CSS_TOGGLER_CONTENT_COLLAPSED, CSS_TOGGLER_CONTENT_EXPANDED);
									}

									displayNodes.push(data);
								}

								results.push(
									{
										node: node,
										text: data
									}
								);
							}
						);

						return results;
					};

					var indexSearchResults = function(nodeList) {
						nodeList.each(
							function(node, index) {
								node.attr('data-index', index);
							}
						);
					};

					var showResults = function(e) {
						if (faq) {
							instance.toggler.expandAll();

							faqSideNav.addClass(CSS_DISABLED);

							faqSectionHeaders.hide();
						}

						searchNodes.addClass(CSS_HIDE);
						searchNodes.removeClass(CSS_RESULT);

						var queryEscaped = ALang.String.escapeRegEx(e.query);

						var queryRegex = '(' + queryEscaped + '(?![^<>]*>))';

						A.Array.each(
							e.results,
							function(result) {
								var node = result.raw.node;

								var data = result.text.replace(new RegExp(queryRegex, 'gi'), '<span class="search-highlight">$1</span>');

								if (faq) {
									node.html(data);
								}

								node.removeClass(CSS_HIDE);
								node.addClass(CSS_RESULT);
							}
						);

						instance._setGridStories(true);

						var gridSquares = A.all('.grid .result .grid-square');

						indexSearchResults(instance.gridStories);
						indexSearchResults(gridSquares);
					};

					var showAllNodes = function() {
						searchNodes.removeClass(CSS_HIDE);
						searchNodes.removeClass(CSS_RESULT);

						if (faq) {
							searchNodes.each(
								function(node, index) {
									node.html(displayNodes[index]);
								}
							);

							faqSectionHeaders.show();

							faqSideNav.removeClass(CSS_DISABLED);

							instance.toggler.collapseAll();
						}

						instance._setGridStories();

						var gridSquares = A.all('.grid .selectable .grid-square');

						indexSearchResults(instance.gridStories);
						indexSearchResults(gridSquares);
					};

					var clearSearch = function() {
						searchInput.val(STR_BLANK);

						showAllNodes();
					};

					var quickSearch = A.Base.create(
						'quickSearch',
						A.Base,
						[A.AutoCompleteBase],
						{
							initializer: function() {
								this._bindUIACBase();
								this._syncUIACBase();
							}
						}
					);

					var filter = new quickSearch(
						{
							inputNode: SELECTOR_SEARCH_INPUT,
							minQueryLength: 1,
							queryDelay: 1,
							resultFilters: 'subWordMatch',
							resultTextLocator: 'text',
							source: getDataSource()
						}
					);

					filter.on('clear', showAllNodes);
					filter.on('results', showResults);

					var clearFaqSearch = A.one('.clear-faq-search');

					if (clearFaqSearch) {
						clearFaqSearch.on(EVENT_CLICK, clearSearch);
					}

					A.on('key', clearSearch, document, 'down:27');

					var grid = A.one('.grid');

					if (grid) {
						searchInput.on(
							'input',
							function(event) {
								grid.toggleClass('searching', event.currentTarget.val());
							}
						);
					}

					var searchIcon = A.one('.search .icon-search');

					if (searchIcon) {
						searchIcon.on(
							EVENT_CLICK,
							function() {
								searchInput.focus();
							}
						);
					}
				}
			},

			initSkipBannerContent: function() {
				var instance = this;

				var skipBannerContentNode = A.one('.skip-banner-content');

				if (skipBannerContentNode) {
					skipBannerContentNode.delegate(
						EVENT_CLICK,
						function(event) {
							event.preventDefault();

							var currentTarget = event.currentTarget;

							var hash = currentTarget.get('hash');

							instance.scrollIntoView(hash);
						},
						'.link'
					);
				}
			},

			initToggler: function() {
				var instance = this;

				var togglerObject = {};

				var faqsContainer = A.one(SELECTOR_FAQ_CATEGORIES);

				if (faqsContainer) {
					togglerObject = {
						container: faqsContainer,
						content: SELECTOR_ANSWER,
						header: SELECTOR_QUESTION,
						setGlobal: true
					};
				}

				var myEvpContainer = A.one(SELECTOR_ACCORDIAN_DETAILS);

				if (myEvpContainer) {
					togglerObject = {
						container: myEvpContainer,
						content: '.section-details',
						header: '.section-header',
						setGlobal: true
					};
				}

				var containerNode = A.one('.past-trips') || A.one(SELECTOR_UPCOMING_TRIPS);

				if (containerNode) {
					togglerObject.container = containerNode;

					var mainContentNode = containerNode.ancestor('#main-content');

					if (mainContentNode) {
						togglerObject.container = mainContentNode;
					}

					var ancestorClass = '.past-trip';

					if (containerNode.hasClass(CSS_UPCOMING_TRIPS)) {
						ancestorClass = '.upcoming-trip';

						togglerObject.content = '.more-details-box';
						togglerObject.header = '.open-details-box';

						instance.accordianToggler(togglerObject);
					}

					togglerObject.content = '.trip-breakdown';
					togglerObject.header = SELECTOR_TRIP_BREAKDOWN_BTN;
					togglerObject.togglerGroup = SELECTOR_TRIP_WRAPPER;
					togglerObject.setGlobal = true;

					togglerObject.container.delegate(
						EVENT_CLICK,
						function(event) {
							var currentTarget = event.currentTarget;

							var tripNode = currentTarget.ancestor(ancestorClass);

							var expanded = currentTarget.hasClass(CSS_TOGGLER_HEADER_EXPANDED);

							if (tripNode) {
								tripNode.toggleClass(CSS_ACTIVE, !expanded);
							}
						},
						SELECTOR_TRIP_BREAKDOWN_BTN
					);
				}

				if (togglerObject.container) {
					instance.accordianToggler(togglerObject);
				}

				var myEvpFaqsContainer = A.one('.my-evp .questions');

				if (myEvpFaqsContainer) {
					var myEvpFaqsTogglerObject = {
						container: myEvpFaqsContainer,
						content: SELECTOR_ANSWER,
						header: SELECTOR_QUESTION
					};

					instance.accordianToggler(myEvpFaqsTogglerObject);
				}
			},

			initTripInterest: function() {
				var instance = this;

				var upcomingTrips = A.one(SELECTOR_UPCOMING_TRIPS);

				if (upcomingTrips) {
					var modal = new A.Modal(
						{
							centered: true,
							height: STR_AUTO,
							render: '.interest-modal',
							visible: false,
							width: 300,
							zIndex: Liferay.zIndex.WINDOW
						}
					).render();

					upcomingTrips.delegate(
						EVENT_CLICK,
						function(event) {
							var currentTarget = event.currentTarget;

							if (currentTarget) {
								var newToolbar = true;

								var bodyContent = LANG_TRIP_INTEREST_DEFAULT_MESSAGE;

								if (currentTarget.attr(STR_DATA_MESSAGE)) {
									bodyContent = currentTarget.attr(STR_DATA_MESSAGE);
								}

								var headerContent = LANG_TRIP_INTEREST_DEFAULT_HEADER;

								if (currentTarget.attr(STR_DATA_HEADER)) {
									headerContent = currentTarget.attr(STR_DATA_HEADER);
								}

								var tripInterestLink = currentTarget.attr(STR_DATA_HREF);

								if (tripInterestLink == 'name added') {
									bodyContent = LANG_TRIP_INTEREST_CONFORMATION_MESSAGE;

									newToolbar = false;
								}

								instance.createToolbar(modal, newToolbar, tripInterestLink, currentTarget);

								modal.setAttrs(
									{
										bodyContent: bodyContent,
										headerContent: '<h3>' + headerContent + '</h3>'
									}
								);
							}

							modal.show();
						},
						'.trip-interest-btn'
					);
				}
			},

			initVideos: function() {
				var instance = this;

				var videoWrapper = A.one('.video-wrapper');

				if (videoWrapper) {
					var videoPreLoaded = videoWrapper.one(SELECTOR_VIDEO);

					if (videoPreLoaded) {
						videoWrapper.delegate(
							EVENT_CLICK,
							function(event) {
								instance.loadVideos(event.currentTarget);
							},
							SELECTOR_VIDEO
						);
					}
					else {
						var tripDisplay = videoWrapper.one(SELECTOR_TRIP_DISPLAY);

						instance.loadVideos(tripDisplay);
					}
				}
			},

			loadVideos: function(target) {
				var instance = this;

				var videoPlayer = A.one('.video-player');

				var videoGroup = target.ancestor('.video-group');

				if (videoGroup) {
					videoPlayer = videoGroup.all('.video-player');
				}

				if (videoPlayer) {
					var autoplay = target.getData('autoplay');

					autoplay = autoplay == 'true';

					var videoUrls = target.getData('url');

					videoUrls = videoUrls.split(',');

					for (var i = 0; i < videoUrls.length; i++) {
						var currentVideoUrl = videoUrls[i];

						if (currentVideoUrl) {
							var videoSrc = instance.getVideoSrc(
								{
									autoplay: autoplay,
									url: currentVideoUrl
								}
							);

							var videoNode = videoPlayer;

							if (videoGroup) {
								videoNode = videoPlayer.item(i);
							}

							instance.showVideoPlayer(
								{
									node: videoNode,
									src: videoSrc
								}
							);
						}
					}
				}
			},

			openEntries: function() {
				var instance = this;

				setTimeout(
					function() {
						var hash = window.location.hash;

						var node = A.one(hash);

						if (node) {
							var parentWrapperNode = node.ancestor(SELECTOR_TRIP_WRAPPER);

							if (parentWrapperNode) {
								var entryIdNode = parentWrapperNode.one('.banner-cover');

								var entryId = entryIdNode.attr('id');

								entryId = ALang.String.removeAll(entryId, 'entry');

								var toggler = instance.toggler;

								toggler.items = [];

								instance.expandToggler(toggler, entryIdNode, entryId);

								instance.scrollIntoView(entryIdNode);
							}
						}

						if (hash.match(/[a-z]*_message_[0-9]*/i)) {
							window.location.hash = '';

							window.location.hash = hash;
						}
					},
					500
				);
			},

			openShareDialog: function(shareLink) {
				var instance = this;

				var modal = new A.Modal(
					{
						centered: true,
						destroyOnHide: true,
						focus: true,
						height: STR_AUTO,
						render: '.share-modal',
						resizable: false,
						visible: false,
						width: 300,
						zIndex: Liferay.zIndex.WINDOW
					}
				).render();

				if (modal) {
					modal.setAttrs(
						{
							bodyContent: LANG_SHARE_MESSAGE + '<div class="control-group"><input class="form-text lfr-input-resource" onclick="this.select()" readonly="true" type="text" value="' + shareLink + '"></div>',
							headerContent: '<h3>' + LANG_SHARE_HEADER + '</h3>'
						}
					);

					instance.createOKToolbar(modal);

					modal.show();

					modal.bodyNode.one('.lfr-input-resource').select();
				}
			},

			scrollIntoView: function(id) {
				var node = A.one(id);

				if (node) {
					if (!scrollAnim) {
						scrollAnim = new A.Anim(
							{
								duration: 0.2,
								easing: 'easeOut',
								node: 'win'
							}
						);
					}

					scrollAnim.set(
						'to',
						{
							scroll: [
								0,
								node.getY()
							]
						}
					).run();
				}
			},

			setHeaderHeight: function() {
				if (header) {
					headerHeight = header.get(STR_OFFSET_HEIGHT);
				}
			},

			setNavbarScroll: function(event) {
				var instance = this;

				var navigation = A.one(SELECTOR_NAVIGATION);

				if (navigation) {
					var winScrollY = WIN.get('scrollY');

					var windowStateMaximized = Liferay.ThemeDisplay.isStateMaximized();

					var navigationHidden = navigation.hasClass(CSS_HIDE);
					var navigationScrolled = navigation.hasClass(CSS_NAV_SCROLL);

					if (navigationScrolled && !navigationHidden) {
						navigationScrolledHeight = navigation.height();
					}

					if (navigationScrolled && winScrollY <= navigationHeight && !windowStateMaximized) {
						navigation.removeClass(CSS_NAV_SCROLL);
					}
					else if (!navigationScrolled && winScrollY > navigationHeight || windowStateMaximized) {
						navigation.addClass(CSS_NAV_SCROLL);
					}

					var scrollDirection = instance.getScrollDirection();

					var scrolledHeaderHeight = headerHeight - navigationScrolledHeight;

					if (!navigationHidden && scrollDirection && winScrollY >= scrolledHeaderHeight) {
						navigation.addClass(CSS_HIDE);

						navigation.removeClass(CSS_OPEN);
					}
					else if (navigationHidden && (!scrollDirection || winScrollY < scrolledHeaderHeight)) {
						navigation.removeClass(CSS_HIDE);
					}

					var faqsNav = A.one('.faqs-nav');

					if (faqsNav) {
						faqsNav.toggleClass('affix', winScrollY >= headerHeight);
					}
				}
			},

			showVideoPlayer: function(config) {
				var node = config.node;

				if (node) {
					node.replaceClass('mask', CSS_PLAYER);

					var iframe = node.one('.video-iframe');

					if (!iframe) {
						node.setContent('<iframe class="video-iframe" frameborder="0"></iframe>');

						iframe = node.one('.video-iframe');
					}

					if (iframe) {
						var currentSrc = iframe.attr(STR_SRC);

						currentSrc = currentSrc.replace(/http.?:/, '');

						var src = config.src;

						if (currentSrc != src) {
							iframe.attr(STR_SRC, src);
						}
					}
				}
			},

			validateInput: function(event) {
				var evpForm = A.one(SELECTOR_EVP_FORM);

				var currentTarget = event.currentTarget;

				var value = currentTarget.val();

				var parentControlGroup = currentTarget.ancestor(SELECTOR_CONTROL_GROUP);

				if (parentControlGroup) {
					A.all('.error-indicator').remove();

					var validatorNodes = evpForm.all(SELECTOR_FORM_VALIDATOR_STACK);

					validatorNodes.each(
						function(item) {
							var controlGroup = item.ancestor(SELECTOR_CONTROL_GROUP);

							if (controlGroup) {
								var controlLabel = controlGroup.one('.control-label');

								if (controlLabel && !controlLabel.one('.error-indicator')) {
									controlLabel.append('<i class="error-indicator icon icon-exclamation-sign"></i>');
								}
							}

						}
					);

					var targetValidatorNodes = parentControlGroup.all(SELECTOR_FORM_VALIDATOR_STACK);

					var mostRecentValidatorNode = parentControlGroup.one(SELECTOR_FORM_VALIDATOR_STACK);

					parentControlGroup.removeClass(STR_ERROR);

					if (targetValidatorNodes.size()) {
						parentControlGroup.addClass(STR_ERROR);

						var eventType = event.type;

						if (eventType == STR_BLUR || eventType == STR_FOCUS) {
							validatorNodes.hide();

							targetValidatorNodes.show();
						}
						else {
							targetValidatorNodes.hide();

							mostRecentValidatorNode.show();

							if (mostRecentValidatorNode.one('.required') && value) {
								mostRecentValidatorNode.hide();

								parentControlGroup.removeClass(STR_ERROR);
							}
						}
					}
				}
			},

			_externalRequest: function(url) {
				var instance = this;

				var externalIframe = instance._externalIframe;

				if (!externalIframe) {
					externalIframe = document.createElement('iframe');

					externalIframe.frameBorder = 0;
					externalIframe.height = 0;
					externalIframe.src = 'about:blank';
					externalIframe.width = 0;

					BODY.appendChild(externalIframe);

					instance._externalIframe = externalIframe;
				}

				externalIframe.src = url;
			},

			_setGridStories: function(results) {
				var instance = this;

				var selectors = ['.grid', '.story-content'];

				if (results) {
					selectors.splice(1, 0, '.result');
				}

				instance.gridStories = A.all(selectors.join(' '));
			}
		};

		Liferay.EVP = new EVP();
	},
	'',
	{
		requires: ['anim', 'aui-base', 'aui-event-input', 'aui-modal', 'aui-progressbar', 'aui-toggler', 'autocomplete-base', 'autocomplete-filters', 'overlaymask', 'querystring']
	}
);

AUI().use(
	'liferay-evp',
	function(A) {
		Liferay.EVP.initializer();
	}
);

/*
This function below loads the Typekit fonts on the page.
*/

(function(document) {
	var config = {
		timeout: 3000,
		typeKitId: 'eio4ypi'
	};

	var flag = false;
	var state;

	var docEl = document.documentElement;

	var timer = setTimeout(
		function() {
			docEl.className = docEl.className.replace(/\bwf-loading\b/g, '') + ' wf-inactive';
		},
		config.timeout
	);

	var script = document.getElementsByTagName('script')[0];
	var typeKitScript = document.createElement('script');

	docEl.className += ' wf-loading';

	typeKitScript.src = '//use.typekit.net/' + config.typeKitId + '.js';
	typeKitScript.async = true;
	typeKitScript.onload = typeKitScript.onreadystatechange = function() {
		state = this.readyState;

		if (flag || state && state != 'complete' && state != 'loaded') {
			return;
		}

		flag = true;

		clearTimeout(timer);

		try {
			Typekit.load(config);
		}
		catch (e) {
		}
	};

	script.parentNode.insertBefore(typeKitScript, script);
})(document);

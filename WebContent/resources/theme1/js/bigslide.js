(function(factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		define([ 'jquery' ], factory);
	} else if (typeof exports === 'object') {
		module.exports = factory(require('jquery'));
	} else {
		factory(jQuery);
	}
}
		(function($) {
			'use strict';
			function _cleanInlineCSS(inlineCSS, toRemove) {
				var inlineCSSArray = inlineCSS.split(';');
				var toRemoveArray = toRemove.split(' ');
				var cleaned = '';
				var keep;
				for (var i = 0, j = inlineCSSArray.length; i < j; i++) {
					keep = true;
					for (var a = 0, b = toRemoveArray.length; a < b; a++) {
						if (inlineCSSArray[i] === ''
								|| inlineCSSArray[i].indexOf(toRemoveArray[a]) !== -1) {
							keep = false;
						}
					}
					if (keep) {
						cleaned += inlineCSSArray[i] + '; ';
					}
				}
				return cleaned;
			}
			$.fn.bigSlide = function(options) {
				var menuLink = this;
				var settings = $.extend({
					'menu' : ('#menu'),
					'push' : ('.push'),
					'shrink' : ('.shrink'),
					'hiddenThin' : ('.hiddenThin'),
					'side' : 'left',
					'menuWidth' : '230px',
					'semiOpenMenuWidth' : '4em',
					'speed' : '200',
					'state' : 'closed',
					'activeBtn' : 'active',
					'easyClose' : true,
					'saveState' : false,
					'semiOpenStatus' : false,
					'semiOpenScreenWidth' : 230,
					'beforeOpen' : function() {
					},
					'afterOpen' : function() {
					},
					'beforeClose' : function() {
					},
					'afterClose' : function() {
					}
				}, options);
				var baseCSSDictionary = 'transition -o-transition -ms-transition -moz-transitions webkit-transition '
						+ settings.side;
				var model = {
					menuCSSDictionary : baseCSSDictionary
							+ ' position top bottom height width',
					pushCSSDictionary : baseCSSDictionary,
					'state' : settings.state
				};
				var controller = {
					init : function() {
						view.init();
					},
					_destroy : function() {
						view._destroy();
						delete menuLink.bigSlideAPI;
						return menuLink;
					},
					changeState : function() {
						if (model.state === 'closed') {
							model.state = 'open'
						} else {
							model.state = 'closed'
						}
					},
					setState : function(state) {
						model.state = state;
					},
					getState : function() {
						return model.state;
					}
				};
				var view = {
					init : function() {
						this.$menu = $(settings.menu);
						this.$push = $(settings.push);
						this.$shrink = $(settings.shrink);
						this.$hiddenThin = $(settings.hiddenThin);
						this.width = settings.menuWidth;
						this.semiOpenMenuWidth = settings.semiOpenMenuWidth;
						var positionOffScreen = {
							'position' : 'fixed',
							'top' : '0',
							'bottom' : '0',
							'height' : '100%'
						};
						var animateSlide = {
							'-webkit-transition' : settings.side + ' '
									+ settings.speed + 'ms ease',
							'-moz-transition' : settings.side + ' '
									+ settings.speed + 'ms ease',
							'-ms-transition' : settings.side + ' '
									+ settings.speed + 'ms ease',
							'-o-transition' : settings.side + ' '
									+ settings.speed + 'ms ease',
							'transition' : settings.side + ' ' + settings.speed
									+ 'ms ease'
						};
						var animateShrink = {
							'-webkit-transition' : 'all ' + settings.speed
									+ 'ms ease',
							'-moz-transition' : 'all ' + settings.speed
									+ 'ms ease',
							'-ms-transition' : 'all ' + settings.speed
									+ 'ms ease',
							'-o-transition' : 'all ' + settings.speed
									+ 'ms ease',
							'transition' : 'all ' + settings.speed + 'ms ease'
						};
						var animationApplied = false;
						positionOffScreen[settings.side] = '-'
								+ settings.menuWidth;
						positionOffScreen.width = settings.menuWidth;
						var initialState = 'closed';
						if (settings.saveState) {
							initialState = localStorage
									.getItem('bigSlide-savedState');
							if (!initialState)
								initialState = settings.state;
						} else {
							initialState = settings.state;
						}
						controller.setState(initialState);
						this.$menu.css(positionOffScreen);
						var initialScreenWidth = $(window).width();
						if (initialState === 'closed') {
							if (settings.semiOpenStatus
									&& initialScreenWidth > settings.semiOpenScreenWidth) {
								this.$hiddenThin.hide();
								this.$menu.css(settings.side, '0');
								this.$menu.css('width', this.semiOpenMenuWidth);
								this.$push.css(settings.side,
										this.semiOpenMenuWidth);
								this.$shrink.css({
									'width' : 'calc(100% - '
											+ this.semiOpenMenuWidth + ')'
								});
								this.$menu.addClass('semiOpen');
							} else {
								this.$push.css(settings.side, '0');
							}
						} else if (initialState === 'open') {
							this.$menu.css(settings.side, '0');
							this.$push.css(settings.side, this.width);
							this.$shrink.css({
								'width' : 'calc(100% - ' + this.width + ')'
							});
							menuLink.addClass(settings.activeBtn);
						}
						var that = this;
						menuLink.on('click.bigSlide touchstart.bigSlide',
								function(e) {
									if (!animationApplied) {
										that.$menu.css(animateSlide);
										that.$push.css(animateSlide);
										that.$shrink.css(animateShrink);
										animationApplied = true;
									}
									e.preventDefault();
									if (controller.getState() === 'open') {
										view.toggleClose();
									} else {
										view.toggleOpen();
									}
								});
						if (settings.semiOpenStatus) {
							$(window)
									.resize(
											function() {
												var screenWidth = $(window)
														.width();
												if (screenWidth > settings.semiOpenScreenWidth) {
													if (controller.getState() === 'closed') {
														that.$hiddenThin.hide();
														that.$menu
																.css({
																	width : that.semiOpenMenuWidth
																});
														that.$menu.css(
																settings.side,
																'0');
														that.$push
																.css(
																		settings.side,
																		that.semiOpenMenuWidth);
														that.$shrink
																.css({
																	'width' : 'calc(100% - '
																			+ that.semiOpenMenuWidth
																			+ ')'
																});
														that.$menu
																.addClass('semiOpen');
													}
												} else {
													that.$menu
															.removeClass('semiOpen');
													if (controller.getState() === 'closed') {
														that.$menu
																.css(
																		settings.side,
																		'-'
																				+ that.width)
																.css(
																		{
																			width : that.width
																		});
														that.$push.css(
																settings.side,
																'0');
														that.$shrink
																.css('width',
																		'100%');
														that.$hiddenThin.show();
													}
												}
											});
						}
						if (settings.easyClose) {
							$(document)
									.on(
											'click.bigSlide',
											function(e) {
												if (!$(e.target).parents()
														.andSelf().is(menuLink)
														&& !$(e.target)
																.closest(
																		settings.menu).length
														&& controller
																.getState() === 'open') {
													view.toggleClose();
												}
											});
						}
					},
					_destroy : function() {
						this.$menu.each(function() {
							var $this = $(this);
							$this.attr('style', _cleanInlineCSS(
									$this.attr('style'),
									model.menuCSSDictionary).trim());
						});
						this.$push.each(function() {
							var $this = $(this);
							$this.attr('style', _cleanInlineCSS(
									$this.attr('style'),
									model.pushCSSDictionary).trim());
						});
						this.$shrink.each(function() {
							var $this = $(this);
							$this.attr('style', _cleanInlineCSS(
									$this.attr('style'),
									model.pushCSSDictionary).trim());
						});
						menuLink.removeClass(settings.activeBtn).off(
								'click.bigSlide touchstart.bigSlide');
						this.$menu = null;
						this.$push = null;
						this.$shrink = null;
						localStorage.removeItem('bigSlide-savedState');
					},
					toggleOpen : function() {
						settings.beforeOpen();
						controller.changeState();
						view.applyOpenStyles();
						menuLink.addClass(settings.activeBtn);
						settings.afterOpen();
						if (settings.saveState) {
							localStorage.setItem('bigSlide-savedState', 'open');
						}
					},
					toggleClose : function() {
						settings.beforeClose();
						controller.changeState();
						view.applyClosedStyles();
						menuLink.removeClass(settings.activeBtn);
						settings.afterClose();
						if (settings.saveState) {
							localStorage.setItem('bigSlide-savedState',
									'closed');
						}
					},
					applyOpenStyles : function() {
						var screenWidth = $(window).width();
						if (settings.semiOpenStatus
								&& screenWidth > settings.semiOpenScreenWidth) {
							this.$hiddenThin.show();
							this.$menu.animate({
								width : this.width
							}, {
								duration : Math.abs(settings.speed - 100),
								easing : 'linear'
							});
							this.$push.css(settings.side, this.width);
							this.$shrink.css({
								'width' : 'calc(100% - ' + this.width + ')'
							});
							this.$menu.removeClass('semiOpen');
						} else {
							this.$menu.css(settings.side, '0');
							this.$push.css(settings.side, this.width);
							this.$shrink.css({
								'width' : 'calc(100% - ' + this.width + ')'
							});
						}
					},
					applyClosedStyles : function() {
						var screenWidth = $(window).width();
						if (settings.semiOpenStatus
								&& screenWidth > settings.semiOpenScreenWidth) {
							this.$hiddenThin.hide();
							this.$menu.animate({
								width : this.semiOpenMenuWidth
							}, {
								duration : Math.abs(settings.speed - 100),
								easing : 'linear'
							});
							this.$push.css(settings.side,
									this.semiOpenMenuWidth);
							this.$shrink.css({
								'width' : 'calc(100% - '
										+ this.semiOpenMenuWidth + ')'
							});
							this.$menu.addClass('semiOpen');
						} else {
							this.$menu.css(settings.side, '-' + this.width);
							this.$push.css(settings.side, '0');
							this.$shrink.css('width', '100%');
						}
					}
				}
				controller.init();
				this.bigSlideAPI = {
					settings : settings,
					model : model,
					controller : controller,
					view : view,
					destroy : controller._destroy
				};
				return this;
			};
		}));
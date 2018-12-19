/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

// @module Footer
define(
	'Footer.View', [
		'SC.Configuration', 'GlobalViews.BackToTop.View'

		, 'footer.tpl'

		, 'Backbone', 'Backbone.CompositeView', 'jQuery'

	],
	function (
		Configuration, GlobalViewsBackToTopView

		, footer_tpl

		, Backbone, BackboneCompositeView, jQuery

	) {
		'use strict';

		// @class Footer.View @extends Backbone.View
		return Backbone.View.extend({

			template: footer_tpl

				,
			initialize: function (options) {
				this.application = options.application;

				BackboneCompositeView.add(this);

				//after appended to DOM, we add the footer height as the content bottom padding, so the footer doesn't go on top of the content
				//wrap it in a setTimeout because if not, calling height() can take >150 ms in slow devices - forces the browser to re-compute the layout.
				this.application.getLayout().on('afterAppendToDom', function () {
					var headerMargin = 25;

					setTimeout(function () {
						$(window).trigger("resize");
					}, 10);
				});

			},
			events: {

				'click [data-action="show-currencies"]': 'showCurrencies',
				'click [data-action="change-currency"]': 'changeCurrency'
			},
			showCurrencies: function () {
				$(".footer-currency-list-holder").slideToggle();
			},
			changeCurrency: function (e) {
				e.preventDefault();
				e.stopPropagation();
				var locale = $(e.currentTarget).attr("data-locale");
				SC.Tools.setSiteCode(locale);
				this.render();
			},
			childViews: {
				'Global.BackToTop': function () {
					return new GlobalViewsBackToTopView();
				}
			}

			// @method getContext @return {Footer.View.Context}
			,
			getContext: function () {
				var footerNavigationLinks = Configuration.get('footer.navigationLinks', []);
				var site = SC.Tools.getSiteCode(this.application||this.options.application);
				var selected = "UK (£)";
				var currencies = SC.Tools.getCurrencies();
				for (var i = 0; i < currencies.length; i++) {
					if (currencies[i].locale == site) {
						selected = currencies[i].title;
						//console.log("found "+selected);
						break;
					}
				}

				var showCurrencies = !SC.ENVIRONMENT.fixedCurrency;
				
				console.log("Currency is fixed " + !showCurrencies);
				//
				// @class Footer.View.Context
				return {
					// @property {Boolean} showLanguages
					showFooterNavigationLinks: !!footerNavigationLinks.length
						// @property {Array<Object>} footerNavigationLinks - the object contains the properties name:String, href:String
						,
					footerNavigationLinks: footerNavigationLinks,
					currencies: currencies,
					selected_currency: selected,
					showCurrencies: showCurrencies,
					logout:SC.SESSION.touchpoints.logout
				};
				// @class Footer.View
			}
		});
	});
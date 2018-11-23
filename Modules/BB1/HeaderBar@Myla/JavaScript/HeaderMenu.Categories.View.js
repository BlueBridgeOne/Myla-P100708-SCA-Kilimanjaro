define(
	'HeaderMenu.Categories.View', [
		'SC.Configuration', 'Backbone.View', 'Backbone.CompositeView', 'headermenu_categories.tpl'

		, 'Utils', 'jQuery','Session'
	],
	function(
		Configuration, View, BackboneCompositeView, headermenu_categories_tpl

		, Utils, jQuery,Session
	) {
		'use strict';

		return Backbone.View.extend({

			initialize: function(options) {

				BackboneCompositeView.add(this);
			},
			events: {
				'click  [data-action="hide-menu"]': 'hideMenu'
			},
			hideMenu: function(e) {
			console.log("Hide Menu From Categories");
				var $header = $("#site-header");
				var $dropdown = $(".header-dropdown");
				$header.removeClass("header-open");
				$dropdown.hide();
			},
			template: headermenu_categories_tpl,
			getContext: function() {
				var context = {}

				var commercecategories = [];
				_.each(Configuration.navigationData, function(entry) {
					if(entry.href!="/range"){
					if (entry["data-type"] == "commercecategory") {
						if (entry.dataTouchpoint !== undefined) {
							entry.data = entry.data || {};
							entry.data.touchpoint = entry.dataTouchpoint;
						}
						if (entry.dataHashtag !== undefined) {
							entry.data = entry.data || {};
							entry.data.hashtag = entry.dataHashtag;
						}

						commercecategories.push(entry);
					}
					}
				});
				//console.log(commercecategories);
				//if (commercecategories.length > 0) {
				//	commercecategories[0].noBar = true;
				//}
				context.categories = commercecategories;
				
context.myaccounturl=Session.get('touchpoints.customercenter');
				//console.log(context.categories);
				// @class Header.Sidebar.View.Context
				return context;

			}
		});
	});
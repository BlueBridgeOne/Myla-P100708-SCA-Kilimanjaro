define(
	'HeaderMenu.Search.View', [
		'SC.Configuration', 'Backbone.View', 'Backbone.CompositeView', 'headermenu_search.tpl'
,	'SiteSearch.View'
		, 'Utils', 'jQuery'
	],
	function(
		Configuration, View, BackboneCompositeView, headermenu_search_tpl
,	SiteSearchView
		, Utils, jQuery
	) {
		'use strict';

		return Backbone.View.extend({

			initialize: function(options) {

				BackboneCompositeView.add(this);
			},
			events: {
				'click  [data-action="hide-menu"]': 'hideMenu'
			},	childViews: {
			'SiteSearch': function()
			{
				return new SiteSearchView();
			}
			
			
		},
			hideMenu: function(e) {
			console.log("Hide Menu From Search");
				var $header = $("#site-header");
				var $dropdown = $(".header-dropdown");
				$header.removeClass("header-open");
				$dropdown.hide();
			},
			template: headermenu_search_tpl
		});
	});
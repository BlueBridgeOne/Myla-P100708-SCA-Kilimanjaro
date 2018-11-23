/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module All
define(
	'All.View', [
		'SC.Configuration', 'ContentGroup.List.View'

		, 'home.tpl'

		, 'Backbone', 'jQuery', 'underscore', 'Utils','HeaderBar.Home.View','FooterCategories.View'
	],
	function(
		Configuration

		, ContentGroups, all_tpl

		, Backbone, jQuery, _, Utils,HeaderBarHome,FooterCategories
	) {
		'use strict';

		//@module Home.View @extends Backbone.View
		return Backbone.View.extend({

			template: all_tpl

				,
			title: _('All Groups').translate()

				,
			page_header: _('All Groups').translate()

				,
			
			childViews: {
				ContentGroups: function(e) {
					return new ContentGroups({ groupname: "all",debug:true,page:"All_" });
				},
				HeaderBarHome: function(e) {
					return new HeaderBarHome({template:"mini",application:this.application});
				}
			},
			getContext: function() {
			$("HTML").addClass("ns_is-edit");
			return {};
			}
		});
	});
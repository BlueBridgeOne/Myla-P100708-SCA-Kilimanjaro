/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module Home
define(
	'Home.View', [
		'SC.Configuration', 'ContentGroup.List.View'

		, 'home.tpl'

		, 'Backbone', 'jQuery', 'underscore', 'Utils','HeaderBar.Home.View','FooterCategories.View'
	],
	function(
		Configuration

		, ContentGroups, home_tpl

		, Backbone, jQuery, _, Utils,HeaderBarHome,FooterCategories
	) {
		'use strict';

		//@module Home.View @extends Backbone.View
		return Backbone.View.extend({

			template: home_tpl

				,
			title: _('Myla London').translate()

				,
			page_header: _('Myla London').translate()
,
getMetaDescription: function() {
                
                return _("Luxury Lingerie and Nightwear").translate();
            }
            ,
        getAddToHead: function() {
                return SC.Tools.getSEO({ title: "Welcome", summary: this.getMetaDescription() });
            }
				,
			
			childViews: {
				ContentGroups: function(e) {
					return new ContentGroups({ groupname: e.groupname,debug:false,page:"HOME_" });
				},
				HeaderBarHome: function(e) {
					return new HeaderBarHome({template:"home",application:this.application});
				},
				FooterCategories: function(e) {
					return new FooterCategories({application:this.application});
				}
			},
			getContext: function() {
			return {};
			}
		});
	});
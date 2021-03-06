/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

// @module ErrorManagement
define(
	'ErrorManagement.View'
,	[
		'Backbone','HeaderBar.Home.View'
	]
,	function(
		Backbone,HeaderBarHome
	)
{
	'use strict';

	return Backbone.View.extend({
		isErrorView: true
		,
		childViews: {
				HeaderBarHome: function(e) {
					return new HeaderBarHome({template:"mini",application:this.application});
				}
			}
	});
});
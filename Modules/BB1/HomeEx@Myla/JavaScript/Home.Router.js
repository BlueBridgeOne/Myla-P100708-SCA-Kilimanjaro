/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module Home
define(
	'Home.Router'
,	[
		'Home.View'
		,'All.View'

	,	'Backbone'
	]
,	function (
		HomeView
		,AllView

	,	Backbone
	)
{
	'use strict';

	// @lass Home.Router @extends Backbone.Router
	return Backbone.Router.extend({

		routes: {
			'': 'homePage'
		,	'?*params': 'homePage'
		,'all': 'all'
		}

	,	initialize: function (Application)
		{
			this.application = Application;
		}

		// @method homePage dispatch the 'go to home page' route
	,	homePage: function ()
		{
			var view = new HomeView({application: this.application});

			view.showContent();
		}
		,	all: function ()
		{
			var view = new AllView({application: this.application});

			view.showContent();
		}
	});
});
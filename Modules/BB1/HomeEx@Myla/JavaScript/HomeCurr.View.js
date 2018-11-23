/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module Home
define(
	'HomeCurr.View', [
		'SC.Configuration'

		, 'homecurr.tpl'

		, 'Backbone', 'jQuery', 'underscore', 'Utils'
	],
	function (
		Configuration

		, homecurr_tpl

		, Backbone, jQuery, _, Utils
	) {
		'use strict';

		//@module Home.View @extends Backbone.View
		return Backbone.View.extend({
			initialize:function(){
				this._dest=this.options.region;
				
			},
			events: {
				'click [data-action="change-site"]': 'enter',
				'change [data-action="change-region"]': 'change'
				
			},
			change:function(e){
				this._dest=$(e.target).val();
			}
			,
			enter: function () {
				
				console.log("Set site from popup: "+this._dest);
				var changed=this._dest!=this.options.region;
				if (this._dest == "UK") {
					SC.Tools.setCookie('country', "GB");
					if(!changed){
						return;
					}
					return SC.Tools.setSiteCode("UK");
				}
				if (this._dest == "US") {
					SC.Tools.setCookie('country', "US");
					if(!changed){
						return;
					}
					return SC.Tools.setSiteCode("US");
				}
				if (this._dest == "Europe") {
					if(!changed){
						return;
					}
					return SC.Tools.setSiteCode("Europe");
				}
				if(this._dest == "Global"&&!changed){
					return;
				}
				return SC.Tools.setSiteCode("Global");
			},
			template: homecurr_tpl,
			getContext: function () {
				var region = this.options.region;
				var continent_code = this.options.continent_code;
				var country_code = this.options.country_code;
				var country_name = this.options.country_name;

				var moveto = "Global";
				if (country_code == "GB") {
					moveto = "UK";
				}else if (continent_code == "EU") {
					moveto = "Europe";
				}
				if (country_code == "US") {
					moveto = "US";
				}
				
				var site;
				var selected = "UK";
				var currencies = SC.Tools.getCurrencies();
				var sites=[];
				for (var i = 0; i < currencies.length; i++) {
					site={title:currencies[i].title,locale:currencies[i].locale};
					if (currencies[i].locale == moveto) {
						site.selected = true;
						
						//console.log("found "+selected);
					}
					sites.push(site);
				}

				
				return {
					sites:sites
				};
			}
		});
	});
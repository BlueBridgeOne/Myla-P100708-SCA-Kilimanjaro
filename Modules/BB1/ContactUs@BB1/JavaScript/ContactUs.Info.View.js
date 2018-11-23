/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('ContactUs.Info.View', [
    'Backbone', 'Backbone.CompositeView', 'contact_us_info.tpl', 'jQuery', 'underscore', 'SC.Configuration'
], function(
    Backbone, BackboneCompositeView, contactUsInfoTpl, jQuery, _, Configuration
) {
    'use strict';

    return Backbone.View.extend({

        initialize: function(options) {

                BackboneCompositeView.add(this);
            }
            // Quite simply, the template we want to use.
            ,
        template: contactUsInfoTpl,
        getContext: function() {
            var companies = Configuration.get("contactUs.companies");
            var use = [];
            var site=SC.Tools.getSiteCode();
            for (var i = 0; i < companies.length; i++) {
                if (companies[i].sitecode == site) {
                    if (companies[i].address) {
                        companies[i].address_formatted = companies[i].address.split(',').join('<br />');
                    }
                    use.push(companies[i]);
                }
            }
            if(use.length==0){
for (var i = 0; i < companies.length; i++) {
                    if (companies[i].address) {
                        companies[i].address_formatted = companies[i].address.split(',').join('<br />');
                    }
                    use.push(companies[i]);
            }
            }
            return { companies: use };
        }
    });
});
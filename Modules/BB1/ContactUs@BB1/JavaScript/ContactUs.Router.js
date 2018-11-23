/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('ContactUs.Router', [
  'Backbone', 'ContactUs.Model', 'ContactUs.View', 'ContactUs.ThankYou.View'
], function(
  Backbone, Model, View, ThankYouView
) {
  'use strict';

  return Backbone.Router.extend({
    routes: {
      'contact-us': 'contactUs',
      'contact-us/thank-you': 'thankYou'
    }

    ,
    initialize: function(application) {
      this.application = application;
    }
    ,
    
    contactUs: function(options) {
      var view = new View({
        application: this.application,
        model: new Model()
      });

      view.showContent();
    },
    thankYou: function(options) {
      var view = new ThankYouView({
        application: this.application
      });

      view.showContent();
    }
  });
});
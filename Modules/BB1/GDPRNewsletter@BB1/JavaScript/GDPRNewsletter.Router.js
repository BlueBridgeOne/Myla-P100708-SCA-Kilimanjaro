/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('GDPRNewsletter.Router', [
  'Backbone', 'GDPRNewsletter.Model','GDPRNewsletter.View', 'GDPRNewsletter.ThankYou.View'
], function(
  Backbone, Model, View, ThankYouView
) {
  'use strict';

  return Backbone.Router.extend({
    routes: {
      'newsletter': 'GDPRNewsletter',
      'newsletter/thank-you': 'thankYou'
    }

    ,
    initialize: function(application) {
      this.application = application;
    }
    ,
    GDPRNewsletter: function(options) {
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
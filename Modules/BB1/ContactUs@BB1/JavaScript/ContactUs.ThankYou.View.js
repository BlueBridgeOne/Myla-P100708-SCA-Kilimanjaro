/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('ContactUs.ThankYou.View'
, [
    'Backbone'
  , 'Backbone.CompositeView'
  , 'contact_us_thankyou.tpl'
  , 'jQuery'
  , 'underscore'
  ,'HeaderBar.Home.View'
  ]
, function
  (
    Backbone
  , BackboneCompositeView
  , contactUsThankYouTpl
  , jQuery
  , _
  ,HeaderBarHome
  )
{
  'use strict';

  return Backbone.View.extend({

 getBreadcrumbPages: function()
    {
      return [{
        text: _('Contact Us').translate()
      , href: '/contact-us'
      },{
        text: _('Thank You').translate()
      , href: '/contact-us/thank-you'
      }]
    }

    // The main use of this is to make this view a Backbone.FormView, so that we can use its functionality.
  , initialize: function(options)
    {
      this.options = options;
      this.application = options.application;

      BackboneCompositeView.add(this);
    },
    childViews: {
        HeaderBarHome: function(e) {
          return new HeaderBarHome({template:"mini",application:this.application});
        }
      }

    // Quite simply, the template we want to use.
  , template: contactUsThankYouTpl

    // Set the page title
  ,
        getTitle: function() {
          return SC.Tools.getTitle("Thank You");
        },
        getMetaDescription: function() {
            return "Thanks for contacting us. Your message has been received and we will get back to you shorty.";
          }
          ,
        
        getAddToHead: function() {
          return SC.Tools.getSEO({ title: "Thank You", summary: this.getMetaDescription()});
        }
  });
});
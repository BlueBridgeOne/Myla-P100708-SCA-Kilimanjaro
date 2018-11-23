/*===========================================

  BB1 - G Truslove

  Date: Jun 2018

  ===========================================*/

define('GDPRNewsletter.ThankYou.View'
, [
    'Backbone'
  , 'Backbone.CompositeView'
  , 'gdprnewsletter_thankyou.tpl'
  , 'jQuery'
  , 'underscore'
  ,'HeaderBar.Home.View'
  ]
, function
  (
    Backbone
  , BackboneCompositeView
  , ThankYouTpl
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
        text: _('Newsletter').translate()
      , href: '/newsletter'
      },{
        text: _('Thank You').translate()
      , href: '/newsletter/thank-you'
      }]
    }

    // The main use of this is to make this view a Backbone.FormView, so that we can use its functionality.
  , initialize: function(options)
    {
      this.options = options;
      this.application = options.application;

      BackboneCompositeView.add(this);
    }

    // Quite simply, the template we want to use.
  , template: ThankYouTpl
,
      
      childViews: {
        HeaderBarHome: function(e) {
          return new HeaderBarHome({template:"mini",application:this.application});
        }
      }
    // Set the page title
  ,
        getTitle: function() {
          return SC.Tools.getTitle("Thank You");
        },
        getMetaDescription: function() {
            return "You have been signed up for our newsletter.";
          }
          ,
        
        getAddToHead: function() {
          return SC.Tools.getSEO({ title: "Thank You", summary: this.getMetaDescription()});
        }
  });
});
/*===========================================

  BB1 - G Truslove

  Date: Jun 2019

  ===========================================*/

define('GDPRNewsletter.ServiceController'
, [
    'ServiceController'
  , 'Application'
  , 'GDPRNewsletter.Model'
  ]
, function
  (
    ServiceController
  , Application
  , GDPRNewsletterModel
  )
{
  'use strict';

  return ServiceController.extend({
    name: 'GDPRNewsletter.ServiceController'

  , post: function()
    {
      this.sendContent(GDPRNewsletterModel.create(this.data));
    }
  });
});
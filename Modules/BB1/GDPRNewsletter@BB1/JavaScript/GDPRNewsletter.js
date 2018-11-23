/*===========================================

  BB1 - G Truslove

  Date: Jun 2019

  ===========================================*/

define('GDPRNewsletter'
, [
    'GDPRNewsletter.Router'
  , 'SC.Configuration'
  ]
, function
  (
    Router
  , Configuration
  )
{
  'use strict';
  return {
    mountToApp: function(application)
    {
    var enabled = Configuration.get('GDPRNewsletter.enabled');

      if (enabled)
      {
        return new Router(application);
        }
    }
  }
});
/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('ContactUs'
, [
    'ContactUs.Router'
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
      // This is a basic way of only enabling functionality if it has been enabled: get the config option from the backend and if it's set to true, then create a router.
      var enabled = Configuration.get('contactUs.enabled');

      if (enabled)
      {
        return new Router(application);
      }
    }
  }
});
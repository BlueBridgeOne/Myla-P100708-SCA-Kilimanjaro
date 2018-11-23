/*===========================================

  BB1 - G Truslove

  Date: Jun 2018

  ===========================================*/

define('GDPRNewsletter.Model'
, [
    'Backbone'
  , 'underscore'
  , 'Utils'
  ]
, function
  (
    Backbone
  , _
  , Utils
  )
{
  'use strict';

  return Backbone.Model.extend({
    urlRoot: Utils.getAbsoluteUrl('services/GDPRNewsletter.Service.ss')

  , validation:
    {
      firstname:
      {
        required: true
      , msg: 'Please enter a first name'
      }
    , lastname:
      {
        required: true
      , msg: 'Please enter a last name'
      }
    , email:
      [
        {
          required: true
        , msg: 'Please enter an email address'
        }
      , {
          pattern: 'email'
        , msg: 'Please enter a valid email address'
        }
      ]
    
      ,host:{}
      ,comoany:{}
    }
  });
});
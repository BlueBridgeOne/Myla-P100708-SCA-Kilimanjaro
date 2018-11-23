define('YoutubeEmbed'
, [
    'YoutubeEmbed.View'
  ]
, function
  (
    View
  )
{
  'use strict';

  return {
    mountToApp: function (application)
    {
      application.getComponent('CMS').registerCustomContentType({
        id: 'bb1_cct_youtube_embed'
      , view: View
      });
    }
  }
});
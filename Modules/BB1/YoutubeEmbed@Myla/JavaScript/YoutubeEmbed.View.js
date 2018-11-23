define('YoutubeEmbed.View'
, [
    'CustomContentType.Base.View'

  , 'youtube_embed.tpl'
  ]
, function
  (
    BaseView

  , Template
  )
{
  'use strict';

  return BaseView.extend({
    template: Template

  , getContext: function ()
    {
      var $html = $("html");
      var SMT = $html.hasClass("ns_is-admin") || $html.hasClass("ns_is-edit");
                        
      return {
        id: this.settings.custrecord_bb1_cct_youtube_id,
        height: this.settings.custrecord_bb1_cct_youtube_height,
        width: this.settings.custrecord_bb1_cct_youtube_width,
        aspect:(80*(this.settings.custrecord_bb1_cct_youtube_height/this.settings.custrecord_bb1_cct_youtube_width))+ "%",
        smt:SMT
      }
    }
  });
});
define('AdvancedImage.View', [
    'CustomContentType.Base.View',
    'advanced_image.tpl',
    'Utils'
], function (
    BaseView,
    Template,
    Utils
) {
    'use strict';

    return BaseView.extend({

        initialize: function (options) {
            this.dark = SC.Tools.dark;
        },
        template: Template,

        getContext: function () {

            var v = this,
                isHeader = false,isFullWidth=true;
            while (v.hasParent) {
                v = v.parentView;
                if (v.placeholderData) {
                    if (v.placeholderData.view == "HeaderBarHome" || v.placeholderData.view == "HeaderBarCat" || v.placeholderData.view == "HeaderBarProd") {
                        isHeader = true;
                        break;
                    }else if (v.placeholderData.view == "ContentGroup") {
                        isFullWidth = false;
                        break;
                    }
                }

            }

            var light = this.settings.custrecord_bb1_cct_ai_light == "T"; //The image is light.
            var SMT;
            if (isHeader) {
                var $html = $("html");
                SMT = $html.hasClass("ns_is-admin") || $html.hasClass("ns_is-edit");
                if (!SMT && light != this.dark) { //Confusing!! A light image equals dark text.
                    console.log("Show dark text in banner=" + light);
                    this.dark = light;
                    SC.Tools.updateDarkHeader(light); //Myla specific, show light or dark text.
                }
            }
            var resize = "main",resizeWide="zoom";
            if (isHeader||isFullWidth) {
                resize = "zoom"
            }
            var parallax;
            
            if(this.settings.custrecord_bb1_cct_ai_parallax&&this.settings.custrecord_bb1_cct_ai_parallax.length>0){
switch(this.settings.custrecord_bb1_cct_ai_parallax){
    case "2": //Inset Landscape
    parallax="inset_landscape";
    //resize=undefined;
    break;
}
            }
            
            return {
                richtext: this.settings.custrecord_bb1_cct_ai_richtext,
                image: this.settings.custrecord_bb1_cct_ai_image2_url || this.settings.custrecord_bb1_cct_ai_image,
                class: light ? "bb1_cct_advanced_image-light" : "bb1_cct_advanced_image-dark",
                alt: this.settings.custrecord_bb1_cct_ai_alttext || 'image',
                align: this.settings.custrecord_bb1_cct_ai_align,
                link: this.settings.custrecord_bb1_cct_ai_link,
                hasLink: this.settings.custrecord_bb1_cct_ai_link&&this.settings.custrecord_bb1_cct_ai_link.length>0,
                hasText: this.settings.custrecord_bb1_cct_ai_richtext && this.settings.custrecord_bb1_cct_ai_richtext.length > 0,
                resize: resize,
                SMT:SMT,
                isHeader:isHeader,
                parallax:parallax
            }
        }
    });
});
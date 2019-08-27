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
            var ANC_IMAGE = $(".header-banner").find(".bgimage-slide-1");
            //console.log("Back 2: " + ANC_IMAGE.css("background-image"));

            //console.log("Is Header: " + isHeader);

            if (isHeader) {
                var bg_image = this.settings.custrecord_bb1_cct_ai_image2_url || this.settings.custrecord_bb1_cct_ai_image;
            } else {
                var bg_image = ANC_IMAGE.attr("src");
                console.log("BG Image: " + bg_image);
                if (bg_image != null) {
                    bg_image = bg_image.replace('url(','').replace(')','').replace(/\"/gi, "");
                }
            }

            var bg_width;
            var bg_height;
            // Get Image Dimensions
            //var bg_image = this.settings.custrecord_bb1_cct_ai_image2_url || this.settings.custrecord_bb1_cct_ai_image;
            //console.log("Image URL: " + bg_image);
            var img = new Image();
            img.onload = function() {
                //console.log("Dimensions: " + this.width + 'x' + this.height);
                bg_width = this.width;
                bg_height = this.height;

                function recalc_bg() {
                    var banner = $(".BANNER_HOLDER").find(".bgimage-slide-1");

                    var banner_bg = banner.attr("src");
                    var banner_holder_width = $(".BANNER_HOLDER").width();
                    //942
                    var ratio = banner_holder_width / 1400;
                    var new_height = bg_height * ratio;
                    //console.log("Banner: " + new_height);

                    $("#banner-spacer").find(".BANNER_HOLDER").css("height", new_height + "px !important");
                    //$("#banner-spacer").css("height", new_height + "px !important");
                    $("#banner-spacer").height(new_height);
                    $("#banner-spacer").find(".BANNER_HOLDER").height(new_height);



                }
                recalc_bg();
                $( window ).resize(function() {
                    recalc_bg();
                });


            }
            if (bg_image != null) {
                img.src = bg_image;
            }


            if(this.settings.custrecord_bb1_cct_ai_parallax&&this.settings.custrecord_bb1_cct_ai_parallax.length>0){
switch(this.settings.custrecord_bb1_cct_ai_parallax){
    case "2": //Inset Landscape
    parallax="inset_landscape";
    //resize=undefined;
    break;
}
            }
            //console.log("Image 2 : " + this.settings.custrecord_bb1_cct_image_2);
            //console.log("Image 3 : " + this.settings.custrecord_bb1_cct_image_3);
            //console.log(this.settings);

            var has_image_2 = false;
            var has_image_3 = false;

            if (this.settings.custrecord_bb1_cct_image_2 != '') has_image_2 = true;
            if (this.settings.custrecord_bb1_cct_image_3 != '') has_image_3 = true;

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
                parallax:parallax,
                image2: this.settings.custrecord_bb1_cct_image_2_url,
                image3: this.settings.custrecord_bb1_cct_image_3_url,
                has_image_2: has_image_2,
                has_image_3: has_image_3
            }
        }
    });
});
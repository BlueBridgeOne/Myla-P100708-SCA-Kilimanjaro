/*===========================================

  BB1 - G Truslove

  Date: July 2018

  ===========================================*/

define('SizeGuide.View', [
    'Backbone', 'Backbone.CompositeView', 'sizeguide.tpl', 'jQuery', 'underscore'
], function(
    Backbone, BackboneCompositeView,sizeguide_tpl, jQuery, _
) {
    'use strict';

    return Backbone.View.extend({

       
        initialize: function(options) {
                this.options = options;
                this.application = options.application;

                BackboneCompositeView.add(this);
            }

           ,
        template: sizeguide_tpl
            ,
        getContext: function() {
            return {
               content:this.options.content
            };
        }
    });
});
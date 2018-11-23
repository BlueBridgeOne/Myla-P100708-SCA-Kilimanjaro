/*
    © 2017 NetSuite Inc.
    User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
    provided, however, if you are an authorized user with a NetSuite account or log-in, you
    may use this code subject to the terms that govern your access and use.
*/

// @module Footer
define(
    'FooterCategories.View', [
        'SC.Configuration'

        , 'footer_categories.tpl'

        , 'Backbone', 'Backbone.CompositeView', 'jQuery', 'Utils', 'Session', 'jquery.cookie'
    ],
    function(
        Configuration

        , footer_categories_tpl

        , Backbone, BackboneCompositeView, jQuery, Utils, Session
    ) {
        'use strict';

        // @class Footer.View @extends Backbone.View
        return Backbone.View.extend({

            template: footer_categories_tpl

                ,
            initialize: function(options) {
                    this.application = options.application;

                    BackboneCompositeView.add(this);
                }
                ,
                render: function() {
                    Backbone.View.prototype.render.call(this);
        
                    setTimeout(function(){ 
                                          //center scrolls
        
                                          var outerContent=$(".footer-categories-wrapper");
                                          var innerContent=outerContent.find("ul");
                  
                      outerContent.scrollLeft((innerContent.width() - outerContent.width()) / 2);  
                    }, 1000);
                }
                ,

            
            // @method getContext @return {Footer.View.Context}
            getContext: function() {
                var context={},commercecategories = [];
                        _.each(Configuration.navigationData, function(entry) {
                            if(entry.href!="/range"){
                            if (entry["data-type"] == "commercecategory") {
                                if (entry.dataTouchpoint !== undefined) {
                                    entry.data = entry.data || {};
                                    entry.data.touchpoint = entry.dataTouchpoint;
                                }
                                if (entry.dataHashtag !== undefined) {
                                    entry.data = entry.data || {};
                                    entry.data.hashtag = entry.dataHashtag;
                                }

                                commercecategories.push(entry);
                            }
                            }
                        });
                        if (commercecategories.length > 0) {
                            commercecategories[0].noBar = true;
                        }
                        context.categories = commercecategories;

                // @class Footer.View.Context
                return context;
                // @class Footer.View
            }
        });
    });
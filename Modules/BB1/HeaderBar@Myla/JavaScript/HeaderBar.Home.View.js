//@module HeaderBar
define(
    'HeaderBar.Home.View', [
        'SC.Configuration', 'Backbone.View', 'Backbone.CompositeView', 'headerbar_home.tpl', 'headerbar_mini.tpl', 'headerbar_cat.tpl', 'headerbar_prod.tpl', 'ProductDetails.Header.View', 'ProductDetails.SubHeader.View'

        , 'Utils', 'jQuery'
    ],
    function(
        Configuration, View, BackboneCompositeView, headerbar_home_tpl, headerbar_mini_tpl, headerbar_cat_tpl, headerbar_prod_tpl, ProductDetailsHeaderView, ProductDetailsSubHeaderView

        , Utils, jQuery
    ) {
        'use strict';

        return Backbone.View.extend({

            initialize: function(options) {
                this.options = options || {};

                var self = this;
                var darkText;
                if (this.options.image && this.options.image.lit) {
                    darkText = true;
                }
                this.dark = darkText || SC.Tools.dark;
                this.home = SC.Tools.home;
                SC.Tools.onUpdateHeader("home", function() {
                    self.dark = SC.Tools.dark;
                    self.home = SC.Tools.home;
                    self.render();
                });

                if (this.options.template) {
                    switch (this.options.template) {
                        case "mini":
                            this.template = headerbar_mini_tpl;
                            SC.Tools.updateDarkHeader(true);
                            break;
                        case "category":
                        case "search":
                            this.template = headerbar_cat_tpl;
                            SC.Tools.updateDarkHeader(darkText);
                            break;
                        case "product":
                            this.template = headerbar_prod_tpl;
                            SC.Tools.updateDarkHeader(darkText);
                            break;
                        default:
                            SC.Tools.updateDarkHeader(darkText || false);
                            break;
                    }
                } else {
                    SC.Tools.updateDarkHeader(darkText || false);
                }
                BackboneCompositeView.add(this);
            },
            updateImage: function(newImage) {
            //console.log("Update Banner "+newImage.url);
                var darkText;
                this.options.image = newImage;
                if (this.options.image && this.options.image.lit) {
                    darkText = true;
                }
                if(darkText!=this.dark){
                this.dark=darkText;
                SC.Tools.updateDarkHeader(darkText);
                }
                this.render();
            },
            render: function() {


                Backbone.View.prototype.render.call(this);

                //sort fixed heights.
                var vph = $(window).height();
                
                this.$el.find("[data-height]").each(function () {
                    var $this = $(this);
                    var dheight = $this.attr("data-height");
                    var dwidth = $(document).width();
                    if (dwidth < 500) {
                        vph *= .65;
                    }else if (dwidth < 800) {
                        vph *= .75;
                    }
                    var newHeight = (parseInt(dheight) / 100) * vph;
                    if(newHeight>1400*.5){
                        newHeight=1400*.5;
                    }
                    $this.height(newHeight);
                });

                SC.Tools.updateHeaderColors(this.$el,true);
            },
            childViews: {
                'ProductDetails': function() {
                    return new ProductDetailsHeaderView({ model: this.model, application: this.options.application });
                },
                'SubProductDetails': function() {
                    return new ProductDetailsSubHeaderView({ model: this.model, application: this.options.application });
                }
            },
            template: headerbar_home_tpl,
            getContext: function() {
                //console.log("render banner "+this.options.template);
                var context = {}
                switch (this.options.template) {
                    case "search":
                        context.name = this.options.keywords;
                        context.collection = _("Search").translate();
                        break;
                    case "category":
                        //console.log(this.options.template+" "+this.options.keywords);
                        if (this.options.category) {

                            context.name = this.options.category.get("name");

                            var decoded = $('<div/>').html(this.options.category.get("description")).text();

                            context.description = decoded;
                            context.collection = "collection";
                            var breadcrumbs = this.options.category.get("breadcrumb"); //Find parent name
                            if (breadcrumbs && breadcrumbs.length > 1) {
                                context.collection = breadcrumbs[0].name;
                            }
                        }
                        break;
                    case "home":
                        var commercecategories = [];
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
                        //console.log(commercecategories);
                        if (commercecategories.length > 0) {
                            commercecategories[0].noBar = true;
                        }
                        context.categories = commercecategories;
                        break;
                }

                if (this.dark) {
                    context.className = "header-foreground-dark";
                }
                context.page = this.options.page;
                context.image = this.options.image;
                //if (context.image) {
                //    console.log("render header " + context.image.url);
                //}

                // @class Header.Sidebar.View.Context
                return context;

            }
        });
    });
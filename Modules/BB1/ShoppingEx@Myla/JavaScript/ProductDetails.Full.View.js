/*
    © 2017 NetSuite Inc.
    User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
    provided, however, if you are an authorized user with a NetSuite account or log-in, you
    may use this code subject to the terms that govern your access and use.
*/

//@module ProductDetails
define(
    'ProductDetails.Full.View', [
        'ProductDetails.Base.View', 'SC.Configuration'

        , 'ItemRelations.Related.View', 'ItemRelations.Correlated.View'


        , 'HeaderBar.Home.View', 'ContentGroup.List.View', 'SocialSharing.Flyout.View'
        ,"SizeGuide.View"

        , 'product_details_full.tpl'

        , 'underscore'


    ],
    function(
        ProductDetailsBaseView, Configuration

        , ItemRelationsRelatedView, ItemRelationsCorrelatedView


        , HeaderBarHome, ContentGroups

        , SocialSharingFlyoutView
        ,SizeGuideView

        , product_details_full_tpl

        , _
    ) {
        'use strict';

        //@class ProductDetails.Full.View Handles the PDP and quick view @extend Backbone.View
        return ProductDetailsBaseView.extend({

            //@property {Function} template
            template: product_details_full_tpl

                //@property {Object} attributes List of HTML attributes applied by Backbone into the $el
                ,
            attributes: {
                'id': 'ProductDetails.Full.View',
                'class': 'view product-detail'
            }


            ,
            bindings: _.extend({}, ProductDetailsBaseView.prototype.bindings, {})

                //@method initialize Override default method to update the url on changes in the current product
                //@param {ProductDetails.Full.View.Initialize.Options} options
                //@return {Void}
                ,
            initialize: function initialize() {
                    ProductDetailsBaseView.prototype.initialize.apply(this, arguments);

                    this.model.on('change', function(){if(this.updateURL()){
                    this.updateImage();}}, this);
                }
                ,
updateImage: function() {
if (this.currentHeader) {
var imageDetails = this.getImageDetails();
                          this.currentHeader.updateImage(imageDetails.ban);
                          this.currentGroups.updateImages(imageDetails);
                    }
},
    events: {
            'click [data-action="show-sizeguide"]': 'showSizeGuide'
        }
        ,
        showSizeGuide:function(e){
         e.preventDefault();
  e.stopPropagation();
var item=this.options.model.get("item");
        var view = new SizeGuideView({ application: this.options.application,content:item.get("custitem_bb1_sca_sizeguide_content") });
        view.title=item.get("storedisplayname2");
                view.showInModal();


        }
                ,
            childViews: _.extend({}, ProductDetailsBaseView.prototype.childViews, {
                    HeaderBarHome: function(e) {

                        var imageDetails = this.getImageDetails();
                        var CMSName = "PROD" + this.model.get("item").get("itemid") + "_";
                        this.currentHeader = new HeaderBarHome({ template: "product", model: this.model, application: this.application, page: CMSName, image: imageDetails.ban });
                        return this.currentHeader;
                    },
                    ContentGroups: function(e) {
                        var imageDetails = this.getImageDetails();
                        var group = this.model.get("item").get("custitem_bb1_sca_content_layout") || "none";

                        var CMSName = "PROD" + this.model.get("item").get("itemid") + "_";
                        this.currentGroups= new ContentGroups({ groupname: group, debug: false, page: CMSName,imageDetails:imageDetails });
                        return this.currentGroups;
                    },
                    'Correlated.Items': function() {
                        return new ItemRelationsCorrelatedView({
                            itemsIds: this.model.get('item').get('internalid'),
                            application: this.application
                        });

                    },
                    'Related.Items': function() {
                        return new ItemRelationsRelatedView({
                            itemsIds: this.model.get('item').get('internalid'),
                            application: this.application
                        });
                    },
                    'SocialSharing.Flyout': function() {
                        return new SocialSharingFlyoutView({});
                    }
                })

                //@method destroy Override default method to detach from change event of the current product
                //@return {Void}
                ,
            destroy: function destroy() {
                    this.model.off('change');
                    return this._destroy();
                }


                //@method getContext
                //@return {ProductDetails.Full.View.Context}
                ,
            getContext: function getContext() {
            var sizeguide=this.model.get("item").get("custitem_bb1_sca_sizeguide_content");
             var CMSName = "PROD" + this.model.get("item").get("itemid") + "_";
                //@class ProductDetails.Full.View.Context @extend ProductDetails.Base.View.Context
                return _.extend(ProductDetailsBaseView.prototype.getContext.apply(this, arguments), {
                    position: "full",
                    page:CMSName,
                    sizeguide:sizeguide
                });

                //@class ProductDetails.Full.View
            }
        });
    });

//@class ProductDetails.Full.View.Initialize.Options @extend ProductDetails.Base.View.Initialize.Options
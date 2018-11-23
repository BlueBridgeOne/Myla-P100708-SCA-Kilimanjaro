/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module ProductDetails
define(
	'ProductDetails.SubHeader.View'
,	[
		'ProductDetails.Base.View'
	,	'SC.Configuration'
        ,"SizeGuide.View"


	,	'product_details_header.tpl'

	,	'underscore'

	]
,	function (
		ProductDetailsBaseView
	,	Configuration
	
,SizeGuideView
	,	product_details_header_tpl

	,	_
	)
{
	'use strict';

	//@class ProductDetails.Full.View Handles the PDP and quick view @extend Backbone.View
	return ProductDetailsBaseView.extend({

		//@property {Function} template
		template: product_details_header_tpl

		//@property {Object} attributes List of HTML attributes applied by Backbone into the $el
	,	attributes: {
			'id': 'ProductDetails.Header.View'
		,	'class': 'view product-detail'
		,position:'subheader_'
		}


	,	bindings: _.extend({}, ProductDetailsBaseView.prototype.bindings, {})

		//@method initialize Override default method to update the url on changes in the current product
		//@param {ProductDetails.Full.View.Initialize.Options} options
		//@return {Void}
	,	initialize: function initialize ()
		{
			ProductDetailsBaseView.prototype.initialize.apply(this, arguments);
			
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

		,	childViews: _.extend({}, ProductDetailsBaseView.prototype.childViews, {
			
				'AddToProductList': function ()
				{
					return null;
				}
		})

		//@method getContext
		//@return {ProductDetails.Header.View.Context}
	,	getContext: function getContext ()
		{
		var sizeguide=this.model.get("item").get("custitem_bb1_sca_sizeguide_content");
		
			//@class ProductDetails.Header.View.Context @extend ProductDetails.Base.View.Context
			return _.extend(ProductDetailsBaseView.prototype.getContext.apply(this, arguments), {
position:"subheader",
                    sizeguide:sizeguide
			});
			//@class ProductDetails.Header.View
		}
	});
});

//@class ProductDetails.Header.View.Initialize.Options @extend ProductDetails.Base.View.Initialize.Options

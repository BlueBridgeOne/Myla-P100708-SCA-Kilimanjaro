{{! © 2017 NetSuite Inc. User may not copy, modify, distribute, or re-bundle or otherwise make available this code; provided, however, if you are an authorized user with a NetSuite account or log-in, you may use this code subject to the terms that govern your access and use. }}
<div data-view="HeaderBarHome"></div>
<div data-view="ContentGroups" />
<div class="product-details-full">
	<header class="product-details-full-header">
		<div id="banner-content-top" class="product-details-full-banner-top"></div>
	</header>
	<article class="product-details-full-content" itemscope itemtype="https://schema.org/Product">
		<meta itemprop="url" content="{{itemUrl}}">
		<div id="banner-details-top" class="product-details-full-banner-top-details"></div>
		<section class="product-details-full-main-content">
			<div class="product-details-full-main-content-left">
				{{#if urlins}}
				<img id="insimage" data-parallax="foreground" src="{{urlins}}" class="product-details-full-ins-image" alt="{{pageHeader}} Inset" />
				{{#if urlpdp}}
				<img id="pdpimage" src="{{urlpdp}}" class="product-details-full-pdp-ins-image" alt="{{pageHeader}}" />
				{{/if}}
				{{else}}
				{{#if urlpdp}}
				<img id="pdpimage" src="{{urlpdp}}" class="product-details-full-pdp-image" alt="{{pageHeader}}" />
				{{/if}}
				{{/if}}
				
			</div>
			<div class="product-details-full-main-content-right">
				<h3 class="product-details-full-content-header-title" itemprop="name">{{pageHeader}}</h3>
				<div class="product-details-full-main">
					{{#if isItemProperlyConfigured}}
					<form id="product-details-full-form" data-action="submit-form" method="POST">
						<table class="product-views-price-table"><tr><td><div data-view="Product.Price"></div></td><td>{{#if sizeguide}}
	<a class="product-views-size-anchor" data-action="show-sizeguide">{{translate 'Size Guide'}}</a>{{/if}}</td></tr></table>
						<section class="product-details-full-info">
							<div id="banner-summary-bottom" class="product-details-full-banner-summary-bottom"></div>
						</section>
						<div data-view="Quantity.Pricing"></div>
						{{#if model.item.storedetaileddescription}}
						<p class="product-delivery-note">{{{model.item.storedetaileddescription}}}</p>
						{{/if}}
						<section data-view="Product.Options" class="product-details-position-full do-not-print"></section>
						<br />
						<div data-view="Product.Sku"></div>
						<div data-view="Product.Stock.Info"></div>
						<p class="product-delivery-note">{{translate deliveryTitle}}
							<br /> {{translate deliveryMessage}}</p>
						{{#if isPriceEnabled}}
						<ul class="inline-list do-not-print">
							<li class="list-responsive-sm">
								<div data-view="Quantity"></div>
							</li>
							<li>
								<div data-view="MainActionView"></div>
							</li>
							<li>
								<div data-view="AddToProductList" class="product-details-full-actions-addtowishlist"></div>
							</li>
						</ul>
						{{/if}}
						<div data-view="StockDescription"></div>
						<div data-view="SocialSharing.Flyout" class="product-details-full-social-sharing"></div>
						<div class="product-details-full-main-bottom-banner">
							<div id="banner-summary-bottom" class="product-details-full-banner-summary-bottom"></div>
						</div>
					</form>
					{{else}}
					<div data-view="GlobalViewsMessageView.WronglyConfigureItem"></div>
					{{/if}}
				</div>
			</div>
		</section>
		<div class="product-details-below-cms" data-cms-area-filters="page_type" data-cms-area="{{page}}PROD_BELOWDETAILS" ></div>
		<div class="product-details-below-cms" data-cms-area-filters="global" data-cms-area="PROD_BELOWDETAILS" ></div>
		<div class="product-details-full-content-related-items">
			<div data-view="Related.Items"></div>
		</div>
		<div class="product-details-full-content-correlated-items">
			<div data-view="Correlated.Items"></div>
		</div>
	</article>
</div>
{{!---- Use the following context variables when customizing this template: model (Object) model.item (Object) model.item.internalid (Number) model.item.type (String) model.quantity (Number) model.options (Array) model.options.0 (Object) model.options.0.cartOptionId (String) model.options.0.itemOptionId (String) model.options.0.label (String) model.options.0.type (String) model.location (String) model.fulfillmentChoice (String) pageHeader (String) itemUrl (String) isItemProperlyConfigured (Boolean) isPriceEnabled (Boolean) ----}}
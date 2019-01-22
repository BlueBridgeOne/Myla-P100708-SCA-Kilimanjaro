{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}
<div class="product-details-full">

	<article class="product-details-full-content" itemscope itemtype="https://schema.org/Product">
		<meta itemprop="url" content="{{itemUrl}}">
		<div id="banner-details-top" class="product-details-full-banner-top-details"></div>

		<section class="product-details-full-main-content">


			<div class="product-details-full-main-content-right">

<h3 class="product-details-header-title" id="first-title" itemprop="name">{{pageHeader}}</h3>

			<div class="product-details-full-main">
				{{#if isItemProperlyConfigured}}
					<form id="product-details-full-form" data-action="submit-form" method="POST">

						<section class="product-details-full-info">
							<div id="banner-summary-bottom" class="product-details-full-banner-summary-bottom"></div>
						</section>
<div>

	<table class="product-views-price-table"><tr><td><div data-view="Product.Price"></div></td><td>{{#if sizeguide}}
	<a class="product-views-size-anchor" data-action="show-sizeguide">{{translate 'Size Guide'}}</a>{{/if}}</td></tr></table>

						<div data-view="Quantity.Pricing"></div>
</div>
						<section data-view="Product.Options" class="do-not-print"></section>

						<div data-view="Product.Stock.Info"></div>

<p class="product-delivery-note">{{translate deliveryTitle}}<br />
{{translate deliveryMessage}}</p>

						{{#if isPriceEnabled}}
						<ul class="inline-list do-not-print">
							<li>
							<div data-view="Quantity"></div>
</li>
<li>
									<div data-view="MainActionView"></div>
						</li></ul>
						{{/if}}

						<div data-view="StockDescription"></div>

					</form>
				{{else}}
					<div data-view="GlobalViewsMessageView.WronglyConfigureItem"></div>
				{{/if}}

			</div>
			</div>

		</section>


	</article>
</div>



{{!----
Use the following context variables when customizing this template:

	model (Object)
	model.item (Object)
	model.item.internalid (Number)
	model.item.type (String)
	model.quantity (Number)
	model.options (Array)
	model.options.0 (Object)
	model.options.0.cartOptionId (String)
	model.options.0.itemOptionId (String)
	model.options.0.label (String)
	model.options.0.type (String)
	model.location (String)
	model.fulfillmentChoice (String)
	pageHeader (String)
	itemUrl (String)
	isItemProperlyConfigured (Boolean)
	isPriceEnabled (Boolean)

----}}

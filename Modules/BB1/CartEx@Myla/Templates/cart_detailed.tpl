{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="cart-detailed">
	<div data-view="HeaderBarHome"></div>
	<div class="cart-detailed-view-header">
		<header class="cart-detailed-header">
			{{#if showLines}}
			<h1 class="cart-detailed-title">
				<!--Bag Icon -->
			<svg fill="currentColor" width="42px" height="34px" viewBox="0 0 21 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" alt="{{translate 'Bag'}}">
				<g transform="translate(-716.000000, -19.000000)" fill-rule="nonzero">
					<path d="M726.399634,19.047619 C723.805551,19.047619 721.703995,20.6620133 721.703995,22.6547617 L721.703995,22.8571427 L719.294187,22.8571427 C719.27612,22.8563826 719.258013,22.8563826 719.239947,22.8571427 C719.022201,22.8753898 718.845822,23.0012042 718.806026,23.1666665 L716.008789,35.3571421 C715.981059,35.4688099 716.019691,35.5841565 716.114135,35.6716774 C716.208578,35.7591984 716.348964,35.8097492 716.49695,35.8095231 L736.40305,35.8095231 C736.551036,35.8097492 736.691422,35.7591984 736.785865,35.6716774 C736.880309,35.5841565 736.918941,35.4688099 736.891211,35.3571421 L734.093974,23.1666665 C734.049252,22.9867688 733.844228,22.8567714 733.605813,22.8571427 L731.126268,22.8571427 L731.126268,22.6547617 C731.126268,20.6620133 729.024712,19.047619 726.430629,19.047619 L726.399634,19.047619 Z M726.399634,19.8095238 L726.430629,19.8095238 C728.49328,19.8095238 730.13445,21.0702532 730.13445,22.6547617 L730.13445,22.8571427 L722.695813,22.8571427 L722.695813,22.6547617 C722.695813,21.0702532 724.336982,19.8095238 726.399634,19.8095238 Z M719.71261,23.6190474 L721.703995,23.6190474 L721.703995,25.1428569 C721.701466,25.280242 721.795428,25.4080307 721.949903,25.4772903 C722.104377,25.5465498 722.295431,25.5465498 722.449905,25.4772903 C722.60438,25.4080307 722.698343,25.280242 722.695813,25.1428569 L722.695813,23.6190474 L730.13445,23.6190474 L730.13445,25.1428569 C730.13192,25.280242 730.225883,25.4080307 730.380357,25.4772903 C730.534832,25.5465498 730.725885,25.5465498 730.88036,25.4772903 C731.034834,25.4080307 731.128797,25.280242 731.126268,25.1428569 L731.126268,23.6190474 L733.18739,23.6190474 L735.814158,35.0476183 L717.085842,35.0476183 L719.71261,23.6190474 Z" id="Shape"></path>
				</g>
			</svg>

				{{pageHeader}}
				<small class="cart-detailed-title-details-count">
					{{productsAndItemsCount}}
				</small>
			</h1>
			{{else}}
				<h2 class="cart-detailed-title">{{translate 'Your Shopping Cart is empty'}}</h2>
			{{/if}}
		</header>
	</div>

	<div class="cart-detailed-body">
		<section class="{{#if showLines}}cart-detailed-left {{else}}cart-detailed-empty{{/if}}">
			{{#unless showLines}}
				<div data-view="Quick.Order.EmptyCart">
					<p class="cart-detailed-body-info">
						{{translate 'Continue Shopping on our <a href="/" data-touchpoint="home">Home Page</a>.' }}
					</p>
				</div>
			{{/unless}}

			{{!<div data-view="Quick.Order"></div>}}

			{{#if showLines}}
			<div class="cart-detailed-proceed-to-checkout-container">
				<a class="cart-detailed-proceed-to-checkout" data-action="sticky" href="#" data-touchpoint="checkout" data-hashtag="#">
					{{translate 'Proceed to Checkout'}}
				</a>
			</div>
			<div data-confirm-message class="cart-detailed-confirm-message"></div>
			<div data-view="Promocode.Notifications"></div>

			<table class="cart-detailed-item-view-cell-actionable-table cart-detailed-table-row-with-border">
				<tbody data-view="Item.ListNavigable">
				</tbody>
			</table>
			{{/if}}
		</section>

		{{#if showLines}}
		<section class="cart-detailed-right">
			<div data-view="Cart.Summary"></div>
		</section>
		{{/if}}
	</div>
	<div class="cart-detailed-footer">
		{{#if showLines}}
			<div data-view="SavedForLater" class="cart-detailed-savedforlater"></div>

			<div data-view="RecentlyViewed.Items" class="cart-detailed-recently-viewed"></div>
			<div data-view="Related.Items" class="cart-detailed-related"></div>
			<div data-view="Correlated.Items" class="cart-detailed-correlated"></div>
		{{else}}
			<div data-view="SavedForLater" class="cart-detailed-savedforlater"></div>
		{{/if}}
	</div>
</div>




{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.addresses (Array)
	model.addresses.0 (Object)
	model.addresses.0.zip (String)
	model.addresses.0.country (String)
	model.addresses.0.company (undefined)
	model.addresses.0.internalid (String)
	model.shipmethods (Array)
	model.lines (Array)
	model.lines.0 (Object)
	model.lines.0.item (Object)
	model.lines.0.item.internalid (Number)
	model.lines.0.item.type (String)
	model.lines.0.quantity (Number)
	model.lines.0.internalid (String)
	model.lines.0.options (Array)
	model.lines.0.location (String)
	model.lines.0.fulfillmentChoice (String)
	model.paymentmethods (Array)
	model.internalid (String)
	model.confirmation (Object)
	model.confirmation.addresses (Array)
	model.confirmation.shipmethods (Array)
	model.confirmation.lines (Array)
	model.confirmation.paymentmethods (Array)
	model.multishipmethods (Array)
	model.lines_sort (Array)
	model.lines_sort.0 (String)
	model.latest_addition (undefined)
	model.promocodes (Array)
	model.ismultishipto (Boolean)
	model.shipmethod (undefined)
	model.billaddress (undefined)
	model.shipaddress (String)
	model.isPaypalComplete (Boolean)
	model.touchpoints (Object)
	model.touchpoints.logout (String)
	model.touchpoints.customercenter (String)
	model.touchpoints.serversync (String)
	model.touchpoints.viewcart (String)
	model.touchpoints.login (String)
	model.touchpoints.welcome (String)
	model.touchpoints.checkout (String)
	model.touchpoints.continueshopping (String)
	model.touchpoints.home (String)
	model.touchpoints.register (String)
	model.touchpoints.storelocator (String)
	model.agreetermcondition (Boolean)
	model.summary (Object)
	model.summary.discounttotal_formatted (String)
	model.summary.taxonshipping_formatted (String)
	model.summary.taxondiscount_formatted (String)
	model.summary.itemcount (Number)
	model.summary.taxonhandling_formatted (String)
	model.summary.total (Number)
	model.summary.tax2total (Number)
	model.summary.discountedsubtotal (Number)
	model.summary.taxtotal (Number)
	model.summary.discounttotal (Number)
	model.summary.discountedsubtotal_formatted (String)
	model.summary.taxondiscount (Number)
	model.summary.handlingcost_formatted (String)
	model.summary.taxonshipping (Number)
	model.summary.taxtotal_formatted (String)
	model.summary.totalcombinedtaxes_formatted (String)
	model.summary.handlingcost (Number)
	model.summary.totalcombinedtaxes (Number)
	model.summary.giftcertapplied_formatted (String)
	model.summary.shippingcost_formatted (String)
	model.summary.discountrate (String)
	model.summary.taxonhandling (Number)
	model.summary.tax2total_formatted (String)
	model.summary.discountrate_formatted (String)
	model.summary.estimatedshipping (Number)
	model.summary.subtotal (Number)
	model.summary.shippingcost (Number)
	model.summary.estimatedshipping_formatted (String)
	model.summary.total_formatted (String)
	model.summary.giftcertapplied (Number)
	model.summary.subtotal_formatted (String)
	model.options (Object)
	showLines (Boolean)
	lines (Array)
	productsAndItemsCount (String)
	productCount (Number)
	itemCount (Number)
	pageHeader (String)

----}}

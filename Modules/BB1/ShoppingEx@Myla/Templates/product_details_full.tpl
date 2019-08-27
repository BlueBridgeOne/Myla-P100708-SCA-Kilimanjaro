{{! © 2017 NetSuite Inc. User may not copy, modify, distribute, or re-bundle or otherwise make available this code; provided, however, if you are an authorized user with a NetSuite account or log-in, you may use this code subject to the terms that govern your access and use. }}


<div class="product-details-full">
	<header class="product-details-full-header prod-banner">
		
	</header>
	<article class="product-details-full-content" itemscope itemtype="https://schema.org/Product">
		<meta itemprop="url" content="{{itemUrl}}">
		<div id="banner-details-top" class="product-details-full-banner-top-details"></div>
		<section class="product-details-full-main-content">

			<div class="product-details-full-main-content-left">
				<!--<div class="product-details-full-image-box"><img src="{{urlpdp}}"></div>-->
				<div id="prod-detail-images" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						{{#if urlimg1}}
						<div class="product-details-full-image-box carousel-item active"><img id="pdpimage1" src="{{urlimg1}}"></div>
						{{/if}}
						{{#if urlimg2}}
						<div class="product-details-full-image-box carousel-item"><img id="pdpimage2" src="{{urlimg2}}"></div>
						{{/if}}
						{{#if urlimg3}}
						<div class="product-details-full-image-box carousel-item"><img id="pdpimage3" src="{{urlimg3}}"></div>
						{{/if}}
						{{#if urlimg4}}
						<div class="product-details-full-image-box carousel-item"><img id="pdpimage4" src="{{urlimg4}}"></div>
						{{/if}}
						{{#if urlimg5}}
						<div class="product-details-full-image-box carousel-item"><img id="pdpimage5" src="{{urlimg5}}"></div>
						{{/if}}
					</div>
					<div class="carousel-controls clearfix">
						<a href="#" class="carousel-prev"><span class="img-circle"><</span></a>
						<a href="#" class="carousel-next"><span class="img-circle">></span></a>
					</div>
				</div>
				<!--
				<div class="product-details-full-image-box"><img src="https://www.myla.com/core/media/media.nl?id=61565&c=4941336&h=23ad00fd667bd6dc80f6"></div>
				<div class="product-details-full-image-box"><img src="https://www.myla.com/images/items/1159_black-plp1pdp1soc1.jpg"></div>
				<div class="product-details-full-image-box"><img src="https://www.myla.com/core/media/media.nl?id=61566&c=4941336&h=43e48802c6295db645fd"></div>
				<div class="product-details-full-image-box"><img src="https://www.myla.com/core/media/media.nl?id=61563&c=4941336&h=9d60b88af9aa99252598"></div>
				<div class="product-details-full-image-box"><img src="https://www.myla.com/core/media/media.nl?id=61564&c=4941336&h=d7fb08d46e8d7eac8ff5"></div>
				-->
			
			</div>

			<div class="product-details-full-main-content-right">
				<div class="product-detail-breadcrumbs"><a href="/">Shop All</a> | <a href="{{cat1_url}}">{{cat1_name}}</a> | <span class="product-detail-crumb-title">{{pageHeader}}</span></div>
				<div class="product-details-full-title-box">
					<h3 class="product-details-full-content-header-title" itemprop="name">{{pageHeader}}</h3>
					<div class="title-price" data-view="Product.Price"></div>
				</div>
				<div class="product-details-full-main">
					{{#if isItemProperlyConfigured}}
					<form id="product-details-full-form" data-action="submit-form" method="POST">
						<section class="product-details-full-info">
							<div id="banner-summary-bottom" class="product-details-full-banner-summary-bottom"></div>
						</section>
						<div data-view="Quantity.Pricing"></div>
						{{#if model.item.storedetaileddescription}}
						<p class="product-delivery-note">{{{model.item.storedetaileddescription}}}</p>
						{{/if}}
						<div id="colours-box"><div class="guide">{{#if sizeguide}}<a class="product-views-size-anchor" data-action="show-sizeguide">{{translate 'Size Guide'}}</a>{{/if}}</div></div>
						<div id="size-box"><div class="qty" data-view="Quantity"></div></div>
						<section data-view="Product.Options" class="product-details-position-full do-not-print"></section>
						
						<br />
						{{#if isPriceEnabled}}
						<ul class="inline-list do-not-print">
							<li>
								<div data-view="MainActionView"></div>
							</li>
							<li>
								<div data-view="AddToProductList" class="product-details-full-actions-addtowishlist"></div>
							</li>
						</ul>
						{{/if}}
						
						<!--<div class="fabric-comp">Fabric Composition: {{fabricComp}}</div>-->
						<div data-view="Product.Stock.Info"></div>
						<p class="product-delivery-note">{{translate deliveryTitle}}
							<br /> {{translate deliveryMessage}}</p>
						<p><a href="/delivery">RETURNS INFORMATION</a></p>
						
						<div data-view="StockDescription"></div>
						<div data-view="SocialSharing.Flyout" class="product-details-full-social-sharing"></div>
						<div class="product-details-full-main-bottom-banner">
							<div id="banner-summary-bottom" class="product-details-full-banner-summary-bottom"></div>
						</div>
						<div data-view="Product.Sku"></div>
						<!--
						<div><a href="#">View {{parentName}} Range</a></div>-->
						<div><a href="{{range_url}}">View All {{range_name}}</a></div>
						
					</form>
					{{else}}
					<div data-view="GlobalViewsMessageView.WronglyConfigureItem"></div>
					{{/if}}
				</div>
			</div>
		</section>

		<div class="product-details-full-content-related-items prod-rel">
			<div data-view="Related.Items"></div>
		</div>
		<div class="product-details-full-content-correlated-items">
			<div data-view="Correlated.Items"></div>
		</div>
		<div class="product-details-below-cms" data-cms-area-filters="global" data-cms-area="PROD_BELOWDETAILS" ></div>
	</article>
</div>
{{!---- Use the following context variables when customizing this template: model (Object) model.item (Object) model.item.internalid (Number) model.item.type (String) model.quantity (Number) model.options (Array) model.options.0 (Object) model.options.0.cartOptionId (String) model.options.0.itemOptionId (String) model.options.0.label (String) model.options.0.type (String) model.location (String) model.fulfillmentChoice (String) pageHeader (String) itemUrl (String) isItemProperlyConfigured (Boolean) isPriceEnabled (Boolean) ----}}
<script>
	$( document ).ready(function() {
		$("#custcol_bb1_matrix_item_colour-container").prependTo("#colours-box");
		$("#custcol_bb1_matrix_item_size-container").prependTo("#size-box");

		if ($(window).width() < 960) {
			var image_arr = new Array();

			$(".carousel-next").click(function() {
				if($(".carousel-inner .active").next().is('.carousel-item')) {
					$('.carousel-inner .active')
					.removeClass('active')
					.hide()
					.next()
					.addClass('active')
					.show();
				} 
				if($(".carousel-inner .active").next().is('.carousel-item')) {
					$(".carousel-prev").show();
				} else {
					$(".carousel-prev").show();
					$(".carousel-next").hide();
				}
				return false;
			});

			$(".carousel-prev").click(function() {
				if($(".carousel-inner .active").prev().is('.carousel-item')) {
					$('.carousel-inner .active')
					.removeClass('active')
					.hide()
					.prev()
					.addClass('active')
					.show();
					$(".carousel-next").show();
				} 
				if($(".carousel-inner .active").prev().is('.carousel-item')) {
					$(".carousel-next").show();
				} else {
					$(".carousel-next").show();
					$(".carousel-prev").hide();
				}
				return false;
			});

			/*
			$( ".carousel-item" ).each(function( index ) {
  					console.log( index + ": " + $( this ).html() );
					image_arr.push($( this ).html());
			});
			var img_count = image_arr.length;
			$(".carousel-inner").html(image_arr[0]);

			var tid = setTimeout(prod_slider, 2000);
			var img_shown = 0;
			function prod_slider() {
				if (img_shown < img_count) {
					img_shown++;
				} else {
					img_shown = 0;
				}
				$(".carousel-inner").html(image_arr[img_shown]);
				
				id = setTimeout(prod_slider, 2000); // repeat myself
			}
			*/
		}

		/*

		// Fixed Product info
		var info_box = $(".product-details-full-main-content-right");
		var related_items = $(".item-relations-related");
		var info_offset = info_box.offset();
		var related_offset = related_items.offset();
		//console.log("Info Offset: " + info_offset.left + " | Related Offset: " + related_offset.top + " | Right Off Bot: " + info_box.height());
		info_box.css("position", "fixed");
		info_box.css("left", info_offset.left);

		$(window).scroll(function(e){ 
			var wrap = $(".product-details-full-main-content-left");
			if ($(this).scrollTop() >= related_offset.top - info_box.height() - 100) {
				//console.log("reaxched");
				info_box.css("position", "absolute");
				info_box.css("left", info_offset.left);
				info_box.css("top", related_offset.top - info_box.height() - 30);
			} else {
				info_box.css("position", "fixed");
				info_box.css("left", info_offset.left);
				info_box.css("top", info_offset.top);
			}
		
		});

		*/

	});
</script>
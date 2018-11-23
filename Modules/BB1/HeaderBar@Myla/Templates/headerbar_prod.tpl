<div class="header-banner BANNER_HOLDER {{className}}" data-parallax="prodbanner" data-height="70" >
		{{#if image}}
<div class="bgimage-anc-child-{{image.anc}} bgimage-anc-child" style="background-image:url('{{image.url}}');" />
	{{else}}
	<div class="BANNER_IMAGE" data-cms-area="{{page}}BANNER_IMAGE" data-cms-area-filters="page_type">
		<div class="BANNER_IMAGE_HOLDER CELL_PLACEHOLDER"><span class="PH_TEXT">Product Image Placeholder</span></div>
	</div>
	{{/if}}
	<div class="BANNER-ALIGN show-product-details-header">
		<div class="BANNER_TEXT BANNER_PROD {{className}}">
			<div data-view="ProductDetails"></div>
		</div>
	</div>
</div>
<div data-view="SubProductDetails" class="show-product-details-subheader"></div>
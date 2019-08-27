<div id="banner-spacer">
<div class="header-banner BANNER_HOLDER {{className}}" data-parallax="prodbanner" data-height="70" >
	<div class="BANNER-ALIGN show-product-details-header">
		<div class="BANNER_TEXT BANNER_PROD {{className}}">
			<div data-view="ProductDetails"></div>
		</div>
	</div>
</div>
<div data-view="SubProductDetails" class="show-product-details-subheader"></div>
</div>
<script>
	$( document ).ready(function() {
	if ($(window).width() < 465) {
        $('*[data-view="ContentGroups"]').css("margin-top", "436px");
        $(".product-details-full-content").css("margin-top", "300px");
    }
    });
</script>
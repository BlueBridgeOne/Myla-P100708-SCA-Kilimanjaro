{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}


{{#if showFacet}}
<div class="facets-faceted-navigation-item-category">


		<div class="facets-faceted-navigation-item-category-facet-group-wrapper hide-scrollbars">
				<ul class="facets-faceted-navigation-item-category-facet-optionlist">
					{{#unless isRange}}
					<li>
							<a class="facets-faceted-navigation-item-category-facet-option {{#if isActive}}option-active{{/if}}" href="{{parentUrl}}">
								{{translate 'Shop All'}}
							</a>
						</li>
						{{/unless}}
					{{#each displayValues}}
						<li>
							<a class="facets-faceted-navigation-item-category-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
								{{displayName}}
							</a>
						</li>
						{{/each}}
						{{#each extraValues}}
							<li>
								<a class="facets-faceted-navigation-item-category-facet-option {{#if isActive}}option-active{{/if}}" href="{{link}}" title="{{label}}">
									{{displayName}}
								</a>
							</li>
						{{/each}}
				</ul>
		</div>

		<div class="facets-faceted-navigation-item-category-facet-group-expander">
			<a href="{{parentUrl}}">{{parentName}}</a>
		</div>
</div>
<script>
$( document ).ready(function() {
    function get_nav_pos(){
		if ( $('.facets-faceted-navigation-item-category').length ) {
			var nav_pos = $('.facets-faceted-navigation-item-category').offset().top - $(window).scrollTop();
			var body_pos = $('body').offset().top - $(window).scrollTop();

			console.log("Body Pos: " + body_pos);

			var $bb = $('.BANNER_HOLDER');
			var bottom_banner = $bb.offset().top + $bb.outerHeight(true);
			console.log("Bottom of banner: " + bottom_banner);

			var nav_height = $(".header-foreground").outerHeight();
			console.log("Nav Height: " + nav_height);

			var filter_height = $("#sticky-nav").outerHeight();

			var sticky_height = bottom_banner - nav_height;
			console.log("Sticky Height: " + sticky_height);

			var facet_margin = $(".facets-facet-browse-results").css("margin-top");
			console.log("Facet Margin: " + facet_margin);
			//313
			if ((body_pos < -sticky_height) && ($(window).width() > 768)) {
				$(".facets-facet-browse-results").css("margin-top", filter_height + "px");

				$("#sticky-nav").css("position", "fixed");
				$("#sticky-nav").css("top", "110px");
				$("#sticky-nav").css("z-index", 9);
				$("#sticky-nav").css("width", "1400px");

				$(".facets-facet-browse-facets-filter").css("position", "fixed");
				$(".facets-facet-browse-facets-filter").css("top", "180px");
				$(".facets-facet-browse-facets-filter").css("left", "1437px");

				$(".facets-facet-browse-facets").css("position", "fixed");
				$(".facets-facet-browse-facets").css("top", "180px");
				$(".facets-facet-browse-facets").css("width", "1400px");
				$(".facets-facet-browse-facets").css("z-index", "999");
			} else {
				$(".facets-facet-browse-results").css("margin-top", "0px");

				$("#sticky-nav").css("position", "relative");
				$("#sticky-nav").css("top", "auto");
				$("#sticky-nav").css("z-index", 9);
				$("#sticky-nav").css("width", "1400px");

				$(".facets-facet-browse-facets-filter").css("position", "relative");
				$(".facets-facet-browse-facets-filter").css("top", "auto");
				$(".facets-facet-browse-facets-filter").css("left", "auto");

				$(".facets-facet-browse-facets").css("position", "relative");
				$(".facets-facet-browse-facets").css("top", "auto");
				$(".facets-facet-browse-facets").css("width", "auto");
				$(".facets-facet-browse-facets").css("z-index", "999");
			}
		}
	}

	get_nav_pos();
	$(window).scroll(get_nav_pos);
});
</script>
{{/if}}



{{!----
Use the following context variables when customizing this template:

	htmlId (String)
	facetId (String)
	showFacet (Boolean)
	values (Array)
	displayValues (Array)
	extraValues (Array)
	showExtraValues (Boolean)
	isUncollapsible (Boolean)
	isCollapsed (Boolean)
	parentName (String)

----}}

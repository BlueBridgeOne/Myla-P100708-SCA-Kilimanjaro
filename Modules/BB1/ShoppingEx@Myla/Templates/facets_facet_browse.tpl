{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}
<div data-view="HeaderBarHome"></div>
<section class="facets-facet-browse">



	{{#if showResults}}
		<div class="facets-facet-browse-content">

			<div data-id="product-search-facets" id="sticky-nav">

				{{#if isCategory}}
					<div data-view="Facets.CategorySidebar" class="facets-facet-browse-facets-sidebar"></div>
				{{/if}}
			</div>

			<div class="facets-facet-browse-facets-filter">
				<a class="facets-facet-browse-facets-filter-anchor" data-action="show-filters">
{{translate 'Filters'}}


<svg class="facets-facet-browse-facets-filter-icon" viewBox="0 0 11 6" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <g id="MYLA" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="Tablet-Portrait-/-PLP-1" transform="translate(-728.000000, -871.000000)" fill="#000000" fill-rule="nonzero">
            <g id="SUB_NAV-(appears-on-scroll-down,-under-the-main-nav)" transform="translate(0.000000, 850.000000)">
                <path d="M734.826395,24.4428791 L730.674742,20.1290197 C730.518931,19.9720464 730.518931,19.7179821 730.674742,19.559846 C730.830552,19.4028727 731.082291,19.4028727 731.238102,19.559846 L735.790328,24.1574202 C735.946139,24.3149749 735.946139,24.5696205 735.790328,24.7265938 L731.238102,29.3241679 C731.082291,29.4817227 730.830552,29.4811413 730.674742,29.3241679 C730.518931,29.167776 730.518931,28.9131304 730.674742,28.7549943 L734.826395,24.4428791 Z" id="Shape" transform="translate(733.232535, 24.442116) rotate(90.000000) translate(-733.232535, -24.442116) "></path>
            </g>
        </g>
    </g>
</svg>
</a>
</div>
<div class="facets-category-spacer"></div>
<div class="facets-facet-browse-facets">
				<div data-view="Facets.FacetedNavigation" data-exclude-facets="commercecategoryname,category"></div>
			</div>



			<div class="facets-facet-browse-results" itemscope="" itemtype="https://schema.org/ItemList">


			<meta itemprop="name" content="{{title}}"/>



				{{#if showItems}}
					<div class="facets-facet-browse-narrowedby" data-view="Facets.FacetsDisplay">
					</div>

					{{#if isEmptyList}}
					<div class="container-padded">
						<div data-view="Facets.Items.Empty">
						</div>
					</div>
					{{else}}
					<div data-view="ContentGroups" />
					{{/if}}
				{{/if}}
			</div>
		</div>

			<div class="facets-facet-browse-pagination" data-view="GlobalViews.Pagination">
			</div>

	{{else}}
	<div class="container-padded">
		<div class="facets-facet-browse-empty-items" data-view="Facets.Items.Empty">
		</div>
	</div>
	{{/if}}
<div data-view="FooterCategories" />
</section>



{{!----
Use the following context variables when customizing this template:

	total (Number)
	isTotalProductsOne (Boolean)
	title (String)
	hasItemsAndFacets (Boolean)
	collapseHeader (Boolean)
	keywords (undefined)
	showResults (Boolean)
	isEmptyList (Boolean)
	isCategory (Boolean)
	showItems (Number)

----}}

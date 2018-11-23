{{! BB1 G Truslove Apr 2018 - This is all the content group layouts. Some are irregular. Some are grid based. }}
<div class="content-single" data-cms-area-filters="page_type" data-cms-area="{{../page}}SINGLE_TOP"></div>
{{#if debug}}
<h2>Content Groups</h2>
{{/if}} {{#each groups}} {{#if ../debug}}
<h5>{{groupTemplate}}</h5>
{{/if}} {{#ifEquals groupTemplate "COLLECTION CELL GROUP x3 LEFT"}}
<!--"COLLECTION CELL GROUP x3 LEFT"-->
<div class="contentgroup{{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_10_17">
		<div class="COLLECTION_CELL_GROUP_X3_TOPTEXT parallax-front" data-parallax="-5" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 1</span>
			</div>
		</div>
		{{#if imageA}}
		<div class="COLLECTION_CELL_GROUP_X3_TOPLEFT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_TOPLEFT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMTEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2">
			<div class="CELL_HOLDER_RATIO_4_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 2</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMRIGHT parallax-back">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMRIGHT parallax-back" data-parallax="-1" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}} {{#if imageC}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMLEFT">
			<img class="w-100" src="{{resizeImage imageC.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMLEFT" data-parallax="3" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT3">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 3</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "COLLECTION CELL GROUP x3 RIGHT"}}
<!--"COLLECTION CELL GROUP x3 RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_10_17">
		<div class=" COLLECTION_CELL_GROUP_X3_TOPTEXT_RIGHT parallax-front" data-parallax="-5" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 1</span>
			</div>
		</div>
		{{#if imageA}}
		<div class="COLLECTION_CELL_GROUP_X3_TOPLEFT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_TOPLEFT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMTEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2">
			<div class="CELL_HOLDER_RATIO_4_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 2</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMRIGHT_RIGHT parallax-back">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMRIGHT_RIGHT parallax-back" data-parallax="-1" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}} {{#if imageC}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMLEFT_RIGHT">
			<img class="w-100" src="{{resizeImage imageC.url 'main'}}" />
		</div>
		{{else}}
		<div class="COLLECTION_CELL_GROUP_X3_BOTTOMLEFT_RIGHT" data-parallax="3" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT3">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 3</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & CONTENT CELL x3 LEFT"}}
<!--"PRODUCT & CONTENT CELL x3 LEFT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_6_3 CELL_COL">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL">
		{{#if itemB}}
		<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 2</span>
		</div>
		{{/if}}
	</div>
	{{#if imageA}}
	<div class="COL_12_6 CELL_COL">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="COL_12_6 CELL_COL" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_3_2 CELL_PLACEHOLDER">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & CONTENT CELL x3 RIGHT"}}
<!--"PRODUCT & CONTENT CELL x3 RIGHT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	
	<div class="COL_6_3 CELL_COL pull-right">
		{{#if itemB}}
		<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 2</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL pull-right">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	{{#if imageA}}
	<div class="COL_12_6 CELL_COL pull-left">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="COL_12_6 CELL_COL pull-left" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_3_2 CELL_PLACEHOLDER">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
</div>
{{/ifEquals}}{{#ifEquals groupTemplate "PRODUCT & PROMO CELL x3 LEFT"}}
<!--"PRODUCT & PROMO CELL x3 LEFT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_6_3 CELL_COL">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL">
		{{#if itemB}}
		<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 2</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_12_6 CELL_COL">
		{{#if imageA}}
		<div class="PRODUCT_PROMO_X3_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_PROMO_X3_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_PROMO_HOLDER_RATIO_3_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & PROMO CELL x3 RIGHT"}}
<!--"PRODUCT & PROMO CELL x3 RIGHT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	
	<div class="COL_6_3 CELL_COL pull-right">
		{{#if itemB}}
		<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 2</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL pull-right">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_12_6 CELL_COL pull-left">
		{{#if imageA}}
		<div class="PRODUCT_PROMO_X3_LEFT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_PROMO_X3_LEFT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_PROMO_HOLDER_RATIO_3_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & CONTENT CELL x5 LEFT"}}
<!--"PRODUCT & CONTENT CELL x5 LEFT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemA}}
				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 1</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
	{{#if imageA}}
	<div class="COL_12_6 CELL_COL">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="COL_12_6 CELL_COL" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_2_2 CELL_PLACEHOLDER">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & CONTENT CELL x5 RIGHT"}}
<!--"PRODUCT & CONTENT CELL x5 RIGHT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	{{#if imageA}}
	<div class="COL_12_6 CELL_COL">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="COL_12_6 CELL_COL" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_2_2 CELL_PLACEHOLDER">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemA}}
				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 1</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & PROMO CELL x5 LEFT"}}
<!--"PRODUCT & PROMO CELL x5 LEFT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemA}}
				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 1</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
	<div class="COL_12_6 CELL_COL">
		{{#if imageA}}
		<div class="PRODUCT_PROMO_X5_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_PROMO_X5_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_PROMO_HOLDER_RATIO_2_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT & PROMO CELL x5 RIGHT"}}
<!--"PRODUCT & PROMO CELL x5 RIGHT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_12_6 CELL_COL">
		{{#if imageA}}
		<div class="PRODUCT_PROMO_X5_LEFT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_PROMO_X5_LEFT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_PROMO_HOLDER_RATIO_2_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemA}}
				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 1</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x5 LEFT"}}
<!--"PRODUCT CELL x5 LEFT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemA}}
				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 1</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
	<div class="COL_12_6 CELL_COL CELL_BIGITEM">
		{{#if itemE}}
		<span data-view="Item{{itemE}}" data-item_index="{{itemE}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_2_2 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 5</span>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x5 RIGHT"}}
<!--"PRODUCT CELL x5 RIGHT"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_12_6 CELL_COL CELL_BIGITEM">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_2_2 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_12_6">
		<div class="row">
			<div class="COL_6 CELL_COL">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 2</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemC}}
				<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 3</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemD}}
				<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 4</span>
				</div>
				{{/if}}
			</div>
			<div class="COL_6 CELL_COL">
				{{#if itemE}}
				<span data-view="Item{{itemE}}" data-item_index="{{itemE}}"></span>
				{{else}}
				<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
					<span class="PH_TEXT">Item Placeholder 5</span>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x2 LARGE LEFT"}}
<!--"PRODUCT CELL x2 LARGE LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_4_3">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		<div class="PRODUCT_CELL_X2_LARGE_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_LARGE_SMALLRIGHT parallax-back">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_SMALLRIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x2 LARGE RIGHT"}}
<!--"PRODUCT CELL x2 LARGE RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_4_3">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back" data-parallax="-1" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		<div class="PRODUCT_CELL_X2_LARGE_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_LARGE_SMALLRIGHT_RIGHT">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_SMALLRIGHT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x2 SMALL LEFT"}}
<!--"PRODUCT CELL x2 SMALL LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_3_4">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}}
		<div class="PRODUCT_CELL_X2_SMALL_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder</span>
			</div>
		</div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL x2 SMALL RIGHT"}}
<!--"PRODUCT CELL x2 SMALL RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_3_4">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 1</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_RIGHT">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder 2</span>
			</div>
		</div>
		{{/if}}
		<div class="PRODUCT_CELL_X2_SMALL_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_10_1 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder</span>
			</div>
		</div>
	</div>
</div>
{{/ifEquals}}{{#ifEquals groupTemplate "PRODUCT CELL x4"}}
<!--"PRODUCT CELL x4"-->
<div class="CELL_ROW {{#if ../debug}}debug{{/if}}">
	<div class="COL_6_3 CELL_COL">
		{{#if itemA}}
		<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 1</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL">
		{{#if itemB}}
		<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 2</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL">
		{{#if itemC}}
		<span data-view="Item{{itemC}}" data-item_index="{{itemC}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 3</span>
		</div>
		{{/if}}
	</div>
	<div class="COL_6_3 CELL_COL">
		{{#if itemD}}
		<span data-view="Item{{itemD}}" data-item_index="{{itemD}}"></span>
		{{else}}
		<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
			<span class="PH_TEXT">Item Placeholder 4</span>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PROMO CELL GROUP x2 LEFT"}}
<!--"PROMO CELL GROUP x2 RIGHT"-->
<div class="contentgroup">
	<div class="GROUP_RATIO_8_5">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">

			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_RIGHT parallax-back" adata-parallax="-5">
			{{#if itemA}}
			<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
			{{else}}
			<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
				<span class="PH_TEXT">Item Placeholder</span>
			</div>
			{{/if}}
		</div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PROMO CELL GROUP x2 RIGHT"}}
<!--"PROMO CELL GROUP x2 RIGHT"-->
<div class="contentgroup">
	<div class="GROUP_RATIO_8_5">
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT">
			{{#if itemA}}
			<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
			{{else}}
			<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
				<span class="PH_TEXT">Item Placeholder</span>
			</div>
			{{/if}}
		</div>
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_ROUNDED" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL GROUP x2 LEFT"}}
<!--"PRODUCT CELL GROUP x2 RIGHT"-->
<div class="contentgroup">
	<div class="GROUP_RATIO_8_5">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">

			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_RIGHT_ROUNDED">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_RIGHT_ROUNDED parallax-back" adata-parallax="-5" data-cms-area-filters="page_type"
		 data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PRODUCT CELL GROUP x2 RIGHT"}}
<!--"PRODUCT CELL GROUP x2 RIGHT"-->
<div class="contentgroup">
	<div class="GROUP_RATIO_8_5">
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_ROUNDED">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_SMALLLEFT_ROUNDED" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_SMALL_LARGERIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PROMO CELL GROUP x3 LEFT"}}
<!--"PROMO CELL GROUP x3 LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_3_5">
		<div class=" PROMO_CELL_X3_LARGE_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1"></div>
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back content-rounded-none">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back content-rounded-none" data-parallax="-1"
		 data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="PROMO_CELL_X3_SMALL_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2"></div>
		<div class="ROW_RESPONSIVE">
			<div class="PROMO_CELL_GROUP_X2_SMALL parallax-back" data-parallax="-5">
				{{#if itemA}}

				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM1">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 1</span>
					</div>
				</div>
				{{/if}}
			</div>
			<div class="PROMO_CELL_GROUP_X2_RIGHT parallax-back" data-parallax="-3">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM2">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 2</span>
					</div>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "PROMO CELL GROUP x3 RIGHT"}}
<!--"PROMO CELL GROUP x3 RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_3_5">
		<div class="PROMO_CELL_X3_LARGE_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1"></div>
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back content-rounded-none">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back content-rounded-none" data-parallax="-1"
		 data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="PROMO_CELL_X3_SMALL_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2"></div>
		<div class="ROW_RESPONSIVE">
			<div class="PROMO_CELL_GROUP_X2_SMALL_RIGHT parallax-back" data-parallax="-5">
				{{#if itemA}}

				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM1">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 1</span>
					</div>
				</div>
				{{/if}}
			</div>
			<div class="PROMO_CELL_GROUP_X2_LEFT parallax-back" data-parallax="-3">
				{{#if itemB}}

				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM2">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 2</span>
					</div>
				</div>
				{{/if}}
			</div>
		</div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "HOME GROUP x3 LEFT"}}
<!--"HOME GROUP x3 LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME">
		<div class="HOME_X3_LARGE_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1"></div>
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back content-rounded-none">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT parallax-back content-rounded-none" data-parallax="-1"
		 data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_SMALL_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2"></div>
		<div class="ROW_RESPONSIVE">
			<div class="HOME_GROUP_X2_SMALL parallax-back" data-parallax="-5">
				{{#if itemA}}

				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM1">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 1</span>
					</div>
				</div>
				{{/if}}
			</div>
			<div class="HOME_GROUP_X2_RIGHT parallax-back" data-parallax="-3">
				{{#if itemB}}
				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM2">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 2</span>
					</div>
				</div>
				{{/if}}
			</div>
		</div>
		<div class="HOME_X3_LARGE_TEXT_MID" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT3"></div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "HOME GROUP x3 RIGHT"}}
<!--"HOME GROUP x3 RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME">
		<div class="HOME_X3_LARGE_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1"></div>
		{{#if imageA}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back content-rounded-none">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="PRODUCT_CELL_X2_LARGE_LARGELEFT_RIGHT parallax-back content-rounded-none" data-parallax="-1"
		 data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_SMALL_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2"></div>
		<div class="ROW_RESPONSIVE">
			<div class="HOME_GROUP_X2_SMALL_RIGHT parallax-back" data-parallax="-5">
				{{#if itemA}}

				<span data-view="Item{{itemA}}" data-item_index="{{itemA}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM1">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 1</span>
					</div>
				</div>
				{{/if}}
			</div>
			<div class="HOME_GROUP_X2_LEFT parallax-back" data-parallax="-3">
				{{#if itemB}}

				<span data-view="Item{{itemB}}" data-item_index="{{itemB}}"></span>
				{{else}}
				<div class="content-rounded" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_ITEM2">
					<div class="CELL_HOLDER_RATIO_3_4 ITEM_PLACEHOLDER">
						<span class="PH_TEXT">Item Placeholder 2</span>
					</div>
				</div>
				{{/if}}
			</div>
		</div>
		<div class="HOME_X3_LARGE_TEXT_MID_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT3"></div>
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "CONTENT CELL 4 : 3"}}
<!--"PROMO CONTENT CELL 4 : 3"-->
<div class="GROUP_FULL_RATIO_4_3 {{#if ../debug}}debug{{/if}}">
	{{#if imageA}}
	<div class="CELL_PLACEHOLDER">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="CELL_PLACEHOLDER" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_4_3">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "CONTENT CELL LANDSCAPE"}}
<!--"PROMO CONTENT CELL LANDSCAPE"-->
<div class="contentgroup variable-gutter-margin-top {{#if ../debug}}debug{{/if}}">
	{{#if imageA}}
	<div class="CELL_PLACEHOLDER">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="CELL_PLACEHOLDER" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_16_9">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
</div>


{{/ifEquals}} {{#ifEquals groupTemplate "HOME x3 LEFT"}}
<!--"HOME x3 LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME_X3">

		{{#if imageA}}
		<div class="HOME_X3_1">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_1" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_1_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_4_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 1</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="HOME_X3_2">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_2" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_2_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2">
			<div class="CELL_HOLDER_RATIO_4_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 2</span>
			</div>
		</div>
		{{#if imageC}}
		<div class="HOME_X3_3">
			<img class="w-100" src="{{resizeImage imageD.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_3" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT3">
			<div class="CELL_HOLDER_RATIO_3_3 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}

	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "HOME x3 RIGHT"}}
<!--"HOME x3 RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME_X3">

		{{#if imageA}}
		<div class="HOME_X3_1_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_1_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_1_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1">
			<div class="CELL_HOLDER_RATIO_4_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 1</span>
			</div>
		</div>
		{{#if imageB}}
		<div class="HOME_X3_2_RIGHT">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_2_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		<div class="HOME_X3_2_TEXT_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT2">
			<div class="CELL_HOLDER_RATIO_4_2 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Text Placeholder 2</span>
			</div>
		</div>
		{{#if imageC}}
		<div class="HOME_X3_3_RIGHT">
			<img class="w-100" src="{{resizeImage imageD.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X3_3_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT3">
			<div class="CELL_HOLDER_RATIO_3_3 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}


	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "HOME x2 LEFT"}}
<!--"HOME x2 LEFT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME_X2">

		{{#if imageA}}
		<div class="HOME_X2_1">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X2_1" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="HOME_X2_2">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X2_2" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "HOME x2 RIGHT"}}
<!--"HOME x2 RIGHT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">
	<div class="GROUP_RATIO_HOME_X2">

		{{#if imageA}}
		<div class="HOME_X2_1_RIGHT">
			<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X2_1_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
		{{#if imageB}}
		<div class="HOME_X2_2_RIGHT">
			<img class="w-100" src="{{resizeImage imageB.url 'main'}}" />
		</div>
		{{else}}
		<div class="HOME_X2_2_RIGHT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT2">
			<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
				<span class="PH_TEXT">Content Placeholder</span>
			</div>
		</div>
		{{/if}}
	</div>
</div>
{{/ifEquals}} {{#ifEquals groupTemplate "!--CONTENT TEXT"}}
<!--"CONTENT TEXT"-->
<div class="contentgroup {{#if ../debug}}debug{{/if}}">

	{{#if imageA}}
	<div class="CONTENT_TEXT_IMAGE">
		<img class="w-100" src="{{resizeImage imageA.url 'main'}}" />
	</div>
	{{else}}
	<div class="CONTENT_TEXT_IMAGE" data-parallax="-1" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_CONTENT1">
		<div class="CELL_HOLDER_RATIO_3_4 CELL_PLACEHOLDER">
			<span class="PH_TEXT">Content Placeholder</span>
		</div>
	</div>
	{{/if}}
	<div class="CONTENT_TEXT_TEXT" data-cms-area-filters="page_type" data-cms-area="{{../page}}GROUP_{{@index}}_TEXT1"></div>
</div>
{{/ifEquals}}
<div class="content-single" data-cms-area-filters="page_type" data-cms-area="{{../page}}SINGLE_{{@index}}"></div>
{{/each}}
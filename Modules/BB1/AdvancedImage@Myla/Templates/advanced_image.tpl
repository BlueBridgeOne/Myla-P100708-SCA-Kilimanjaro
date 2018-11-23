<div class="cms-content-bb1_cct_advanced_image">
	<div class="advanced-image-container">
		{{#if hasText}}
		<div class="text-container {{class}}">
			{{{richtext}}}
		</div>
		{{/if}}
		{{#if parallax}}
		<div class="bb1_cct_advanced_image-{{parallax}}" data-parallax="{{parallax}}" style="background-image:url('{{resizeImage image resize}}');'"></div>
		{{else}}
		{{#if isHeader}}
		<div class="bgimage-anc-child-{{align}} bgimage-anc-child" style="background-image:url('{{resizeImage image resize}}');"></div>
		{{else}}
		{{#if hasLink}}
		<a href="{{link}}">
			{{/if}}
			<img src="{{resizeImage image resize}}" alt="{{alt}}" />
			{{#if hasLink}}
		</a>
		{{/if}}
		{{/if}}
		{{/if}}
	</div>
</div>
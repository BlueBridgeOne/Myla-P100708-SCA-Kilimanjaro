{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-color" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		<!--
		{{#if showLabel}}
				<label for="{{cartOptionId}}">
					{{label}}
				</label>
		{{/if}}
	-->
		<div class="{{cartOptionId}}-controls product-views-option-color-container {{#if showSmall}}product-views-option-color-container-small{{/if}}" data-validation="control">
			{{#each values}}
				{{#if internalId}}
					<div class="product-views-option-color-picker">
						<label class="product-views-option-color-picker-label">
							<input
								class="product-views-option-color-picker-input"
								type="radio"
								name="{{../position}}{{../cartOptionId}}"
								id="{{../cartOptionId}}"
								data-action="changeOption"
								value="{{internalId}}"
								{{#if isActive}}checked{{/if}}
								data-toggle="set-option"
								data-active="{{isActive}}"
								data-available="{{isAvailable}}" />
							{{#if isColorTile}}
								<span data-label="label-{{../cartOptionId}}" value="{{internalId}}"
									class="product-views-option-color-picker-box {{#if isActive}}active{{/if}} {{#if isLightColor}}product-views-option-color-picker-box-white-border{{/if}}"
									style="background: {{color}}"></span>
									{{/if}}
							{{#if is2ColorTile}}
							<span data-label="label-{{../cartOptionId}}" value="{{internalId}}"
									class="product-views-option-color-picker-box multi {{#if isActive}}active{{/if}} {{#if isLightColor}}product-views-option-color-picker-box-white-border{{/if}}"
									style="border-right:20px solid {{color2}};border-bottom:20px solid {{color2}};border-left:20px solid {{color}};border-top:20px solid {{color}};"></span>
							{{else}}
								<img data-label="label-{{../cartOptionId}}" value="{{internalId}}"
									src="{{resizeImage image.src 'tinythumb'}}"
									style="height:{{image.height}};width:{{image.width}}"
									alt="{{label}}"
									class="product-views-option-color-picker-box-img">
							{{/if}}
						</label>
					</div>
				{{/if}}
			{{/each}}
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}

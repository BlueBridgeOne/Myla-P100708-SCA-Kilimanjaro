{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div id="{{cartOptionId}}-container" class="product-views-option-dropdown" data-type="option" data-cart-option-id="{{cartOptionId}}" data-item-option-id="{{itemOptionId}}">
	<div class="{{cartOptionId}}-controls-group" data-validation="control-group">
		<div class="{{cartOptionId}}-controls" data-validation="control">
			<select name="{{position}}{{cartOptionId}}" id="{{cartOptionId}}" class="product-views-option-dropdown-select" data-toggle="select-option">
				<option value="">{{translate title}}</option>
				{{#each values}}
					{{#if internalId}}
						<option class="select-matrix-option"
							value="{{internalId}}"
							{{#if isActive}}selected{{/if}}
							data-active="{{isActive}}"
							data-available="{{isAvailable}}">
								{{label}}
						</option>
					{{/if}}
				{{/each}}
			</select>
		</div>
	</div>
</div>

{{!----
The context variables for this template are not currently documented. Use the {{log this}} helper to view the context variables in the Console of your browser's developer tools.

----}}

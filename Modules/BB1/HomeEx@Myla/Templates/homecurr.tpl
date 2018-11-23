{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div>
	<div class="modal-header-logo" >Myla
		<div class="header-logo-sub">London</div>
	</div>
	<p class="modal-shipping-dest">{{translate 'What is your shipping destination?'}}</p>
	
	<select id="shipping-dest" class="modal-shipping-select input-large" data-action="change-region">
		{{#each sites}}
<option value="{{locale}}" {{#if selected}}selected{{/if}}>{{title}}</option>
{{/each}}
	</select>

	<br /><div class="text-center">
		<button class="button-primary button-large" data-dismiss="modal" data-action="change-site">{{translate 'Enter'}}</button>
	</div>
</div>
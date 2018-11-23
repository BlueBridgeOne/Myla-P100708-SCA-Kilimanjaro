{{!
	© 2016 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if isCountryAndStatePresent}}
	<label class="global-views-states-group-label is-required" for="{{manage}}state">
		{{translate 'County/State/Region'}}
	</label>
	<div  class="global-views-states-group-form-controls" data-validation="control">
		<select class="{{inputClass}} global-views-states-group-select" id="{{manage}}state" name="state" data-type="selectstate" data-action="selectstate" >
			<option value="">
				{{translate '-- Select --'}}
			</option>
			{{#each states}}
				<option value="{{code}}" {{#if isSelected}} selected {{/if}} >
					{{name}}
				</option>
			{{/each}}
		</select>
		<input
			type="hidden"
			id="{{manage}}statePCA"
			name="statePCA"
			value="{{selectedState}}"
			data-action="inputstate"
		>
	</div>
{{else}}
	<label class="global-views-states-group-label" for="{{manage}}state">
		{{translate 'County'}}
		<p class="global-views-states-optional-label">{{translate '(optional)'}}</p>
	</label>
	<div  class="global-views-states-group-form-controls" data-validation="control">
		<input
			type="text"
			id="{{manage}}state"
			name="state"
			class="{{inputClass}} global-views-states-group-input"
			value="{{selectedState}}"
			data-action="inputstate"
		>
		<input
			type="hidden"
			id="{{manage}}statePCA"
			name="statePCA"
			value="{{selectedState}}"
			data-action="inputstate"
		>
	</div>
{{/if}}
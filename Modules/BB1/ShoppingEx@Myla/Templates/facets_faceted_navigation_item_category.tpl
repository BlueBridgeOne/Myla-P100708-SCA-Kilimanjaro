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

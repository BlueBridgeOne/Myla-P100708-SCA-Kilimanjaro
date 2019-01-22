/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

// @module Facets
define('Facets.FacetedNavigationItemCategory.View'
,	[
		'SC.Configuration'

    ,	'facets_faceted_navigation_item_category.tpl'

    ,	'Backbone'
    ,	'Backbone.CompositeView'
    ,	'underscore'
	]
,	function (
		Configuration

    ,	facets_faceted_navigation_item_category_tpl

    ,	Backbone
    ,	BackboneCompositeView
    ,	_
	)
{
    'use strict';

    // @class Facets.FacetedNavigationItemCategory.View @extends Backbone.View
    return Backbone.View.extend({

        template: facets_faceted_navigation_item_category_tpl

	,	events: {
			'click [data-action="see-more"]': 'toggleSeeMoreLess'
		}

    ,	initialize: function ()
		{
			this.categories = this.model && (this.model.get('siblings') || this.model.get('categories')) || [];
			this.categoryUrl = this.options.categoryUrl;

			this.on('afterViewRender', this.renderCategories, this);
        }

		//@method renderCategories
	,	renderCategories: function ()
		{
			this.$('[data-collapsed="true"]').hide();
		}

	,	toggleSeeMoreLess: function(event)
		{
			var target = this.$(event.currentTarget)
			,	target_see_more = target.find('[data-type="see-more"]')
			,	target_see_less = target.find('[data-type="see-less"]')
			,	target_was_expanded = !!target.data('collapsed');

			if (target_was_expanded)
			{
				target_see_more.show();
				target_see_less.hide();
			}
			else
			{
				target_see_more.hide();
				target_see_less.show();
			}

			target.data('collapsed', !target_was_expanded);
		}

        // @method getContext @return {Facets.FacetedNavigationItemCategory.View.Context}
    ,	getContext: function()
		{
			var showFacet = this.categories.length
			,	values = []
			,	self = this
			,	showMax = Configuration.get('categories.sideMenu.showMax')
			,	uncollapsible = Configuration.get('categories.sideMenu.uncollapsible')
			,	collapsed = Configuration.get('categories.sideMenu.collapsed');


var isRange=this.model.get("urlfragment")=="range"||this.model.get("parenturl")=="/range";
if(!isRange){
			_.each(this.categories, function (category)
			{
				values.push({
					displayName: category.name
				,	label: category.name
				,	link: category.fullurl
				,	isActive: category.fullurl === self.categoryUrl
				});
			});
		}

			var max = showMax || values.length
			,	displayValues = _.first(values, max)
			,	extraValues = _.rest(values, max);

			var breadcrumb = this.model && (this.model.get('breadcrumb') || [])
			,	parentName = '';

			if (breadcrumb && breadcrumb.length)
			{
				var index = breadcrumb.length > 1 ? breadcrumb.length - 2 : breadcrumb.length - 1;
				parentName = breadcrumb[index].name;
                if (breadcrumb.length > 1) {
                    parentName += " / " + breadcrumb[1].name;
                }
			}
			var isActive=false;
			var parentUrl=this.model.get("parenturl");
			if(!parentUrl||parentUrl.length==0){
			parentUrl=this.model.get("fullurl");
			isActive=true;
			}
            // @class Facets.FacetedNavigationItemCategory.View.Context
            return {
				//@property {String} htmlId
				htmlId: _.uniqueId('commercecategory_')
                // @property {String} facetId
            ,	facetId: 'commercecategory'
                // @property {Boolean} showFacet
            ,	showFacet: !!showFacet
				//@property {Array<Object>} values
			,	values: values
                // @property {Array<Object>} displayValues
            ,	displayValues: displayValues
				//@property {Array<Object>} extraValues
			,	extraValues: extraValues
				//@property {Boolean} showExtraValues
			,	showExtraValues: !!extraValues.length
				//@property {Boolean} isUncollapsible
			,	isUncollapsible: !!uncollapsible
				//@property {Boolean} isCollapsed
			,	isCollapsed: !uncollapsible && collapsed
				//@property {String} parentName
			,	parentName: parentName
			,parentUrl:parentUrl
			,isActive:isActive
			,isRange:isRange
			// @class Facets.FacetedNavigationItemCategory.View
            };
        }
    });

});

// @module AdvancedImage
define(
	'AdvancedImage'
,	[
		'AdvancedImage.View'
	]
,	function (
		CCTAdvancedImageView
	)
{
	'use strict';

	//@class AdvancedImage
	return {
		mountToApp: function mountToApp (application)
		{
			application.getComponent('CMS').registerCustomContentType({
				// @property {String} id This property value MUST be lowercase
				id: 'bb1_cct_advanced_image'
				// @property {Backbone.View} view The view to render the CCT
			,	view: CCTAdvancedImageView
			});
		}
	};
});

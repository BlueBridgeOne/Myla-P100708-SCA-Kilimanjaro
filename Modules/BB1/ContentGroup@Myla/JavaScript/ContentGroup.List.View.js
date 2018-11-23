//@module ContentGroup
define(
	'ContentGroup.List.View', [
		'SC.Configuration', 'Backbone.View', 'Backbone.CompositeView', 'contentgrouplist.tpl', 'Facets.ItemCell.View', 'facets_item_cell_grid.tpl'

		, 'Utils', 'jQuery'
	],
	function (
		Configuration, View, BackboneCompositeView, contentgrouplist_tpl, FacetsItemCellView, facets_item_cell_grid_tpl

		, Utils, jQuery
	) {
		'use strict';

		var ItemFunction = function (e) {
			var index = parseInt(e.item_index) - 1,
				model;
			//console.log("index " + index);
			if (index >= this.options.items.length) {
				return null;
			} else {
				model = this.options.items.models[index];
			}
			var view = new FacetsItemCellView({
				model: model,
				application: this.application
			});
			view.template = facets_item_cell_grid_tpl;
			return view;
		};

		return Backbone.View.extend({

			initialize: function (options) {
				this.options = options;
				
				BackboneCompositeView.add(this);
			},
			itemsInGroup: function (group) { //How many items in each group.
				switch (group) {
					case "PRODUCT CELL x5 LEFT":
					case "PRODUCT CELL x5 RIGHT":
					return 5;
					case "PRODUCT & CONTENT CELL x5 LEFT":
					case "PRODUCT & CONTENT CELL x5 RIGHT":
					case "PRODUCT & PROMO CELL x5 LEFT":
					case "PRODUCT & PROMO CELL x5 RIGHT":
					case "PRODUCT CELL x4":
						return 4;
					case "PRODUCT & CONTENT CELL x3 LEFT":
					case "PRODUCT & CONTENT CELL x3 RIGHT":
					case "PRODUCT & PROMO CELL x3 LEFT":
					case "PRODUCT & PROMO CELL x3 RIGHT":
					case "PROMO CELL GROUP x3 LEFT":
					case "PROMO CELL GROUP x3 RIGHT":
					case "HOME GROUP x3 LEFT":
					case "HOME GROUP x3 RIGHT":
						return 2;
					case "PROMO CELL GROUP x2 LEFT":
					case "PROMO CELL GROUP x2 RIGHT":
						return 1;
				}
				return 0;

			},
			imagesInGroup: function (group) { //How many images are in each group.
				switch (group) {
					case "PRODUCT & CONTENT CELL x3 LEFT":
					case "PRODUCT & CONTENT CELL x3 RIGHT":
					case "PRODUCT & PROMO CELL x3 LEFT":
					case "PRODUCT & PROMO CELL x3 RIGHT":
					case "PRODUCT & CONTENT CELL x5 LEFT":
					case "PRODUCT & CONTENT CELL x5 RIGHT":
					case "PRODUCT & PROMO CELL x5 LEFT":
					case "PRODUCT & PROMO CELL x5 RIGHT":
					case "PROMO CELL GROUP x2 LEFT":
					case "PROMO CELL GROUP x2 RIGHT":
					case "PROMO CELL GROUP x3 LEFT":
					case "PROMO CELL GROUP x3 RIGHT":
					case "HOME GROUP x3 LEFT":
					case "HOME GROUP x3 RIGHT":
					case "CONTENT TEXT":
						return 1;
					case "COLLECTION CELL GROUP x3 LEFT":
					case "COLLECTION CELL GROUP x3 RIGHT":
					case "HOME x3 LEFT":
					case "HOME x3 RIGHT":
						return 3;
					case "PRODUCT CELL x2 LARGE LEFT":
					case "PRODUCT CELL x2 LARGE RIGHT":
					case "PRODUCT CELL x2 SMALL LEFT":
					case "PRODUCT CELL x2 SMALL RIGHT":
					case "PRODUCT CELL GROUP x2 LEFT":
					case "PRODUCT CELL GROUP x2 RIGHT":
					case "HOME x2 LEFT":
					case "HOME x2 RIGHT":
						return 2;


				}
				return 0;

			},
			childViews: { //I tried all sorts of ways to build this using a loop. But no joy.
				Item: ItemFunction,
				Item1: ItemFunction,
				Item2: ItemFunction,
				Item3: ItemFunction,
				Item4: ItemFunction,
				Item5: ItemFunction,
				Item6: ItemFunction,
				Item7: ItemFunction,
				Item8: ItemFunction,
				Item9: ItemFunction,
				Item10: ItemFunction,
				Item11: ItemFunction,
				Item12: ItemFunction,
				Item13: ItemFunction,
				Item14: ItemFunction,
				Item15: ItemFunction,
				Item16: ItemFunction,
				Item17: ItemFunction,
				Item18: ItemFunction,
				Item19: ItemFunction,
				Item20: ItemFunction,
				Item21: ItemFunction,
				Item22: ItemFunction,
				Item23: ItemFunction,
				Item24: ItemFunction,
				Item25: ItemFunction,
				Item26: ItemFunction,
				Item27: ItemFunction,
				Item28: ItemFunction,
				Item29: ItemFunction,
				Item30: ItemFunction,
				Item31: ItemFunction,
				Item32: ItemFunction,
				Item33: ItemFunction,
				Item34: ItemFunction,
				Item35: ItemFunction,
				Item36: ItemFunction,
				Item37: ItemFunction,
				Item38: ItemFunction,
				Item39: ItemFunction,
				Item40: ItemFunction,
				Item41: ItemFunction,
				Item42: ItemFunction,
				Item43: ItemFunction,
				Item44: ItemFunction,
				Item45: ItemFunction,
				Item46: ItemFunction,
				Item47: ItemFunction,
				Item48: ItemFunction
			},
			updateImages: function (images) {
				this.options.imageDetails = images;
				this.render();
			},
			template: contentgrouplist_tpl,
			getContext: function () {
				var groupname = this.options.groupname;
				groupname = groupname.split(" ").join("").toLowerCase();
				var groups = Configuration.get('contentGroups.' + groupname, []);
				console.log(groupname + " debug:" + this.options.debug + " groups:" + (groups && groups.length));

				if (this.options.items) {

					var items = this.options.items;
					//console.log("Items Found " + items.length);
					var groupitems = []; //Place items in each group depending on how many placeholders in that group.
					var total = 0,
						groupTotal;
					for (var i = 0; i < groups.length; i++) {
						groupTotal = this.itemsInGroup(groups[i].groupTemplate);
						//console.log(JSON.stringify(groups[i]) + " " + groupTotal);
						total += groupTotal;
					}
					//console.log("total "+total);
					if (total < items.length) { //Not enough groups, repeat groups until there is enough.
						var originalGroupsLength = groups.length;
						var diff = items.length - total,
							found = false;
						//console.log("diff=" + diff);
						do {
							for (var i = 0; i < originalGroupsLength; i++) {

								groups.push({
									groupTemplate: groups[i].groupTemplate
								});
								groupTotal = this.itemsInGroup(groups[i].groupTemplate);
								if (groupTotal > 0) {
									diff -= groupTotal;
									found = true;
									if (diff <= 0) {
										break;
									}
								}
							}
						} while (diff > 0 && found);
					} else if (total > items.length) { //Too many groups, remove groups until there is just enough.
						var originalGroupsLength = groups.length;
						var diff = total - items.length,
							found = false;
						//console.log("too many groups diff=" + diff);
						do {
							for (var i = groups.length - 1; i >= 0; i--) {

								groupTotal = this.itemsInGroup(groups[i].groupTemplate);
								if (groupTotal < diff) {
									groups.pop();

									if (groupTotal > 0) {
										diff -= groupTotal;
										found = true;
										if (diff <= 0) {
											break;
										}
									}
								} else {
									diff = 0;
									break;
								}
							}
						}
						while (diff > 0 && found);

					}


					//Load items into groups.
					var pos = 1;

					for (var i = 0; i < groups.length; i++) {
						groupTotal = this.itemsInGroup(groups[i].groupTemplate);
						//console.log(JSON.stringify(groups[i]) + " " + groupTotal);
						if (groupTotal > 0) {
							groups[i].itemA = pos;
							pos++;
						}
						if (groupTotal > 1) {
							groups[i].itemB = pos;
							pos++;
						}
						if (groupTotal > 2) {
							groups[i].itemC = pos;
							pos++;
						}
						if (groupTotal > 3) {
							groups[i].itemD = pos;
							pos++;
						}
						if (groupTotal > 4) {
							groups[i].itemE = pos;
							pos++;
						}
					}



				}

				//clear images
				for (var i = 0; i < groups.length; i++) {
					groups[i].imageA = undefined;
					groups[i].imageB = undefined;
					groups[i].imageC = undefined;
					groups[i].imageD = undefined;
		}

				if (this.options.imageDetails && this.options.imageDetails.pos) {
					//load image details into groups
					
					var images = this.options.imageDetails.pos;
					
					var pos = 1,
						groupTotal;
					for (var i = 0; i < groups.length; i++) {
						groupTotal = this.imagesInGroup(groups[i].groupTemplate);

						if (groupTotal > 0) {
							if (images[pos]) {
								groups[i].imageA = images[pos];
							}
							pos++;
						}
						if (groupTotal > 1) {
							if (images[pos]) {
								groups[i].imageB = images[pos];
							}
							pos++;
						}
						if (groupTotal > 2) {
							if (images[pos]) {
								groups[i].imageC = images[pos];
							}
							pos++;
						}
						if (groupTotal > 3) {
							if (images[pos]) {
								groups[i].imageD = images[pos];
							}
							pos++;
						}
					}
				}
				//console.log(groups);
				//$("html").addClass("ns_is-edit");
				//console.log(groups);
				return {
					groups: groups,
					debug: this.options.debug,
					page: this.options.page || ""
				};

			}
		});
	});
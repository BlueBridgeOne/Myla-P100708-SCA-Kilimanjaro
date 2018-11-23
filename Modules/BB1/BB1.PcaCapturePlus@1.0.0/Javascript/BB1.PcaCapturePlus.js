//@module BB1.PcaCapturePlus
define(
	'BB1.PcaCapturePlus', [
		'OrderWizard.Module.Address',
		'Address.Edit.View',
		'Address.Edit.Fields.View',
		'Address.Model',
		'GlobalViews.States.View',
		'SC.Configuration',

		'underscore'
	],
	function (
		OrderWizardModuleAddress,
		AddressEditView,
		AddressEditFieldsView,
		AddressModel,
		GlobalViewsStatesView,
		Configuration,

		_
	) {
		'use strict';

		var pcaCapturePlusConfig = Configuration.get('pcaCapturePlus');

		if (pcaCapturePlusConfig && pcaCapturePlusConfig.enabled) {

			//AddressModel.prototype.validation.phone = {required: true};


			OrderWizardModuleAddress.prototype.render = _.wrap(OrderWizardModuleAddress.prototype.render, function (render, not_trigger_ready) {

				if (this.addressView)
					this.addressView.trigger('beforeViewRender', this);

				render.call(this, not_trigger_ready);

				if (this.addressView)
					this.addressView.trigger('afterViewRender', this);

			});


			_.extend(AddressEditView.prototype, {

				initialize: _.wrap(AddressEditView.prototype.initialize, function (initialize, options) {
					var self = this;

					initialize.apply(this, _.rest(arguments));

					this.appendStyleSheets().loadLibraries();

					this.on('beforeViewRender', function () {
						if (self.capturePlusControl)
							self.capturePlusControl.destroy();
					});

					this.on('afterViewRender', function () {
						self.loadLibraries().then(function () {
							var fields = [{
										element: self.$('input[name="address-lookup"]').attr("id"),
										field: "Line1",
										mode: pca.fieldMode.SEARCH
									}, // Separate Mode
									{
										element: self.$('input[name="addr1"]').attr("id"),
										field: "Line1",
										mode: pca.fieldMode.SEARCH
									}, // Bound Mode
									{
										element: self.$('input[name="zip"]').attr("id"),
										field: "PostalCode",
										mode: pca.fieldMode.SEARCH
									}, // Bound Mode
									{
										element: self.$('input[name="addr1"]').attr("id"),
										field: "Line1",
										mode: pca.fieldMode.POPULATE
									},
									{
										element: self.$('input[name="addr2"]').attr("id"),
										field: "Line2",
										mode: pca.fieldMode.POPULATE
									},
									{
										element: self.$('input[name="city"]').attr("id"),
										field: "City",
										mode: pca.fieldMode.POPULATE
									},
									{
										element: self.$('select[name="country"]').attr("id"),
										field: "CountryIso2",
										mode: pca.fieldMode.POPULATE
									},
									{
										element: self.$('input[name="statePCA"]').attr("id"),
										field: "Province",
										mode: pca.fieldMode.POPULATE
									},
									{
										element: self.$('input[name="zip"]').attr("id"),
										field: "PostalCode",
										mode: pca.fieldMode.POPULATE
									}
								],
								options = {
									key: Configuration.get('pcaCapturePlus.apiKey'),
									setCursor: true,
									prompt: true,
									promptDelay: 0,
									setCountryByIP: true
								};
							try {
								options.setCountryByIP = pca.capturePlus.bindings[0].options.CapturePlusCountryByIP === "1";
							} catch (e) {}
							self.capturePlusControl = new pca.Address(fields, options);
							self.capturePlusControl.setCountry(SC.Tools.getDefaultCountry());
							self.capturePlusTooltip = new pca.Tooltip(self.$('input[name="addr1"]')[0], 'Start typing a postcode, street or address');

							self.capturePlusControl.listen("populate", function (address) {
								self.$('input[name="address-lookup"]').val("");
								jQuery('#finder-error').slideUp('fast').css("display", "none");

								//BB1 G Truslove Dec 2017 get the county from hidden input and attempt to match it in available counties select input. This makes sure of a valid county.
								var PCACounty = self.$('input[name="statePCA"]').val();
								var PCACity = self.$('input[name="city"]').val();
								self.$('select[name="country"]').change();

								console.log("County: " + PCACounty + " City=" + PCACity);
								if (!PCACounty || PCACounty.length == 0) {
									if(self.$("#state").prop("tagName") == "SELECT"){
									PCACounty = PCACity;
									}
								}
								//console.log(self.$('input[name="statePCA"]').length);
								self.$("#state").val("");
								if (PCACounty && PCACounty.length > 0) {
									var v, h;
									if (self.$("#state").prop("tagName") == "INPUT") {
										self.$("#state").val(PCACounty);
									} else {
										self.$("#state option").each(function () {
											v = self.$(this).val().trim();
											h = self.$(this).text().trim();

											if (v == PCACounty || h == PCACounty) {
												//console.log(v + " " + h+" "+PCACounty);
												self.$('select[name="state"]').val(v);
											}
										});
									}
								}
								if (typeof dataLayer != 'undefined') {
									dataLayer.push({
										'event': 'GAEvent',
										'eventCategory': 'Checkout',
										'eventAction': 'Complete',
										'eventLabel': 'Address Lookup'
									});
								}
							});

							self.capturePlusControl.listen("error", function (error) {
								var message = "";
								if (~error.indexOf("Postcode Required")) {
									message = "Please enter a valid postcode";
								} else if (~error.indexOf("Postcode Invalid")) {
									message = "Please ensure you enter a valid postcode";
								} else if (~error.indexOf("empty")) {
									message = "Sorry, we couldn't find any results, please try again";
								} else {
									message = 'Sorry, you have used today\'s free look-ups.';
									jQuery(".search").attr('disabled', 'true');
									jQuery(".recentFavourites").css('visibility', 'hidden');
								}
								self.capturePlusControl.hide();
								self.capturePlusTooltip.hide();
								self.$('#finder-error').html('<div class="col-xs-12"><div class="error"><span>' + message + '</span></div></div>').slideDown('fast').css('display', 'block');
								var offset = self.$("#finder-error").offset();
								jQuery('html, body').animate({
									scrollTop: offset ? offset.top : 0
								}, 400);
								self.$('input[name="address-lookup"]').attr("disabled", true).blur();
							});

							self.$('input[name="address-lookup"]').keydown(function (e) {
								if (e.keyCode == 13) {
									return false;
								}
							});
						});
					});
				}),

				appendStyleSheets: function () {
					var $head = jQuery('head'),
						apiKey = Configuration.get('pcaCapturePlus.apiKey');

					if (!$head.find('link[href$="//services.postcodeanywhere.co.uk/css/captureplus-2.30.min.css?key=' + apiKey + '"]').length) {
						$head.prepend('<link rel="stylesheet" href="//services.postcodeanywhere.co.uk/css/captureplus-2.30.min.css?key=' + apiKey + '" />');
					}

					return this;
				},

				loadPostcodeAnywhereLibrary: function () {
					return jQuery.getScript('//services.postcodeanywhere.co.uk/js/captureplus-2.30.min.js?key=' + Configuration.get('pcaCapturePlus.apiKey'));
				},

				loadLibraries: function () {
					return this.librariesLoaded || (
						this.librariesLoaded = jQuery.when(
							this.loadPostcodeAnywhereLibrary()
						)
					);
				}



			});

			_.extend(AddressEditFieldsView.prototype, {

				eraseZip: function () {},


				getContext: _.wrap(AddressEditFieldsView.prototype.getContext, function (getContext, options) {
					var self = this;

					var context = getContext.apply(this, _.rest(arguments));


					var site = SC.Tools.getSiteCode();
					context.showLookup = site == "UK";

					return context;
				})

			});

		}

		return {
			mountToApp: function (application) {

			}
		};

	}
);
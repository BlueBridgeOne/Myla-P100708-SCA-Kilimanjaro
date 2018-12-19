/*
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
*/

//@module OrderWizard.Module.PaymentMethod.ThreeDSecure
define(
	'OrderWizard.Module.PaymentMethod.ThreeDSecure'
,   [
		'Wizard.Module'
	,	'Transaction.Model'
	,	'order_wizard_paymentmethod_threedsecure_module.tpl'

	,	'underscore'
	]
,   function (
		WizardModule
	,	TransactionModel
	,	order_wizard_paymentmethod_threedsecure_module_tpl

	,	_
	)
{
	'use strict';

	return WizardModule.extend({

		//@property {Function} template
		template: order_wizard_paymentmethod_threedsecure_module_tpl

		// @property {String} title
	,	title: _('Credit Card Authentication').translate()

		// @method initialize
		// @param {Object} options
	,	initialize: function (options)
		{

			this.application = options.application;
			this.deferred = options.deferred;

			WizardModule.prototype.initialize.apply(this, arguments);
		}

		// @method render
		// @return {Backbone.View} result
	,	render: function ()
		{
			var result = WizardModule.prototype.render.apply(this, arguments);
			return result;
		}

		// @method showInModal
		// @param {Object} options
		// @return {jQuery.Deferred}
	,	showInModal: function (options)
		{
			var self = this;
			this.render();
			var promise = this.application.getLayout().showInModal(this, _.extend({ keyboard: false, backdrop: 'static' }, options));
			promise.done(function() {
				self.listenForCallback();
			});

			this.on('modal-close', function ()
			{
				this.model.fetch().done(function ()
				{
					self.model.set('internalid', 'cart');
					self.wizard.getCurrentStep().enableNavButtons();
				});
			});

			return promise;
		}

		// @method process3DSecure. Called from ssp 3D Secure file (threedsecure.ssp)
		// @param {Json} confirmation Order submit answer.
	,	process3DSecure: function (order_info)
		{
			console.log("process3DSecure");
			console.log(order_info);
			if (order_info.confirmation && order_info.confirmation.confirmationnumber)
			{
				console.log("success");
				this.error = null;
				this.model.set(order_info);
				this.success();
			}
			else
			{
				console.log("fail");
				this.fail();
				if (order_info && order_info.confirmation && order_info.confirmation.errorMessage)
				{
					this.error = order_info.confirmation.errorMessage;
					this.wizard.manageError(order_info.confirmation);
					this.model.set('3dsecure_error', order_info.confirmation);
					this.showInModal();
				}
			}
		}

		// @method listenForCallback. Turns callback widely available, emptying it after use.
	,	listenForCallback: function()
		{
			var self = this;
			window.process3DSecure = function (data)
			{
				self.process3DSecure(data);
				window.process3DSecure = function(){};
			};
		}

		// @method fail Called if confirmation coming from 3D Secure ssp file fails.
		// @return {jQuery.Deferred} Rejected promise.
	,	fail: function()
		{
			return this.deferred.reject();
		}

		// @method success Called if confirmation coming from 3D Secure ssp file succeeded.
		// @return {jQuery.Deferred} Resolved promise.
	,	success: function()
		{
			this.$containerModal.modal('hide');
			return this.deferred.resolve();
		}

		// @method getContext
		// @return {OrderWizard.Module.PaymentMethod.ThreeDSecure.Context}
	,   getContext: function ()
		{
			var err=this.model.get('3dsecure_error');
			if(err){
				console.log("3D Secure Error");
				console.log(err);
				if(err.errorMessage=="Payment Gateway rejected the request."||err.errorMessage=="There was an unexpected error that occurred while communicating with the payment processor. Please try again later."){
					err.errorMessage="We were unable to process this payment.<br /><br /><ol style='list-style:decimal;margin-left:15px;color:#4d5256;font-size:.9em;'><li style='list-style:decimal;'>Check the payment and address details have been entered correctly.</li><li style='list-style:decimal;'>Check the account has sufficient funds.</li><li style='list-style:decimal;'>Try a different card.</li><li style='list-style:decimal;'>Call us for assistance <a href='tel:+44 (0)20 7637 2204'>+44 (0)20 7637 2204</a>.</li></ol>";
				}
				if(err.errorMessage=="Unexpected Error"){
					// console.log(err);
					// console.trace();
					err = null;
					return;
				}
			}
			return {
				threeDSecureError: err
			,	iframe: this.model.get('confirmation').get('paymentauthorization').servicehtml
			};
		}
	});
});

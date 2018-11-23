/*===========================================

  BB1 - G Truslove

  Date: Jun 2019

  ===========================================*/

define('GDPRNewsletter.Model', [
    'Models.Init', 'SC.Model', 'Utils', 'Tools'
], function(
    CommerceAPI, SCModel, Utils, Tools
) {

    'use strict';

    return SCModel.extend({

        name: 'GDPRNewsletter'

            ,
        validation: {
            email: [{
                required: true,
                msg: 'Please enter an email address'
            }]
        }

        ,
        create: function(data) {
            try {
                //nlapiLogExecution("DEBUG", "SCA Testing", "Newsletter=" + JSON.stringify(data));
                // Validate! Validate! Validate!
                this.validate(data);

                // Create a bunch of useful variables
                var configuration, currentDomain, request, url;

                // Get the config options for the functionality
                configuration = SC.Configuration && SC.Configuration.GDPRNewsletter;

                currentDomain = data.host;

                var notify = configuration.notify;


                // Include subsidiary data, if relevant
                if (CommerceAPI.context.getFeature('SUBSIDIARIES')) {
                    data.subsidiary = CommerceAPI.session.getShopperSubsidiary();
                }
                data.email = data.email.toLowerCase();

                var contactID;
                var leadID, globalsubscriptionstatus;
                if (configuration.usecompanies && data.company && data.company.length > 0) {

                    //Company and contact

                    var customerSearch = nlapiSearchRecord("entity", null, [
                        ["entityid", "is", data.company], 'OR', ["email", "is", data.email]
                    ], [
                        new nlobjSearchColumn("entityid", null, null),
                        new nlobjSearchColumn("email", null, null),
                        new nlobjSearchColumn("globalsubscriptionstatus", null, null)
                    ]);
                    for (var i = 0; customerSearch != null && i < customerSearch.length; i++) {
                        var res = customerSearch[i];
                        leadID = res.getId();
                        break;
                    }
                    if (!leadID) { //Create new company
                        var lead = nlapiCreateRecord('lead');
                        lead.setFieldValue("customform", 55);
                        lead.setFieldValue("currency", CommerceAPI.session.getShopperCurrency().internalid);
                        lead.setFieldValue("email", data.email);
                        lead.setFieldValue("companyname", data.company);
                        lead.setFieldValue('globalsubscriptionstatus', 1);

                        leadID = nlapiSubmitRecord(lead, true,true);
                    }
                    var contactSearch = nlapiSearchRecord("contact", null, [
                        ["company", "is", leadID], 'AND', ["email", "is", data.email]
                    ], [
                        new nlobjSearchColumn("entityid", null, null),
                        new nlobjSearchColumn("email", null, null),
                        new nlobjSearchColumn("globalsubscriptionstatus", null, null)
                    ]);

                    for (var i = 0; contactSearch != null && i < contactSearch.length; i++) {
                        var res = contactSearch[i];
                        contactID = res.getId();
                        globalsubscriptionstatus = res.getValue("globalsubscriptionstatus");
                        break;
                    }
                    if (!contactID) { //create a new contact
                        var contact = nlapiCreateRecord('contact');
                        contact.setFieldValue("email", data.email);
                        contact.setFieldValue("firstname", data.firstname);
                        contact.setFieldValue("lastname", data.lastname);
                        contact.setFieldValue("company", leadID);
                        contact.setFieldValue('globalsubscriptionstatus', 1);
                        contactID = nlapiSubmitRecord(contact, true,true);
                    } else if (globalsubscriptionstatus == 2) {
                        nlapiSubmitField('contact', contactID, 'globalsubscriptionstatus', 1);
                    }

                } else {

                    //Individual

                    var customerSearch = nlapiSearchRecord("entity", null, [
                        ["email", "is", data.email]
                    ], [
                        new nlobjSearchColumn("entityid", null, null),
                        new nlobjSearchColumn("email", null, null),
                        new nlobjSearchColumn("globalsubscriptionstatus", null, null)
                    ]);

                    for (var i = 0; customerSearch != null && i < customerSearch.length; i++) {
                        var res = customerSearch[i];
                        leadID = res.getId();
                        globalsubscriptionstatus = res.getValue("globalsubscriptionstatus");
                        break;
                    }
                    if (!leadID) { //Create new lead
                        //nlapiLogExecution('DEBUG', "Not found " + data.email);

                        var lead = nlapiCreateRecord('lead');
                        lead.setFieldValue("customform", 55);
                        lead.setFieldValue("currency", CommerceAPI.session.getShopperCurrency().internalid);
                        lead.setFieldValue("email", data.email);
                        lead.setFieldValue("firstname", data.firstname);
                        lead.setFieldValue("lastname", data.lastname);
                        lead.setFieldValue("isperson", "T");
                        lead.setFieldValue('globalsubscriptionstatus', 1);

                        if (data.company) {
                            lead.setFieldValue("companyname", data.company);
                        } else {
                            lead.setFieldValue("companyname", "unknown");
                        }
                        var autonumbering = false; //Customer autonumbering is on in account.

                        if (autonumbering) {
                            leadID = nlapiSubmitRecord(lead, true,true);
                        } else {
                            lead.setFieldValue("entityid", data.firstname + " " + data.lastname);

                            var number = 1;
                            do { //Find a unique ID using trial and error
                                try {
                                    leadID = nlapiSubmitRecord(lead, true,true);
                                } catch (err2) {
                                    if (err2.code == "UNIQUE_CUST_ID_REQD") {
                                        number++;
                                        lead.setFieldValue("entityid", data.firstname + " " + data.lastname + " " + number);
                                    } else {
                                        throw (err2);
                                    }

                                }

                            } while (!leadID);
                        }
                    } else if (globalsubscriptionstatus == 2) {
                        nlapiSubmitField('lead', leadID, 'globalsubscriptionstatus', 1);
                    }
                }

                var params = [{ name: "Name", value: data.firstname + " " + data.lastname }, { name: "Company", value: data.company }, { name: "E-Mail", value: data.email, href: "mailto:" + data.email + "?subject=re: " + data.title }, { name: "Host", value: data.host, href: "https://" + data.host }];

                var reply;
                if (leadID) {
                    params.push({ name: "Customer", value: "View in NetSuite", href: "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'customer', leadID) });
                }
                if (contactID) {
                    params.push({ name: "Contact", value: "View in NetSuite", href: "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'contact', contactID) });
                }
                Tools.emailAlert(19117, notify, "Newsletter", data.title, data.incomingmessage, params, reply);

                return {
                    successMessage: 'Thank you for subscribing to our newsletter.'
                };


            } catch (e) {

                nlapiLogExecution("ERROR", "Newsletter Error", JSON.stringify(e));
                // Finally, let's catch any other error that may come
                return {
                    status: 500,
                    code: 'ERR_FORM',
                    message: 'There was an error submitting the form, please try again later.',
                    stack: e.details || e.message || e
                }
            }
        }
    });
});
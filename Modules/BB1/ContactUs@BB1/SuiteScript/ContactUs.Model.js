/*===========================================

  BB1 - G Truslove

  Date: Feb 2018

  ===========================================*/

define('ContactUs.Model', [
  'Models.Init', 'SC.Model', 'Utils', 'Tools'
], function(
  CommerceAPI, SCModel, Utils, Tools
) {

  'use strict';

  return SCModel.extend({

    name: 'ContactUs'

      ,
    validation: {
      firstname: {
        required: true,
        msg: 'Please enter a first name'
      },
      lastname: {
        required: true,
        msg: 'Please enter a last name'
      },
      email: [{
        required: true,
        msg: 'Please enter an email address'
      }, {
        pattern: 'email',
        msg: 'Please enter a valid email address'
      }]
    }

    ,
    create: function(data) {
      try {
        //nlapiLogExecution("DEBUG", "SCA Testing", "Contact Us=" + JSON.stringify(data));
        // Validate! Validate! Validate!
        this.validate(data);

        // Create a bunch of useful variables
        var configuration, currentDomain, request, url;

        // Get the config options for the functionality
        configuration = SC.Configuration && SC.Configuration.contactUs;

        currentDomain = data.host;

        var notify = configuration.notify;

        if (data.formtype == "CONTACTUS") {
          var spam = configuration.spam;

          //nlapiLogExecution("ERROR", "SCA Testing", "SPAM=" + JSON.stringify(spam));
          var lcmessage = data.incomingmessage;
          var lctitle = data.title;
          for (var i = 0; i < spam.length; i++) {
            if (spam[i].phrase && spam[i].phrase.length > 0 && lcmessage.indexOf(spam[i].phrase.toLowerCase()) > -1) {
              nlapiLogExecution("ERROR", "SPAM DETECTED", data.incomingmessage);
              throw (new Error("The message could not be accepted."));
            }
            if (spam[i].phrase && spam[i].phrase.length > 0 && lctitle.indexOf(spam[i].phrase.toLowerCase()) > -1) {
              nlapiLogExecution("ERROR", "SPAM DETECTED", data.title);
              throw (new Error("The message could not be accepted."));
            }
          }
        }

        // Include subsidiary data, if relevant
        if (CommerceAPI.context.getFeature('SUBSIDIARIES')) {
          data.subsidiary = CommerceAPI.session.getShopperSubsidiary();
        }
        data.email = data.email.toLowerCase();

        //CUSTOM REGION custentity_bb1_sales_region
        var region = 1,
          regionText = "UK"; //1 UK, 2 France, 3 Ireland
        switch (data.host) {
          case "myla.bluebridgeone.com":
          case "www.myla.com":
          case "myla.com":
            region = 1;
            regionText = "UK"
        }

        var contactID;
        var leadID;
        if (configuration.usecompanies && data.company && data.company.length > 0) {

          //Company and contact

          var customerSearch = nlapiSearchRecord("entity", null, [
            ["entityid", "is", data.company], 'OR', ["email", "is", data.email]
          ], [
            new nlobjSearchColumn("entityid", null, null),
            new nlobjSearchColumn("email", null, null)
          ]);
          for (var i = 0; customerSearch != null && i < customerSearch.length; i++) {
            var res = customerSearch[i];
            if(res.recordType!="contact"){
            leadID = res.getId();
            break;
            }
          }
          if (!leadID) { //Create new company
            var lead = nlapiCreateRecord('lead');
            
            lead.setFieldValue("customform", 55);
            
            lead.setFieldValue("currency", CommerceAPI.session.getShopperCurrency().internalid);
            lead.setFieldValue("email", data.email);
            lead.setFieldValue("comments", "Created by website " + currentDomain + ".");
            lead.setFieldValue("companyname", data.company);
            if (data.phone) {
              lead.setFieldValue("phone", data.phone);
            }

            //Address
            if (data.addr1) {
              var line = lead.getLineItemCount("addressbook") + 1;

              lead.setLineItemValue("addressbook", "addressee", line, data.company);
              lead.setLineItemValue("addressbook", "attention", line, data.firstname + " " + data.lastname);
              lead.setLineItemValue("addressbook", "addr1", line, data.addr1);
              lead.setLineItemValue("addressbook", "city", line, data.city);
              lead.setLineItemValue("addressbook", "state", line, data.state);
              lead.setLineItemValue("addressbook", "country", line, data.country);
              lead.setLineItemValue("addressbook", "zip", line, data.zip);
            }

            //CUSTOM
            lead.setFieldValue("custentity_bb1_other_name", data.company);
            lead.setFieldValue("custentity_bb1_gen_email_add", data.email);
            lead.setFieldValue("custentity_bb1_sales_region", region);


            leadID = nlapiSubmitRecord(lead, true,true);
          }
          var contactSearch = nlapiSearchRecord("contact", null, [
            ["company", "is", leadID], 'AND', ["email", "is", data.email]
          ], [
            new nlobjSearchColumn("entityid", null, null),
            new nlobjSearchColumn("email", null, null)
          ]);

          for (var i = 0; contactSearch != null && i < contactSearch.length; i++) {
            var res = contactSearch[i];
            contactID = res.getId();
            break;
          }
          if (!contactID) { //create a new contact
            var contact = nlapiCreateRecord('contact');
            contact.setFieldValue("email", data.email);
            contact.setFieldValue("firstname", data.firstname);
            contact.setFieldValue("lastname", data.lastname);
            contact.setFieldValue("company", leadID);
            contact.setFieldValue("comments", "Created by website " + currentDomain + ".");
            if (data.phone) {
              contact.setFieldValue("phone", data.phone);
            }
            //Address
            if (data.addr1) {
              var line = contact.getLineItemCount("addressbook") + 1;

              contact.setLineItemValue("addressbook", "addressee", line, data.company);
              contact.setLineItemValue("addressbook", "attention", line, data.firstname + " " + data.lastname);
              contact.setLineItemValue("addressbook", "addr1", line, data.addr1);
              contact.setLineItemValue("addressbook", "city", line, data.city);
              contact.setLineItemValue("addressbook", "state", line, data.state);
              contact.setLineItemValue("addressbook", "country", line, data.country);
              contact.setLineItemValue("addressbook", "zip", line, data.zip);
            }
            contactID = nlapiSubmitRecord(contact, true,true);
          }

        } else {

          //Individual

          var customerSearch = nlapiSearchRecord("entity", null, [
            ["email", "is", data.email]
          ], [
            new nlobjSearchColumn("entityid", null, null),
            new nlobjSearchColumn("email", null, null)
          ]);

          for (var i = 0; customerSearch != null && i < customerSearch.length; i++) {
            var res = customerSearch[i];
            if(res.recordType!="contact"){
            leadID = res.getId();
            break;
            }
          }
          if (!leadID) { //Create new lead
            //nlapiLogExecution('DEBUG', "Not found " + data.email);

            var lead = nlapiCreateRecord('lead');
            lead.setFieldValue("customform", 55);
            lead.setFieldValue("currency", CommerceAPI.session.getShopperCurrency().internalid);
            lead.setFieldValue("email", data.email);
            lead.setFieldValue("firstname", data.firstname);
            lead.setFieldValue("lastname", data.lastname);
            lead.setFieldValue("comments", "Created by website " + currentDomain + ".");
            lead.setFieldValue("isperson", "T");
            
            if (data.phone) {
              lead.setFieldValue("phone", data.phone);
            }
            if (data.company) {
              lead.setFieldValue("companyname", data.company);
            } else {
              lead.setFieldValue("companyname", "unknown");
            }

            //CUSTOM
            lead.setFieldValue("custentity_bb1_gen_email_add", data.email);
            lead.setFieldValue("custentity_bb1_sales_region", region);


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
          }
        }
        //Create new case

        var newCaseRecord = nlapiCreateRecord('supportcase');
        switch (data.formtype) {
          case "CONTACTUS":
            newCaseRecord.setFieldValue('title', data.title);
            newCaseRecord.setFieldValue('incomingmessage', Utils.sanitizeString(data.incomingmessage));
            break;
        }

        if (data.phone) {
          newCaseRecord.setFieldValue('phone', data.phone);
        }
        
        newCaseRecord.setFieldValue('category', 1); //Might be myla only option
        newCaseRecord.setFieldValue('email', data.email);
        newCaseRecord.setFieldValue('company', leadID);
        if (contactID) {
          newCaseRecord.setFieldValue('contact', contactID);
        }

        var caseconfiguration = SC.Configuration && SC.Configuration.cases;

        //nlapiLogExecution("ERROR", "caseconfiguration", JSON.stringify(caseconfiguration));
        newCaseRecord.setFieldValue('status', caseconfiguration.defaultValues.statusStart.id); // Not Started
        newCaseRecord.setFieldValue('origin', caseconfiguration.defaultValues.origin.id); // Web

        var caseID = nlapiSubmitRecord(newCaseRecord);

        var params = [{ name: "Name", value: data.firstname + " " + data.lastname }, { name: "Company", value: data.company }, { name: "E-Mail", value: data.email, href: "mailto:" + data.email + "?subject=re: " + data.title }, { name: "Sales Region", value: regionText }, { name: "Host", value: data.host, href: "https://" + data.host }];
        if (data.phone) {
          params.push({ name: "Phone Number", value: data.phone, href: "tel:" + data.phone });
        }
        var reply;
        if (leadID) {
          params.push({ name: "Customer", value: "View in NetSuite", href: "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'customer', leadID) });
        }
        if (contactID) {
          params.push({ name: "Contact", value: "View in NetSuite", href: "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'contact', contactID) });
        }
        if (caseID) {
          params.push({ name: "Case", value: "View in NetSuite", href: "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'supportcase', caseID) });

          reply = "https://system.eu2.netsuite.com" + nlapiResolveURL('RECORD', 'supportcase', caseID, "EDIT");
        }
        switch (data.formtype) {
          case "CONTACTUS":
            Tools.emailAlert(19117, notify, "Contact Us", data.title, data.incomingmessage, params, reply);

            return {
              successMessage: 'Thanks for contacting us. Your message has been recieved and we will get back to you shorty.'
            };

            break;
          case "REQUESTCALLBACK":
            Tools.emailAlert(19117, notify, "Callback Required", "Please call " + data.firstname + " " + data.lastname, "<p><span style=\"color:#888;\">Time:</span> " + data.time + "</p><p><span style=\"color:#888;\">Phone:</span> <a href=\"tel:" + data.phone + "\" style=\"text-decoration:none;color:#028ccf;\">" + data.phone + "</a></p>", params);

           
            return {
              successMessage: 'Thanks for contacting us. Your message has been received and one of our team will call you.'
            };

            break;
          case "REGISTERB2B":
            Tools.emailAlert(19117, notify, "Trade Registration", "Please create a trade account for " + data.company + ".","<p><span style=\"color:#888;\">Name:</span> " + data.firstname + " " + data.lastname + "</p><p><span style=\"color:#888;\">Company:</span> " + data.company + "</p>", params);

 return {
              successMessage: 'Thanks for contacting us. Your request for a trade account has been received. We will review your details get back to you shorty.'
            };
            

            break;
        }





      } catch (e) {

        nlapiLogExecution("ERROR", "Contact Us Error", JSON.stringify(e));
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
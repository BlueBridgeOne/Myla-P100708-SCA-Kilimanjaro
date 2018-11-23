/* BB1 G Truslove Oct 2017 - reusable functions */

define('Tools', ['Application', 'Profile.Model', 'underscore'], function(Application, Profile, _) {
    'use strict';

    var Tools = {};

    function emailAlert(from, to, title, subject, message, params, reply, attachments) { //BB1 G truslove - email an internal alert
        var body = "";
        var companyinformation = nlapiLoadConfiguration("companyinformation");
        var fromemail = companyinformation.getFieldValue("email");
        if (fromemail && fromemail.length > 0) {
            var companyname = companyinformation.getFieldValue("companyname");
            var logo = "http://shopping.eu2.netsuite.com/c.4941336/images/Logo.png"; //Hard coded



            body = "<html><body>";
            body += "<img src=\"" + logo + "\" /><br />"
            body += "<p style=\"text-decoration:none;color:#333;font-weight:bold;\">Website Notification | " + title + "</p>";
            if (subject || message || reply) {
                body += "<hr style=\"margin:30x 0px;background-color:#EEE;height:1px;border:0;\" />";
                body += "<div style=\"margin:0 15px\" >";
                if (subject) {
                    body += "<h3 style=\"color:#333;\">" + subject + "</h3>";
                }
                if (message) {
                    body += "<p style=\"color:#333;\">" + message.split("\n").join("<br />") + "</p>";
                }
                if (reply) {
                    body += "<p><a href=\"" + reply + "\" style=\"text-decoration:none;color:#028ccf;\">Reply in NetSuite</a></p>";
                }
                body += "</div>";
            }
            if (params && params.length > 0) {
                body += "<hr style=\"margin:30x 0px;background-color:#EEE;height:1px;border:0;\" />";
                body += "<div style=\"margin:0 15px\" ><table><tr>";
                for (var i = 0; i < params.length; i++) {
                    if (i > 0 && i % 2 == 0) {
                        body += "</tr><tr>";
                    }
                    if (params[i].value) {
                        if (params[i].href) {
                            body += "<td style=\"color:#333;padding-right:30px;\"><span style=\"color:#888;\">" + params[i].name + ":</span> <a href=\"" + params[i].href + "\" style=\"text-decoration:none;color:#028ccf;\">" + params[i].value + "</a></td>";
                        } else {
                            body += "<td style=\"color:#333;padding-right:30px;\"><span style=\"color:#888;\">" + params[i].name + ":</span> " + params[i].value + "</td>";
                        }
                    }
                }
                body += "</tr></table></div>";
            }
            body += "<hr style=\"margin:30x 0px;background-color:#EEE;height:1px;border:0;\" />";
            body += "<div style=\"margin:0 15px\" >";
            body += "<p style=\"color:#888;\">© " + companyname + " " + (new Date()).getFullYear() + "</p>";
            body += "<p style=\"color:#CCC;\">Do not reply directly to this message.</p>";
            body += "</div>";
            body += "</body></html>";
            nlapiSendEmail(from, to, 'Website Notification | ' + title, body, null, null, null, attachments);
        }
    }

    // Ensure all new functions are defined here
    Tools = {
        emailAlert: emailAlert
    };

    // Make Tools module available to Application
    Application.Tools = Tools;

    return Tools;
});
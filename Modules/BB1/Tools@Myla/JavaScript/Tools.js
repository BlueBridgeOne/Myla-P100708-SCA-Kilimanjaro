/* BB1 G Truslove - reusable functions */

define('Tools', [
        'jQuery', 'Utils', 'underscore', 'SC.Configuration', 'Session', 'Handlebars','HomeCurr.View'
    ],
    function (
        jQuery, Utils, _, Configuration, Session, Handlebars,HomeCurrView
    ) {

        'use strict';

        Handlebars.registerHelper("debug", function (optionalValue) {
            console.log("Current Context");
            console.log("====================");
            console.log(this);

            if (optionalValue) {
                console.log("Value");
                console.log("====================");
                console.log(optionalValue);
            }
        });


        var Tools = {
            USPriceLevel: 7, //Should be 7, not 5.
            isUSPrice: function () {
                if (this._isUSPrice) {
                    return this._isUSPrice;
                }
                this._isUSPrice = SC.Tools.getSiteCode() == "US" && SC.ENVIRONMENT.currentPriceLevel == "5";
                return this._isUSPrice;
            },
            setCookie: function (c_name, value, exdays) {
                if (window.localStorage) {

                    window.localStorage.setItem(c_name, value);
                } else {
                    var exdate = new Date();
                    exdays = exdays || 100000;
                    exdate.setDate(exdate.getDate() + exdays);
                    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
                    document.cookie = c_name + "=" + c_value;
                }
            },
            getCookie: function (c_name) {
                if (window.localStorage) {

                    return window.localStorage.getItem(c_name);
                } else {
                    var i, x, y, ARRcookies = document.cookie.split(";");
                    for (i = 0; i < ARRcookies.length; i++) {
                        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
                        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
                        x = x.replace(/^\s+|\s+$/g, "");
                        if (x == c_name) {
                            return unescape(y);
                        }
                    }
                }
            },
            getDefaultCountry: function () {
                if (this.site == "US") {
                    return "US";
                }
                if (this.site == "UK") {
                    return "GB";
                }
                return this.getCookie("country") || Configuration.get('siteSettings.defaultshipcountry');
            },
            _onUpdateHeader: {},
            onUpdateHeader: function (name, foo) { //callback event system to show dark or light headers depending on images and banners.
                this._onUpdateHeader[name] = foo;
            },
            updateDarkHeader: function (dark) {


                if ((typeof dark) != "boolean") {
                    dark = false;
                    if ($(".header-spacer").length > 0) {
                        dark = true;
                    }
                }
                var fragment = Backbone.history.fragment;
                if (fragment) {
                    var q = fragment.indexOf("?");
                    if (q > -1) {
                        fragment = fragment.substring(0, q);
                    }
                }
                var home = fragment == "" && SC.ENVIRONMENT.SCTouchpoint == "shopping";
                if (dark != this.dark || home != this.home) {
                    this.dark = dark;
                    this.home = home;
                    var $html = $("html");
                    var SMT = $html.hasClass("ns_is-admin") || $html.hasClass("ns_is-edit");
                    if (!SMT) {

                        //console.log("updateDarkHeader dark=" + dark + " home=" + this.home + " to " + this._onUpdateHeader);
                        var $html = $("html");
                        var SMT = $html.hasClass("ns_is-admin") || $html.hasClass("ns_is-edit");
                        if (!SMT) {
                            for (var f in this._onUpdateHeader) {
                                this._onUpdateHeader[f]();
                            }
                        }
                    }
                }

            },
            updateHeaderColors: function ($parent, reset) {
                //Menu colours
                //console.log("updateHeaderColors");
                var top = $(document).scrollTop();

                var vpw = $parent.find(".header-banner").outerHeight() || 100;
                var maxmenuheight = vpw * 1.3;
                var menucolor = vpw - Math.min(top, vpw);
                var pos = 1 - (menucolor / vpw);
                menucolor = 255 - parseInt(pos * 255);
                if (self.menucolor != menucolor || reset) {
                    //console.log(menucolor);
                    var dark = SC.Tools.dark;
                    var backcolor = 255;
                    if (dark) {
                        backcolor = 255;
                    } else {
                        backcolor = parseInt(pos * 255);
                    }
                    self.menucolor = menucolor;
                    var backAlpha = .1 + (pos * .4);

                    //console.log(".header-foreground "+$parent.find(".header-foreground").length);

                    $parent.find(".header-button,.header-logo").css({
                        color: "rgb(" + menucolor + "," + menucolor + "," + menucolor + ")",
                        fill: "rgb(" + menucolor + "," + menucolor + "," + menucolor + ")"
                    });

                    $parent.find(".header-foreground").css("background", "rgba(" + backcolor + "," + backcolor + "," + backcolor + "," + backAlpha + ")");

                    $parent.find(".header-foreground").css("background", "linear-gradient(to bottom, rgba(" + backcolor + "," + backcolor + "," + backcolor + "," + (0.5 - (pos * .1)) + ") 0%,rgba(" + backcolor + "," + backcolor + "," + backcolor + "," + (0.15 + (pos * .25)) + ") 60%,rgba(" + backcolor + "," + backcolor + "," + backcolor + "," + (pos * .4) + ") 100%)");

                }
            },
            encodeDQString: function (value) {

                if (value) {
                    return value.split("\"").join("\\\"");
                }
                return value;
            },
            getName: function () {
                return "Myla London";
            },
            getTitle: function (title) {
                return _(title).translate() + " | " + this.getName();
            }
            ,setMeta:function(name,content){
                var $meta=$("[name='"+name+"']");
                if($meta.length>0&&content){
                    $meta.attr("content",content);
                    return "";
                }else{
                    return "<meta name=\""+name+"\" content=\"" + this.encodeDQString(_(content).translate()) + "\">\r\n";
                }
            }
            ,
            getSEO: function (details) { //Get SEO meta tags based on details object

                //console.log(details);            
                
                var meta = "";
                if (details.summary) {
                    meta+=this.setMeta("twitter:card",details.title);
                }
                
                    meta += "<meta name=\"twitter:site\" content=\"@MylaLondon\">\r\n";
                    meta+=this.setMeta("twitter:title",details.title);
                    
                    if (details.summary) {
                        meta+=this.setMeta("twitter:description",details.summary);
                    }
                    //meta+="<meta name=\"twitter:creator\" content=\"@author_handle\">\r\n";
                    if (details.image) {
                        meta += "<meta name=\"twitter:image\" content=\"" + this.encodeDQString(details.image) + "\">\r\n";
                    }
                

                meta += "<meta property=\"og:title\" content=\"" + this.encodeDQString(_(details.title).translate()) + "\" />\r\n";
                meta += "<meta property=\"og:type\" content=\"" + this.encodeDQString(details.type || _("article").translate()) + "\" />\r\n";
                meta += "<meta property=\"og:url\" content=\"" + SC.ENVIRONMENT.currentHostString + "\" />\r\n";
                if (details.image) {
                    meta += "<meta property=\"og:image\" content=\"" + this.encodeDQString(details.image) + "\" />\r\n";
                }
                if (details.summary) {
                    meta += "<meta property=\"og:description\" content=\"" + this.encodeDQString(_(details.summary).translate()) + "\" />\r\n";
                }
                meta += "<meta property=\"og:site_name\" content=\"" + Tools.getName() + "\" />\r\n";
                //meta+="<meta property=\"fb:admins\" content=\"Facebook numeric ID\" />\r\n";
                return meta;

            },
            getValue: function (name) { //get a value from localstorage if available

                if (typeof (Storage) !== "undefined") {
                    return localStorage.getItem(name);
                }
            },
            setValue: function (name, value) { //set a value in localstorage if available

                if (typeof (Storage) !== "undefined") {
                    return localStorage.setItem(name, value);
                }
            },
            getCMSName: function (name) { //get an name used for in CMS e.g. blue bras > BLUEBRAS_
                var newName = "";
                if (name) {
                    var charCode, char;
                    for (var i = 0; i < name.length; i++) {
                        charCode = name.charCodeAt(i);
                        char = name.charAt(i);

                        if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
                            newName += char;
                        }

                    }
                    newName += "_";
                }
                return newName;
            },
            getImageDetailOption: function (filename, option) {
                var op = filename.indexOf(option);
                if (op > -1) {
                    return parseInt(filename.substring(op + option.length, op + option.length + 1));
                } else {
                    return 0;
                }
            },
            getImageDetails: function (filename) { //Parse an image filename and figure out where it should be placed on the site.
                var details = {
                    url: filename
                };
                var sep = filename.lastIndexOf("/");
                if (sep > -1) {
                    filename = filename.substring(sep + 1);
                }
                sep = filename.lastIndexOf("_");
                if (sep > -1) {
                    filename = filename.substring(sep + 1);
                }
                sep = filename.lastIndexOf(".");
                if (sep > -1) {
                    filename = filename.substring(0, sep);
                }
                var parts = filename.split("-");
                if (parts.length == 1) {
                    details.colour = parts[0].toLowerCase();
                } else if (parts.length == 2) {

                    details.colour = parts[0].toLowerCase();
                    details.ban = this.getImageDetailOption(parts[1], "ban") == 1; //banner
                    details.soc = this.getImageDetailOption(parts[1], "soc") == 1; //social
                    details.pdp = this.getImageDetailOption(parts[1], "pdp") == 1; //product details
                    details.plp = this.getImageDetailOption(parts[1], "plp") == 1; //product list
                    details.lit = this.getImageDetailOption(parts[1], "lit") == 1; //light images
                    details.anc = this.getImageDetailOption(parts[1], "anc"); //anchor the image
                    details.ins = this.getImageDetailOption(parts[1], "ins") == 1; //Inset image
                    if (!(details.anc > 0 && details.anc < 9)) {
                        details.anc = 0;
                    }
                    details.pos = this.getImageDetailOption(parts[1], "pos"); //place in a specific position on the product details page.
                    if (!(details.pos > 0)) {
                        details.pos = 0;
                    }

                }
                return details;

            },
            getAllItemImages: function (model, colour) { //Get all relevant images to an item.
                var images = model.getImages();
                if ((images.length == 0 || (images.length == 1 && images[0].url.indexOf("no_image") > -1)) && model.get('matrix_parent')) {
                    //No found, probably on cart line, so search around.
                    var item_images_detail = model.get('matrix_parent').itemimages_detail || {};
                    item_images_detail = item_images_detail.media || item_images_detail;
                    var result = Utils.imageFlatten(item_images_detail);

                    //@class ImageContainer
                    images = result.length ? result : [{
                        //@property {String} url
                        url: Utils.getThemeAbsoluteUrlOfNonManagedResources('img/no_image_available.jpeg', Configuration.get('imageNotAvailable'))
                            //@property {String} altimagetext
                            ,
                        altimagetext: this.get('_name')
                    }];
                }
                //console.log("getImages "+JSON.stringify(images));

                if (colour) {
                    colour = colour.toLowerCase().split(" ").join("");
                }
                var details = {};
                //var url, urlpdp, urlplp, urlsoc, urlban,urlins;

                var imageDetails;
                if (colour) {
                    for (var i = 0; i < images.length; i++) {
                        imageDetails = SC.Tools.getImageDetails(images[i].url);
                        //console.log(colour+" "+ imageDetails.colour+" "+images[i].url)
                        if (colour == imageDetails.colour) {
                            if (imageDetails.pdp) {
                                details.pdp = imageDetails;
                            }
                            if (imageDetails.ban) {
                                details.ban = imageDetails;
                            }
                            if (imageDetails.soc) {
                                details.soc = imageDetails;
                            }
                            if (imageDetails.plp) {
                                details.plp = imageDetails;
                            }
                            if (imageDetails.ins) {
                                details.ins = imageDetails;
                            }
                            if (imageDetails.pos > 0) {
                                if (!details.pos) {
                                    details.pos = [];
                                }
                                details.pos[imageDetails.pos] = imageDetails;
                            }
                        }
                    }
                }
                for (var i = 0; i < images.length; i++) {
                    imageDetails = SC.Tools.getImageDetails(images[i].url);

                    if (!details.pdp && imageDetails.pdp) {
                        details.pdp = imageDetails;
                    }
                    if (!details.ban && imageDetails.ban) {
                        details.ban = imageDetails;
                    }
                    if (!details.soc && imageDetails.soc) {
                        details.soc = imageDetails;
                    }
                    if (!details.plp && imageDetails.plp) {
                        details.plp = imageDetails;
                    }
                    if (!details.ins && imageDetails.ins) {
                        details.ins = imageDetails;
                    }
                    if (imageDetails.pos > 0) {
                        if (!details.pos) {
                            details.pos = [];
                        }
                        if (!details.pos[imageDetails.pos]) {
                            details.pos[imageDetails.pos] = imageDetails;
                        }
                    }

                }
                if (!details.plp) {
                    details.plp = details.pdp || details.soc;
                }
                if (!details.pdp) {
                    details.pdp = details.plp || details.soc;
                }
                if (!details.soc) {
                    details.soc = details.pdp || details.plp;
                }
                return details;
            },
            showErrorInModal: function (application, title, message) {

                var view = new Backbone.View({
                    application: application
                });

                view.title = title;
                view.render = function () {
                    this.$el.append('<p class="error-message">' + message + '</p><br /><div class="text-center"><button class="button-primary button-large" data-dismiss="modal">' + _('OK').translate() + '</button></div>');
                };
                view.showInModal();
            },
            showSuccessInModal: function (application, title, message) {

                var view = new Backbone.View({
                    application: application
                });

                view.title = title;
                view.render = function () {
                    this.$el.append('<p class="success-message">' + message + '</p><br /><div class="text-center"><button class="button-primary button-large" data-dismiss="modal">' + _('OK').translate() + '</button></div>');
                };
                view.showInModal();
            },
getRRP:function(item){ // Get the item RRP price for the current currency
    switch(SC.Tools.getSiteCode()){
        case "Global":
        return item.get("custitem_bb1_usd_rrp");
        case "US":
        return item.get("custitem_bb1_usa_usd_rrp");
        case "Europe":
        return item.get("custitem_bb1_eur_rrp");
    }
    return item.get("custitem_bb1_gbp_rrp");
},

            getCurrency: function () {

                var currency = SC.ENVIRONMENT&&SC.ENVIRONMENT.currentCurrency&&SC.ENVIRONMENT.currentCurrency.code;
                var session_currency = SC.SESSION&&SC.SESSION.currency&&SC.SESSION.currency.code;
                if (currency != session_currency) {
                    console.log("For some reason the site currency " + currency + " does not match the session currency " + session_currency + ".");
                }
                return session_currency||currency;
            },
            getCurrencySymbol: function () {

                var currency = SC.ENVIRONMENT&&SC.ENVIRONMENT.currentCurrency&&SC.ENVIRONMENT.currentCurrency.symbol;
                var session_currency = SC.SESSION&&SC.SESSION.currency&&SC.SESSION.currency.symbol;
                
                return session_currency||currency;
            },
            getSiteCode: function (application) {

                

                if (SC.isPageGenerator()) {
                    return "Global";
                }
                if (this.site || this.redirecting) {
                    //console.log("getSiteCode " + this.site);
                    return this.site;
                }
                var TP = SC.ENVIRONMENT.SCTouchpoint;
               
                if (!Session.get('touchpoints.' + Configuration.get('currentTouchpoint'))) {
                    console.log("Not set TP ");
                    return;
                }
                var site = this.getCookie('region');
                if (site == "undefined") {
                    site = undefined;
                }
                //site = undefined; //TEMP!!!!
                if (site) {
                    console.log("Preferred site is " + site);
                }

                if (TP == "checkout" || TP == "myaccount") {
                    this.site=site;
                    return this.site;
                }

                if (!site) {

                    if (application && !this._geo) {
                        this._geo = true;
                        this.setCookie('region', "UK"); //default to UK.
                        this.site="UK";
                        console.log("Site is not set, so detect site using IP geo.");

                        var key = "58db67ff48d37a703b53d5fa44489c345bd3b090c9627f5cfd263123";
                        $.get("https://api.ipdata.co/?api-key=" + key, function (response) {
                            try {
                                if (response.country_code) {
                                    SC.Tools.setCookie('country', response.country_code);
                                }
                                console.log("The IP geo thinks you are here: " + response.continent_code + " - " + response.country_code);

                                //SC.Tools.showErrorInModal(application,"Testing","The IP geo thinks you are here: " + response.continent_code + " - " + response.country_code);
                                // response.country_name="Sweden";
                                // response.country_code="SW";
                                // response.continent_code="EU";
                                // if (response.country_code == "GB") {
                                //      return;
                                //  }
                                var view = new HomeCurrView({region:"UK", application: application,country_name:response.country_name,continent_code:response.continent_code,country_code:response.country_code });
                //view.title="Myla London";
                view.showInModal();

                                // if (response.country_code == "GB") {
                                //     return SC.Tools.setSiteCode("UK");
                                // }
                                // if (response.country_code == "US") {
                                //     return SC.Tools.setSiteCode("US");
                                // }
                                // if (response.continent_code == "EU") {
                                //     return SC.Tools.setSiteCode("Europe");
                                // }
                                // return SC.Tools.setSiteCode("Global");

                            } catch (err) {
                                console.log("Unable to get IP geo." + err);

                            }

                        }, "jsonp");
                    }
                    return "UK";

                } else {

                    this.site = site;

                    var currency = this.getCurrency();

                    console.log("Site is already set to " + site + " with session currency set to " + currency + ". Check that that site matches the currency, just in case.");


                    var currencies = SC.Tools.getCurrencies();
                    var found = false,
                        alternative;
                    for (var i = 0; i < currencies.length; i++) {
                        if (currencies[i].code == currency) {
                            if (this.site == currencies[i].locale) {
                                found = true;
                                break;
                            } else if (!alternative) {
                                alternative = currencies[i];
                            }
                        }
                    }

                    if (!found) {
                        console.log("Oh no!! Unable to match site to the currency.");
                        if (alternative) {
                            console.log("To match the currency, change the site to " + alternative.locale + ".");
                            return this.setSiteCode(alternative.locale);
                        } else {
                            console.log("No alternative found to match currency. That's pretty bad.");
                        }
                    } else {
                        console.log("All is well, start site as " + site + ".");
                    }



                    return site;
                }

            },
            getCurrencies: function () { //Check for fixed currencies.
                var currencies = Configuration.get('multiDomain.hosts.currencies', []);

                var fixedCurrency;
                if (SC.ENVIRONMENT.fixedCurrency) {
                    fixedCurrency = this.getCurrency();
                }
                var newCurrencies = [];
                for (var i = 0; i < currencies.length; i++) {
                    if (!SC.ENVIRONMENT.fixedCurrency || currencies[i].code == fixedCurrency) {
                        newCurrencies.push(currencies[i]);
                    }
                }
                return newCurrencies;
            },
            setSiteCode: function (code) {

                if (SC.isPageGenerator()) {
                    return "Global";
                }

                if (this.site == code || this.redirecting) {
                    return code;
                }

                var TP = SC.ENVIRONMENT.SCTouchpoint;
                if (TP == "checkout" || TP == "myaccount") {
                    return;
                }

                //console.log("Change Site Code " + this.site + " to " + code + " " + (this.site == code));
                this.oldsite = this.site; //backup

                this._isUSPrice = null;

                var currency = this.getCurrency();
                var currencies = SC.Tools.getCurrencies();

                //var TP = SC.ENVIRONMENT.SCTouchpoint;
                // if (TP == "checkout" || TP == "myaccount") { //Don't change in checkout.
                //     for (var i = 0; i < currencies.length; i++) {
                //         if (currencies[i].code == currency) {
                //             this.site = currencies[i].locale;
                //             break;
                //         }
                //     }
                //     return;
                // }

                var fixedCurrency;
                if (SC.ENVIRONMENT.fixedCurrency) { //Check if the code is the fixed currency. If not, fix it.
                    fixedCurrency = currency;
                    var foundCurrency = false
                    for (var i = 0; i < currencies.length; i++) {
                        if (currencies[i].locale == code) {
                            if (currencies[i].code == fixedCurrency) {
                                foundCurrency = true;
                                break;
                            }
                        }
                    }
                    if (!foundCurrency) {
                        for (var i = 0; i < currencies.length; i++) {
                            if (currencies[i].code == fixedCurrency) {
                                code = currencies[i].locale;
                                console.log("Fixed currency is " + fixedCurrency);
                                break;
                            }
                        }
                    }

                }

                this.setCookie('region', code);
                var newSite = false;
                if (!code) {
                    newSite = true;
                }
                this.site = code;

                for (var i = 0; i < currencies.length; i++) { //Do we need to swap currency?

                    if (currencies[i].locale == code) {
                        //if (currency != currencies[i].code) {
                        console.log("Change site and currency to " + code + " with " + currencies[i].code + " from " + currency + ".");
                        var baseUrl = Session.get('touchpoints.' + Configuration.get('currentTouchpoint'));
                        var ssp = document.location.href.indexOf(".ssp");
                        if (ssp > -1) {
                            baseUrl = document.location.href.substring(0, ssp + 4) + "?";
                        }
                        baseUrl = SC.SESSION.touchpoints.logout;
                        var newHref = Utils.addParamsToUrl(baseUrl, {
                            cur: currencies[i].code
                        });

                        if (newHref) {
                            if (!newSite || currencies[i].code != "GBP") {
                                console.log("Redirect.... " + newHref);

                                this.redirecting = true;
                                window.location.href = newHref;
                            }

                        }
                        return;

                        //}
                    }
                }
                console.log("Update site to " + code + ".");
                return code;

            },
            _adjustPrice: function (price, name, Tax) { //Update a single price
                if (Tax > 0 && price[name]) {
                    var value = price[name];
                    value = Math.round(100 * value * (1 + (Tax / 100))) / 100;
                    price[name] = value;
                    var symbol=SC.Tools.getCurrencySymbol();
                    price[name + "_formatted"] = Utils.formatCurrency(value,symbol);
                }
            },
            updatePriceObject: function (price, taxrate) { //Manipulate the ex VAT display price manually
                var site = this.getSiteCode();
                var Tax = taxrate,
                    message;
                switch (site) {
                    case "UK":
                        Tax = taxrate || 20;
                        break;
                    case "Europe":
                        Tax = taxrate || 20;
                        break;
                    case "US":
                    if(taxrate&&taxrate>0){
                        Tax=taxrate;
                    }else{
                        message = "Ex tax & duties";
                    }
                        break;
                    default:
                    if(taxrate&&taxrate>0){
                        Tax=taxrate;
                    }else{
                        message = "Ex tax & duties";
                    }
                        break;
                }

                this._adjustPrice(price, "price", Tax);
                //this._adjustPrice(price, "compare_price", Tax);
                if (price.min) {
                    this._adjustPrice(price.min, "price", Tax);
                }
                if (price.max) {
                    this._adjustPrice(price.max, "price", Tax);
                }

                return message;
            }

        };


        SC.Tools = Tools;

        return Tools;
    });
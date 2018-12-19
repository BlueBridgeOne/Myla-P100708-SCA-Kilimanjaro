//@module HeaderBar
define(
    'HeaderBar.View', [
        'SC.Configuration', 'Backbone.View', 'Backbone.CompositeView', 'headerbar.tpl', 'Header.MiniCart.View', 'Header.MiniCartSummary.View', 'HeaderMenu.Categories.View', 'HeaderMenu.Search.View', 'Utils', 'jQuery', 'Tools', 'SiteSearch.View'
    ],
    function (
        Configuration, View, BackboneCompositeView, headerbar_tpl, HeaderMiniCartView, HeaderMiniCartSummaryView, HeaderMenuCategoriesView, HeaderMenuSearchView, Utils, jQuery, Tools, SiteSearch
    ) {
        'use strict';

        return Backbone.View.extend({

            initialize: function (options) {
                this.options = options;
                BackboneCompositeView.add(this);
                var self = this;
                this.dark = SC.Tools.dark;
                this.home = SC.Tools.home;
                var SMT = $html.hasClass("ns_is-admin") || $html.hasClass("ns_is-edit");
                if (!SMT) {
                    SC.Tools.onUpdateHeader("bar", function () {
                        self.dark = SC.Tools.dark;
                        self.home = SC.Tools.home;
                        self.render();
                    });
                }
            },
            events: {
                'click [data-action="show-menu"]': 'showMenu',
                'click [data-action="shop-all"]': 'showAll',
                'click [data-action="show-search"]': 'showSearch',
                'click [data-action="hide-menu"]': 'hideMenu',
                'click [data-action="show-submenu"]': 'showSubMenu'
            },
            showSubMenu: function (e) {
                e.preventDefault();
                e.stopPropagation();
                var $this = this.$(e.target);
                if (!$this.hasClass("categories-menu-anchor")) {
                    $this = $this.closest(".categories-menu-anchor");
                }
                var $icon = $this.find(".categories-menu-icon");
                if ($icon.css("display") == "block") {
                    var $categoriesmenu = $this.closest(".categories-menu"),
                        $menu;
                    $(".categories-menu").each(function () {
                        $menu = $(this).find(".header-menu-level2-wrapper");
                        $icon = $(this).find(".categories-menu-icon");
                        if (this == $categoriesmenu[0]) {
                            if ($icon.hasClass("open")) {
                                $icon.removeClass("open");
                                $menu.slideUp();
                            } else {
                                $icon.addClass("open");
                                $menu.slideDown();
                            }
                        } else {
                            $icon.removeClass("open");
                            $menu.slideUp();
                        }
                    });


                } else {
                    var href = $this.attr("data-href");
                    if (href && href.length > 0) {
                        Backbone.history.navigate(href, {
                            trigger: true
                        });
                    }
                }

            },
            showMenu: function (e) {
                this.showDropdown(e, "menu");
            },
            showAll: function (e) {
                this.showDropdown(e, "categories");
            },
            showSearch: function (e) {
                this.showDropdown(e, "search");
            },
            showDropdown: function (e, type) {
                e.preventDefault();
                e.stopPropagation();
                var $header = $("#site-header");
                var shown = $header.hasClass("header-open");
                var show = !shown || type != this._lastDropdownType;
                this._lastDropdownType = type;
                var $dropdown = $(".header-dropdown");
                if (!show) {
                    if (shown) {
                        $header.removeClass("header-open");
                        $dropdown.hide();
                        console.log("Hide menu from dropdown type " + type);
                    }
                } else {
                    //Show or hide the correct dropdown, e.g. categories or search
                    if (type == "categories" || type == "menu") {
                        $("#HeaderCategories").show();
                    } else {
                        $("#HeaderCategories").hide();
                    }
                    if (type == "search") {
                        $("#HeaderSearch").show();
                    } else {
                        $("#HeaderSearch").hide();
                    }
                    if (!shown) {
                        $header.addClass("header-open");
                        $dropdown.show();
                        if (type == "search") {
                            $("#header-search-input").focus();
                        }
                    }
                }
            },
            hideMenu: function (e) {
                console.log("Hide Menu From Header Bar");
                var $header = $("#site-header");
                var $dropdown = $(".header-dropdown");
                $header.removeClass("header-open");
                $dropdown.hide();
            },
            childViews: {
                'Header.MiniCart': function () {
                    return new HeaderMiniCartView();
                },
                'Header.MiniCartSummary': function () {
                    return new HeaderMiniCartSummaryView();
                },
                'HeaderMenu.Categories': function () {
                    return new HeaderMenuCategoriesView();
                },
                'HeaderMenu.Search': function () {
                    return new HeaderMenuSearchView();
                },
                'SiteSearch': function () {
                    return new SiteSearch({
                        application: this.options.application,
                        mobile: true
                    });
                }
            },
            render: function () {
                Backbone.View.prototype.render.call(this);
                SC.Tools.updateHeaderColors(this.$el, true);
            },
            template: headerbar_tpl,
            getContext: function () {
                //console.log("Header Bar " + this.dark + " home - " + this.home);
                var $header = $("#site-header");
                var $dropdown = $(".header-dropdown");
                $header.removeClass("header-open");
                $dropdown.hide();

                var className = "",
                    logoClassName = "";
                if (this.dark) {
                    className = "header-foreground-dark";
                }
                if (this.home) {
                    logoClassName = "header-logo-home";
                }

                return {
                    className: className,
                    logoClassName: logoClassName
                };

            }
        });
    });
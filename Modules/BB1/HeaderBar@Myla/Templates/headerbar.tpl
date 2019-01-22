<div class="header-background header-gradient">
<div class="header-foreground {{className}}">
	<div class="header-logo {{logoClassName}}"><a ontouchstart="" href="/" data-touchpoint="home" data-action="hide-menu">Myla<div class="header-logo-sub">London</div></a></div>
	<div class="header-button header-button-left header-button-menu checkout-hidden">
		<a ontouchstart="" data-action="show-menu">
			<!-- Menu Icon-->
			<svg fill="currentColor" width="23px" height="14px" viewBox="0 0 23 14" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" alt="{{translate 'Menu'}}">
				<g transform="translate(-30.000000, -22.000000)" fill-rule="nonzero">
					<path d="M30,22.8571429 L30,23.8730159 L52.4,23.8730159 L52.4,22.8571429 L30,22.8571429 Z M30,28.4444444 L30,29.4603175 L52.4,29.4603175 L52.4,28.4444444 L30,28.4444444 Z M30,34.031746 L30,35.047619 L52.4,35.047619 L52.4,34.031746 L30,34.031746 Z" id="Shape"></path>
				</g>
			</svg>
		</a>
	</div>
	<div class="header-button header-button-left header-button-shop-all checkout-hidden do-not-print"><a ontouchstart="" data-action="shop-all">{{translate 'Shop All'}}&nbsp;

<!-- Chevron Icon -->
<svg fill="currentColor" width="13px" height="8px" viewBox="0 0 13 8" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <g transform="translate(-114.000000, -51.000000)" fill-rule="nonzero">
        <path d="M122.122214,55.0009156 L117.140229,49.8242843 C116.953257,49.6359164 116.953257,49.3310393 117.140229,49.141276 C117.327202,48.952908 117.629289,48.952908 117.816261,49.141276 L123.278933,54.6583649 C123.465905,54.8474306 123.465905,55.1530053 123.278933,55.3413733 L117.816261,60.8584623 C117.629289,61.0475279 117.327202,61.0468303 117.140229,60.8584623 C116.953257,60.6707919 116.953257,60.3652172 117.140229,60.1754539 L122.122214,55.0009156 Z" id="Shape" transform="translate(120.209581, 55.000000) rotate(90.000000) translate(-120.209581, -55.000000) "></path>
    </g>
</svg>

	</a></div>
	<div class="header-button header-button-left header-button-search checkout-hidden do-not-print"><a ontouchstart="" data-action="show-search">{{translate 'Search'}}&nbsp;

<!--Search Icon -->
<svg fill="currentColor" width="15px" height="15px" viewBox="0 0 15 15" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <g fill-rule="evenodd" transform="translate(-212.000000, -48.000000)" >
        <path d="M218.044274,59.3330143 C215.128101,59.3330143 212.755534,56.9604478 212.755534,54.0442743 C212.755534,51.1281008 215.128101,48.7555343 218.044274,48.7555343 C220.960259,48.7555343 223.333014,51.1281008 223.333014,54.0442743 C223.333014,56.9604478 220.960259,59.3330143 218.044274,59.3330143 Z M227,62.4658373 L222.570114,58.0363286 C223.511509,56.9704586 224.088549,55.5749868 224.088549,54.0442743 C224.088549,50.7114237 221.377125,48 218.044274,48 C214.711424,48 212,50.7114237 212,54.0442743 C212,57.3771249 214.711424,60.0885486 218.044274,60.0885486 C219.574609,60.0885486 220.970459,59.5118871 222.035951,58.5704913 L226.465837,63 L227,62.4658373 Z" id="Page-1"></path>
    </g>
</svg>

</a></div>
	<div class="header-button checkout-hidden do-not-print" data-view="Header.MiniCart"></div>
    <div class="header-button checkout-hidden do-not-print">
        <a ontouchstart="" data-action="show-currencies" href="#">{{selected_currency}}</a>
    </div>
	<div class="header-button header-button-my-account checkout-hidden do-not-print"><a ontouchstart="" href="#" data-touchpoint="customercenter">{{translate 'My Account'}}</a>
	</div>
</div>
<div class="header-dropdown checkout-hidden do-not-print">
	<div id="HeaderCategories" data-view="HeaderMenu.Categories"></div>
	<div id="HeaderSearch" style="display:none;" data-view="HeaderMenu.Search"></div>
    <div id="HeaderCurrencies">
            <ul class="header-currency-list">
                {{#each currencies}}
                <li>
                    <a ontouchstart="" class="header-currency-link" data-action="header-change-currency" data-locale="{{locale}}">
                                {{title}}
                            </a>
                </li>
                {{/each}}

            </ul>
    </div>
</div>
<div class="header-site-search checkout-hidden do-not-print" data-view="SiteSearch" data-type="SiteSearch"></div>
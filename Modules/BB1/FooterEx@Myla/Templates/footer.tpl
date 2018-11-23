{{! © 2017 NetSuite Inc. User may not copy, modify, distribute, or re-bundle or otherwise make available this code; provided, however, if you are an authorized user with a NetSuite account or log-in, you may use this code subject to the terms that govern your access and use. }}
<div class="footer-content">
	<div class="FOOTER_TEXT">
		<a ontouchstart="" href="/" data-touchpoint="home"><h2>Myla</h2>
		<h4>London</h4>
		<img class="footer-logo" alt="Myla Logo" src="/store/img/footer-logo.svg" /></a>
	</div>
	<div class="footer-content-nav">
		{{#if showFooterNavigationLinks}}
		<ul class="footer-content-nav-list">
			{{#each footerNavigationLinks}}
			<li>
				<a ontouchstart="" class="footer-link" href="{{href}}" data-touchpoint="{{dataTouchpoint}}">
							{{text}}
						</a>
			</li>
			{{/each}}
			<li class="checkout-hidden myaccount-hidden">
				<a ontouchstart="" class="footer-link" href="/newsletter" data-touchpoint="home">
							{{translate 'Newsletter'}}
						</a>
			</li>
			<li class="checkout-hidden myaccount-hidden">
				{{#if showCurrencies}}
				<a ontouchstart="" class="footer-link" data-action="show-currencies">
							{{selected_currency}} <span class="caret"></span>
						</a>
						{{else}}
<span class="footer-link" >{{selected_currency}}</span>
{{/if}}
			</li>
			<li class="myaccount-only" style="display:none;">
				<a ontouchstart="" class="footer-link" href="{{logout}}" data-navigation="ignore-click">{{translate 'Logout'}}</a>
			</li>
		</ul>
		{{/if}}
<div class="footer-currency-list-holder checkout-hidden myaccount-hidden hide-scrollbars">
		<ul class="footer-currency-list">
			{{#each currencies}}
			<li>
				<a ontouchstart="" class="footer-currency-link" data-action="change-currency" data-locale="{{locale}}">
							{{title}}
						</a>
			</li>
			{{/each}}
			
		</ul>
	</div>
	</div>
	<div class="FOOTER_TEXT_BOTTOM">
		<a ontouchstart="" href="/"><h2>Myla</h2>
		<h4>London</h4>
	</div>
	
	</div>
</div>
{{!---- Use the following context variables when customizing this template: showFooterNavigationLinks (Boolean) footerNavigationLinks (Array) ----}}
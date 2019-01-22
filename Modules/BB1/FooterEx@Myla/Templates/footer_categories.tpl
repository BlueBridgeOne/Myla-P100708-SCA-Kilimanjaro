<div class="footer-categories">
	<h5 class="footer-categories-subtitle">{{translate 'Our Universe'}}</h5>
	<h2 class="footer-categories-title">{{translate 'Myla Collection'}}</h2>
	<div class="footer-categories-wrapper hide-scrollbars">
		<ul class="footer-categories-list">
			{{#each categories}}
			<li>
				<a href="{{href}}" data-touchpoint="home">
					<span class="footer-categories-img">
						{{#if thumbnail}}
						<img src="{{thumbnail}}" />
						{{else}}
						<div data-cms-area="FOOTER_IMAGE_{{@index}}" data-cms-area-filters="global">
							<span class="FOOTER_PLACEHOLDER">Category Image Placeholder</span>
						</div>
						{{/if}}
					</span>
				</a>

				<a href="{{href}}" data-touchpoint="home">
					<h4 class="footer-categories-collection">{{text}}</h4>
				</a>
			</li>
			{{/each}}
		</ul>
	</div>
</div>
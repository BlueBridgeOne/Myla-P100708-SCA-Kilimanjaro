<ul class="header-menu-level1">
	{{#each categories}} {{#if text}}
	<li class="categories-menu">
		<a class="categories-menu-anchor" data-action="show-submenu" data-href="{{href}}"><h4 class="{{class}}">{{translate text}}

<!-- Chevron Icon -->
<svg class="categories-menu-icon" fill="#333" width="13px" height="8px" viewBox="0 0 13 8" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <g transform="translate(-114.000000, -51.000000)" fill-rule="nonzero">
        <path d="M122.122214,55.0009156 L117.140229,49.8242843 C116.953257,49.6359164 116.953257,49.3310393 117.140229,49.141276 C117.327202,48.952908 117.629289,48.952908 117.816261,49.141276 L123.278933,54.6583649 C123.465905,54.8474306 123.465905,55.1530053 123.278933,55.3413733 L117.816261,60.8584623 C117.629289,61.0475279 117.327202,61.0468303 117.140229,60.8584623 C116.953257,60.6707919 116.953257,60.3652172 117.140229,60.1754539 L122.122214,55.0009156 Z" id="Shape" transform="translate(120.209581, 55.000000) rotate(90.000000) translate(-120.209581, -55.000000) "></path>
    </g>
</svg>


		</h4></a>
		<div class="header-menu-level2-wrapper hide-scrollbars">
		<ul class="header-menu-level2">
			<li>
				<a class="header-menu-level2-anchor" data-touchpoint="home" data-action="hide-menu" href="{{href}}" >{{translate 'Shop All'}}</a>
			</li>
			{{#if categories}} {{#each categories}}
			<li>
				<a class="{{class}}" data-touchpoint="home" data-action="hide-menu" {{objectToAtrributes this}}>{{translate text}}</a>
			</li>
			{{/each}} {{/if}}
		</ul>
	</div>
	</li>
	{{/if}} {{/each}}
	<li class="categories-menu-account">
		<a class="categories-menu-anchor" href="{{myaccounturl}}" ><h4 class="header-menu-level1-anchor">{{translate 'My Account'}}</h4></a>
	</li>


</ul>
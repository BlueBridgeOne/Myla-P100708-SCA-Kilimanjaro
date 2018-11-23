<div class="header-banner BANNER_HOLDER {{className}}" data-parallax="homebanner" data-height="90">
    <div class="BANNER_IMAGE" data-cms-area="HOME_BANNER_IMAGE" data-cms-area-filters="page_type" >
        <div class="BANNER_IMAGE_HOLDER CELL_PLACEHOLDER"><span class="PH_TEXT">Image Placeholder</span></div>
    </div>
    <div class="BANNER-ALIGN">
        <div class="BANNER_TEXT BANNER_HOME">
            <a href="/">
                <h1>Myla</h1>
                <h3>London</h3>
            </a>
            <div class="categories-container">
                {{#each categories}} {{#unless noBar}}<span class="category-bar">|</span>{{/unless}}
                <a class="category-link" href="{{href}}" data-touchpoint="{{dataTouchpoint}}">{{text}}</a> {{/each}}
            </div>
        </div>
    </div>
</div>
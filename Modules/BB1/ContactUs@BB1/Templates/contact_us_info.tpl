{{!=========================================== BB1 - G Truslove Date: Feb 2018 ===========================================}} {{#if companies}} {{#each companies}}
<div class="contactus-infotext">

<h3>Myla</h3>
{{#if address_formatted}}
<p>{{{address_formatted}}}</p>
{{/if}}
<br />
{{#if vat}}
<p>{{translate 'VAT'}} {{vat}}</p>
{{/if}}
{{#if phone}}
<p><strong>{{translate 'Call us:'}}</strong> <a href="tel:{{phone}}">{{phone}}</a></p>
{{/if}}
{{#if email}}
<p><strong>{{translate 'Email:'}}</strong> <a href="mailto:{{email}}">{{email}}</a></p>
{{/if}}

<br />


    {{#if facebook}}
    <p>
        <i class="icon-facebook"></i> <a href="{{facebook}}">Facebook</a>
    </p>{{/if}} {{#if twitter}}
    <p>
        <i class="icon-twitter"></i> <a href="{{twitter}}">Twitter</a>
    </p>{{/if}} {{#if linkedin}}
    <p>
        <i class="icon-linkedin"></i> <a href="{{linkedin}}">LinkedIn</a>
    </p>{{/if}} {{#if instagram}}
    <p>
        <i class="icon-instagram"></i> <a href="{{instagram}}">Instagram</a>
    </p>{{/if}}

    {{/each}} {{/if}}

    </div>

{{!===========================================

   BB1 - G Truslove

   Date: Jun 2018

   ===========================================}}

<div data-view="HeaderBarHome"></div>

<section class="newsletter-container">
    
    <div class="col-xs-12 newsletter-entry-form">
    <h1>{{translate 'Subscribe to our Newsletter'}}</h1>
    

    <form class="newsletter-form">
        <p class="newsletter-required"><small>{{translate 'Required'}}*</small></p>
        <fieldset>
            {{#if usecompanies}}
            <div class="newsletter-company" data-input="company" data-validation="control-group">
                <label for="company">{{translate 'Company Name'}} <small>(Optional)</small></label>
                <span data-validation="control">
                    <input name="company" type="text" id="company" maxlength="50">
                </span>
            </div>
            {{/if}}
            <div class="newsletter-firstname" data-input="firstname" data-validation="control-group">
                <label for="firstname">{{translate 'First Name'}}<small class="newsletter-required">*</small></label>
                <span data-validation="control">
                    <input name="firstname" type="text" id="firstname" maxlength="30">
                </span>
            </div>
            <div class="newsletter-lastname" data-input="lastname" data-validation="control-group">
                <label for="lastname">{{translate 'Last Name'}}<small class="newsletter-required">*</small></label>
                <span data-validation="control">
                    <input name="lastname" type="text" id="lastname" maxlength="30">
                </span>
            </div>
            
            <div class="newsletter-email" data-input="email" data-validation="control-group">
                <label for="email">{{translate 'Email'}}<small class="newsletter-required">*</small></label>
                <span data-validation="control">
                    <input name="email" type="text" id="email" maxlength="100">
                </span>
            </div>
            
            <input name="host" type="hidden" id="host" value="{{host}}">
        </fieldset>

<p class="contact-gdpr-message">{{translate 'By suscribing you agree to Myla&apos;s <a href="/terms">Terms and Conditions </a>.'}}</p>

<p>
<input id="iagree" name="iagree" type="checkbox" value="IAgree" /> {{translate 'I Agree'}} <small class="input-required">*</small>
</p>

        <div class="newsletter-button-container">
            <button class="newsletter-button-submit" type="submit">{{translate 'Subscribe'}}</button>
        </div>
        
    </form>
</div>
</div>
</section>
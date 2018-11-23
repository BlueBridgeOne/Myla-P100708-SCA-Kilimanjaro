{{!===========================================

   BB1 - G Truslove

   Date: Feb 2018

   ===========================================}}

<div data-view="HeaderBarHome"></div>
<section class="contactus-container">
    <h1 class="text-center">{{translate 'Contact Us'}}</h1>
    
    <div class="col-md-7 col-sm-6 entry-form">
    <p>{{translate 'Complete the form below to ask us a question or make a request and a member of our team will contact you shortly.'}}</p>
    <br />

    <small class="contactus-required">{{translate 'Required'}}*</small>

    <form class="contactus-form">
        <fieldset>
            {{#if usecompanies}}
            <div class="contactus-company" data-input="company" data-validation="control-group">
                <label for="company">{{translate 'Company Name'}} <small>(Optional)</small></label>
                <span data-validation="control">
                    <input name="company" type="text" id="company" maxlength="50">
                </span>
            </div>
            {{/if}}
            <div class="contactus-firstname" data-input="firstname" data-validation="control-group">
                <label for="firstname">{{translate 'First Name'}}<small class="contactus-required">*</small></label>
                <span data-validation="control">
                    <input name="firstname" type="text" id="firstname" maxlength="30">
                </span>
            </div>
            <div class="contactus-lastname" data-input="lastname" data-validation="control-group">
                <label for="lastname">{{translate 'Last Name'}}<small class="contactus-required">*</small></label>
                <span data-validation="control">
                    <input name="lastname" type="text" id="lastname" maxlength="30">
                </span>
            </div>
            
            <div class="contactus-email" data-input="email" data-validation="control-group">
                <label for="email">{{translate 'Email'}}<small class="contactus-required">*</small></label>
                <span data-validation="control">
                    <input name="email" type="text" id="email" maxlength="100">
                </span>
            </div>
            <div class="contactus-subject" data-input="title" data-validation="control-group">
                <label for="title">{{translate 'Subject'}}<small class="contactus-required">*</small></label>
                <span data-validation="control">
                    <input name="title" type="text" id="title" maxlength="200">
                </span>
            </div>
            <div class="contactus-message" data-input="incomingmessage" data-validation="control-group">
                <label for="incomingmessage">{{translate 'Message'}}<small class="contactus-required">*</small></label>
                <span data-validation="control">
                    <textarea name="incomingmessage" type="text" id="incomingmessage"></textarea>
                </span>
            </div>
            <input name="host" type="hidden" id="host" value="{{host}}">
            <input name="formtype" type="hidden" id="formtype" value="CONTACTUS">
        </fieldset>

<p class="contact-gdpr-message">{{translate 'By contacting us you agree to Myla&apos;s <a href="/privacy">Privacy Policy
</a> and <a href="/terms">

Terms and Conditions</a>.'}}</p>

<p>
<input id="iagree" name="iagree" type="checkbox" value="IAgree" /> {{translate 'I Agree'}} <small class="input-required">*</small>
</p>

        <div class="contactus-button-container">
            <button class="contactus-button-submit" type="submit">{{translate 'Submit'}}</button>
        </div>
        
    </form>
</div>
<div class="col-md-5 col-sm-6" data-view="ContactUs.Info" >
</div>
</section>
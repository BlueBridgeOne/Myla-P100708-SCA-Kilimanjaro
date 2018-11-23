 {{#if smt}}
 <div class="youtube-holder" style="padding-top:{{aspect}};background-color:black;">
    <h2 style="color:white;position:absolute;left:30px;top:30px;">YouTube ID: {{id}}</h2>
    </div>
    {{else}}
<div class="youtube-holder" style="padding-top:{{aspect}};">
   
<iframe class="youtube-iframe" src="https://www.youtube.com/embed/{{id}}?rel=0&controls=0&showinfo=0&modestbranding=1&color=white" frameborder="0" allow="autoplay; encrypted-media"
    allowfullscreen>
</iframe>
</div>
{{/if}}
<div class="cms-content-bb1_cct_advanced_image">
	<div class="advanced-image-container">
		{{#if hasText}}
		<div class="text-container {{class}}">
			{{{richtext}}}
		</div>
		{{/if}}
		{{#if parallax}}
		<div class="bb1_cct_advanced_image-{{parallax}}" data-parallax="{{parallax}}" data-bg-width="{{bgwidth}}" style="background-image:url('{{resizeImage image resize}}');'"></div>
		{{else}}
		{{#if isHeader}}
			<div id="slider">
			<div id="slider-inner">
			{{#if hasLink}}
				<a href="{{link}}">
			{{/if}}
			<img class="bgimage-slide slide-1" src="{{resizeImage image resize}}" alt="{{alt}}" />
			{{#if has_image_2}}
			<img class="bgimage-slide slide-2" src="{{resizeImage2 image resize}}" />
			{{/if}}
			{{#if has_image_3}}
			<img class="bgimage-slide slide-3" src="{{resizeImage image3 resize}}" />
			{{/if}}
			{{#if hasLink}}
				</a>
			{{/if}}
			</div>
			</div>
		{{else}}
		{{/if}}
		{{/if}}
	</div>
</div>

<script>
	$( document ).ready(function() {
		//console.log("Slides " + $(".bgimage-slide").length);
    	if ($(".bgimage-slide").length) {
			// Initialise slider
			var slide_1 = $(".slide-1").attr("src");
			var slide_2 = $(".slide-2").attr("src");
			var slide_3 = $(".slide-3").attr("src");
			var current_slide = 1;

			var slide_width = $(".slide-1").width() + $(".slide-2").width();

			//console.log("Slide 1 BG: " + slide_1);
			//console.log("Slide 2 BG: " + slide_2);
			//console.log("Slide 3 BG: " + slide_3);
			//console.log("Slide Width: " + slide_width);

			//$("#slider-inner").width(slide_width);

			var banner = $(".BANNER_HOLDER").find(".bgimage-anc-child");
			
			function makeScroll() {
				console.log("Current slide: " + current_slide);

				if (current_slide == 1) {
					//banner.css("background-image", slide_2);
					$(".bgimage-slide:eq(1)").css("margin-left", "-1430px");
					$(".bgimage-slide:eq(0)").animate({marginLeft: '1430px'}, 500);
					$(".bgimage-slide:eq(1)").animate({marginLeft: '0px'}, 500);
					current_slide = 2;
				} else if (current_slide == 2) {
					//banner.css("background-image", slide_3);
					$(".bgimage-slide:eq(0)").css("margin-left", "-1430px");
					$(".bgimage-slide:eq(1)").animate({marginLeft: '1430px'}, 500);
					$(".bgimage-slide:eq(0)").animate({marginLeft: '0px'}, 500);
					current_slide = 1;
				} else if (current_slide == 3) {
					//banner.css("background-image", slide_1);
					current_slide = 1;
				}
			}

			if ( $( ".home-banner" ).length ) {
				//setInterval(makeScroll, 5*1000);
				$(".bgimage-slide").hide();
				$(".bgimage-slide:eq(0)").show();
			} else {
				$(".bgimage-slide").hide();
				$(".bgimage-slide:eq(0)").show();
			}
		}
	});
</script>
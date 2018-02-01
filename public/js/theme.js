(function($) {
    "use strict";

	/*Bootstrap Multilevel Dropdown*/
    $('.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        event.preventDefault();
        event.stopPropagation();
        $(this).parent().siblings().removeClass('open');
        $(this).parent().toggleClass('open');
    });

	$('[data-toggle="tooltip"]').tooltip();


    function filterableGallery(){
        if ( $('.isotope-gallery').length ){
            $('.isotope-gallery').imagesLoaded( function() {

                $(".isotope-gallery").isotope({
                    itemSelector: ".gallery-item",
                    layoutMode: 'masonry',
                    masonry: {
                        columnWidth: '.grid-sizer'
                    }
                });

                // Add isotope click function
                $(".gallery-filter li").on('click',function(){
                    $(".gallery-filter li").removeClass("active");
                    $(this).addClass("active");

                    var selector = $(this).attr("data-filter");
                    $(".filterable-gallery").isotope({
                        filter: selector
                    })
                })

            })
        }
    }
    filterableGallery();

    /*Counter*/
	if ( $('.counter').length ){
		$('.counter').counterUp()
	}

	/*CountDown*/
	if ( $('#coming-soon-countdown').length ){
		 $('#coming-soon-countdown').countdown('2017/7/05', function(event) {
			 $(this).html(event.strftime(
				 '<div class="block days"><span class="number">%-D</span><br><span class="string">%!D:Day,Days;</span></div>'+
				 '<div class="block hours"><span class="number">%H</span><br><span class="string">%!H:Hour,Hours;</span></div>'+
				 '<div class="block minutes"><span class="number">%M</span><br><span class="string">%!M:Minute,Minutes;</span></div>'+
				 '<div class="block seconds"><span class="number">%S</span><br><span class="string">%!S:Second,Seconds;</span></div>'
			))
		})
	}

	/*Time and Date Droper*/
	if ( $('.timedroper').length ){
		$('.timedroper').timeDropper();
	}
	if ( $('.datedroper').length ){
		$('.datedroper').dateDropper();
	}

	function nextPrevControl(){
		if ( $('.popular-fleets-tabs').length ){

			$('.tab-switcher >li:last-child').on('click', function () {
				moveTab("Next")
			});
			$('.tab-switcher >li:first-child').on('click', function () {
				moveTab("Previous")
			});


			function moveTab(nextOrPrev) {
				var currentTab = "";
				$('.popular-fleets-tabs li').each(function () {
					if ($(this).hasClass('active')) {
						currentTab = $(this)
					}
				});

				if (nextOrPrev == "Next" && currentTab.next().length) {
					currentTab.removeClass('active');
					currentTab.next().addClass('active')
				} else if (currentTab.prev().length) {
					currentTab.removeClass('active');
					currentTab.prev().addClass('active')
				}
			}
		}
	}
	nextPrevControl();


	/*Footer Height*/
	if ( $(window).width() < 992 && $(window).width() > 767 ){
		var maxHeight = 0;

		$(".footer-widget").each(function(){
		   if ($(this).height() > maxHeight) { maxHeight = $(this).height(); }
		});

		$(".footer-widget").height(maxHeight);
	}

	/*Category Nav*/
	if ( $('.category-dropdown').length ){

		$('.category-dropdown li.dropdown a').removeClass('active');
		$('.category-dropdown li.dropdown a + ul').slideUp();

		$('.category-dropdown li.dropdown a').on('click', function(e){
			$('.category-dropdown li.dropdown a').removeClass('active');
			$('.category-dropdown li.dropdown a + ul').slideUp();

			$(this).addClass('active');
			$(this).find('+ ul').slideDown();

			return false
		})
	}

	if ( $('.other-images').length ){

		var swiper = new Swiper('.other-images', {
			scrollbar: '.swiper-scrollbar',
			scrollbarHide: false,
			slidesPerView: 'auto',
			centeredSlides: true,
			spaceBetween: 5,
			grabCursor: true
		});


		$('.other-images').magnificPopup({
			delegate: 'a',
			type: 'image',
			closeOnContentClick: false,
			closeBtnInside: false,
			mainClass: 'mfp-with-zoom mfp-img-mobile',
			image: {
				verticalFit: true,
				titleSrc: function(item) {
//					return item.el.attr('title') + ' &middot; <a class="image-source-link" href="'+item.el.attr('data-source')+'" target="_blank">image source</a>';
				}
			},
			gallery: {
				enabled: true
			},
			zoom: {
				enabled: true,
				duration: 300, // don't foget to change the duration also in CSS
				opener: function(element) {
					return element.find('img');
				}
			}

		})
	}

    $(document).ready(function(){


    });

    $(window).load(function(){




    })

})(jQuery)

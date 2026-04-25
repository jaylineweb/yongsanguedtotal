(function ($) {
	'use strict';

	$(function () {

		var $window = $(window),
			$container = $('#container'),
			$contents = $('#contents'),
			debounceCourse = null,
			debounceQuick = null;

		var $courseSliders = $('.course_slider');

		var $rowgroup1 = $('.rowgroup1');
		if ($rowgroup1.length) {
			var raf = window.requestAnimationFrame || function(fn) { return setTimeout(fn, 50); };
			raf(function() {
				$rowgroup1.addClass('is-loaded');
			});
		}

		function initCourseSlider($slider) {

			var $tab = $slider.closest('.tabitem');
			var $bar = $tab.find('.statebar');
			var $control = $tab.find('.course_slider_control');

			if ($slider.hasClass('slick-initialized')) return;
			$slider.off('init.course reInit.course afterChange.course');
			$slider.on('init.course reInit.course afterChange.course', function(e, slick, current) {
				var i = (current || 0) + 1;
				var total = slick.slideCount;
				var percent = (i / total) * 100;
				$bar.css('width', percent + '%');
			});

			$slider.slick({

				autoplay: true,
				autoplaySpeed: 2000,
				slidesToShow: 4,
				slidesToScroll: 1,
				infinite: true,
				speed: 800,
				variableWidth: true,
				autoArrow: $control.find('.auto'),
				prevArrow: $control.find('.prev'),
				nextArrow: $control.find('.next'),
				isRunOnLowIE : false,
				pauseOnArrowClick : true,
				pauseOnDirectionKeyPush : true,
				pauseOnSwipe : true,
				pauseOnDotsClick : true,
				pauseText : '정지',
				playText : '재생',
				responsive: [
					{
						breakpoint: 1501,
						settings: {
							slidesToShow: 4,
							variableWidth: false,

						}
					},
					{
						breakpoint: 1201,
						settings: {
							slidesToShow: 3,

						}
					},
					{
						breakpoint: 1001,
						settings: "unslick"
					}
				]
			});
		}


		function checkCourseSlider() {
			var winW = $(window).width();
			$courseSliders.each(function() {
				var $slider = $(this);
				if (winW > 1000) {
					if (!$slider.hasClass('slick-initialized')) {
						initCourseSlider($slider);
					}
				}
			});
		}

		checkCourseSlider();

		var resizeTimer = null;
		$(window).on('resize.courseSliderReinit', function() {
			clearTimeout(resizeTimer);
			resizeTimer = setTimeout(function() {
				checkCourseSlider();
			}, 150);
		});

		$('.filter_btn').on('click', function() {
			var linkMap = {
				"all": "/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal",
				"n1": "/course/list.do?category=digital",
				"n2": "/course/list.do?category=hobby",
				"n3": "/course/list.do?category=culture"
			};

			var $this = $(this),
				type = $this.data('type'),
				idx = $this.closest('.filter_item').index(),
				$tabs = $('.course_results .tabitem'),
				$target = $tabs.eq(idx);

			$('.filter_btn').removeClass('is_active').removeAttr('title');
			$this.addClass('is_active').attr('title', '선택됨');

			$tabs.removeClass('active');
			$target.addClass('active');

			var $targetMoreBtn = $target.find('.more_btn');
			var targetHref = linkMap[type];

			//if (type === 'all' || !targetHref) {
			//	$targetMoreBtn.hide();
			//} else {
			//	$targetMoreBtn.show().attr('href', targetHref);
			//}
			if (targetHref) {
				$target.find('.more_btn').show().attr('href', targetHref);
			}


			var $slider = $target.find('.course_slider');

			if ($(window).width() > 1000 && !$slider.hasClass('slick-initialized')) {
				initCourseSlider($slider);
			}

			if ($slider.hasClass('slick-initialized')) {
				$slider.slick('setPosition');
			}
		}).filter('.is_active').triggerHandler('click');

		var $popupzone = $container.find('.popupzone'),
			$popupzoneList = $popupzone.find('.popupzone_list'),
			$popupzoneCurrent = $popupzone.find('.countbox .current'),
			$popupzoneTotal = $popupzone.find('.countbox .total'),
			$popupzonePrev = $popupzone.find('.control_btns .prev'),
			$popupzoneNext = $popupzone.find('.control_btns .next'),
			$popupzoneAuto = $popupzone.find('.control_btns .auto');

		$popupzoneList.slick({

			slidesToShow: 1,
			slidesToScroll: 1,
			swipe: false,
			draggable: false,
			swipeToSlide: false,
			infinite: true,
			variableWidth: false,
			current: $popupzoneCurrent,
			total: $popupzoneTotal,
			playText: '재생',
			pauseText: '정지',
			isRunOnLowIE : false,
			pauseOnArrowClick : true,
			pauseOnDirectionKeyPush : true,
			pauseOnSwipe : true,
			pauseOnDotsClick : true,

			prevArrow: $popupzonePrev,
			nextArrow: $popupzoneNext,

			autoArrow: $popupzoneAuto,
			speed: 1000,
			autoplaySpeed: 8000,
			autoplay: true,

			dots: false,
			customState: function (state) {
				//현재 슬라이드 위치가 10보다 작을 때
				if (state.current < 10) {
					state.current = '0' + state.current;
				}
				//슬라이드 갯수가 10보다 작을 때
				if (state.total < 10) {
					state.total = '0' + state.total;
				}
				return state;
			},
			responsive: [
				{
					breakpoint: 1001,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						swipe : true,
						draggable : true,
						swipeToSlide : true,
						touchThreshold : 100,
						variableWidth:false,
					},
				},
				{
					breakpoint: 641,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						variableWidth:false,
					},
				}
			]
		});

		var $newsWrap = $container.find('.rowgroup3 .news_wrap .news_inner'),
			$newsList = $newsWrap.find('.news_list'),
			$newsPrev = $newsWrap.find('.news_control_prev'),
			$newsNext = $newsWrap.find('.news_control_next');

		if ($newsList.length) {
			$newsList.slick({
				autoplay: false,
				dots: false,
				swipe: true,
				draggable: true,
				swipeToSlide: true,
				touchThreshold: 100,
				slidesToScroll: 1,
				slidesToShow: 2,
				speed: 500,
				variableWidth: true,
				infinite: true,

				prevArrow: $newsPrev,
				nextArrow: $newsNext,

				cssEase: 'ease-out',
				responsive: [
					{
						breakpoint: 1301,
						settings: {
							slidesToShow: 2,
							swipeToSlide: true,
							touchThreshold: 100
						}
					},
					{
						breakpoint: 1001,
						settings: {
							slidesToShow: 1,
							prevArrow: false,
							nextArrow: false,
							variableWidth: true,
							swipeToSlide: true,
							touchThreshold: 100
						}
					}
				],
			});
		}


		var $quickList = $container.find('.rowgroup4 .quick_box .quick_list');

		function toggleQuickSlick() {
			if (!$quickList.length) return;

			var isMobile = $window.width() <= 1000;
			var isInited = $quickList.hasClass('slick-initialized');

			if (isMobile && !isInited) {
				$quickList.slick({
					autoplay: false,
					dots: false,
					arrows: false,
					swipe: true,
					draggable: true,
					swipeToSlide: true,
					touchThreshold: 100,
					slidesToScroll: 3,
					slidesToShow: 1,
					variableWidth: true,
					infinite: true,
					speed: 400,
					cssEase: 'ease-out',
					responsive: [
						{
							breakpoint: 641,
							settings: {
								slidesToShow: 3,
								variableWidth: true,
							}
						}
					]
				});
			} else if (!isMobile && isInited) {
				$quickList.slick('unslick');
			}
		}

		toggleQuickSlick();

		$window.on('resize.quickSlick', function () {
			clearTimeout(debounceQuick);
			debounceQuick = setTimeout(toggleQuickSlick, 150);
		});
	});
})(window.jQuery);

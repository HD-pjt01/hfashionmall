$(function() {
	$('#btn-SearchLayer').click(function() {
		$('#headerSearch').show();
	});
});

$(function() {
	$('#btn-search-close').click(function() {
		$('#headerSearch').hide();
	});
});

$(document).ready(function() {
	var swiper = new Swiper('.section1',
		{
			speed: 500,
			spaceBetween: 5,
			slidesPerView: 1,
			loop: true,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
				clickable: true,
			},
			/*  on: {
				slideChange: function () {
				  $('.box').removeClass('active');
				  $('.box').eq(this.realIndex).addClass('active');
				}
			  }*/
		});

	var swiper = new Swiper('.section2',
		{
			speed: 500,
			spaceBetween: 20,
			slidesPerView: 5,
			loop: true,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
				clickable: true,
			},
			/*  on: {
				slideChange: function () {
				  $('.box').removeClass('active');
				  $('.box').eq(this.realIndex).addClass('active');
				}
			  }*/
		});

})


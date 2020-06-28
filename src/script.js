$('#screenshot-slideshow').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  fade: true,
  asNavFor: '#screenshot-slideshow-nav',
});

$('#screenshot-slideshow-nav').slick({
  arrows: false,
  slidesToShow: 4,
  slidesToScroll: 1,
  asNavFor: '#screenshot-slideshow',
  dots: true,
  centerMode: true,
  focusOnSelect: true,
  responsive: [
    {
      breakpoint: 580,
      settings: {
        slidesToShow: 2,
      },
    },
    {
      breakpoint: 760,
      settings: {
        slidesToShow: 3,
      },
    },
  ],
}).removeClass('hidden');

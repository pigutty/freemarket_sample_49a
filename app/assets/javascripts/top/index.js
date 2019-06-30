$(function() {
  $('.slider').slick({
    dots: true,
    prevArrow:'<img src="/assets/prev.png" class="slick-prev">',
    nextArrow:'<img src="/assets/next.png" class="slick-next">'
  });
  $('.slick-dots').find('li').on('mouseover', function() {
    $(this).click();
  });
});
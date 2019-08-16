$(document).on('turbolinks:load',function(){
  $('.listing__form__price__box__price__right__default').on('keyup',function(){
    var price = $('.listing__form__price__box__price__right__default').val();
    var salesfee = price * 0.1
    var salesprofit = price - salesfee
    $('#salesfee').text(salesfee);
    $('#salesprofit').text(salesprofit);
  })
});

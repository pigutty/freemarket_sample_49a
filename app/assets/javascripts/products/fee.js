$(document).on('turbolinks:load',function(){
  $('.listing__form__price__box__price__right__default').on('keyup',function(){
    var price = $('.listing__form__price__box__price__right__default').val();
    if (price >=300 && price <= 9999999){
      var salesfee = price * 0.1
      var salesprofit = price - salesfee
      $('#salesfee').text('¥' + String(salesfee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
      $('#salesprofit').text('¥' + String(salesprofit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    }
    else{
      return;
    }
  })
});

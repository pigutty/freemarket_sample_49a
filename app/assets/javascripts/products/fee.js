$(document).on('turbolinks:load',function(){
  var price = $('.listing__form__price__box__price__right__default').val();
  console.log(price);
  if(price != 0){
    console.log('ここ');
    var salesfee = Math.round(price * 0.1)
    var salesprofit = price - salesfee
    $('#salesfee').text('¥' + String(salesfee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    $('#salesprofit').text('¥' + String(salesprofit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  }

  $('.listing__form__price__box__price__right__default').on('keyup',function(){
    var price = $('.listing__form__price__box__price__right__default').val();
    if (price >=300 && price <= 9999999){
      var salesfee = Math.round(price * 0.1)
      var salesprofit = price - salesfee
      $('#salesfee').text('¥' + String(salesfee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
      $('#salesprofit').text('¥' + String(salesprofit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    }
    else{
      return;
    }
  })
});

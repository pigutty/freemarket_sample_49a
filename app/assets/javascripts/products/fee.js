$(document).on('turbolinks:load', function(){
  $('.listing__form__price__box__price__right__default').change(function(){
    console.log('ここ');
    var price = ('.listing__form__price__box__price__right__default').val();
    console.log(price);
  });
});
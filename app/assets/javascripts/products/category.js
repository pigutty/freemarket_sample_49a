$(document).on('turbolinks:load', function(){




  $('.listing__form__detail__box__form-group__category-select').eq(0).change(function(){
    var bigcategoryid = $(this).val();
    console.log(bigcategoryid);
    $('.listing__form__detail__box__form-group').eq(1).css('display','block');
  });



  $('.listing__form__detail__box__form-group__category-select').eq(1).change(function(){
    console.log('test');
    $('.listing__form__detail__box__form-group').eq(2).css('display','block');
  });


});
$(document).on('turbolinks:load', function(){ 
  $('#big-category').eq(0).change(function(){
    var bigvalue = document.getElementById('big-category').value;
    var middlecategory = $('.listing__form__detail__box__form-group').eq(bigvalue);
    $('.middle-category').css('display', 'none');
    middlecategory.css('display','block');
    middlecategory.children('select').attr("id", "middle-category");

    middlecategory.change(function(){
      var middlevalue = document.getElementById('middle-category').value;
      var smallcategory = $('.listing__form__detail__box__form-group').eq(middlevalue)
      $('.small-category').css('block', 'none');
      smallcategory.css('display','block');
    });
  });
});
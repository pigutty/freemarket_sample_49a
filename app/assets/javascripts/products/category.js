$(document).on('turbolinks:load', function(){ 
  $('#big-category').change(function(){
    var bigvalue = document.getElementById('big-category').value;
    var middlecategory = $('.listing__form__detail__box__form-group.middle-category').eq(bigvalue-1);
    $('.middle-category').css('display', 'none');
    $('.small-category').css('display', 'none');
    $('.middle-category').children('select').removeAttr("id");
    middlecategory.css('display','block');
    middlecategory.children('select').attr("id", "middle-category");
    middlecategory.change(function(){
      var middlevalue = document.getElementById('middle-category').value;
      var smallcategory = $('.small-category').eq(middlevalue-14);
      $('.small-category').css('display', 'none');
      $('.small-category').children('select').removeAttr("id");
      smallcategory.css('display','block');
      smallcategory.children('select').attr("id", "small-category");
      smallcategory.change(function(){
        var smallvalue = document.getElementById('small-category').value;
        $('.lastchoice-category').children('select').val(smallvalue);
      });
    });
  });
});
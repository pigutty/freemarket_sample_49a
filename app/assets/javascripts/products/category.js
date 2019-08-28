$(document).on('turbolinks:load', function(){ 
  $('#big-category').change(function(){
    var bigvalue = document.getElementById('big-category').value;
    $('#input_category_grandparent').attr('value',bigvalue);
    var middlecategory = $('.middle-category').eq(bigvalue-1);
    $('.middle-category').css('display', 'none');
    $('.small-category').css('display', 'none');
    $('.middle-category').children('select').removeAttr("id");
    middlecategory.css('display','block');
    middlecategory.children('select').attr("id", "middle-category");

    middlecategory.change(function(){
      var middlevalue = document.getElementById('middle-category').value;
      $('#input_category_parent').attr('value',middlevalue);
      var smallcategory = $('.small-category').eq(middlevalue-14);
      $('.small-category').css('display', 'none');
      $('.small-category').children('select').removeAttr("id");
      smallcategory.css('display','block');
      smallcategory.children('select').attr("id", "small-category");
      
      smallcategory.change(function(){
        var smallvalue = document.getElementById('small-category').value;
        $('#input_category').attr("value",smallvalue);
        // $('.lastchoice-category').children('select').val(smallvalue);
      });
    });
  });
});

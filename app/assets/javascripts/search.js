$(document).on('turbolinks:load', function(){
  $(document).on('change', '.order-select', function () {
    $('#search_submit').trigger('click');
  });

  $('#search-clear').click(function(e){
    $('.search-box').find('select').val("");
    $('.search-box').find('input').val("");
    $('.middle-category').css('display','none');
    $('.small-category').css('display','none');
    $('#search_submit').val("完了");
    e.preventDefault();
    return false;
  });
});

$(document).on('turbolinks:load', function(){
  var number = $('.mypage__main__header').attr("data-id")
  $('.mypage-nav-list-item').eq(number).addClass('avtive');
});

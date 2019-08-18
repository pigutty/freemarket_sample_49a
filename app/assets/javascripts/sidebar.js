$(document).on('turbolinks:load', function(){
  var number = $('.mypage__main').attr("data")
  $('.mypage-nav-list-item').eq(number).addClass('avtive');
});

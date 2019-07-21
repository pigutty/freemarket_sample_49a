$(document).on('turbolinks:load', function(){
  $(".mypage__main__information__tab__title").click(function(){
    $('.mypage__main__information__tab__title.active').removeClass("active");
    $(this).addClass("active");
    $(".mypage__main__information__content").removeClass('is-shown');
    const index = $(this).index();
    $(".mypage__main__information__content").eq(index).addClass("is-shown");
  });
  $(".mypage__main__tradehistory__bottom__tab__name").click(function(){
    $('.mypage__main__tradehistory__bottom__tab__name.active').removeClass("active");
    $(this).addClass("active");
    $(".mypage__main__tradehistory__bottom__content__now__list.is-shown").removeClass('is-shown');
    const index = $(this).index();
    $(".mypage__main__tradehistory__bottom__content__now__list").eq(index).addClass("is-shown");
  });
});

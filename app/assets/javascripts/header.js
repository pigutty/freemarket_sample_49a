$(function() {
  $(".header-bottom__search-menu__category").hover(function(){
    $(".header-bottom__search-menu__category__wrapper__1").css('display','block');
    }, function(){
    $(".header-bottom__search-menu__category__wrapper__1").css('display','none');
  });






  $(".header-bottom__search-menu__category__wrapper").hover(function(){
    $(".header-bottom__search-menu__category__wrapper__wrapper__1").css('display','block');
    $(".header-bottom__search-menu__category__wrapper").css('width','448px');
    }, function(){
    $(".header-bottom__search-menu__category__wrapper__wrapper__1").css('display','none');
    $(".header-bottom__search-menu__category__wrapper").css('width','224px');
  });




$(".header-bottom__search-menu__category__wrapper__wrapper").hover(function(){
  $(".header-bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','block');
  $(".header-bottom__search-menu__category__wrapper").css('width','772px');
}, function(){
  $(".header-bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','none');
  $(".header-bottom__search-menu__category__wrapper").css('width','448px');
});

$(".header-bottom__search-menu__category__wrapper__wrapper__wrapper").hover(function(){
}, function(){
});

$(".header-bottom__search-menu__brand").hover(function(){
  $(".header-bottom__search-menu__brand__wrapper__1").css('display','block');
  }, function(){
  $(".header-bottom__search-menu__brand__wrapper__1").css('display','none');
});

$(".header-bottom__user-menu__notification").hover(function(){
  $(".header-bottom__user-menu__notification__wrapper").css('display','block');
  }, function(){
  $(".header-bottom__user-menu__notification__wrapper").css('display','none');
});

$(".header-bottom__user-menu__todolist").hover(function(){
  $(".header-bottom__user-menu__todolist__content").css('display','block');
  }, function(){
  $(".header-bottom__user-menu__todolist__content").css('display','none');
});

$(".header-bottom__user-menu__mypage").hover(function(){
  $(".header-bottom__user-menu__mypage__box").css('display','block');
  }, function(){
  $(".header-bottom__user-menu__mypage__box").css('display','none');
});

})

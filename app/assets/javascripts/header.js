$(function() {
  $(".header__wrapper__bottom__search-menu__category").hover(function(){
    $(".header__wrapper__bottom__search-menu__category__wrapper__1").css('display','block');
    }, function(){
    $(".header__wrapper__bottom__search-menu__category__wrapper__1").css('display','none');
  });






  $(".header__wrapper__bottom__search-menu__category__wrapper").hover(function(){
    $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__1").css('display','block');
    $(".header__wrapper__bottom__search-menu__category__wrapper").css('width','448px');
    }, function(){
    $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__1").css('display','none');
    $(".header__wrapper__bottom__search-menu__category__wrapper").css('width','224px');
  });




$(".header__wrapper__bottom__search-menu__category__wrapper__wrapper").hover(function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','block');
  $(".header__wrapper__bottom__search-menu__category__wrapper").css('width','772px');
}, function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','none');
  $(".header__wrapper__bottom__search-menu__category__wrapper").css('width','448px');
});

$(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__wrapper").hover(function(){
}, function(){
});

$(".header__wrapper__bottom__search-menu__brand").hover(function(){
  $(".header__wrapper__bottom__search-menu__brand__wrapper__1").css('display','block');
  }, function(){
  $(".header__wrapper__bottom__search-menu__brand__wrapper__1").css('display','none');
});

$(".header__wrapper__bottom__user-menu__notification").hover(function(){
  $(".header__wrapper__bottom__user-menu__notification__wrapper").css('display','block');
  }, function(){
  $(".header__wrapper__bottom__user-menu__notification__wrapper").css('display','none');
});

$(".header__wrapper__bottom__user-menu__todolist").hover(function(){
  $(".header__wrapper__bottom__user-menu__todolist__content").css('display','block');
  }, function(){
  $(".header__wrapper__bottom__user-menu__todolist__content").css('display','none');
});

$(".header__wrapper__bottom__user-menu__mypage").hover(function(){
  $(".header__wrapper__bottom__user-menu__mypage__box").css('display','block');
  }, function(){
  $(".header__wrapper__bottom__user-menu__mypage__box").css('display','none');
});

})

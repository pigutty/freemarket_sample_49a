$(document).on('turbolinks:load', function(){
  $(".header-bottom__search-menu__brand").hover(function(){
    $(".header-bottom__search-menu__brand__wrapper__1").css('display','block');
    $(".header-bottom__search-menu__brand__icon").css('color','#0099e8');
    }, function(){
    $(".header-bottom__search-menu__brand__wrapper__1").css('display','none');
    $(".header-bottom__search-menu__brand__icon").css('color','black');
  });

  $(".header-bottom__search-menu__brand__wrapper__1").hover(function(){
    $(this).css('background-color','red');
    $(this.children).css('color','white')
    }, function(){
    $(this).css('background-color','white');
    $(this.children).css('color','black');
  });

  $(".header-bottom__user-menu__good").hover(function(){
    $(".far.fa-heart").css('color','#0099e8');
    $(".header-bottom__user-menu__good__icon").css('color','#0099e8');
    }, function(){
    $(".header-bottom__user-menu__good__icon").css('color','black');
    $(".far.fa-heart").css('color','#ccc');
  });

  $(".header-bottom__user-menu__notification").hover(function(){
    $(".header-bottom__user-menu__notification__wrapper").css('display','block');
    $(".header-bottom__user-menu__notification__icon").css('color','#0099e8');
    $(".fas.fa-bell").css('color','#0099e8');
    }, function(){
    $(".header-bottom__user-menu__notification__wrapper").css('display','none');
    $(".header-bottom__user-menu__notification__icon").css('color','black');
    $(".fas.fa-bell").css('color','#ccc');
  });

  $(".header-bottom__user-menu__notification__wrapper__content").hover(function(){
    $(this).css('background-color','#ccc');
    }, function(){
    $(this).css('background-color','white');
  });

  $(".header-bottom__user-menu__todolist").hover(function(){
    $(".header-bottom__user-menu__todolist__content").css('display','block');
    $(".header-bottom__user-menu__todolist__icon").css('color','#0099e8');
    $(".fa.fa-check").css('color','#0099e8');
    }, function(){
    $(".header-bottom__user-menu__todolist__content").css('display','none');
    $(".header-bottom__user-menu__todolist__icon").css('color','black');
    $(".fa.fa-check").css('color','#ccc');
  });

  $(".header-bottom__user-menu__mypage").hover(function(){
    $(".header-bottom__user-menu__mypage__box").css('display','block');
    $(".header-bottom__user-menu__mypage__icon").css('color','#0099e8');
    }, function(){
    $(".header-bottom__user-menu__mypage__box").css('display','none');
    $(".header-bottom__user-menu__mypage__icon").css('color','black');
  });

  $(".user_menu_card").hover(function(){
    $(this).css('background-color','#ccc');
    }, function(){
    $(this).css('background-color','white');
  });

  $(".user_status").hover(function(){
    $(this.children).css('color','gray');
    }, function(){
    $(this.children).css('color','black');
  });
})

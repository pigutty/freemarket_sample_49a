// function buildHTML_category_parent(){
//   var category_parent_html = 
//   `<ul class="header__wrapper__bottom__search-menu__category__parent">レディース</ul>
//     <ul class="header__wrapper__bottom__search-menu__category__parent">メンズ</ul>
//     <ul class="header__wrapper__bottom__search-menu__category__parent">ベビーキッズ</ul>`
//     return category_parent_html;
// }

// function buildHTML_category_child(){
//   var category_child_html = 
//   `<ul class="header__wrapper__bottom__search-menu__category__parent__child" >トップス</ul>
//     <ul class="header__wrapper__bottom__search-menu__category__parent__child" >アウター</ul>
//     <ul class="header__wrapper__bottom__search-menu__category__parent__child">パンツ</ul>`
//     return category_child_html;
// }

// function buildHTML_brand_parent(){
//   var brand_parent_html = 
//   `<ul class="header__wrapper__bottom__search-menu__brand__parent">シャネル</ul>
//     <ul class="header__wrapper__bottom__search-menu__brand__parent">ナイキ</ul>
//     <ul class="header__wrapper__bottom__search-menu__brand__parent">ヴィトン</ul>`
//     return brand_parent_html;
// }

$(function() {
//   $(".header__wrapper__bottom__search-menu__category").hover(function(){
//     $(this).append(buildHTML_category_parent);
//     $(".header__wrapper__bottom__search-menu__category__parent").hover(function(){
//       $(this).append(buildHTML_category_child);
//     }, function(){
//       $(this).find(".header__wrapper__bottom__search-menu__category__parent__child").remove();
//     });
//   }, function(){
//     $(this).find(".header__wrapper__bottom__search-menu__category__parent").remove();
//   });

$(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__1").hover(function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','block');
}, function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__wrapper__1").css('display','none');
});

$(".header__wrapper__bottom__search-menu__category__wrapper__1").hover(function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__1").css('display','block');
}, function(){
$(".header__wrapper__bottom__search-menu__category__wrapper__wrapper__1").css('display','none');
});

$(".header__wrapper__bottom__search-menu__category").hover(function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__1").css('display','block');
}, function(){
  $(".header__wrapper__bottom__search-menu__category__wrapper__1").css('display','none');
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
  $(".header__wrapper__bottom__user-menu__mypage__todolist__content").css('display','block');
}, function(){
  $(".header__wrapper__bottom__user-menu__mypage__todolist__content").css('display','none');
});

$(".header__wrapper__bottom__user-menu__mypage").hover(function(){
  $(".header__wrapper__bottom__user-menu__mypage__box").css('display','block');
}, function(){
  $(".header__wrapper__bottom__user-menu__mypage__box").css('display','none');
});
//   // $(".header__wrapper__bottom__search-menu__category").hover(function(){
//   //   $(this).append(buildHTML_category_parent);
//   // }, function(){
//   //   $(this).find(".header__wrapper__bottom__search-menu__category__parent").remove();
//   // });


// header__wrapper__bottom__user-menu__notification__wrapper











})

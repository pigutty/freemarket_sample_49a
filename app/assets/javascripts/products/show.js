$(function () {
  var slider = '.item-detail__image__sliders';
  var thumbnailItem = '.item-detail__image__thumbnail';
  //サムネイルのインデックス番号を取得
  $(thumbnailItem).each(function () {
    var index = $(thumbnailItem).index(this);
  });
  $(slider).on('init', function () {
    var index = $('.slick-slide.slick-current').attr('data-slick-index');
    $(thumbnailItem + '[data-index="'+index+'"]').addClass('thumbnail-current');
  });

  $(slider).slick({
    arrows: false,
  });

  $(thumbnailItem).on('click',function(){
    var index = $(this).attr('data-index');
    $(slider).slick("slickGoTo",index,false);
  });

  $(slider).on('beforeChange',function(event,slick,currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass('thumbnail-current');
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
});
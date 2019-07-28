$(document).on('turbolinks:load', function(){
  var slider = ".item-detail__image__sliders";
  var thumbnailItem = ".item-detail__image__thumbnail";

  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });

  $(slider).slick({
    arrows: false,
    infinite: false
  });

  $(thumbnailItem).on('click',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
});

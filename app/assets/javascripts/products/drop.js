$(document).on('turbolinks:load',function(){
  var imagesLength = $('.images-lists-box').children().length;
  $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
  function buildpreview(){
    var html = `<ul class="listing-image-container">
                  <li class="image-box">
                    <img class="preview-zone"></img>
                  </li>
                  <div class="button">
                    <a class="edit">編集</a>
                    <a class="delete">削除</a>
                  </div>
                </ul>`
    return html;
  }
  $('.listing-upload-drop-file').change(function(e){
    var imagesLength = $('.images-lists-box').children().length;
    var file = e.target.files[0];
    var html = buildpreview();
    var reader = new FileReader();
    $('.images-lists-box').append(html);
    reader.onload = function(){
      $('.preview-zone').last().attr('src', reader.result);
    }
    reader.readAsDataURL(file);
    imagesLength += 1
    if (imagesLength < 5){
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength) }px`);
      $(".listing__form__upload__box__preview").eq(imagesLength-1).css("display","none");
      $(".listing__form__upload__box__preview").eq(imagesLength).css("display","block");
    }else if( imagesLength == 5 ){
      $('.images-lists-box').css('height','344px');
      $('.images-lists-box').css('width', '620px');
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength-1).css('display','none');
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
    }
    else{
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);
      $(".listing__form__upload__box__preview").eq(imagesLength-1).css("display","none");
      $(".listing__form__upload__box__preview").eq(imagesLength).css("display","block");
    }
  });


  $(document).on('mouseenter', '.edit,.delete', function(){
    $(this).css(
      'opacity', '0.7',
      );
  });
  $(document).on('mouseleave', '.edit,.delete', function(){
    $(this).css(
      'opacity', '1'
      );
  });


  $(document).on('click',".images-lists-box .listing-image-container .button .delete",function(){
    var index = $(this).index();
    reload_url_pattern = /products/;
    var api_url = window.location.pathname.replace(reload_url_pattern,'api/products');
    console.log(api_url);
    $.ajax({
      type: "GET",
      url: api_url,
      data: { index: index },
      dataType: 'json',
    })
    .done(function(){
      console.log("done");
    })
    .fail(function(){
      console.log('fail');
    })
  })

  $(document).on('click',".images-lists-box .listing-image-container .button .edit",function(){
    var index = $(this).index();
    reload_url_pattern = /products/;
    var api_url = window.location.pathname.replace(reload_url_pattern,'api/products');
    $.ajax({
      type: "GET",
      url: api_url,
      data: { index:index, file: image },
      dataType: 'json',
    })
    .done(function(){
      console.log("done");
    })
    .fail(function(){
      console.log('fail');
    })
  })

  $(document).on('click', '.delete', function(){
    var imagesLength = $('.images-lists-box').children().length;
    $(this).parents('.listing-image-container').remove();
    imagesLength -= 1;
    if (imagesLength < 5){
      $('.images-lists-box').css('height', '172px');
      $('.images-lists-box').css('width', '620px');
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * imagesLength }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength+1).css('display','none');
      $('.listing-upload-drop-file').eq(imagesLength).val("");
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
    }else if(imagesLength == 5){
      $('.images-lists-box').css('height','344px');
      $('.images-lists-box').css('width', '620px');
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength+1).css('display','none');
      $('.listing-upload-drop-file').eq(imagesLength).val("");
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
    }else{
      $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength+1).css('display','none');
      $('.listing-upload-drop-file').eq(imagesLength).val("");
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
    }
  });
});


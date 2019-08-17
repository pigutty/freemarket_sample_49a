$(document).on('turbolinks:load',function(){
  function buildpreview(){
    var html = `<ul class="listing-image-container">
                  <li class="image-box">
                    <img id="preview-zone"></img>
                  </li>
                  <div class="button">
                    <a class="edit">編集</a>
                    <a class="delete">削除</a>
                  </div>
                </ul>`
    return html;
  }
  function buildpreview2(){
    var html2 = `<ul class="listing-image-container">
                  <li class="image-box">
                    <img id="preview-zone2"></img>
                  </li>
                  <div class="button">
                    <a class="edit">編集</a>
                    <a class="delete">削除</a>
                  </div>
                </ul>`
    return html2;
  }


  var imagesLength =0;
  var imagesLength2 =0;
  var totalImagesLength = imagesLength + imagesLength2;
  $('.listing-upload-drop-file,.listing-upload-drop-file2').change(function(e){
    var file = e.target.files[0];
    var html = buildpreview();
    var html2 = buildpreview2();
    var reader = new FileReader();

    if (totalImagesLength <= 3){
      $('#preview').prepend(html);
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','none');
      imagesLength += 1;
      console.log(imagesLength);
      console.log(totalImagesLength);
      // totalImagesLength += 1;
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      $('.listing__form__upload__box__preview').css('width', `calc(620px - ${128 * imagesLength }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
      reader.readAsDataURL(file);
    }else if(totalImagesLength == 4){
      console.log('4以上')
      $('#preview').prepend(html);
      console.log(imagesLength2);
      // $('.listing__form__upload__box__preview').eq(imagesLength).css('display', 'none');
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','block');
      // totalImagesLength += 1
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }else if(totalImagesLength >= 5){
      console.log('5以上')
      console.log(totalImagesLength);
      $('#preview2').prepend(html2);
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','block');
      // $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','none');
      reader.onload = function(){
        $('#preview-zone2').attr('src', reader.result);
      }
      imagesLength2 += 1;
      // totalImagesLength += 1;
      $('.listing__form__upload__box__preview2').css('width', `calc(570px - ${114 * imagesLength2 }px`);
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','block');
      reader.readAsDataURL(file);
    }
  });


  $(document).on('mouseenter', '.edit,.delete', function(){
    $(this).css(
      'opacity', '0.7',
      // 'cursor', 'pointer'
      );
  });
  $(document).on('mouseleave', '.edit,.delete', function(){
    $(this).css(
      'opacity', '1'
      );
  });

  $(document).on('click', '.delete', function(){
    $(this).parents('.listing-image-container').remove();
    console.log(imagesLength);
    $('.listing__form__upload__box__preview').eq(imagesLength).css('display','none');
    imagesLength -= 1;
    $('.listing__form__upload__box__preview').css('width', `calc(620px - ${128 * imagesLength }px`);
    $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
    // $('.listing__form__upload__box__preview').css('width', `calc(620px + 128px`);
    console.log(imagesLength);
  });
});


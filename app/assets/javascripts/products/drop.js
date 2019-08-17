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

  function deletepict(){

  }

  var imagesLength =0;
  var imagesLength2 =0;
  var totalImagesLength = 0;
  $('.listing-upload-drop-file,.listing-upload-drop-file2').change(function(e){
    var file = e.target.files[0];
    var html = buildpreview();
    var html2 = buildpreview2();
    var reader = new FileReader();

    if (totalImagesLength <= 3){
      $('#preview').prepend(html);
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','none');
      imagesLength += 1;
      totalImagesLength += 1;
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      $('.listing__form__upload__box__preview').css('width', `calc(620px - ${128 * imagesLength }px`);
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
      reader.readAsDataURL(file);
    }else if(totalImagesLength == 4){
      $('#preview').prepend(html);
      $('.listing__form__upload__box__preview').eq(imagesLength).css('display', 'none');
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','block');
      totalImagesLength += 1
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }else if(totalImagesLength >= 5){
      $('#preview2').prepend(html2);
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','none');
      reader.onload = function(){
        $('#preview-zone2').attr('src', reader.result);
      }
      imagesLength2 += 1;
      totalImagesLength += 1;
      $('.listing__form__upload__box__preview2').css('width', `calc(570px - ${114 * imagesLength2 }px`);
      $('.listing__form__upload__box__preview2').eq(imagesLength2).css('display','block');
      reader.readAsDataURL(file);
    }
  });


  $(document).on('mouseenter', '.delete', function(){
    $(this).css(
      'opacity', '0.8',
      // 'cursor', 'pointer'
      );
  });
  $(document).on('mouseleave', '.delete', function(){
    $(this).css(
      'opacity', '1'
      );
  });
  
});


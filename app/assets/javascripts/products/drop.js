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
  function appendinput(){
    var input = `<label class="listing__form__upload__box">
                  <input class="listing-upload-drop-file", type="file", id="preview", style="display:none;", multiple>
                </label>`
    return input;
  }
  function formBox(){
    var box = `<label class="listing__form__upload__box__preview">
                <input class="listing-upload-drop-file2", type="file", style="display:none;", multiple>
              </label>`
    return box;
  }

  $(function(){
    $('.listing-upload-drop-file2').change(function(){
      console.log('test');
    });
    //fileを選択時に発火するイベントを登録
    $('.listing-upload-drop-file').change(function(e){
      // console.log('test');
      var file = e.target.files[0];
      var reader = new FileReader();
      // $box = $('.listing__form__upload__box__space__pict')
      
      var html = buildpreview();
      var input = appendinput();
      
      reader.onload = function(){
        console.log('カウント')
        $('#preview-zone').attr('src', reader.result);
        var imagesLength = $('.listing-upload-drop-file').length;
        var imagesLength2= $('.listing-upload-drop-file2').length;
        // var imageLength2 = imagesLength % 5
        console.log(imagesLength2);
        // console.log(imageLength2);
        if (imagesLength <= 4){
          // var box = formBox();
          $('#preview').prepend(html);
          $('.listing__form__upload__box__preview').append(input);
          $('.listing__form__upload__box__preview').css('width', `calc(100% - ${20 * imagesLength }%`);
        }else if(imagesLength == 5){
          var box = formBox();
          $('#preview').prepend(html);
          $('.listing__form__upload__box__preview').append(input);
          $('.listing__form__upload__box__preview').css('width', `calc(100% - ${20 * imagesLength }%`);
          $('#preview2').append(box);
        }
        else if(imagesLength == 6){
          console.log("test");
        //   // $(".listing__form__upload__box").detach('');
        //   $('.listing__form__upload__box__preview').remove();
        //   // $('#preview2').empty();
        //   $('.listing__form__upload__box__preview').css('width', `calc(100% - ${20 * imagesLength }%`);
        //   $('#preview2').prepend(html);

          

        //   // $('#preview2').prepend(html);

        //   // $('#preview').prepend(html);
        //   $('.listing__form__upload__box__preview2').css('width', `calc(100% - ${20 * imagesLength2 }%`);
        }
      }
      reader.readAsDataURL(file);
    });
  });
});


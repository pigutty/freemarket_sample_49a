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
  function appendinput(){
    var input = `<label class="listing__form__upload__box">
                  <input class="listing-upload-drop-file", type="file", style="display:none;", multiple>
                </label>`
    return input;
  }
  function formBox(){
    var box = `<label class="listing__form__upload__box">
                <input class="listing-upload-drop-file2", type="file", id="preview2", style="display:none;", multiple>
              </label>`
    return box;
  }
  //fileを選択時に発火するイベントを登録
  $('.listing-upload-drop-file,.listing-upload-drop-file2').change(function(e){
    console.log(e);
    var file = e.target.files[0];
    var html = buildpreview();
    var html2 = buildpreview2();
    var input = appendinput();
    var input2 = formBox();
    var reader = new FileReader();
    var imagesLength = $('.listing-upload-drop-file').length;
    var imagesLength2= $('.listing-upload-drop-file2').length;
    var totalImagesLength = imagesLength + imagesLength2;
    console.log(imagesLength);
    console.log(imagesLength2);
    if (totalImagesLength <= 5){
      console.log('case1');
      console.log(html);
      $('#preview').prepend(html);
      $('.listing__form__upload__box__preview').append(input);
      $('.listing__form__upload__box__preview').css('width', `calc(100% - ${20 * imagesLength }%`);
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }else if(totalImagesLength == 6){
      console.log('case2');
      console.log(html);
      $('#preview').prepend(html);
      $('.listing__form__upload__box__preview').append(input);
      $('.listing__form__upload__box__preview').css('width', `calc(100% - ${20 * imagesLength }%`);
      $('.listing__form__upload__box__preview2').css('display','block');
      reader.onload = function(){
        $('#preview-zone').attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }else if(totalImagesLength >= 7){
      console.log('case3');
      $('#preview2').prepend(html2);
      $('.listing__form__upload__box__preview2').append(input2);
      $('.listing__form__upload__box__preview2').css('width', `calc(100% - ${20 * imagesLength2 }%`);
      reader.onload = function(){
        $('#preview-zone2').attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }
    console.log(reader);
  });
});


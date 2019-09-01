//グレーのブロックのレイアウト調整するメソッド。imagesLengthに表示される画像の個数を代入する。
function layoutControl(imagesLength){
  if (imagesLength < 5){
    // 画像プレビューを放り込んでいく箱の高さと幅を調整
    $('.images-lists-box').css('height', '172px');
    $('.images-lists-box').css('width', '620px');

    //グレーの箱の幅は、全体の幅から画像の個数だけ引いたもの。
    $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * imagesLength }px`);

    // 一旦今まで表示していたイメージフィールドを見えないようにしてから。
    $('.listing__form__upload__box__preview').css('display','none');
    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド。
    $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');

  }else if(imagesLength == 5){
    // 画像プレビューを放り込んでいく箱の高さと幅を調整。５個の時は、二列になるように高さを広げる。
    $('.images-lists-box').css('height','344px');
    $('.images-lists-box').css('width', '620px');

    //５個の時は、グレーの箱の幅は、全体の幅と同じ。
    $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);

    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド
    $('.listing__form__upload__box__preview').css('display','none');
    $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');

  }else{
    // 画像が６個以上で二列になる時、画像プレビューを放り込んでいく箱は５個の時と同じ。
    $('.images-lists-box').css('height','344px');
    $('.images-lists-box').css('width', '620px');

    // グレーの箱の幅は、全体の幅から(画像の個数-5)だけ引いたもの。
    $('.listing__form__upload__box__preview').css('width', `calc(550px - ${112 * (imagesLength -5) }px`);

    // 表示するイメージフィールドは、(画像の個数＋１)番目のイメージフィールド。
    $('.listing__form__upload__box__preview').css('display','none');
    $('.listing__form__upload__box__preview').eq(imagesLength).css('display','block');
  }
}


// 画像のプレビューを作成するメソッド。
// imgタグに後から画像を読み込ませていく。
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


// ここから下の記述が、ページの読み込み時に実行される。
$(document).on('turbolinks:load',function(){
  // 変数の定義。
  var imagesLength = null;//画像が何個あるか、を表す数字。
  var index = null;//何番目の画像を編集したり削除したりするのか、を表す数字。0が１番目に対応している。。
  var id = null;//どの商品の編集や削除をしているのか、を表す商品のid。


  // ページの読み込み時に画像が何個あるか、を読み取ってレイアウト調整。
  imagesLength = $('.images-lists-box').children().length;
  layoutControl(imagesLength);
  // console.log('ページ読み込み時の画像の個数は');
  // console.log(imagesLength);



  // ファイルがアップロードされると以下の記述が実行される。 
  // 商品の画像を追加する時と編集するときの、2つで発火する。
  $('.listing-upload-drop-file').change(function(e){
    // イベントの発火時に、現状把握。
    imagesLength = $('.images-lists-box').children().length;//画像は何個あるのか。
    index = ($(this).parents('label').index()-1);//何番目のイメージフィールドが変更されたのか。
    // console.log(index+1);
    // console.log('番目のイメージフィールドがアップロードされました。その時の画像の個数は');
    // console.log(imagesLength);


    // 画像が追加される時は、画像の個数 <= 変化しているイメージフィールドのindex、となっている。
    // 以下は商品の画像を追加する記述。
    if(imagesLength <= index){
      // 画像の箱を追加する。
      var html = buildpreview();
      $('.images-lists-box').append(html);

      // 画像を読み込みを実行。
      var file = e.target.files[0];// これがイベントでアップロードされたファイル。最初の一個だけ使う？。
      var reader = new FileReader();
      reader.onload = function(){
        $('.preview-zone').last().attr('src', reader.result);
        // 追加されたカードは最後にあるので、そいつのimgタグに画像情報を付与。
      }
      reader.readAsDataURL(file);

      // 画像の追加が終わったあとは、imagesLengthを１増やしてレイアウト調整。
      imagesLength += 1
      layoutControl(imagesLength);
      // console.log('画像の追加が終わりました。現在の画像の個数は');
      // console.log(imagesLength);
    }
    

    // 画像の編集時は、変化しているイメージフィールドのindex < 画像の個数、となっている。
    // 商品編集時の処理を、以下に記述。
    else{
      // console.log("商品の編集の始まりです。");
      // console.log(index);
      // console.log('番目の画像が編集されようとしています。');

      
      // 変更された画像の情報等を、ajaxで送るためにデータ作成。
      data = new FormData();
      var image = e.target.files[0];
      id = location.pathname.replace(/products/,"").replace(/edit/,"").replace("/","").replace("/","").replace("/","");
      data.append('id',id);
      data.append('index',index);
      data.append('image',image);

      // api/products コントローラーのcreateアクションに進んでください。 
      $.ajax({
        type: "POST",
        url: "/api/products",
        data: data,
        dataType: 'json',
        processData: false,
        contentType: false,
      })

      // 画像の変更が成功した際は、プレビュー画像もそれに合わせて変更する。
      .done(function(){
        var reader = new FileReader();
        reader.onload = function(){
          // 変更されたファイルフィールドのindexと同じ番目にあるimgタグに、
          // 編集でアップロードされた画像を放り込む。
          $('.image-box img').eq(index).attr('src', reader.result);
        }
        reader.readAsDataURL(image);

        // 編集の時はajaxで送信後に、直接画像を保存してしまったので、
        // 画像がアップロードされたファイルフィールドは、空にしなければならない。
        $('.listing-upload-drop-file').eq(index).val("");
      })
      .fail(function(){
        // 編集しようとした画像が、まだデータベースに保存されていなかった場合はこちらの処理が実行される。
        // ファイルフィールドに画像が入っているので、それに対応して、プレビューを変えるだけで良い。
        // console.log('編集しようとした画像は、まだデータベースに保存されていませんでした。プレビューのみ変更します。');

        var reader = new FileReader();
        reader.onload = function(){
          $('.image-box img').eq(index).attr('src', reader.result);
        }
        reader.readAsDataURL(image);
      })
    }
  });



  // 削除ボタンが押された時の記述。
  $(document).on('click',".images-lists-box .listing-image-container .button .delete",function(){
    // どの画像が削除されたのか、という情報のみが必要。
    index = $(this).parents("ul").index();
    // console.log(index);
    // console.log('番目の画像が削除されようとしています。');


    // コントローラーで削除を実行します。api/products　のedit actionに進んでください。
    var url = window.location.pathname.replace(/products/,'api/products');
    // console.log(url);
    $.ajax({
      type: "GET",
      url: url,
      data: { index: index},
      dataType: 'json',
    })
    .done(function(){
      // 画像の削除が完了したら、削除した画像に対応するプレビューを消去。
      $('.listing-image-container').eq(index).remove();

      // imagesLengthを１減らしてレイアウト調整。
      imagesLength -= 1;
      layoutControl(imagesLength);
      // console.log(index);
      // console.log('番目の画像が無事削除されました。現在の画像の個数は');
      // console.log(imagesLength);
    })
    .fail(function(){
      // 画像がデータベースになかったら、こちらの処理に来る。
      // プレビューを削除するだけで良い。
      // console.log('この画像はまだデータベースに保存されていなので、プレビューだけ削除します。');
      $('.listing-image-container').eq(index).remove();

      // imagesLengthを１減らしてレイアウト調整。
      imagesLength -= 1;
      layoutControl(imagesLength);
      // console.log(index);
      // console.log('番目の画像が無事削除されました。現在の画像の個数は');
      // console.log(imagesLength);
    })
  })


  // 編集ボタンが押された時に、以下の記述が実行される。
  $(document).on('click',".images-lists-box .listing-image-container .button .edit",function(){
    // 何番目の編集ボタンがクリックされたか。
    // それに対応するイメージフィールドをクリックさせて、ファイルフィールドが変わった時のイベントに繋げる。
    index = $(this).parents("ul").index();
    $('.listing__form__upload__box__preview').eq(index).trigger('click');
  });

  

  // 編集、削除ボタンにマウスを乗っけた時に、ボタンのレイアウトを変えるやーつ。
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
});


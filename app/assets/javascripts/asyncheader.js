$(function() {
  function buildmiddleHTML(data){
    var html = `<li class="middlecategory-element" data-id='${data.id}'>
                  <a> ${data.name} </a>
                </li>`
      $('.middlecategory-list').append(html)
  }
  var middleul = `<ul class="middlecategory-list"></ul>`
  var smallul = `<ul class="smallcategory-list"></ul>`

  function buildsmallHTML(data){
    var html = `<li class="smallcategory-element" data-id='${data.id}'>
                  <a> ${data.name} </a>
                </li>`
      $('.smallcategory-list').append(html)
  }

  $(".header-bottom__search-menu__category").hover(function(){
    $(".bigcategory-element").css("display","block");
    $(this).children().css("color","#0099e8");
  },function(){
    $(".bigcategory-element").css("display","none");
    $(this).children().css("color","black");
  })

  $(".bigcategory-element").hover(function(){
    $(this).css("background-color","red")
    $(this).children().css("color","#fff")
    $(this).append(middleul);
    var id = $(this).data('id');
    var url = '/';
    $.ajax({
      type: "GET",
      url: url,
      data: { parent_id: id },
      dataType: 'json',
    })
    .done(function(datas){
      $(".middlecategory-element").remove();
      datas.forEach(function(data){
        buildmiddleHTML(data);
      })
      $(".middlecategory-element").hover(function(){
        $(this).css("background-color","#ccc")
        $(this).append(smallul);
        var sid = $(this).data('id');
        var url = "/api/top";
        $.ajax({
          type: "GET",
          url: url,
          data: { child_id: sid},
          dataType: 'json',
        })
        .done(function(datas){
          $(".smallcategory-element").remove();
          datas.forEach(function(data){
            buildsmallHTML(data);
          })
          $(".smallcategory-element").hover(function(){
            $(this).css("background-color","#ccc");
          },function(){
            $(this).css("background-color","#fff");
          })
        })
        .fail(function(){
        })
      },function(){
        $(this).css("background-color","#fff")
      })
    })
    .fail(function(){
    })
  },function(){
    $(".middlecategory-list").remove();
    $(this).css("background-color","#fff")
    $(this).children().css("color","black")
  })
})


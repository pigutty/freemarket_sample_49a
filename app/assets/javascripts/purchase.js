$(document).on('turbolinks:load', function() {
  $("#new_credit_card, .registration__content.mypage__content").submit(function(e){
    console.log("test");
    e.preventDefault();
    Payjp.setPublicKey('pk_test_d7948e7275630f3552910c45');
    var card = {
      number: document.querySelector('input[name="number"]').value,
      cvc: document.querySelector('input[name="cvc"]').value,
      exp_month: document.querySelector('select[name="select[exp_month(2i)]"]').value,
      exp_year: document.querySelector('select[name="select[exp_year(1i)]"]').value
    };
    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        var token = response.id
        $('input').val("");
      } else {
        alert("error");
      };
      $.ajax({
        type: "POST",
        url:  "/credit_cards",
        data: {token: token},
        dataType: 'json',
      })
      .done(function(){
        window.location = "/registration_check";
      })
      .fail(function(){
        window.location = "/";
      })
    });
  })
});

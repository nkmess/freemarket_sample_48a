$(function(){
  $(document).on('click','.credit__content__card__link', function(e) {
    e.preventDefault();
    Payjp.setPublicKey('pk_test_6f8c0dbd80a304bd5dda8853');
    var card = {
      number: parseInt($(".number").val()),
      cvc: parseInt($(".cvc").val()),
      exp_month: parseInt($(".credit__content__form__group__select__month").val()),
      exp_year: parseInt($(".credit__content__form__group__select__year").val())
    };
    Payjp.createToken(card, function(status, response) {
        var token = response.id;
        console.log(response.id)  
        $.ajax({
          url: '/cards',
          type: "POST",
          data: { token: token },
          dataType: 'json',
        })
        .done(function(){
          alert("登録が完了しました"); //確認用
        })
        .fail(function(){
          alert("カード情報が正しくありません。"); //確認用
          

        })
        console.log("うわああああああああああああ")
    });
  });
});


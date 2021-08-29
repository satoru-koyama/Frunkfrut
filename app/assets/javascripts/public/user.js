$(document).on('turbolinks:load', function() {


  // 編集エリア表示
  $(function () {
    $('.user_update_1').hide();
    $('.user_edit_button_1').on("click", function () {
      const userEdit = $('.user_edit_1');
      const userUpdate = $('.user_update_1');

      userEdit.hide();
      userUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $('.user_cancel_button_1').on("click", function () {
      const userEdit = $('.user_edit_1');
      const userUpdate = $('.user_update_1');

      userEdit.show();
      userUpdate.hide();
    });
  });

  // 編集エリア表示
  $(function () {
    $('.user_update_2').hide();
    $('.user_edit_button_2').on("click", function () {
      const userEdit = $('.user_edit_2');
      const userUpdate = $('.user_update_2');

      userEdit.hide();
      userUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $('.user_cancel_button_2').on("click", function () {
      const userEdit = $('.user_edit_2');
      const userUpdate = $('.user_update_2');

      userEdit.show();
      userUpdate.hide();
    });
  });

});

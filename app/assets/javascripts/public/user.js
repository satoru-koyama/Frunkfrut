$(document).on('turbolinks:load', function() {


  // 編集エリア表示
  $(function () {
    $('.user_update').hide();
    $('.user_edit_button').on("click", function () {
      const userId = $(this).attr('id').replace(/[^0-9]/g, '');
      const userEdit = $('.user_edit_' + userId);
      const userUpdate = $('.user_update_' + userId);

      userEdit.hide();
      userUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $(document).on("click", ".user_cancel_button", function () {
      const userId = $(this).attr('id').replace(/[^0-9]/g, '');
      const userEdit = $('.user_edit_' + userId);
      const userUpdate = $('.user_update_' + userId);

      userEdit.show();
      userUpdate.hide();
    });
  });

});

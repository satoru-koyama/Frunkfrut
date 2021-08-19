$(document).on('turbolinks:load', function() {


  $(function(){
    $('#new_comment').hide();

    $('#new_comment_btn').on('click',function(){

      $('#new_comment').slideToggle();

    });
  });


  // 編集エリア表示
  $(function () {
    $('.comment_update').hide();
    $('.comment_edit_button').on("click", function () {
      const commentId = $(this).attr('id').replace(/[^0-9]/g, '');
      const commentEdit = $('.comment_edit_' + commentId);
      const commentUpdate = $('.comment_update_' + commentId);

      commentEdit.hide();
      commentUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $(document).on("click", ".comment_cancel_button", function () {
      const commentId = $(this).attr('id').replace(/[^0-9]/g, '');
      const commentEdit = $('.comment_edit_' + commentId);
      const commentUpdate = $('.comment_update_' + commentId);

      commentEdit.show();
      commentUpdate.hide();
    });
  });

});


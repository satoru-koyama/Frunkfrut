$(document).on('turbolinks:load', function() {


  $(function(){
    $('#new_reply').hide();

    $('#new_reply_btn').on('click',function(){

      $('#new_reply').slideToggle();

    });
  });


  // 編集エリア表示
  $(function () {
    $('.reply_update').hide();
    $('.reply_edit_button').on("click", function () {
      const replyId = $(this).attr('id').replace(/[^0-9]/g, '');
      const replyEdit = $('.reply_edit_' + replyId);
      const replyUpdate = $('.reply_update_' + replyId);

      replyEdit.hide();
      replyUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $(document).on("click", ".reply_cancel_button", function () {
      const replyId = $(this).attr('id').replace(/[^0-9]/g, '');
      const replyEdit = $('.reply_edit_' + replyId);
      const replyUpdate = $('.reply_update_' + replyId);

      replyEdit.show();
      replyUpdate.hide();
    });
  });

});


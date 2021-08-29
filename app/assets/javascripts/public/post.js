$(document).on('turbolinks:load', function() {

  $(function(){
    $('#post_index_list').hide();

    $('#post_index_list_btn').on('click',function(){

      $('#post_index_list').slideToggle();

    });
  });

  $(function(){
    $('#new_post').hide();

    $('#new_post_btn').on('click',function(){

      $('#new_post').slideToggle();

    });
  });


  // 編集エリア表示
  $(function () {
    $('.post_update').hide();
    $('.post_edit_button').on("click", function () {
    console.log("clicked!")
      const postId = $(this).attr('id').replace(/[^0-9]/g, '');
      const postEdit = $('.post_edit_' + postId);
      const postUpdate = $('.post_update_' + postId);

      postEdit.hide();
      postUpdate.show();


    });
  });


  // 編集エリア非表示
  $(function () {
    $(document).on("click", ".post_cancel_button", function () {
      const postId = $(this).attr('id').replace(/[^0-9]/g, '');
      const postEdit = $('.post_edit_' + postId);
      const postUpdate = $('.post_update_' + postId);

      postEdit.show();
      postUpdate.hide();
    });
  });

});



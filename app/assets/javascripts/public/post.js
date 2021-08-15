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
  $('.form-post').hide();
  $('.post-after-button').hide();
  $('.edit-post-button').on("click", function () {              // ①クリックイベント

    const postId = $(this).data('post-id');                   // ②一意のcomment.idを代入
    const postLabelArea = $('#post-label-' + postId);   // ③一意のラベルを代入
    const postForm = $('.form-post-' + postId); // ④一意のコメントエリアを代入
    const postBeforeButton = $('.post-before-button-' + postId);     // ⑤一意のボタンエリアを代入
    const postAfterButton = $('.post-after-button-' + postId);     // ⑤一意のボタンエリアを代入

    postLabelArea.hide(); // 非表示
    postBeforeButton.hide();    // 非表示
    postForm.show();  // 表示
    postAfterButton.show();    // 表示


  });
});


// 編集エリア非表示
$(function () {
  $(document).on("click", ".post-cancel-button", function () {
    const postId = $(this).data('cancel-id');
    const postLabelArea = $('#post-label-' + postId);
    const postForm = $('.form-post-' + postId);
    const postBeforeButton = $('.post-before-button-' + postId);
    const postAfterButton = $('.post-after-button-' + postId);

    postLabelArea.show();
    postBeforeButton.show();
    postForm.hide();
    postAfterButton.hide();
  });
});

// コメント更新ボタン
$(function () {
  $(document).on("click", ".post-update-button", function () {
    const postId = $(this).data('update-id');
    const textField = $('#textarea-post-' + postId);
    const fileField = $('#file-post-' + postId);
    const text = textField.val();                             // ②textFieldの内容を取得
    const image = fileField[0].files[0];

    $.ajax({                         // ③ajax関数
      url: '/posts/' + postId,
      type: 'PATCH',                 // ⑤HTTP通信の種類： updateアクションなので'PATCH'と記述
      data: {                        // ⑥commentモデルのbodyカラムに変数bodyを格納
        post: {
          text: text,
          image: image
        }
      }
    })
  });
});
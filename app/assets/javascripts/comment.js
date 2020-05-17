$(function(){

  function buildHTML(comment){
    var html =
    `
    <div class='comment' data-comment-id=${comment.id}>
    <strong>
    <a href="/users/${comment.user_id}">${comment.user_name}</a>
    ：
    ${comment.text}
    </strong>
    </div>
    `
    return html;
  }

  var reloadMessages = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    var last_comment_id = $('.comment:last').data("comment-id");
    $.ajax({
      //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
      url: 'api/messages/${post_id}',
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      console.log(succese)
      if (comments.length !== 0) {
      var insertHTML = '';
      //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
      $.each(comments, function(i, comment) {
        insertHTML += buildHTML(comment)
      });
      //メッセージが入ったHTMLに、入れ物ごと追加
      $('.comments').append(insertHTML);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  if (document.location.href.match(/\/posts\/\d+\/posts/)) {
    setInterval(reloadMessages, 7000);
  }
})
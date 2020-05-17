$(document).on('turbolinks:load', function(){
  function buildHTML(comment){
    var html = `<div>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                    ${comment.text}
                  </strong>
                  <span>
                  <a class="delete" rel="nofollow" data-method="delete" href="/posts/${comment.post_id}/comments/${comment.id}">削除</a>
                  </span>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      $('.text_box').val('');
      $('.form_submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
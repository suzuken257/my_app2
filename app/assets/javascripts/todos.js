$(document).on('turbolinks:load', function(){
  function buildHTML(todo){
    var html = 
    `<p>
    <strong>
    ${todo.content}
    <span>
    <a class="delete" rel="nofollow" data-method="delete" href="/users/${todo.user_id}/todos/${todo.id}">削除</a>
    </span>
    </strong>
    </p>`
    return html;
  }
  $('#new_todo').on('submit', function(e){
    console.log ("あああ")
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
      $('.todo-box').append(html);
      $('.todo-box').animate({ scrollTop: $('.todo-box')[0].scrollHeight});
      $('.todo_box').val('');
      $('.form_submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
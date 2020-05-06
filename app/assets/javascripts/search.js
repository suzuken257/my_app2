$(function(){

  var search_list = $(".contents");

  function appendPost(post) {
      var html = `
      <div class='main__content'>
        <div class='main__content__video'>
          <iframe frameborder='0' height='200' id='ytplayer' src='https://www.youtube.com/embed/${post.video}' type='text/html' width='288'></iframe>
        </div>
        <div class='main__content__title'>
          <a href="/posts/${post.id}">${post.title}</a>
        </div>
        <div class='main__content__user'>
          <a href="/users/${post.user_id}">${post.user_name}</a>
        </div>
      </div>`

    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function(){
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(posts) {
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
  });
});
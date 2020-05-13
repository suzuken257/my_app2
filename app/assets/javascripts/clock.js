function showtime(){
  var today = new Date();
  $weekday = ['日','月','火','水','木','金','土'];
  month = today.getMonth() + 1 ;
  $('#datetime').html(month + "/"+ today.getDate() + "（"+ $weekday[today.getDay()] +"） " +today.getHours() + ":" + ('0'+today.getMinutes()).slice(-2) + ":" + ('0' +today.getSeconds()).slice(-2));
}
setInterval(showtime,1000);
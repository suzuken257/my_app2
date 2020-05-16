$(document).on('turbolinks:load', function(){
  $('.left-menu').on('click',function() {
      $(".main__side").slideToggle();
  });
});

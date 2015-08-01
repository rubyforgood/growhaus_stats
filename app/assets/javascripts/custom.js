$( document ).ready(function() {
  $(".button-collapse").sideNav({
    menuWidth: 300
  });
  $("#close-side-nav").click(function(){
    $('.button-collapse').sideNav('hide');
  })
});

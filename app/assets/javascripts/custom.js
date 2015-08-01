setupNav = function(){
  $(".button-collapse").sideNav({
    menuWidth: 300
  });
  $("#close-side-nav").click(function(){
    $('.button-collapse').sideNav('hide');
  })
};

$( document ).ready(function() {
  setupNav();
});

$(document).on('page:load', function () {
  setupNav();
});
(function () {
  var setupNav = function () {
    $(".button-collapse").sideNav({
      menuWidth: 300
    });
  };

  $(document).on({
    "ready": setupNav,
    "page:load": setupNav
  });
})();

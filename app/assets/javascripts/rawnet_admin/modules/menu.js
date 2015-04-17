var RawnetAdmin = window.RawnetAdmin || {};

RawnetAdmin.menu = function(){

  function toggleNav(link) {
    var   active = $('#mainNav a.active'),
    target = $(link.attr('href')),
    activeMenu = $('#subNav nav.active');

    active.removeClass('active');
    activeMenu.removeClass('active');
    link.addClass('active');
    target.addClass('active');
  }

  function openSearch() {
    var search = $('#searchControl');

    search.fadeIn("fast").addClass('open');
    search.find('input').focus();
    $(document).keyup(function(e) {
      if (e.keyCode === 27) {
        search.fadeOut("fast").removeClass('open');
        $(document).unbind("keyup");
      }else if (e.keyCode === 13) {
        search.find('form').trigger('submit');
      }
    });
  }

  function init() {
    var activeLink = $('#subNav a.active'),
    activeMenu = activeLink.closest('nav'),
    activeSelector = $('#mainNav a[href="#' + activeMenu.attr('id') + '"]');

    activeMenu.addClass('active');
    activeSelector.addClass('active');

    $(document).on('click', '#mainNav a[href^="#"], #dashboardNav a[href^="#"]', function(e) {
      e.preventDefault();
      toggleNav($(this));
    });
    $(document).on('click', '#subNav a.search', function(e) {
      e.preventDefault();
      openSearch();
    });
  }

  return {
    init: init
  };

}();

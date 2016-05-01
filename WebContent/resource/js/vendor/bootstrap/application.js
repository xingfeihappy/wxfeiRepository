(function ($) {
  $(function () {
    // Todo list
    $('.todo').on('click', 'li', function () {
      $(this).toggleClass('todo-done');
    });
  });
})(jQuery);

/**
 * Created by alexander on 5/15/17.
 */
document.addEventListener("turbolinks:load", function() {

    function disableOnScroll() {
        $(window).off('scroll', scrollHandler);
    }

    $('[data-scroll-pagination]').each(function () {
        var $pagination = $(this);
        var page = 1;
        var url = $pagination.data('scrollPagination') + '?page=';

        init();

        function init() {

            loadComments();

            $(window).on('scroll', scrollHandler);
            $(document).on('page:before-change turbolinks:before-visit', function() {
                disableOnScroll();
            });
        }

        function loadComments() {
            $.get(url + page, function (data) {

                if (data.length === 0) {
                    disableOnScroll();
                    return;
                }

                data.forEach(function (elem) {
                    $pagination.append('<p>' + elem.body + '</p><p>' + elem.created_at + '</p><hr>');
                });

            });
        }

        function scrollHandler() {
            if ($(window).scrollTop() + $(window).height() === $(document).height()) {
                ++page;
                loadComments();
            }
        }

    });
});

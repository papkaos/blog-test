/**
 * Created by alexander on 5/15/17.
 */
$(function () {

    $('[data-scroll-pagination]').each(function () {
        var $pagination = $(this);
        var page = 1;
        var url = $pagination.data('scrollPagination') + '?page=';

        init();
        
        function init() {

            loadComments(url, page);

            $(window).on('scroll', function () {

                if($(window).scrollTop() + $(window).height() == $(document).height()) {
                    page++;
                    loadComments(url, page);
                }
            });

        }
        
        function loadComments(url, page) {
            $.get(url + page, function (data, status) {
                console.log(data);

                data.forEach(function (elem) {
                    $pagination.append('<p>' + elem.body + '</p><p>' + elem.created_at + '</p><hr>');
                });

            });
        }
        
        // todo page++
    });

});


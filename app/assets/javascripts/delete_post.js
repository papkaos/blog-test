document.addEventListener("turbolinks:load", function () {
    // var $deleteButton = $('[data-post-delete-method=delete]');

    $('[data-posts-controller]').on('click', '[data-post-delete-method=delete]', function (e) {
        var $el = $(e.target);

        if (confirm('Please be reasonable.. There is no need to make call to the server')) {
            var url = $el.data('postDeleteUrl');
            var method = $el.data('postDeleteMethod');

            $.ajax({
                url: url,
                type: method,
                success: function (data) {
                    if (data.status === 'deleted') {
                        $el.closest('[data-post-wrapper]').remove();
                    }
                }
            });
        }

    });

    // console.log($deleteButton);
});

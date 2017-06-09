document.addEventListener("turbolinks:load", function() {
    var $filterSelect = $('[data-filter-posts]');

    $filterSelect.change(function (e) {
        var url = window.location;
        var paramKey = 'sort';

        url.href = url.origin + '?' + paramKey + '=' + $filterSelect.val();

        // if (~url.href.indexOf('?')) {
        //     url.href = '&' + paramKey + '=' + $filterSelect.val();
        // } else {
        //     url.href = url.origin + '?' + paramKey + '=' + $filterSelect.val();
        // }
    });
});

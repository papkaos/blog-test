/**
 * Created by alexander on 5/5/17.
 */
$(document).ready(function() {

    var $formComment = $('#new-comment');


    $formComment.validate({
        submitHandler: function(form) {
            var url = $formComment.attr('action'),
                method = $formComment.attr('method'); // todo

            $.ajax({
                dataType: 'json',
                type: method,
                url: url,
                data: $formComment.serialize(),
                success: function(data) {
                    console.log(data);

                    // todo append new comment
                    $('#comments').append('<p>' + data.body + '</p><p>' + data.formatted_created_date + '</p><hr>');

                    $formComment.trigger('reset');
                }
            });
        }
    });

});
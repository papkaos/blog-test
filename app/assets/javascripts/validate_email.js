document.addEventListener("turbolinks:load", function () {
    var $form = $('[data-validate-email]');
    var url = $form.data('validateEmail');

    $form.validate({
        rules: {
            'user[email]': {
                required: true,
                email: true,
                remote: {
                    url: url,
                    type: "post"
                }
            }
        },
        messages: {
            'user[email]': {
                required: 'Please enter your email',
                email: 'Please enter valid email address',
                remote: 'This email already taken'
            }
        },
        onkeyup: false
    });

});

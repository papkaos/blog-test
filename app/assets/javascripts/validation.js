/**
 * Created by alexander on 5/18/17.
 */
document.addEventListener("turbolinks:load", function () {
    var $registrationForm = $('#registration-form');

    $registrationForm.validate({
        rules: {
            'user[email]': {
                required: true,
                email: true,
                remote: {
                    url: "/users/validate",
                    type: "post"
                }
            },
            'user[password]': {
                required: true,
                minlength: 6
            },
            'user[password_confirm]': {
                required: true,
                minlength: 6,
                equalTo: '#user_password'
            }
        },
        messages: {
            'user[email]': {
                required: 'Please enter your email',
                email: 'Please enter valid email address',
                remote: 'This email already taken'
            },
            'user[password]': {
                required: 'Please enter your password',
                minlength: 'Enter at least 6 characters'
            },
            'user[password_confirm]': {
                required: 'Please repeat your password',
                minlength: 'Enter at least 6 characters',
                equalTo: 'Password need to match first'
            }
        },
        onkeyup: false
    });

});

// $.validator.setDefaults({
//     errorClass: 'error-msg',
//     highlight: function (element) {
//     }
// });
//
// $.validator.addMethod("nospaces", function(value, element) {
//     return this.optional(element) || /^[^ ]((?! {2,}).)*[^ ]$/.test(value);
// }, "Введен недопустимый символ пробел");
//
// $formCreateTeam.validate({
//     rules: {
//         'long-name': {
//             required: true,
//             maxlength: 20,
//             nospaces: true
//         },
//         'short-name': {
//             required: true,
//             maxlength: 9,
//             nospaces: true
//         }
//     },
//     messages: {
//         'long-name': {
//             required: 'Нужен текст для невведенного поля',
//             maxlength: 'Не должно превышать 20 символов'
//         },
//         'short-name': {
//             required: 'Нужен текст для невведенного поля',
//             maxlength: 'Не должно превышать 9 символов'
//         }
//     },
//     onfocusout: false,
//     onkeyup: false,
//     onclick: false
// });

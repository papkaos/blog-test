/**
 * Created by alexander on 5/18/17.
 */
document.addEventListener("turbolinks:load", function () {
    var $registrationForm = $('#registration-form');

    $registrationForm.validate({
        rules: {
            'email': {
                required: true,
                email: true,
                remote: 'http://localhost:3000/users/validate'
            },
            'password-user': {
                required: true,
                minlength: 6
            },
            'password-confirm': {
                required: true,
                minlength: 6,
                equalTo: '#password-user'
            }
        },
        messages: {
            'email': {
                required: 'Please enter your email',
                email: 'Please enter valid email address',
                remote: 'This email already taken'
            },
            'password-user': {
                required: 'Please enter your password',
                minlength: 'Enter at least 6 characters'
            },
            'password-confirm': {
                required: 'Please repeat your password',
                minlength: 'Enter at least 6 characters',
                equalTo: 'Password need to match first'
            }
        }
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

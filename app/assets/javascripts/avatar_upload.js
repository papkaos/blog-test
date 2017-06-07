document.addEventListener("turbolinks:load", function () {
    var $avatar = $('[data-avatar-edit]');
    var $uploadButton = $('[data-upload-button]');

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $avatar.attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $uploadButton.change(function(){
        readURL(this);
    });
});

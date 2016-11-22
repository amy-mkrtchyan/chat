$(document).ready(function(){

    var messages = $('#messages');
    messages.scrollTop(messages.prop('scrollHeight'));

    $('form#new_message').on('submit', function () {
        var msg_body = $('#msg_body');
        $('#message_body').val(msg_body.val());
        msg_body.val('');
    });
});

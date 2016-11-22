$(document).ready(function(){
    App.messages = App.cable.subscriptions.create({channel: 'MessagesChannel', room_id: $('#message_room_id').val()}, {
        received: function(data) {
            var messages = $('#messages');
            messages.append(this.renderMessage(data));
            messages.scrollTop(messages.prop('scrollHeight'));

        },

        renderMessage: function(data) {
            return "<li class='media'>\
            <div class='media-body'>\
            <a class='pull-left' href='#'>\
            <img class='media-object img-circle square_48' src='" + data.avatar + "'>\
            </a>\
            <div class='media-body'>" +
                data.message +
                "<br>\
                <small class='text-muted'>"+ data.user + "|" + data.created_at + "</small>\
            <hr>\
            </div>\
            </div>\
            </li>";
        }
    });
});

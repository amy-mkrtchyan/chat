//= require cable
//= require_self
//= require_tree .

this.App = {};
$(document).ready(function () {
    App.cable = ActionCable.createConsumer('/messenger?uid=' + $('#message_uid').val());
});

App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    console.log(data);
    $('#message_content').val('');
    return $('.messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
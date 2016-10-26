App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    // $("#messages").removeClass('hidden')
    return $('.messages').append(this.renderMessage(data));
    console.log('hello you !')
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
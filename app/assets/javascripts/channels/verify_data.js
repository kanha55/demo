$(document).ready(function() {
  return App.global_notifications = App.cable.subscriptions.create({
    channel: "VerifyDataChannel"
  }, {
  
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
     var dateSpan = document.createElement('div')
     dateSpan.innerHTML = data;
     debugger
     $('#chat_id').append(dateSpan);
     setTimeout(function() { $('#chat_id').append('hey'); }, 1500);
    }
	});
});
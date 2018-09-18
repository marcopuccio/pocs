self.addEventListener('message', function(message) {
    setTimeout(function() {
        self.postMessage(message.data);
    }, 1000);
}, false);
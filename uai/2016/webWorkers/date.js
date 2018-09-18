self.addEventListener('message', function(message) {
    if (message.data.date) {
        self.postMessage(new Date());
    }
}, false);
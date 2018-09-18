$(document).on('ready', function() {

    // When document is ready, load the workers.
    var feedWorker = new Worker('feed.js');
    var dateWorker = new Worker('date.js');


    // Able form.
    $('#webworker-starter').on('click', function(ev) {
        ev.preventDefault();
        
        // Toggle disabled on inputs.
        $('input, textarea, button').attr('disabled', false);

        // Able the killer worker button and hide this button.
        $('#webworker-killer').removeClass('hide');
        $(this).addClass('hide');
    })


    // Disable form and kill workers.
    $('#webworker-killer').on('click', function(ev) {
        ev.preventDefault();

        // Toggle disabled and clear inputs.
        var $inputFields = $('input, textarea, button'); 
        $inputFields.attr('disabled', true);
        $inputFields.val('');
        
        // Toggle disabled on buttons.
        $(this).attr('disabled', true);

        // Kill workers
        terminateWorkers();
    });


    // Serialize data from forms and submit it passing the object to webworker.
    $('[data-feed-form]').on('submit', function(ev) {
        ev.preventDefault();
        var $form = $(this);
        var data = $form.serialize();
        var dataArray = data.split('&');
        var jsonData = {};

        // Parse to JSON the serialized querystring.
        dataArray.forEach(function(i) {
            var indexData = i.split('=');
            jsonData[indexData[0]] = indexData[1];
        });

        // call to worker and write the data to document.
        postNewJSONNotice(jsonData);
        updateDatetime({'date': true});
    });

    function terminateWorkers() {
        // Terminate workers Function 
        feedWorker.terminate();
        dateWorker.terminate();
    }

    function postNewJSONNotice(jsonData) {
        feedWorker.postMessage(jsonData);
        feedWorker.addEventListener('message', function(e) {
            document.getElementById('title').textContent = e.data.title;           
            document.getElementById('content').textContent = e.data.content;
        }, false);
    }

    function updateDatetime(jsonData) {
        dateWorker.postMessage(jsonData);
        dateWorker.addEventListener('message', function(e) {
            document.getElementById('the-date').textContent = e.data;
        }, false);
    }

});
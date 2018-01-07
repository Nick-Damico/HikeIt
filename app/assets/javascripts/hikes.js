//////////////////////////////////////////
//  Global Functions
//////////////////////////////////////////

function attachListeners() {
  findHikeListener();
}



//////////////////////////////////////////
//  Event Listeners
//////////////////////////////////////////

function findHikeListener() {
  $('#findHikeBtn').on('click', function(e) {
    // Stop default request 'GET', /hikes
    e.preventDefault();
    getHikes(e.target);
  });
}


//////////////////////////////////////////
//  AJAX Requests
//////////////////////////////////////////

function getHikes(target) {
  let $target = $(target);
  let $parent = $target.parent('form');
  let formUrl = $parent.attr('action');
  let formMethod = $parent.attr('method');
  $.ajax({
    method: formMethod,
    url: formUrl,
    dataType: 'json'
  }).done(function(data) {
    // Get response
    // load data into DOM
  }).fail(function() {
    alert('error')
  });
}

// iife function for DOM ready()
$(function() {
  // Hijack Find Hike Button from /home
  attachListeners();


}); // End of iife block
// Make AJAX request to /hikes :index action for JSON

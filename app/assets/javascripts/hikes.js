
//////////////////////////////////////////
//  Global Functions
//////////////////////////////////////////

function attachListeners() {
  findHikeListener();
}

function buildHikes(data) {
  let hikes = [];
  for (let item of data) {
    let hike = new Hike(item);
    hikes.push(hike);
  }
  return hikes;
}

function formatForOutput(hikes) {
  for (let hike of hikes) {
    hike.truncateText();
  }
}



//////////////////////////////////////////
//  Event Listeners
//////////////////////////////////////////

function findHikeListener() {
  $('#findHikeBtn').on('click', function(e) {
    // Stop default request 'GET', /hikes
    e.preventDefault();
    $('#mainContent').fadeOut('slow', function() {
      $(this).html("");
      getHikes(e.target);
    });

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
    let hikes = buildHikes(data);
    console.log(hikes);
    formatForOutput(hikes);
    let html = HandlebarsTemplates['hikes/index']({ hike: hikes })
    $('#mainContent').html(html).fadeIn('slow');

  }).fail(function() {
    alert('error')
  });
}

////////////////////////////////////////////////////////////////////////////////////
//  END of /hikes index action code for asynchronous loading.
////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
// iife function for DOM ready()
//////////////////////////////////////////

// With turbolinks the javascript is only loaded once.
// This will fix issues of javascript not executing on a link_to click || back button click.
$(document).on('turbolinks:load', function() {
  attachListeners();
})


$(function() {
  attachListeners();
}); // End of iife block

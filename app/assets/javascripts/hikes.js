
//////////////////////////////////////////
//  Global Functions
//////////////////////////////////////////

function attachListeners() {
  findHikeListener();
  planHikeListener();
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

function planHikeListener() {
  // Hijack 'Create Hike' button on form
  $('#new_hike').on('submit', function(e) {
    e.preventDefault();
    let url = this.action;
    let formData = $(this).serialize();
    $.ajax({
      method: this.method,
      url: url,
      data: formData,
      dataType: 'json'
    })
    .done(function(data) {
      let hikes = buildHikes(data);
      debugger;
    })
  });
  // Capture params
  // Use params to make a $.post $.ajax 'post' request for a new resource
  // Get ajax response from Server render :show page in window with new resource
}

function getHike() {

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
    formatForOutput(hikes);
    let html = HandlebarsTemplates['hikes/index']({ hike: hikes })
    $('#mainContent').html(html).fadeIn('slow');

  }).fail(function() {
    alert('error')
  });
}

function createHike(target) {

}

////////////////////////////////////////////////////////////////////////////////////
//  END of /hikes index action code for asynchronous loading.
////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
// iife function for DOM ready()
//////////////////////////////////////////

// With turbolinks the javascript is only loaded once.
// This will fix issues of javascript not executing on a link_to click || back button click.
$(function() {
  $(document).on('turbolinks:load', function() {
    attachListeners();
  })
})

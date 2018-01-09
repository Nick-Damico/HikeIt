
//////////////////////////////////////////
//  Global Functions
//////////////////////////////////////////

function attachListeners() {
  findHikeListener();
  planHikeListener();
  showHikeListener();
}

function formatForOutput(hikes) {
  for (let hike of hikes) {
    hike.truncateText();
  }
}

function mainContentAppend(html) {
  $('#mainContent').fadeOut('slow', function() {
    $(this).html('');
    $('#mainContent').html(html).fadeIn('slow');
  })
}



//////////////////////////////////////////
//  Event Listeners
//////////////////////////////////////////

function findHikeListener() {
  $('#findHikeBtn').on('click', function(e) {
    e.preventDefault();
    getHikes(e.target);
  });
}

function planHikeListener() {
  // Hijack 'Create Hike' button on form submission
  $('#new_hike').on('submit', function(e) {
    e.preventDefault();
    let url = this.action;
    let formData = $(this).serialize();
    request(url, this.method, formData);
  });
}

function showHikeListener() {
  $('.show-hike-btn').on('click', function(e) {
    e.preventDefault();
    let formData = $(this).serialize();
    let url = $(event.target).attr('href');
    request(url, 'GET', formData);
  });
}

// Attaches Listeners to dynamically rendered elements from AJAX and jQuery requests
function dynamicShowEvent() {
  $(document).on("click", '.show-hike-btn', function(e) {
      e.preventDefault();
      let url = $(event.target).attr('href');
      request(url, 'GET', "");
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
    let hikes = Hike.buildHikes(data);
    formatForOutput(hikes);
    let html = HandlebarsTemplates['hikes/index']({ hike: hikes })
    mainContentAppend(html);
    dynamicShowEvent();
  }).fail(function() {
    alert('error')
  });
}


function request(url, method, data) {
  $.ajax({
    method: method,
    url: url,
    dataType: 'json',
    data: data
  })
  .done(function(data) {
    let hike = new Hike(data);
    let users = User.buildUsers(data.users);
    let html = HandlebarsTemplates['hikes/show']({ hike: hike, users: users });
    mainContentAppend(html);
  });
}



////////////////////////////////////////////////////////////////////////////////////
//  END of /hikes index action code for asynchronous loading.
////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
// iife function
//////////////////////////////////////////

// With turbolinks the javascript is only loaded once.
// This will fix issues of javascript not executing on a link_to click || back button click.
$(function() {
  $(document).on('turbolinks:load', function() {
    attachListeners();
  })
})

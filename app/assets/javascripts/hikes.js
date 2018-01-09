
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
      let hike = new Hike(data);
      let users = User.buildUsers(data.users);
      let html = HandlebarsTemplates['hikes/show']({ hike: hike, users: users });

      mainContentAppend(html);
    })
  });
  // Capture params
  // Use params to make a $.post $.ajax 'post' request for a new resource
  // Get ajax response from Server render :show page in window with new resource
}

function showHikeListener() {
  $('.show-hike-btn').on('click', function(e) {
    e.preventDefault();
    let url = $(e.target).attr('href');

    $.ajax({
      method: 'GET',
      url: url,
      dataType: 'json'

    }).done(function(data) {
      let hike = new Hike(data);
      let users = User.buildUsers(data.users);
      let html = HandlebarsTemplates['hikes/show']({ hike: hike, users: users });
      mainContentAppend(html);
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
    let hikes = Hike.buildHikes(data);
    formatForOutput(hikes);
    let html = HandlebarsTemplates['hikes/index']({ hike: hikes })
    mainContentAppend(html);
    dynamicShowEvent();
  }).fail(function() {
    alert('error')
  });
}

function dynamicShowEvent() {
  $(document).on("click", '.show-hike-btn', function(e) {
      e.preventDefault();
      let url = $(e.target).attr('href');

      $.ajax({
        method: 'GET',
        url: url,
        dataType: 'json'

      }).done(function(data) {
        let hike = new Hike(data);
        let users = User.buildUsers(data.users);
        let html = HandlebarsTemplates['hikes/show']({ hike: hike, users: users });
        mainContentAppend(html);
      });
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
$(function() {
  $(document).on('turbolinks:load', function() {
    attachListeners();
  })
})

////////////////////////////////////////////////////////////////////////////////////
//  /hikes index action code for asynchronous loading.
////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////
//  Function Prototypes
//////////////////////////////////////////

function Hike(data) {
  this.id = data.id;
  this.title = data.title;
  this.description = data.description;
  this.hike_date = moment(data.hike_date).format("MMM D, YYYY")
  this.trail = data.hiking_trail.name;
  this.trail_image = data.hiking_trail.image_url;
  this.hike_type = data.planned_hikes[0].hike_type;
  this.hikers = [];
  for (let hike of data.planned_hikes) {
    this.hikers.push(hike.user_id);
  }
}

Hike.prototype.truncateText = function() {
  this.description = this.description.slice(0,45
  );
  this.description += '...';
}



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




// iife function for DOM ready()
$(function() {
  // Hijack Find Hike Button from /home
  attachListeners();


}); // End of iife block
// Make AJAX request to /hikes :index action for JSON

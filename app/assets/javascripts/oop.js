
//////////////////////////////////////////
//  Object Constructors
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

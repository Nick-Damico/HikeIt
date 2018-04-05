//
// ///////////////////////////////////////////////////////////////
// //  Object Constructors
// ///////////////////////////////////////////////////////////////
//
// //////////////////////////////////////////
// //  Hike Constructor & Prototype Methods
// //////////////////////////////////////////
//
// function Hike(data) {
//   this.id = data.id;
//   this.title = data.title;
//   this.description = data.description;
//   this.notes = data.notes;
//   this.date = data.hike_date;
//   this.time = data.hike_time;
//   this.trail_id = data.hiking_trail.id;
//   this.trail = data.hiking_trail.name;
//   this.trail_image = data.hiking_trail.image_url;
//   this.hike_type = data.planned_hikes[0].hike_type;
//   this.features = data.hiking_trail.feature.title;
//   this.hikers = [];
//   for (let hike of data.planned_hikes) {
//     this.hikers.push(hike.user_id);
//   }
// }
//
// Hike.buildHikes = function(data) {
//   let hikes = [];
//   for (let item of data) {
//     let hike = new Hike(item);
//     hikes.push(hike);
//   }
//   return hikes;
// }
//
// Hike.prototype.formatDate = function() {
//   return moment(this.date).format("MMM D, YYYY");
// }
//
// Hike.prototype.formatTime = function() {
//   return moment(this.time).format("h:mm a");
// }
//
// Hike.prototype.truncateText = function() {
//   this.description = this.description.slice(0,45
//   );
//   this.description += '...';
// }
//
//
//
// //////////////////////////////////////////
// //  User Constructor & Prototype Methods
// //////////////////////////////////////////
//
// function User(data) {
//   this.id = data.id;
//   this.email = data.email;
// }
//
// User.buildUsers = function(data) {
//   let users = [];
//   for (let user of data) {
//     newUser = new User(user);
//     users.push(newUser);
//   }
//   return users;
// }

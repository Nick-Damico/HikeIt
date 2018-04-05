// ////////////////////////////////////////////////////////////////////////////////////
// //  Handlebars.js Helper Methods
// ////////////////////////////////////////////////////////////////////////////////////
//
// Handlebars.registerHelper('formatted_date', function(hike, options) {
//   return hike.formatDate();
// });
//
// Handlebars.registerHelper('formatted_time', function(hike, options) {
//   return hike.formatTime();
// });
//
// Handlebars.registerHelper('hike_banner', function(type, options) {
//     let html = '';
//     if (type === 'day_hike') {
//       html = '<div class="hike-status-banner hike-status-day"><span class="text-white font-w-100">DayHike</span></div>'
//     } else {
//       html = '<div class="hike-status-banner hike-status-night"><span class="text-white font-w-100">OverNight</span></div>'
//     }
//     return new Handlebars.SafeString(html);
// });
//
// Handlebars.registerHelper('join_status', function(hikers, hike_id, options) {
//     let html = '';
//     let id = parseInt(document.cookie.replace('user_id=',''));
//     if (hikers.indexOf(id) === -1) {
//         html += `<form action="/hikes/${hike_id}/join" accept-charset="UTF-8" method="post">`;
//         html += '<input name="utf8" type="hidden" value="✓">';
//         html += '<input type="submit" name="commit" value="Join" class="card-btn btn btn-login-form text-white rounded-0 w-50" data-disable-with="Join" disabled>';
//     		html += '</form>';
//     } else {
//       html = '<span class="btn card-btn btn-color-login joined-btn rounded-0 w-75">You\'ve Joined</span>';
//     }
//     return new Handlebars.SafeString(html);
// });
//
// Handlebars.registerHelper('current_user', function() {
//   return parseInt(document.cookie.replace('user_id=',''));
// })

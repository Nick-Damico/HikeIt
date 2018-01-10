# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
  - Using 'jquery-rails' gem, code in '/assets/javascript/app.js'
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Used 'active_model_serializers' gem, rendering :show view for instances of  'hikes', '/hikes/:id'.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Rendering :index view of all planned_hikes, from '/home' clicking either nav-bar link 'hikes' or 'Find Hike' button will render all hikes using AJAX.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - On :show view of a hike users who have joined the hike are displayed which is a many_to_many relationship, there is also a side container with an all hike button that when clicked will render all of a Users hikes into the window as well.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  - /home page click on 'plan hike' will bring up a form to plan a hike. On submission of this form AJAX and jQuery are used to hijack this default behavior and make a 'POST' request to '/hikes' which returns a JSON model of this data and using Handlebars.js renders this into the window as a :show view.
- [x] Translate JSON responses into js model objects.
  - 'assets/javascript/oop.js' contains JavaScript Object constructor functions for Users and Hikes. I can call 'new Hike(data)', 'new User(data)' and pass in returned JSON data from my server to create model objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  - Examples of methods for this are: Hike.prototype.formatDate, Hike.prototype.truncateText, User.buildUsers.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

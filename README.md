# HikeIt

## Project Overview
HikeIt is a Ruby on Rails application designed to help outdoor enthusiasts find and organize hikes with friends, both old and new, within the GSM National Park. Whether you're a seasoned hiker or a beginner, HikeIt provides a platform to discover exciting trails, connect with fellow hikers, and plan memorable hiking adventures in the beautiful surroundings of the GSM National Park.

## Screenshot
![HikeIt App](https://github.com/Nick-Damico/HikeIt/assets/19657584/35c2709c-ed2f-41ed-9de3-888dd89da65e)

## Key Features
- Explore a wide range of hiking trails within the GSM National Park.
- Create and manage personal hiking profiles.
- Connect with other hikers and join group hikes for a shared hiking experience.
- Organize and schedule your own hikes, inviting friends or welcoming new hikers to join.

## Technologies Used
- Ruby on Rails framework for rapid application development.
- Database management with MySQL to store user profiles, hike information, and user-generated content.
- Authentication and authorization systems to ensure secure user access and privacy.

## Installation
1. Clone the repository
`git clone https://github.com/Nick-Damico/HikeIt.git`

2. Navigate to the project directory
`cd HikeIt`

3. Install the required dependencies
`bundle install`

4. Set up the database
`rails db:migrate`

5. Populate the database with hiking trails using the following command to ensure the database is populated
`rails db:seed`

6. Start the server
`rails s`

## Usage

1. After cloning the repository and following the installation steps below, use the command `rails s` to start the server.
2. Open your web browser and navigate to `localhost:3000`.
3. Sign up using a valid email and password, or sign up with Facebook.
4. Once logged in, you have two options: 'Plan Hike' or 'Find Hike'.
   - To plan a hike, click on 'Plan Hike' and fill out the form to create a new hike in the database. Submit the form once completed.
   - To find a hike, click on 'Find Hike'. This will display all joinable hikes in the database.
5. To view more information about a specific hike, click on the hike's details. You can find additional information such as the trail route, difficulty level, and any notes from the organizer.
6. To join a hike, simply click on the 'Join' button for the desired upcoming event. This will add you as a participant in that hike.

Enjoy discovering and organizing exciting hiking adventures with HikeIt!

## Future Improvements
- Rate Hikes by difficulty level, interest, and location.
- Utilize interactive maps, trail descriptions, and user reviews to make informed hiking choices.
- Expand to other National Parks.
- Stay up-to-date with the latest hiking events, news, and tips from the GSM National Park community.

## Acknowledgments (Optional)
[HikeIt is a personal project created by [Nicholas D'Amico]. Special thanks [Flatiron Bootcamp.] for giving me the skills to build this project.

The app is available as open source under the terms of the [MIT License](https://github.com/Nick-Damico/HikeIt/blob/master/LICENSE).

# HikeIt ##

HikeIt is a Rails social hiking application that allows a User to plan a hiking trip or join other users on their hiking trips, it also includes a database of information on all hikes in the GSMNP.

## Usage ##

After cloning and installing user ```rails s``` to start a server and type into your browser ```localhost:3000```
Sign up with a valid email and password or Facebook. Once logged in choose to 'plan hike' or 'find hike'. Plan hike will present you with a form to create a new hike in the database once submitted. Clicking on the 'find hike' button from the home page or hikes in the navbar will display all joinable hikes in the database. Click to find out more information about the hike or click directly on the 'join' button to be added as a hiker for that upcoming event.

## Installation ##

```shell
git clone https://github.com/Nick-Damico/HikeIt.git
cd HikeIt
bundle install
rails db:migrate
rails s
```

## Contributing ##

Bug reports and pull requests are welcome on GitHub at https://github.com/Nick-Damico/HikeIt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/Nick-Damico/HikeIt/blob/master/CONTRIBUTING.md) code of conduct.

## License ##

The gem is available as open source under the terms of the [MIT License](https://github.com/Nick-Damico/HikeIt/blob/master/LICENSE).

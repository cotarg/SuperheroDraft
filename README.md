# SuperheroDraft
A Rails app for playing superhero drafts.

## Description:
"What if so and so teamed up" is a frequent conversation in comic book nerd circles. I want to build an app that allows for people to conceive of those match-ups, and then put them up for ratings.

This is a Rails app that allows people to save teams and matchups, leveraging the ComicVine API for information about characters. The current feature set includes the ability to save a user account, make matchups for you and friends to compete in, and to make and save teams of superheroes to enter in matchups.

Future improvements in the backlog include:
* Character Information pages, leveraging more info out of ComicVine
* Private matchups that can only be joined by invitation
* Further leveraging of Spotify beyond logins to embed playlists in teams.

## Dependencies:
All required gems are listed in the Gemfile, to install the app locally as long as you are using Ruby 2.3 and Rails 4.2, all you'll need to do is `bundle install`.

To get full functionality, you will require an API keys for both [Spotify](https://developer.spotify.com/web-api/) and [ComicVine](http://comicvine.gamespot.com/api/). 

In addition, this app relies on a caching layer and is configured to use memcached. (If you prefer a different solution, you may need to reconfigure the app's caching.)

## Technologies:
Ruby 2.3
Rails 4.2
Google's [Material Design Lite](https://getmdl.io/)
memcached
ActiveRecord and PostgreSQL

## License:
This project is copyright(c) 2016, Rowan G. Cota, and is licensed under the MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contributing to this project:

If you wish to contribute to this project, please fork a copy to your own account and develop features on branch. The branch naming convention for the project is `(your initials)/(name of feature)`.

When your feature is complete, please submit a pull request against master. In the pull request please include a summary of the changes/feature, any new required dependencies, and the name you wish to be credited by for contribution of the feature.

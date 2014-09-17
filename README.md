CutePetsDenver
==============

# Post a random adoptable pet from Denver's shelter to a twitter feed.

Originated as a project of [Team Denver](http://codeforamerica.org/cities/denver/) during the 2014 fellowship at Code for America.

## About
A twitter bot that pulls data from a random pet in the U.S. using the [Petfinder gem](https://github.com/ehutzelman/petfinder).

Originally specific to Denver, it's been redeployed by a few cities. Check out [this twitter list](https://twitter.com/drewSaysGoVeg/cutepetseverywhere/members) to see where.

**Links to Petfinder gem and Bot**

* [Twitter bot](http://twitter.com/CutiesInDenver)

* [Petfinder gem](https://github.com/ehutzelman/petfinder)

## Setup

### Twitter
1. Create a new [twitter app](https://apps.twitter.com/).
1. On the API key tab for the Twitter app, modify permissions so the app can **Read and Write**.
1. Create an access token. On the API Key tab in Twitter for the app, click **Create my access token**
1. Take note of the values for environment set up below.
*Note:* It's important to change permissions to Read/Write before generating the access token. The access token is keyed for the specific access level and will not be updated when changing permissions.

### Petfinder
1. Get your [Petfinder API Key](https://www.petfinder.com/developers/api-key)

### Environmental variables
1. Create a local .env file: `cp template.env .env`
2. Fill in the twitter keys created above. 
3. Fill in the API credentials created above.
4. Fill in the City and State from where you'd like to tweet a random pet for adoption. (Format is City, State e.g. Washington, DC -- no quotations needed)

### Run
`rake`

## Deployment

### Heroku 
1. Download and install the [Heroku Toolbelt](from: https://toolbelt.heroku.com).
1. Create heroku project: `heroku create [app name]`
1. Push code: `heroku push heroku master`
1. Add environment variables
    1. `heroku config:set TWITTER_KEY=your_twitter_key`
    1. `heroku config:set TWITTER_SECRET=your_twitter_secret`
    1. `heroku config:set OAUTH_TOKEN=your_oauth_token`
    1. `heroku config:set OAUTH_TOKEN_SECRET=your_oauth_secret`
    2. `heroku config:set PETFINDER_KEY=your_petfinder_key`
    2. `heroku config:set PETFINDER_SECRET=your_petfinder_secret`
    3. `heroku config:set CITY=City, State`
1. Schedule Tweets 
    1. Add the **Heroku Scheduler** add on: `heroku addons:add scheduler`
    1. Schedule tweets: `heroku addons:open scheduler`
    1. In the task field: `rake`.

## Hat tips

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudos to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).

* Also kudos to [Erik Hutzelman](https://github.com/ehutzelman) for the [Petfinder gem](https://github.com/ehutzelman/petfinder)!
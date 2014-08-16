CutePetsDenver
==============

# Post a random adoptable pet from Denver's shelter to a twitter feed.

Originated as a project of [Team Denver](http://codeforamerica.org/cities/denver/) during the 2014 fellowship at Code for America.

## About
A twitter bot that pulls data from [Adopt-A-Pet-Denver](https://github.com/dviramontes/Adopt-a-Pet-Denver) an API created by [David Viramontes](https://github.com/dviramontes/) and [Drew](https://github.com/drewrwilson) to serve data for animals currently in Denver animal shelters ready for adoption.

Originally specific to Denver, it's been redeployed by a few cities. Check out [this twitter list](https://twitter.com/drewSaysGoVeg/cutepetseverywhere/members) to see where.

**Links to API and Bot**

* [Twitter bot](http://twitter.com/CutiesInDenver)

* [API](http://adopt-a-pet-denver.herokuapp.com/api)

## Setup

### Twitter
1. Create a new [twitter app](https://apps.twitter.com/).
1. On the API key tab for the Twitter app, modify permissions so the app can **Read and Write**.
1. Create an access token. On the API Key tab in Twitter for the app, click **Create my access token**
1. Take note of the values for environment set up below.
*Note:* It's important to change permissions to Read/Write before generating the access token. The access token is keyed for the specific access level and will not be updated when changing permissions.

### Environmental variables
1. Create a local .env file: `cp template.env .env`
1. Fill in the twitter keys created above. 

### Run
`rake`

## Deployment

### Heroku 
1. Download and install the [Heroku Toolbelt](from: https://toolbelt.heroku.com).
1. Create heroku project: `heroku create [app name]`
1. Push code: `heroku push heroku master`
1. Add environment variables
    1. `heroku config:set consumer_key="your_consumer_key_goes_here"`
    1. `heroku config:set consumer_secret="your_consumer_secret_key_goes_here"`
    1. `heroku config:set access_token="your_access_token_goes_here"`
    1. `heroku config:set access_token_secret="your_access_token_secret_goes_here"`
1. Schedule Tweets 
    1. Add the **Heroku Scheduler** add on: `heroku addons:add scheduler`
    1. Schedule tweets: `heroku addons:open scheduler`
    1. In the task field: `rake`.

## Hat tips

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudo to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).

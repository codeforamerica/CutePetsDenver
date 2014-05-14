CutiesInDenver
==============

# Post a random adoptable pet from Denver's shelter to a twitter feed.

Project of [Becky Boone](https://github.com/boonrs) and [Drew](https://github.com/drewrwilson) during our fellowship at Code for America in 2014.

## About
A twitter bot that pulls data from [Adopt-A-Pet-Denver](https://github.com/dviramontes/Adopt-a-Pet-Denver) an API created by [David Viramontes](https://github.com/dviramontes/) and [Drew](https://github.com/drewrwilson) to serve data for animals currently in Denver animal shelters ready for adoption.

**Links to API and Bot**

* [Twitter bot](http://twitter.com/CutiesInDenver)

* [API](http://adopt-a-pet-denver.herokuapp.com/api)

## Setup

#### Download this project. 

The command in your terminal should look something like this:

    git clone https://github.com/drewrwilson/CutiesInDenver.git
    cd CutiesInDenver

#### Install the prerequisites:

    bundle install

#### Get your API keys

You need to sign up for a twitter API. You'll need all of the following:
* consumer key
* consumer secret
* access token
* access token secret

#### Setup your environment variables

If you're using a Mac or Linux, you can do this in bash by running these commands:

````
export consumer_key=XXXXXXXXXXXXXXXXXXXXXX
export consumer_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
export access_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
export access_token_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
````

Alternatively, you can set those properties in a file named ".env". The example file, template.env, can be renamed to .env and modified.

## Running the app

Running `rake` from the project directory should result in tweeting about a random adoptable pet.


-----------------------

**Hat tips**

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudo to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).

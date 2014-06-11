CutiesInBoston
==============

Post a random adoptable pet from the Boston MSPCA to a twitter feed.

Project of [Becky Boone](https://github.com/boonrs) and [Drew](https://github.com/drewrwilson) during their fellowship at Code for America in 2014.

Modified by [CodeforBoston](codeforboston.com) to work with the Petfinder.com API

## About
A twitter bot that pulls data from the Petfinder API and tweets out adoptable pets from the [Boston MSPCA](http://www.mspca.org/adoption/boston/).

It should be easily extendable to other shelters using petfinder.com to list their animals.

**Links to API and Bot**

* [Twitter bot](http://twitter.com/CutiesInBoston)

* [API](https://www.petfinder.com/developers/api-docs)

## Setup

### Install

    bundle install

### Get your API keys

You need to sign up for a twitter API. You'll need all of the following:
* consumer_key
* consumer_secret
* access_token
* access_token_secret

You'll also need petfinder keys
* petfinder_key
* petfinder_secret

### Setup your environment variables

If you're using a Mac or Linux, you can do this in bash by running these commands:

    export consumer_key=XXXXXXXXXXXXXXXXXXXXXX
    export consumer_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    export access_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    export access_token_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    export petfinder_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    export petfinder_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

### Tweet

    rake tweet

-----------------------

**Hat tips**

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudo to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).

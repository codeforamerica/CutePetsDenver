require "twitter"
require "logger"
require "pp"
require "open-uri"

class Twit
  attr_reader :pet

  def initialize(pet)
    @pet = pet
    @errlog = Logger.new(STDERR)
    @errlog.level = Logger::WARN #set to Logger:WARN to avoid seing status messages
  end

  def greeting
    Greeting.new.random
  end

  def message
    PP.pp(pet)

    if pet.sex == 'M'
      gender = "male"
    elsif pet.sex == 'F'
      gender = "female"
    else
      gender = ''
    end

    # if it's a "Small and Fuzzy" just list the breed,
    # if it's a rabbit list it as an X rabbit
    # if it's a cat of dog just list the breed and not 'cat' or 'dog'
    # TODO deal with multi-breed dogs

    if pet.type == "Small & Furry"
      animal = pet.breed
    elsif pet.type == "Rabbit"
      animal = pet.breed + " " + "Rabbit"
    else
      animal = pet.breed
    end

    greeting +
    " " + pet.name + ". " +
    "A " + gender +
    " " + animal +
    " " + pet.link
  end

  def client
    Twitter::REST::Client.new do |config|
      begin
        config.consumer_key = ENV.fetch('consumer_key')
        config.consumer_secret = ENV.fetch('consumer_secret')
        config.access_token = ENV.fetch('access_token')
        config.access_token_secret = ENV.fetch('access_token_secret')

      rescue KeyError
        @errlog.error "What are your twitter keys? I see none in env. Did you read the README? Specifically,git  #{$!}"
      end

    end
  end

  def tweet
    uri = URI.parse(pet.pic)
    media = uri.open
    client.update_with_media(message, media)
  end
end

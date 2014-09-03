require "twitter"
require "logger"
require 'open-uri'

class Twit
  attr_reader :pet

  def initialize(pet)
    @pet = pet
    @errlog = Logger.new(STDERR)
    @errlog.level = Logger::WARN #set to Logger:WARN to avoid seing status messages
  end

  def client
    Twitter::REST::Client.new do |config|
      begin
        config.consumer_key = ENV["TWITTER_KEY"]
        config.consumer_secret = ENV["TWITTER_SECRET"]
        config.access_token = ENV["OAUTH_TOKEN"]
        config.access_token_secret = ENV["OAUTH_TOKEN_SECRET"]

      rescue KeyError
        @errlog.error "What are your twitter keys? I see none in env. Did you read the README? Specifically,git  #{$!}"
      end

    end
  end


  def tweet_pet
     File.open('image.png', 'wb') do |file|
      file << open(pet.photo_url).read
      tweet = "#{pet.description}... #{pet.profile_url}"
      client.update_with_media(tweet, File.open(file))
     end
  end

end
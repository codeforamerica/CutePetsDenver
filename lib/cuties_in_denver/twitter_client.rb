require 'twitter'
require 'logger'
require 'english'

class TwitterClient
  attr_reader :pet

  def initialize(pet)
    @pet = pet
    @errlog = Logger.new(STDERR)
    @errlog.level = Logger::WARN # setting to avoid seeing status messages
  end

  def greeting
    Greeting.new.random
  end

  def message
    greeting + ' ' + pet.name + '. ' + pet.desc.slice(0..65) + '... ' + pet.link
  end

  def client
    Twitter::REST::Client.new do |config|
      begin
        config.consumer_key = ENV.fetch('consumer_key')
        config.consumer_secret = ENV.fetch('consumer_secret')
        config.access_token = ENV.fetch('access_token')
        config.access_token_secret = ENV.fetch('access_token_secret')

      rescue KeyError
        @errlog.error "What are your twitter keys? I see none in env. Did you read the README? Specifically,git  #{$ERROR_INFO}"
      end

    end
  end

  def tweet
    File.open('image.png', 'wb') do |file|
      file << open(pet.pic).read
      client.update_with_media(message, File.open(file))
    end
  end
end

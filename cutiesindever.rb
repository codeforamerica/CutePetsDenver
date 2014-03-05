require "Twitter"
require "yaml"

require_relative 'config'
# get json
# parson json
yaml = YAML.load_file('config.yml')
c = yaml['en']['config']

client = Twitter::REST::Client.new do |config|
	config.consumer_key = c['consumer_key']
	config.consumer_secret = c['consumer_secret']
	config.access_token = c['access_token']
	config.access_token_secret = c['access_token_secret']
end

client.update("I'm tweeting with @drewSaysGoVeg!")


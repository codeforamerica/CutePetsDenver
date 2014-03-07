require "Twitter"
require "yaml"
require "net/http"
require 'json'
require 'open-uri'

require_relative 'string_function'


url = 'http://adopt-a-pet-denver.herokuapp.com/api'
response =  Net::HTTP.get_response(URI.parse(url))


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

#parse the json into a hash
animaldata = JSON.parse(response.body);

#remove this after we add it to the API
animaldata['link'] = "http://www.petharbor.com/pet.asp?uaid=DNVR." + animaldata['id']

#building the tweet sentence
mytweet = "Hi! My name is " + animaldata['name'].my_titleize + ". " + animaldata['desc'].strip_html.slice(0..65) + "... " + animaldata['link']
mytweet.remove_double_whitespace

#post the tweet
#client.update(mytweet)

File.open('image.png', 'wb') do |file|
	file << open(animaldata['pic']).read
	#post the tweet
	client.update_with_media(mytweet, File.open(file))
	#test output
	#puts "My tweet " + mytweet.remove_double_whitespace
end
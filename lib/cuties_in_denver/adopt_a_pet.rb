require "net/http"
require 'json'
require 'open-uri'

class AdoptAPet
  # Now we need to grab the URL of the city-specific API that tells us about available pets
  # (If the environment doesn't have a $CUTIES_API_URL variable set, we'll assume we're in Denver.)
  URL =  ENV.fetch('CUTIES_API_URL', 'http://adopt-a-pet-denver.herokuapp.com/api')

  def self.random
      Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
  end
end

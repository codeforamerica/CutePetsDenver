require "net/http"
require 'json'
require 'open-uri'
require 'pp'

class AdoptAPet
  URL = 'http://adopt-a-pet-mesa.herokuapp.com/api'

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  private
  def self.fetch_pet
    Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
  end
end

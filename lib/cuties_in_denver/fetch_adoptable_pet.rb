require 'net/http'
require 'json'
require 'open-uri'

# Hits custom API and fetches a pet that is adoptable
class FetchAdoptablePet
  URL = 'http://adopt-a-pet-mesa.herokuapp.com/api'

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  def self.fetch_pet
    Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
  end
  private_class_method :fetch_pet
end

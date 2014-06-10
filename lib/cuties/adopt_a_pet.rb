require "net/http"
require 'json'
require 'open-uri'
require 'pp'

class AdoptAPet
  URL = 'http://api.petfinder.com/pet.getRandom'

  PARAMS = {
    :format => 'json',
    :key => ENV.fetch('petfinder_key'),
    :shelterid => 'MA38', # MSPCA in Jamaica Plain
    :output => 'full'
  }

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  private
  def self.fetch_pet
    uri = URI(URL)
    uri.query = URI.encode_www_form(PARAMS)
    json = JSON.parse(Net::HTTP.get_response(uri).body)

    PP.pp(json)

    p = json['petfinder']['pet']

    pet = {
      "link" => "https://www.petfinder.com/petdetail/" + p['id']['$t'],
      "name" => p['name']['$t'],
      "pic" => p['media']['photos']['photo'][2]['$t'],
      # TODO which photo (of three) is the best? If there a way we can figure this out?
      # TODO deal with missing photos
      "id" => p['id']['$t'],
      "sex" => p['sex']['$t'],
      "breed" => p['breeds']['breed']['$t'],
      "type" => p['animal']['$t']
      #"desc" => p['description']['$t'] or ''
    }

    PP.pp(pet)

    Pet.new(pet)
  end
end

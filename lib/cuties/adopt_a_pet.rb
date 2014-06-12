require 'net/http'
require 'json'
require 'open-uri'
require 'pp'

class AdoptAPet
  URL = 'http://api.petfinder.com/pet.getRandom'

  PARAMS = {
    format:    'json',
    key:        ENV.fetch('petfinder_key'),
    shelterid: 'MA38', # MSPCA in Jamaica Plain
    # id: 29421606,
    output:    'full'
  }

  def self.random
    pet = fetch_pet while pet.nil? || pet.error?
    pet
  end

  private

  def self.get_breeds(pet)
    breed_list = [pet['breeds']['breed']].flatten # Coerces into an Array
    breed_list = breed_list.map{ |b| b["$t"] }.join(' & ') # Joins into string
  end

  def self.photo_url(pet)
    pet['media']['photos']['photo'][2]['$t'] unless pet['media'].nil?
  end

  def self.fetch_pet
    uri = URI(URL)
    uri.query = URI.encode_www_form(PARAMS)
    json = JSON.parse(Net::HTTP.get_response(uri).body)

    PP.pp(json)  # Pretty-prints the response in the Terminal

    pet_json  = json['petfinder']['pet']
    breeds    = get_breeds(pet_json)
    photo_url = get_photo(pet_json)

    pet = {
      "link" => "https://www.petfinder.com/petdetail/" + p['id']['$t'],
      "name" => p['name']['$t'],
      "pic" => photo_url,
      "id" => p['id']['$t'],
      "sex" => p['sex']['$t'],
      "breed" => breeds,
      "type" => p['animal']['$t']
      #"desc" => p['description']['$t'] or ''
    }

    PP.pp(pet)

    Pet.new(pet)
  end
end

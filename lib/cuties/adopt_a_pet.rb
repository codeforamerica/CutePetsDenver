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

    b = p['breeds']['breed']
    if b.kind_of?(Array) #if there are multiple breeds put them in a list
      breeds = []
      for item in b
        breeds.push(item['$t'])
      end
    else
      breeds = [b['$t']]
    end

    if p['media'] != nil
      picture = p['media']['photos']['photo'][2]['$t']
    else
      picture = nil
    end

    pet = {
      "link" => "https://www.petfinder.com/petdetail/" + p['id']['$t'],
      "name" => p['name']['$t'],
      "pic" => picture,
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

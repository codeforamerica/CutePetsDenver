require "net/http"
require 'json'
require 'open-uri'

class AdoptAPet
  URL = 'http://adopt-a-pet-denver.herokuapp.com/api'

  def self.random

    pet = Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))

    while pet.nil? or pet.pic.nil? # just keep on trying.
      pet = Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
      #maybe TODO later: exponential backoff rather than continuously hitting the server.
    end

    return pet
  end

end

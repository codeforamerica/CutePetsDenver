require "net/http"
require 'json'
require 'open-uri'
require 'logger'

class AdoptAPet
  URL = 'http://adopt-a-pet-denver.herokuapp.com/api'

  def self.random
    log = Logger.new(STDOUT)
    log.level = Logger::INFO #set to Logger:WARN to avoid seing status messages

    pet = Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))

    while pet.nil? or pet.pic.nil? # just keep on trying.
      log.info("Bummer! The server gave us either no pet or pet w/o pic! I'll try again though.")
      pet = Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
      #maybe TODO later: exponential backoff rather than continuously hitting the server.
    end

    return pet
  end

end

class AdoptAPet
  URL = 'http://adopt-a-pet-denver.herokuapp.com/api'

  def self.random
      Pet.new(JSON.parse(Net::HTTP.get_response(URI.parse(URL)).body))
  end
end

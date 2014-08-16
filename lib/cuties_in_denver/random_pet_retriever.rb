require "petfinder"

class RandomPetRetriever

  def self.retrieve_random_pet(shelter_id)
    petfinder = Petfinder::Client.new(ENV["API_KEY"], ENV["API_SECRET"])
    pet = petfinder.random_pet(shelterid: shelter_id)
    p pet.description
    p pet.photos.first
    p pet.id
    #https://www.petfinder.com/petdetail/#{pet.id}
  end


end
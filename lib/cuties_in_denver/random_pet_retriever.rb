require "petfinder"

class RandomPetRetriever

  def self.retrieve_random_pet(city)
    petfinder = Petfinder::Client.new(ENV["PETFINDER_KEY"], ENV["PETFINDER_SECRET"])
    pet = petfinder.random_pet(location: city)
    pet_to_tweet = Pet.new(description: pet.description.slice(0..70), photo_url: pet.photos.first.medium, profile_url: "https://www.petfinder.com/petdetail/#{pet.id}")
    pet_to_tweet
  end

end
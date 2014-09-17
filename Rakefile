require 'dotenv'
Dotenv.load

require_relative 'lib/cuties_in_denver'

desc "Retrieve and tweet about pet by city via Petfinder"
task :petfindertweet do 
  pet = RandomPetRetriever.retrieve_random_pet(ENV["CITY"])
  Twit.new(pet).tweet_pet
end


task :default => :petfindertweet

require 'dotenv'
Dotenv.load

require_relative 'lib/cuties_in_denver'


desc "Retrieve random pet via Petfinder"
task :petfinder do 
  RandomPetRetriever.retrieve_random_pet
end

desc "Retrieve and construct tweet about pet via Petfinder"
task :petfindertweet do 
  pet = RandomPetRetriever.retrieve_random_pet
  Twit.new(pet).tweet_pet
end

task :default => :twitter

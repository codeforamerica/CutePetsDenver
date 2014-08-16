require 'dotenv'
Dotenv.load

require_relative 'lib/cuties_in_denver'

desc "Tweet random pet."
task :twitter do 
  Twit.new(AdoptAPet.random).tweet
end

desc "Retrieve random pet via Petfinder"
task :petfinder do 
  RandomPetRetriever.retrieve_random_pet("CA148")
end

task :default => :twitter


#CA148
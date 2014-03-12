require 'dotenv'
Dotenv.load

require_relative 'lib/cuties_in_denver'

desc "Tweet random pet."
task :twitter do 
  Twit.new(AdoptAPet.random).tweet
end

task :default => :twitter
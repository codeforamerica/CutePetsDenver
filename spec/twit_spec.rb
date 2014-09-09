require 'cuties_in_denver/twit'
require 'cuties_in_denver/pet'

describe Twit do
  describe '#create' do
    it 'assigns a new pet' do
      pet_json = JSON.generate(
                  {id: 'some_id', link: 'http://www.example.com/pets/moofy', 
                   name: 'moofy', desc: 'Moofy is a cute dog', 
                   pic: 'http://www.example.com/pics/moofy.jpg', code: 'some_code'}
                  )
      pet = Pet.new(pet_json)
      twit = Twit.new(pet)
      expect(twit.pet).to eq(pet)
    end
  end

  # TODO 
  describe '#tweet' do
  end
end
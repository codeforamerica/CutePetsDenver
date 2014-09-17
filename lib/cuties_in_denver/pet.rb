class Pet
  attr_reader :description, :photo_url, :profile_url

  def initialize(attributes = {})
    @description = attributes[:description]
    @photo_url = attributes[:photo_url]
    @profile_url = attributes[:profile_url]
  end


end
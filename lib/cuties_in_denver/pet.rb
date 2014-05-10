class Pet
  attr_reader :attributes

  def id
    attributes['id'].strip_html
  end

  def link
    "http://www.petharbor.com/pet.asp?uaid=DNVR." + id
  end

  def name
    attributes['name'].strip_html.my_titleize
  end

  def desc
    attributes['desc'].strip_html
  end

  def pic
    attributes['pic'].strip_html
  end

  def initialize(attributes)
    @attributes =  attributes
  end

  def error?
    attributes['code']
  end
end
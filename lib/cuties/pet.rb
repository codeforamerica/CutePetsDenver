class Pet
  attr_reader :attributes

  def id
    attributes['id']
  end

  def link
    attributes['link']
  end

  def name
    attributes['name']
  end

  def sex
    attributes['sex']
  end

  def breed
    attributes['breed']
  end

  def type
    attributes['type']
  end

  #def desc
  #  attributes['desc'].strip_html
  #end

  def pic
    attributes['pic']
  end

  def initialize(attributes)
    @attributes =  attributes
  end

  def error?
    attributes['code']
  end
end

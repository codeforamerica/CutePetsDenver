class Pet
  attr_reader :attributes

  def id
    attributes['id']
  end

  def link
    attributes['link']
  end

  def name
    attributes['name'].my_titleize
  end

  def desc
    attributes['desc'].strip_html.remove_double_whitespace
  end

  def pic
    attributes['pic']
  end

  def initialize(attributes)
    @attributes =  attributes
  end
end
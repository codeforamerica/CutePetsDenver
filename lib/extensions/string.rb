require 'nokogiri'

# Extensions to the String class
class String
  def my_titleize
    split.map(&:capitalize).join(' ')
  end

  def strip_html
    doc = Nokogiri::HTML(self)
    doc.xpath('//text()').remove.text
  end
end

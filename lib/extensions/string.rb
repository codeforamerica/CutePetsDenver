require 'nokogiri'

class String
	def strip_html
    doc = Nokogiri::HTML(self)
    doc.xpath("//text()").remove.text
	end
end



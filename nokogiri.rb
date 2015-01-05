require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.olx.com.ar/nf/search/venta%2Bpergamino"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text
cont = 0
doc.css("#itemListContent .clearfix").each do |item|
	puts item.css("h3 a").text
	puts cont += 1
end
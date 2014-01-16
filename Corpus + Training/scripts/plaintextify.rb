#!/usr/bin/env ruby

require 'rexml/document'
include REXML

output_file = File.open('tweets.plaintext', 'w')

Dir.foreach('Corpus/') do |item|
	next if item == '.' or item == '..'

	#puts item

	file = File.read("Corpus/" + item)
	begin
		doc = Document.new file
	rescue
		puts "#{item} is messed up."
	end

	doc.elements.each("doc/text") do |element|
		output_file.write element.text
		output_file.write "\n"
	end

	#file.close
end

output_file.close

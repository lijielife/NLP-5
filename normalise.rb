#!/usr/bin/env ruby

filename_read = ARGV[0] || "nlp_merged.txt"
filename_write = ARGV[1] || "nlp_merged.normalised"
read_file = File.new(filename_read, "r")
write_file = File.new(filename_write, "w")

count = 0
while (line = read_file.gets)
	# 1. Replace escaped quotes with just quotes
	line.gsub!(/\\"/, '"')

	# 2. Replace a series of more than one periods, exclamation makrs, or
	# questions marks with a period and a space
	line.gsub!(/([.?!]){2,}/, '\1 ')

	# 3. Remove 'RT's and 'Retweet's
	line.gsub!(/\bRT\b/i, '')
	line.gsub!(/retweet/i, '')

	# 4. Remove @mentions (@replies) occurring at the start of the tweet
	line.gsub!(/^@.*? /, '')

	# 5. Remove smilies and sadlies
	line.gsub!(/:[()]/, '')

	# 6. Put sentences on new lines
	line.gsub!(/([.?!] )/, "\\1\n")

	print line
	count = count + 1
	write_file.write(line)
end

print "#{count} lines written.\n"

read_file.close
write_file.close
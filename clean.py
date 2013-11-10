#!/usr/bin/env python

import json
import sys

# Both in file and out file must be provided!
r = open(sys.argv[1])
w = open(sys.argv[2])

count = 0

for line in r:
	tweet = json.loads(line)
	text = tweet['text']
	cleaned_tweet = {}
	cleaned_tweet["text"] = text
	tweetString = json.dumps(cleaned_tweet)
	w.write (tweetString[10:len(tweetString)-2])
	w.write('\n')

	# Stop once we've reached 400,000 tweets
	count += 1
	if count == 400000:
		break
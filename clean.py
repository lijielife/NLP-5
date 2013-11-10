import json
w = open ('clean.txt', 'a')
r = open ('streamed_data.json')
for line in r:
	tweet = json.loads(line)
	text = tweet['text']
	cleaned_tweet = {}
	cleaned_tweet["text"] = text
	tweetString = json.dumps(cleaned_tweet)
	w.write (tweetString[10:len(tweetString)-2])
	w.write('\n')

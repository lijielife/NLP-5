import nltk, sys
from nltk.classify.naivebayes import NaiveBayesClassifier

def get_words_in_tweets(tweets):
	all_words = []
	for (words, sentiment) in tweets:
		all_words.extend (words)
	return all_words

def get_word_features(wordlist):
	wordlist = nltk.FreqDist(wordlist)
	word_features = wordlist.keys()
	return word_features

def extract_features (document):
	document_words = set(document)
	features = {}
	for word in word_features:
		features['contains(%s)' % word] = (word in document_words)
	return features

def read_tweets_from_file_of_sentiment(fname, sentiment):
    tweets = []
    f = open(fname, 'r')
    line = f.readline()
    while line != '':
        tweets.append([line.lower(), sentiment])
        line = f.readline()
    f.close()
    return tweets

pos_tweets = read_tweets_from_file_of_sentiment('positive.txt', 'positive')
neg_tweets = read_tweets_from_file_of_sentiment('negative.txt', 'neagative')

tweets = []
for (words, sentiment) in pos_tweets + neg_tweets:
	words_filtered = [e.lower() for e in words.split() if len(e) >= 3]
	tweets.append((words_filtered, sentiment))
word_features = get_word_features(get_words_in_tweets(tweets))

training_set = nltk.classify.apply_features(extract_features, tweets)
classifier = nltk.NaiveBayesClassifier.train(training_set)


def classify_tweet(tweet):
    return classifier.classify(extract_features(nltk.word_tokenize(tweet)))

print(classify_tweet(str(sys.argv[1]).lower()))




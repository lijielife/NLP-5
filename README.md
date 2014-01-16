# NLP Project - TwitterSummarizer

This is the source for the web interface for the TwitterNLP project – an assignment for *CSC421: Natural Language Processing* at NTU. It was submitted by

- Shahbaaz Sabharwaal
- Gayathri Gopalakrishnan
- Keerthana Kumar
- Sahil Bajaj
- Arnav Kumar

It summarizes the sentiment of Twitter users on a certain topic. The application lists the positive and negative de- scriptions of a topic on Twitter. The most precise descriptive phrase for the subject needs to be ex- tracted before the sentiment can be determined which implies that the entire corpus can’t be anno- tated with the sentiment for each sentence. For dif- ferent queries different parts of the sentence might be considered. Hence, the sentiment analysis is the last step before the display of results to the user.

The source for the application can be found in the [Application directory] (https://github.com/radzinzki/NLP/tree/master/Application). There is a readme there for further instructions.
The corpus and training data is in a  directory called [Corpus + Training](https://github.com/radzinzki/NLP/tree/master/Corpus%20%2B%20Training). That also has another readme for further instructions.

The project uses a re-trained [Standford Parser](http://nlp.stanford.edu/software/lex-parser.shtml) for Syntactic parsing and a re-trained [Twitie Tagger](http://gate.ac.uk/wiki/twitie.html) for part-of-speech tagging. It uses the [NLTK](http://nltk.org) for the sentiment analysis on the Tweets.


The application is also deployed on Heroku and can be found at: http://twittersummarizer.herokuapp.com.

Unfortunately, due to the storage constraints of the free tier of Heroku, we only have a very small subset of our data there. Only a few queries, such as “iPad” or “iPad air” will give worthwhile results. This serves 
to give an idea as to how the final application should look like after the local deployment.

The [final assignment report](https://github.com/radzinzki/NLP/blob/master/AssignmentReport.pdf) detials all the techniques used for the project, including the processes for training the parser and tagger, our data pipeline, and how the application works.


Credits: 
- [Andy Bromberg's excellent blogpost detailing an example of Sentiment Analysis](http://andybromberg.com/sentiment-analysis-python/)
- [badhessian.org: Collecting real-time Twitter data with the Streaming API](http://badhessian.org/2012/10/collecting-real-time-twitter-data-with-the-streaming-api/)

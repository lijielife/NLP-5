------------------------------------------------------------------------
Explanation of Directory Structure
------------------------------------------------------------------------
This directory contains the results of automatic tagging and the source
code for the application. The automatic tagging results file is called
"nlp_merged.clean.normal.pos" inside the "data" folder. The file
"nlp_merged.clean.normal" contains the normalized plaintext tweets.

The web application is inside the "twittersummarizer" folder and the
source for the Java part of the application (Initializer.jar and
twittersummarizer/TwitterNLP.jar) is inside the "java_source" folder.

------------------------------------------------------------------------
Steps to run the application
------------------------------------------------------------------------
Navigate to this directory on the command line.

1. Initialize the database with the following command:
	java -cp '*' -mx2g -jar Initializer.jar

2. Run the following commands to start the application:
	cd twittersummarizer
	[sudo] pip install virtualenv
	virtualenv venv
	source venv/bin/activate
	pip install -r requirements.py

	python web.py

3. Navigate to the following URL to view the application:
	localhost:5000
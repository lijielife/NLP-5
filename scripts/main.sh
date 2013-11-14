#!/usr/bin/env bash

echo "Extracting corpus... "
tar xvf corpus.tar.gz
echo "Done."

echo -n "Converting XML files to single file with plaintext tweets... "
./plaintextify.rb
echo "Done."

echo -n "Normalising data... "
./normalise.rb tweets.plaintext tweets.plaintext.normal
echo "Done."

echo -n "Adding part-of-speech tags... "
cd twitie-tagger/
java -jar twitie_tag.jar ../Training\ Data/POS\ Tagger/Training\ POS\ Models/finalpos.tagger ../tweets.plaintext.normal > ../tweets.plaintext.normal.pos
cd ..
echo "Done."

echo -n "Parsing POS-tagged data... "
java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory -loadFromSerializedFile Training\ Data/Parser/serialized_models/SerializedModel10 tweets.plaintext.normal.pos > tweets.plaintext.normal.pos.parsed
echo "Done."

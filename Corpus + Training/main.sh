#!/usr/bin/env bash

# This script uses the plaintext tweet data instead of converting the XML
# ones since the latter takes too long and may cause the file manager to
# become unresponsive due to the creation of >400,000 new files

# echo "Extracting corpus... "
# tar xvf data/corpus.tar.gz
# echo "Done."

# echo -n "Converting XML files to single file with plaintext tweets... "
# ./scripts/plaintextify.rb
# echo "Done."

echo -n "Normalising plaintext tweet data... "
./scripts/normalise.rb data/tweets.plaintext data/tweets.plaintext.normal
echo "Done."

echo -n "Adding part-of-speech tags... "
cd twitie-tagger/
java -jar twitie_tag.jar ../tagger_and_parser/POS\ Tagger/Training\ POS\ Models/finalpos.tagger ../data/tweets.plaintext.normal > ../data/tweets.plaintext.normal.pos
cd ..
echo "Done."

echo -n "Parsing POS-tagged data... "
java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory -loadFromSerializedFile tagger_and_parser/Parser/serialized_models/SerializedModel10 data/tweets.plaintext.normal.pos > data/tweets.plaintext.normal.pos.parsed
echo "Done."

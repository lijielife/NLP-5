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
echo "Done."

echo -n "Parsing POS-tagged data... "
echo "Done."

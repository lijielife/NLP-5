#!/usr/bin/env bash

# Get plaintext tweets from xml files

echo -n "Converting XML files to single file with plaintext tweets... "
./plaintextify.rb
echo "Done."

echo -n "Normalising data... "
./normalise.rb
echo "Done."

echo -n "Adding part-of-speech tags... "
echo "Done."

echo -n "Parsing POS-tagged data... "
echo "Done."

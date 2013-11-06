# Command 1

java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz "set1_corrected" > "output_1_pcfg"

# Command 2

java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -PCFG -headFinder edu.stanford.nlp.trees.LeftHeadFinder -sentences newline -train "path/to/training/data" 1 -saveToSerializedFile "SerializedModel1" -writeOutputFiles "PlainTextTweets_subset1"

# Command 3

java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory -loadFromSerializedFile "SerializedModel1" "set2_corrected" > "output_2_pcfg"

# Command 4 (same as command 2, with the range modified - change the range as you move on)

java -cp "*" -mx1g edu.stanford.nlp.parser.lexparser.LexicalizedParser -PCFG -headFinder edu.stanford.nlp.trees.LeftHeadFinder -sentences newline -train "path/to/training/data" 1-2 -saveToSerializedFile "SerializedModel1" -writeOutputFiles "PlainTextTweets"
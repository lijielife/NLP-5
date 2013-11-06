# Command 1

java -cp "*" -mx2g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz "set1_corrected" > "output_1_pcfg"

# Command 2

java -cp "*" -mx2g edu.stanford.nlp.parser.lexparser.LexicalizedParser -PCFG -headFinder edu.stanford.nlp.trees.LeftHeadFinder -sentences newline -train "train_1" -saveToSerializedFile "SerializedModel1" -writeOutputFiles "AllPlainTextTweets"

# Command 3

java -cp "*" -mx2g edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences newline -tokenized -tagSeparator _ -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -tokenizerMethod newCoreLabelTokenizerFactory -loadFromSerializedFile "SerializedModel1" "set2_corrected" > "output_2_pcfg"
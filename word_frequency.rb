def most_common_words(file_name, stop_words_file_name, number_of_word)
  text = File.open('lib/source-text.txt').read.strip  #Open and read the text file
  word_count = Hash.new(0)  #Creating word count method and check how many have from each words
  text.gsub(/\W/, " ").split(" ").each { |word| word_count[word.downcase] += 1 }  #split the text
  p word_count  #see in the array
  File.open(stop_words_file_name, "r").each_line { |line| word_count.delete(line.strip) }  #with stop_word remove the words we do not want to see
  word_count.sort_by { |_key, value| -value }.first(number_of_word).to_h  #check for most frequent words with first method
end

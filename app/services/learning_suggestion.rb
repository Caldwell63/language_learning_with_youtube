class LearningSuggestion
  def initialize(words)
    @words = words
  end

  def call
    order_by_rank
    find_treshold_index
    eliminate_frequent_words
    eliminate_non_en_words
    order_by_frequency
    take_some_frequent_rare_words
  end

  private

  def order_by_rank
    @words_ordered = @words.sort do |w1, w2|
      word_range(w1) <=> word_range(w2)
    end
  end

  def find_treshold_index
    @index = @words_ordered.count - (@words_ordered.count * 0.05).to_i - 1
  end

  def eliminate_frequent_words
    @rare_words = @words_ordered.drop(@index)
  end

  def eliminate_non_en_words
    @rare_words_en = @rare_words.select { |word| @frequent_words.key word }
    @rare_words_en = @rare_words # fix this line needs to be deleted !
  end

  def order_by_frequency
    wordfrequency = Hash.new(0)
    @rare_words_en.each { |word| wordfrequency[word] += 1 }

    wordfrequency = wordfrequency.sort_by { |x, y| [y, x] }
    wordfrequency.reverse!

    @rare_word_frequency = wordfrequency
  end

  def take_some_frequent_rare_words
    some_words_arr = @rare_word_frequency.take 8
    @suggestion = []
    some_words_arr.each{|word| @suggestion << word[0]}
    @suggestion
  end

  def word_range(word)
    frequent_words[word] || 5000
  end

  def frequent_words
    @frequent_words ||= Word.all.order(:rank).pluck(%i[en rank]).to_h
  end
end

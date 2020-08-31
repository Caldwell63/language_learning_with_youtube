
require 'csv'
def import_from_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'data_frequent_words_en.csv'))
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    w = Word.new
    w.rank = row['rank']
    w.en = row['en'].downcase
    w.frequency = row['frequency']
    w.save
    p w
  end
end

puts "cleaning #{Word.count} words form DB..."
Word.destroy_all
puts Word.count

import_from_csv

puts "Finish! now #{Word.count} words in DB"



  def text_to_test
    %w(this is a test this is a car cars are awesome however what I do not know why what to write happy how ever need some beer soon i am in a friday feeling)
  end




def language_level(text_array)
  # variable declaration
  text = text_array
  array_result = []
  hash_result = {}
  i = 1
  # loop
  while text.length * 0.6 > array_result.length
    frequent_word = Word.where(rank: "#{i}").first.en
    if text.include?(frequent_word)
      how_many = text.count(frequent_word)
      how_many.times { array_result << i }
    end
    i = i + 1
  end
  # prepare clean return
  hash_result[:most_difficult] = Word.where(rank: "#{array_result.last}").first.en
  hash_result[:max_rank] = array_result.last
  hash_result[:arg_rank] = array_result.sum / array_result.length
  return  hash_result
end

text = text_to_test
print language_level(text)


class FrequencyList
  attr_reader :frequent_words

  def initialize
    @frequent_words = []
    @path_of_csv = 'seeds/data_frequent_words_en.csv'
    import_from_file
  end

  def all
    @frequent_words
  end

  def import_from_file
    CSV.foreach(@path_of_csv) do |row|
      @frequent_words << [row[0], row[1], row[2]]
    end
  end
end

def analyze(test_arr)
  i = 0
  number_easy_words = 0

  while test_arr.length * 0.6 > number_easy_words
    next_word = LIST.frequent_words[i][1]
    if test_arr.include?(next_word)
      puts next_word = "rank: " + LIST.frequent_words[i][0] + " " + LIST.frequent_words[i][1]
      number_easy_words += 1
    end
    i += 1
  end
  puts 'number of easy words: ' + number_easy_words.to_s
end

def get_text_from_user
  print 'enter you input here >'
  input = gets.chomp
  default = 'This is awesome this,  some why not at all and /! hello this is my name why not this is a good idea'
  input == '' ? default : input
end

def clean_input_return_array_of_words(text_to_test)
  text_to_test.gsub!(/[!:>+<,()\/.@%&1234567890"]/,'').split(' ').map { |s| s }
end

LIST = FrequencyList.new
text_to_test = get_text_from_user
ap test_arr_clean = clean_input_return_array_of_words(text_to_test)
analyze(test_arr_clean)

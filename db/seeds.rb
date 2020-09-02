
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


# puts 'Creating card1...'

# words = "hungry"
# card1 = Card.new(
#   stage: 1,
#   known_on: Date.new(2020,12,02),
#   word: "hungry",
#   user_id: 2
#   )

# card1.save!

# card1 = Card.new(
#   stage: 1,
#   known_on: Date.new(2020,12,02),
#   word: "fast",
#   user_id: 2
#   )




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

puts 'Creating card1...'
card1 = Card.new(
  stage: 1,
  known_on: Date.new(2020,12,02),
  word: Word.first,
  user_id: 2
  )

card1.save!

card2 = Card.new(
  stage: 2,
  known_on: Date.new(2020,12,03),
  word: Word.second,
  user_id: 2
  )
  card2.save!


  card3 = Card.new(
    stage: 3,
    known_on: Date.new(2020,12,03),
    word: Word.last,
    user_id: 2
    )
  card3.save!


class FrequencyList
  attr_reader :frequent_words

  def initialize
    @frequent_words = []
    @path_of_csv = 'seeds/data.csv'
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



require 'csv'
def import_from_csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'data_frequent_words_en.csv'))
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    ap "je suis la"
    ap row
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


exit

channels = "https://www.youtube.com/channel/UCdEPvAKHIY0bXJqW71mIANg"

# Video.destroy_all




a_one = ["https://www.youtube.com/watch?v=erjMgola4fQ",
      "https://www.youtube.com/watch?v=WFRR0zC70-0",
      "https://www.youtube.com/watch?v=RP1AL2DU6vQ",
      "https://www.youtube.com/watch?v=akZrk7jF5Jo",
      "https://www.youtube.com/watch?v=NGRYhHduX8o",
      "https://www.youtube.com/watch?v=cUogZMEs39g",
      "https://www.youtube.com/watch?v=nUlpLXpB_dg",
      "https://www.youtube.com/watch?v=uVGV8LG3HHM"
    ]

a2 = ["https://youtube.com/watch?v=EOfWriKvGN0",
      "https://youtube.com/watch?v=Y76hSxoxClg",
      "https://youtube.com/watch?v=9M1LFoDK81k",
      "https://youtube.com/watch?v=5U2JTpEv7lY",
      "https://www.youtube.com/watch?v=HTngjFzBO80",
      "https://www.youtube.com/watch?v=mqYf20skxgY",
      "https://www.youtube.com/watch?v=gOMypAhVaXE",
      "https://www.youtube.com/watch?v=GH7x5w7mtjE"
     ]

b1 = ["https://youtube.com/watch?v=A4n4bY8-Ufs",
      "https://youtube.com/watch?v=W7SsWCYC3MY",
      "https://youtube.com/watch?v=2KfHDYjUgiM",
      "https://youtube.com/watch?v=zN5YfkCXv8o",
      "https://youtube.com/watch?v=hKqb_I5XV4Y",
      "https://youtube.com/watch?v=svBQjzLyMJs",
      "https://youtube.com/watch?v=WNey5Rqv30g",
      "https://youtube.com/watch?v=g2AdkNH-kWA"
    ]

b2 = ["https://youtube.com/watch?v=gdK6z0i1uOs",
      "https://youtube.com/watch?v=F-175C95uGE",
      "https://youtube.com/watch?v=6i0A2nkjI9g",
      "https://youtube.com/watch?v=q6jL_MwFxnI",
      "https://youtube.com/watch?v=cpP6HijoB9I",
      "https://youtube.com/watch?v=ottnH427Fr8",
      "https://youtube.com/watch?v=NCYTGHvjTAQ",
      "https://youtube.com/watch?v=IMb6j7KMEKE"]

c1 = ["https://youtu.com/watch?v=F-175C95uGE",
      "https://youtu.com/watch?v=q6jL_MwFxnI",
      "https://youtu.com/watch?v=CjTtiMWjJ9g",
      "https://youtu.com/watch?v=f9a2D0jTOds",
      "https://youtu.com/watch?v=9q2jnGR4XQY",
      "https://youtu.com/watch?v=vXFiEX-5So0",
      "https://youtu.com/watch?v=rUdHoEiydX0",
      "https://youtu.com/watch?v=nhZ4JCrOwe0"
     ]

programm = Word.new

a_one.each do |video|
  programm.get_level(video)
  last = Video.last
  last.training = "A1"
  last.save
end

a2.each do |video|
  programm.get_level(video)
  last = Video.last
  last.training = "A2"
  last.save
end

b1.each do |video|
  programm.get_level(video)
  last = Video.last
  last.training = "B1"
  last.save
end

b2.each do |video|
  programm.get_level(video)
  last = Video.last
  last.training = "B2"
  last.save
end

c1.each do |video|
  programm.get_level(video)
  last = Video.last
  last.training = "C1"
  last.save
end

# b1.each do |video|
#   programm.get_level(video)
#   Video.last.training = "B1"
# end

# b2.each do |video|
#   programm.get_level(video)
#   Video.last.training = "B2"
# end

# c1.each do |video|
#   programm.get_level(video)
#   Video.last.training = "C1"
# end

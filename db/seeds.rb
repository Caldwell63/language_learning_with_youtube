
# Card.destroy_all

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

# card1.save!

# card2 = Card.new(
#   stage: 1,
#   known_on: Date.new(2020,12,03),
#   word: Word.second,
#   user_id: 2
#   )
#   card2.save!



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

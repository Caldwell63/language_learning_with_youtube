
Card.destroy_all

puts 'Creating card1...'
card1 = Card.new(
  stage: 12,
  known_on: Date.new(2020,12,02),
  word: Word.first,
  user_id: 2
  )

card1.save!

card2 = Card.new(
  stage: 12,
  known_on: Date.new(2020,12,02),
  word: Word.second,
  user_id: 2
  )
  card2.save!



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


channels = "https://www.youtube.com/channel/UCdEPvAKHIY0bXJqW71mIANg"

# Video.destroy_all

# programm = Word.new

# a1.each do |video|
#   programm.get_level(video)
#   Video.last.training = "A1"
# end

# # a2.each do |video|
# #   programm.get_level(video)
# #   Video.last.training = "A2"
# # end

# # b1.each do |video|
# #   programm.get_level(video)
# #   Video.last.training = "B1"
# # end

# # b2.each do |video|
# #   programm.get_level(video)
# #   Video.last.training = "B2"
# # end

# # c1.each do |video|
# #   programm.get_level(video)
# #   Video.last.training = "C1"
# # end

a1 = ["https://www.youtube.com/watch?v=erjMgola4fQ",
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

b1 = ["https://youtube.com/A4n4bY8-Ufs",
      "https://youtube.com/W7SsWCYC3MY",
      "https://youtube.com/2KfHDYjUgiM",
      "https://youtube.com/zN5YfkCXv8o",
      "https://youtube.com/hKqb_I5XV4Y",
      "https://youtube.com/svBQjzLyMJs",
      "https://youtube.com/WNey5Rqv30g",
      "https://youtube.com/g2AdkNH-kWA"
    ]

b2 = ["https://youtube.com/gdK6z0i1uOs",
      "https://youtube.com/F-175C95uGE",
      "https://youtube.com/6i0A2nkjI9g",
      "https://youtube.com/q6jL_MwFxnI",
      "https://youtube.com/cpP6HijoB9I",
      "https://youtube.com/ottnH427Fr8",
      "https://youtube.com/NCYTGHvjTAQ",
      "https://youtube.com/IMb6j7KMEKE"]

c1 = ["https://youtu.com/F-175C95uGE",
      "https://youtu.com/q6jL_MwFxnI",
      "https://youtu.com/CjTtiMWjJ9g",
      "https://youtu.com/f9a2D0jTOds",
      "https://youtu.com/9q2jnGR4XQY",
      "https://youtu.com/vXFiEX-5So0",
      "https://youtu.com/rUdHoEiydX0",
      "https://youtu.com/nhZ4JCrOwe0"
     ]

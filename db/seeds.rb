

# puts "cleaning #{Word.count} words form DB..."
# Word.destroy_all
# puts Word.count

# import_from_csv

# puts "Finish! now #{Word.count} words in DB"







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


# puts 'Creating card1...'
# card1 = Card.new(
#   stage: 1,
#   known_on: Date.new(2020,12,02),
#   word: Word.first,
#   user_id: 2
#   )

# card1.save!

# card2 = Card.new(
#   stage: 2,
#   known_on: Date.new(2020,12,03),
#   word: Word.second,
#   user_id: 2
#   )
#   card2.save!


#   card3 = Card.new(
#     stage: 3,
#     known_on: Date.new(2020,12,03),
#     word: Word.last,
#     user_id: 2
#     )
#   card3.save!


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

# puts "cleaning #{Word.count} words form DB..."
# Word.destroy_all
# puts Word.count
# import_from_csv
# puts "Finish! now #{Word.count} words in DB"



channels = "https://www.youtube.com/channel/UCdEPvAKHIY0bXJqW71mIANg"

Video.destroy_all




a_one = ["https://www.youtube.com/watch?v=erjMgola4fQ",
      "https://www.youtube.com/watch?v=WFRR0zC70-0",
      "https://www.youtube.com/watch?v=RP1AL2DU6vQ",
      "https://www.youtube.com/watch?v=akZrk7jF5Jo",
      # "https://www.youtube.com/watch?v=NGRYhHduX8o",
      # "https://www.youtube.com/watch?v=cUogZMEs39g",
      # "https://www.youtube.com/watch?v=nUlpLXpB_dg",
      # "https://www.youtube.com/watch?v=uVGV8LG3HHM"
    ]
a2 = ["https://www.youtube.com/watch?v=EOfWriKvGN0",
      "https://www.youtube.com/watch?v=xL3jQzi7q_M",
      "https://www.youtube.com/watch?v=DTvgAxi5mVA",
      "https://www.youtube.com/watch?v=5U2JTpEv7lY",
      # "https://www.youtube.com/watch?v=M25ieTfZ1eI",
      # "https://www.youtube.com/watch?v=mqYf20skxgY",
      # "https://www.youtube.com/watch?v=gOMypAhVaXE",
      # "https://www.youtube.com/watch?v=GH7x5w7mtjE"
     ]
b1 = ["https://www.youtube.com/watch?v=g2AdkNH-kWA",
      "https://www.youtube.com/watch?v=HJx7C7GT2VU",
      "https://www.youtube.com/watch?v=gdK6z0i1uOs",
      "https://www.youtube.com/watch?v=F-175C95uGE",
      # "https://www.youtube.com/watch?v=6i0A2nkjI9g",
      # "https://www.youtube.com/watch?v=q6jL_MwFxnI",
      # "https://www.youtube.com/watch?v=ottnH427Fr8",
      # "https://www.youtube.com/watch?v=NCYTGHvjTAQ"
    ]
b2 = ["https://www.youtube.com/watch?v=gdK6z0i1uOs",
      "https://www.youtube.com/watch?v=F-175C95uGE",
      "https://www.youtube.com/watch?v=6i0A2nkjI9g",
      "https://www.youtube.com/watch?v=q6jL_MwFxnI",
      # "https://www.youtube.com/watch?v=OX-XEa50fFw",
      # "https://www.youtube.com/watch?v=ottnH427Fr8",
      # "https://www.youtube.com/watch?v=NCYTGHvjTAQ",
      # "https://www.youtube.com/watch?v=XkBBbve3XbA"
    ]
c1 = ["https://www.youtube.com/watch?v=Ib-E0NBCglI",
      "https://www.youtube.com/watch?v=gupTjlZsQFI",
      "https://www.youtube.com/watch?v=ZOOSIPzi3Ls",
      "https://www.youtube.com/watch?v=2vk084myCAg",
      # "https://www.youtube.com/watch?v=pHs-zrNOIOY",
      # "https://www.youtube.com/watch?v=nhZ4JCrOwe0",
      # "https://www.youtube.com/watch?v=rUdHoEiydX0",
      # "https://www.youtube.com/watch?v=fUDDsZ2I_gk"
     ]

programm = Word.new

a_one.each do |video|
  ap "a_one #{video}"
  video = CreateVideo.new(video).call
  video.update!(training: 'A1')
end

a2.each do |video|
  ap "a2 #{video}"
  video = CreateVideo.new(video).call
  video.update!(training: 'A2')
end

b1.each do |video|
  ap "b1 #{video}"
  video = CreateVideo.new(video).call
  video.update!(training: 'B1')
end

b2.each do |video|
  ap "b2 #{video}"
  video = CreateVideo.new(video).call
  video.update!(training: 'B2')
end

c1.each do |video|
  ap "c1 #{video}"
  video = CreateVideo.new(video).call
  video.update!(training: 'C1')
end

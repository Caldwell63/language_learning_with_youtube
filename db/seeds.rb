# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'tts'
# Function that grabs the user input and plays it in English
# And then displays what was said in the command line.
# Allows us to easily just write "say()"
def say(word)
    s = "#{word}"
    repeatTimes = 1
    s.play("en", repeatTimes)
    puts
    puts "Successfully Said: #{word}"
end

say("anton hello")

class Word < ApplicationRecord
  has_many :cards, dependent: :destroy

  # scope :available_for, ->(user) do
  #   words_with_cards = user.words
  #   where.not(id: words_with_cards.pluck(:id))
  # end

  def get_level(youtube_url)
    # raise

    youtube_id = youtube_url_to_id(youtube_url)
    text_raw = to_subtitle_v1(youtube_id)
    text_clean = clean_string(text_raw)
    text_array = string_to_array(text_clean)
    result_hash = language_level(text_array)
    return "" if  result_hash == nil
    create_video(youtube_id, result_hash, text_array)
    result_hash
  end

  def create_video(youtube_id, result_hash, text_array)
    video = Video.new(
    youtube_id: youtube_id,
    title: "",
    level: result_hash[:max_rank].to_s,
    subtitle: text_array
      )
    video.save
    video.add_info
  end


  def to_subtitle_v1(youtube_id)
    url = URI("https://subtitles-for-youtube.p.rapidapi.com/subtitles/#{youtube_id}.srt?lang=en&type=None&translated=Translated")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'subtitles-for-youtube.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['RAKUTEN_API_KEY']

    response = http.request(request)
    text_raw = response.read_body
    text_raw == "" ? "Video has no subtitles" : text_raw
  end


  def to_subtitle_v2(youtube_id)
    url = "http://video.google.com/timedtext?lang=en&v=#{youtube_id}"
    html_file = open(url).read

    #needs to be completed
  end

  def youtube_url_to_id(youtube_url)
    video_id = youtube_url.match(/v=(.*)/)[1..-1]
    video_id.first.to_s
  end

  def clean_string(string)
    transform_to_full_word(string)
  end

  def string_to_array(text)
    text.scan(/[a-z]+/)
  end

  def language_level(text_array)
    # variable declaration
    text = text_array
    array_result = []
    hash_result = {}
    i = 1
    frequent_words = Word.all
    # loop
    while text.length * 0.8 > array_result.length
      frequent_word = frequent_words[i].en
      # frequent_word = Word.where(rank: "#{i}").first.en
      if text.include?(frequent_word)
        how_many = text.count(frequent_word)
        how_many.times { array_result << i }
      end
      i += 1
      break if i > 4990
    end
    # prepare clean return
    hash_result[:most_difficult] = frequent_words[i].en # Word.where(rank: "#{array_result.last}").first.en
    hash_result[:max_rank] = array_result.last
    hash_result[:arg_rank] = array_result.sum / array_result.length
    return hash_result
  end

  def transform_to_full_word(text)
    text.downcase!
    text.gsub!("&#39;", "'")
    # text.gsub!("‘", "'")
    text.gsub!("'s", ' is')
    text.gsub!("i'm", 'i am')
    # text.gsub!("i‘m", 'i am')
    # text.gsub!("’ll", ' will')
    text.gsub!("'ll", ' will')
    text.gsub!("dont't", 'do not')
    text.gsub!("'ve", ' have')
    text.gsub!("'d", ' had')
    text.gsub!("ain't", "am not")
    text.gsub!("aren't", "are not")
    text.gsub!("can't", "cannot")
    text.gsub!("can't've", "cannot have")
    text.gsub!("'cause", "because")
    text.gsub!("could've", "could have")
    text.gsub!("couldn't", "could not")
    text.gsub!("couldn't've", "could not have")
    text.gsub!("didn't", "did not")
    text.gsub!("doesn't", "does not")
    text.gsub!("don't", "do not")
    text.gsub!("hadn't", "had not")
    text.gsub!("hadn't've", "had not have")
    text.gsub!("hasn't", "has not")
    text.gsub!("haven't", "have not")
    text.gsub!("he'd", "he would")
    text.gsub!("he'd've", "he would have")
    text.gsub!("he'll", "he will")
    text.gsub!("he'll've", "he will have")
    text.gsub!("he's", "he is")
    text.gsub!("how'd", "how did")
    text.gsub!("how'd'y", "how do you")
    text.gsub!("how'll", "how will")
    text.gsub!("how's", "how is")
    text.gsub!("I'd", "I would")
    text.gsub!("I'd've", "I would have")
    text.gsub!("I'll", "I will")
    text.gsub!("I'll've", "I will have")
    text.gsub!("I'm", "I am")
    text.gsub!("I've", "I have")
    text.gsub!("isn't", "is not")
    text.gsub!("it'd", "it had")
    text.gsub!("it'd've", "it would have")
    text.gsub!("it'll", "it will")
    text.gsub!("it'll've", "it will have")
    text.gsub!("it's", "it is")
    text.gsub!("let's", "let us")
    text.gsub!("ma'am", "madam")
    text.gsub!("mayn't", "may not")
    text.gsub!("might've", "might have")
    text.gsub!("mightn't", "might not")
    text.gsub!("mightn't've", "might not have")
    text.gsub!("must've", "must have")
    text.gsub!("mustn't", "must not")
    text.gsub!("mustn't've", "must not have")
    text.gsub!("needn't", "need not")
    text.gsub!("needn't've", "need not have")
    text.gsub!("o'clock", "of the clock")
    text.gsub!("oughtn't", "ought not")
    text.gsub!("oughtn't've", "ought not have")
    text.gsub!("shan't", "shall not")
    text.gsub!("sha'n't", "shall not")
    text.gsub!("shan't've", "shall not have")
    text.gsub!("she'd", "she would")
    text.gsub!("she'd've", "she would have")
    text.gsub!("she'll", "she will")
    text.gsub!("she'll've", "she will have")
    text.gsub!("she's", "she is")
    text.gsub!("should've", "should have")
    text.gsub!("shouldn't", "should not")
    text.gsub!("shouldn't've", "should not have")
    text.gsub!("so've", "so have")
    text.gsub!("so's", "so is")
    text.gsub!("that'd", "that would")
    text.gsub!("that'd've", "that would have")
    text.gsub!("that's", "that is")
    text.gsub!("there'd", "there had")
    text.gsub!("there'd've", "there would have")
    text.gsub!("there's", "there is")
    text.gsub!("they'd", "they would")
    text.gsub!("they'd've", "they would have")
    text.gsub!("they'll", "they will")
    text.gsub!("they'll've", "they will have")
    text.gsub!("they're", "they are")
    text.gsub!("they've", "they have")
    text.gsub!("to've", "to have")
    text.gsub!("wasn't", "was not")
    text.gsub!("we'd", "we had")
    text.gsub!("we'd've", "we would have")
    text.gsub!("we'll", "we will")
    text.gsub!("we'll've", "we will have")
    text.gsub!("we're", "we are")
    text.gsub!("we've", "we have")
    text.gsub!("weren't", "were not")
    text.gsub!("what'll", "what will")
    text.gsub!("what'll've", "what will have")
    text.gsub!("what're", "what are")
    text.gsub!("what's", "what is")
    text.gsub!("what've", "what have")
    text.gsub!("when's", "when is")
    text.gsub!("when've", "when have")
    text.gsub!("where'd", "where did")
    text.gsub!("where's", "where is")
    text.gsub!("where've", "where have")
    text.gsub!("who'll", "who will")
    text.gsub!("who'll've", "who will have")
    text.gsub!("who's", "who is")
    text.gsub!("who've", "who have")
    text.gsub!("why's", "why is")
    text.gsub!("why've", "why have")
    text.gsub!("will've", "will have")
    text.gsub!("won't", "will not")
    text.gsub!("won't've", "will not have")
    text.gsub!("would've", "would have")
    text.gsub!("wouldn't", "would not")
    text.gsub!("wouldn't've", "would not have")
    text.gsub!("y'all", "you all")
    text.gsub!("y'alls", "you alls")
    text.gsub!("y'all'd", "you all would")
    text.gsub!("y'all'd've", "you all would have")
    text.gsub!("y'all're", "you all are")
    text.gsub!("y'all've", "you all have")
    text.gsub!("you'd", "you had")
    text.gsub!("you'd've", "you would have")
    text.gsub!("you'll", "you you will")
    text.gsub!("you'll've", "you you will have")
    text.gsub!("you're", "you are")
    text.gsub!("you've", "you have")
    return text
  end
end

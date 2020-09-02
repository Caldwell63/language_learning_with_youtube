class VideoLevel
  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def call
    fetch_subtitle
    clean_subtitles
    extract_words
    level_by_words
    create_video
  end


  private

  def youtube_id
    @youtube_id ||= @youtube_url.match(/v=(.*)/)[1..-1].first.to_s
  end

  def fetch_subtitle
    url = URI("https://subtitles-for-youtube.p.rapidapi.com/subtitles/#{youtube_id}.srt?lang=en&type=None&translated=Translated")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'subtitles-for-youtube.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['RAKUTEN_API_KEY']

    response = http.request(request)
    @subtitles = response.read_body
  end

  def extract_words
    @words = @subtitles.scan(/[a-z]+/)
  end

  def level_by_words
    @level = AnalizeLevel.new(@words).call
  end

  def create_video
    video = Video.new(
    youtube_id: @youtube_id,
    level: @level,
    subtitle: @subtitles
      )

    video.save
    video.add_info
  end

  def clean_subtitles
    @subtitles.downcase!
    @subtitles.gsub!("&#39;", "'")
    @subtitles.gsub!("‘", "'")
    @subtitles.gsub!("'s", ' is')
    @subtitles.gsub!("i'm", 'i am')
    @subtitles.gsub!("'ll", ' will')
    @subtitles.gsub!("dont't", 'do not')
    @subtitles.gsub!("'ve", ' have')
    @subtitles.gsub!("'d", ' had')
    @subtitles.gsub!("ain't", "am not")
    @subtitles.gsub!("aren't", "are not")
    @subtitles.gsub!("can't", "cannot")
    @subtitles.gsub!("can't've", "cannot have")
    @subtitles.gsub!("'cause", "because")
    @subtitles.gsub!("could've", "could have")
    @subtitles.gsub!("couldn't", "could not")
    @subtitles.gsub!("couldn't've", "could not have")
    @subtitles.gsub!("didn't", "did not")
    @subtitles.gsub!("doesn't", "does not")
    @subtitles.gsub!("don't", "do not")
    @subtitles.gsub!("hadn't", "had not")
    @subtitles.gsub!("hadn't've", "had not have")
    @subtitles.gsub!("hasn't", "has not")
    @subtitles.gsub!("haven't", "have not")
    @subtitles.gsub!("he'd", "he would")
    @subtitles.gsub!("he'd've", "he would have")
    @subtitles.gsub!("he'll", "he will")
    @subtitles.gsub!("he'll've", "he will have")
    @subtitles.gsub!("he's", "he is")
    @subtitles.gsub!("how'd", "how did")
    @subtitles.gsub!("how'd'y", "how do you")
    @subtitles.gsub!("how'll", "how will")
    @subtitles.gsub!("how's", "how is")
    @subtitles.gsub!("I'd", "I would")
    @subtitles.gsub!("I'd've", "I would have")
    @subtitles.gsub!("I'll", "I will")
    @subtitles.gsub!("I'll've", "I will have")
    @subtitles.gsub!("I'm", "I am")
    @subtitles.gsub!("I've", "I have")
    @subtitles.gsub!("isn't", "is not")
    @subtitles.gsub!("it'd", "it had")
    @subtitles.gsub!("it'd've", "it would have")
    @subtitles.gsub!("it'll", "it will")
    @subtitles.gsub!("it'll've", "it will have")
    @subtitles.gsub!("it's", "it is")
    @subtitles.gsub!("let's", "let us")
    @subtitles.gsub!("ma'am", "madam")
    @subtitles.gsub!("mayn't", "may not")
    @subtitles.gsub!("might've", "might have")
    @subtitles.gsub!("mightn't", "might not")
    @subtitles.gsub!("mightn't've", "might not have")
    @subtitles.gsub!("must've", "must have")
    @subtitles.gsub!("mustn't", "must not")
    @subtitles.gsub!("mustn't've", "must not have")
    @subtitles.gsub!("needn't", "need not")
    @subtitles.gsub!("needn't've", "need not have")
    @subtitles.gsub!("o'clock", "of the clock")
    @subtitles.gsub!("oughtn't", "ought not")
    @subtitles.gsub!("oughtn't've", "ought not have")
    @subtitles.gsub!("shan't", "shall not")
    @subtitles.gsub!("sha'n't", "shall not")
    @subtitles.gsub!("shan't've", "shall not have")
    @subtitles.gsub!("she'd", "she would")
    @subtitles.gsub!("she'd've", "she would have")
    @subtitles.gsub!("she'll", "she will")
    @subtitles.gsub!("she'll've", "she will have")
    @subtitles.gsub!("she's", "she is")
    @subtitles.gsub!("should've", "should have")
    @subtitles.gsub!("shouldn't", "should not")
    @subtitles.gsub!("shouldn't've", "should not have")
    @subtitles.gsub!("so've", "so have")
    @subtitles.gsub!("so's", "so is")
    @subtitles.gsub!("that'd", "that would")
    @subtitles.gsub!("that'd've", "that would have")
    @subtitles.gsub!("that's", "that is")
    @subtitles.gsub!("there'd", "there had")
    @subtitles.gsub!("there'd've", "there would have")
    @subtitles.gsub!("there's", "there is")
    @subtitles.gsub!("they'd", "they would")
    @subtitles.gsub!("they'd've", "they would have")
    @subtitles.gsub!("they'll", "they will")
    @subtitles.gsub!("they'll've", "they will have")
    @subtitles.gsub!("they're", "they are")
    @subtitles.gsub!("they've", "they have")
    @subtitles.gsub!("to've", "to have")
    @subtitles.gsub!("wasn't", "was not")
    @subtitles.gsub!("we'd", "we had")
    @subtitles.gsub!("we'd've", "we would have")
    @subtitles.gsub!("we'll", "we will")
    @subtitles.gsub!("we'll've", "we will have")
    @subtitles.gsub!("we're", "we are")
    @subtitles.gsub!("we've", "we have")
    @subtitles.gsub!("weren't", "were not")
    @subtitles.gsub!("what'll", "what will")
    @subtitles.gsub!("what'll've", "what will have")
    @subtitles.gsub!("what're", "what are")
    @subtitles.gsub!("what's", "what is")
    @subtitles.gsub!("what've", "what have")
    @subtitles.gsub!("when's", "when is")
    @subtitles.gsub!("when've", "when have")
    @subtitles.gsub!("where'd", "where did")
    @subtitles.gsub!("where's", "where is")
    @subtitles.gsub!("where've", "where have")
    @subtitles.gsub!("who'll", "who will")
    @subtitles.gsub!("who'll've", "who will have")
    @subtitles.gsub!("who's", "who is")
    @subtitles.gsub!("who've", "who have")
    @subtitles.gsub!("why's", "why is")
    @subtitles.gsub!("why've", "why have")
    @subtitles.gsub!("will've", "will have")
    @subtitles.gsub!("won't", "will not")
    @subtitles.gsub!("won't've", "will not have")
    @subtitles.gsub!("would've", "would have")
    @subtitles.gsub!("wouldn't", "would not")
    @subtitles.gsub!("wouldn't've", "would not have")
    @subtitles.gsub!("y'all", "you all")
    @subtitles.gsub!("y'alls", "you alls")
    @subtitles.gsub!("y'all'd", "you all would")
    @subtitles.gsub!("y'all'd've", "you all would have")
    @subtitles.gsub!("y'all're", "you all are")
    @subtitles.gsub!("y'all've", "you all have")
    @subtitles.gsub!("you'd", "you had")
    @subtitles.gsub!("you'd've", "you would have")
    @subtitles.gsub!("you'll", "you you will")
    @subtitles.gsub!("you'll've", "you you will have")
    @subtitles.gsub!("you're", "you are")
    @subtitles.gsub!("you've", "you have")
  end
end

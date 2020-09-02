class VideoLevel
  def initialize(words)
    @words = words
  end

  def call
    level_by_words
  end

  private

  def level_by_words
    @level = AnalizeLevel.new(@words).call
  end
end

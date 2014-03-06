require_relative 'soundex_encoder'

class Soundex

  def initialize
    @encoder = SoundexEncoder.new
  end

  def encode(word)
    head(word) +  @encoder.encode(tail word)
  end

private

  def head(word)
    word[0]
  end

  def tail(word)
    word[1..-1]
  end

end
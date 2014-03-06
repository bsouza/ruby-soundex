require_relative 'encoded_chars'

class SoundexEncoder

  def initialize
    @encodeds = EncodedChars.new
  end

  def encode(word)
    encoded = String.new

    drop_unneeded_letters(word.clone).each_char do |char| 
      break if is_full? encoded
      encoded += @encodeds.get(char)
    end

    encoded.ljust 3, "0"
  end

private

  MAX_SIZE = 3
  UNNEEDED_LETTERS = ['a', 'e', 'i', 'o', 'u', 'y', 'h', 'w']

  def is_full?(encoded)
    encoded.size >= MAX_SIZE
  end

  def drop_unneeded_letters(word)
    UNNEEDED_LETTERS.each do |char| 
      word = word.gsub(char, '')
    end

    word
  end

end
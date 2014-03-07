require_relative 'encoded_chars'

class SoundexEncoder

  def initialize
    @encodeds = EncodedChars.new
  end

  def encode(word)
    encoded = String.new

    for index in 0 .. word.size - 1
      char = word[index]

      break if is_full? encoded
      encoded_char = @encodeds.get(char)
      
      if encoded_char != encoded.chars.last || isVowel?(word[index - 1])
        encoded += @encodeds.get(char) 
      end
    end

    # word.each_char do |char| 
    #   break if is_full? encoded
    #   encoded_char = @encodeds.get(char)      
      
    #   if encoded_char != encoded.chars.last
    #     encoded += @encodeds.get(char) 
    #   end
    # end

    encoded.ljust 3, "0"
  end

private

  MAX_SIZE = 3
  VOWELS = ['a', 'e', 'i', 'o', 'u', 'y']

  def is_full?(encoded)
    encoded.size >= MAX_SIZE
  end

  def isVowel?(letter)
    VOWELS.include? letter
  end

end
require_relative 'encoded_chars'

class Soundex

  def initialize
    @encodeds = EncodedChars.new
  end

  def encode(word)
    encoded = word[0]

    for index in 1 .. word.size - 1
      break if is_full? encoded

      last_char = word[index - 1]
      current_char = word[index]
      
      encoded_char = @encodeds.get current_char

      if !is_first_invalid_encoded?(index, word, encoded_char) &&
          is_valid_sequence?(encoded, encoded_char, last_char) then
        encoded += encoded_char
      end
    end

    padding_zero encoded
  end

private

  MAX_SIZE = 4
  VOWELS = ['a', 'e', 'i', 'o', 'u', 'y']

  def is_full?(encoded)
    encoded.size >= MAX_SIZE
  end

  def is_vowel?(letter)
    VOWELS.include? letter
  end

  def padding_zero(word)
    word.ljust 4, "0"
  end

  def is_first_invalid_encoded?(index, word, encoded_char)
    index.equal?(1) and @encodeds.get(word[0]) == encoded_char
  end

  def is_valid_sequence?(encoded, encoded_char, last_char)
    is_different_to_last_encoded? encoded_char, encoded or is_valid_vowel_sequence? encoded_char, last_char
  end

  def is_different_to_last_encoded?(encoded_char, encoded)
    encoded_char != encoded[-1]
  end

  def is_valid_vowel_sequence?(encoded_char, last_char)
    is_valid_encoded_char?(encoded_char) and is_vowel?(last_char)
  end

  def is_valid_encoded_char?(encoded_char)
    !encoded_char.empty? and !encoded_char.equal?('')
  end

end
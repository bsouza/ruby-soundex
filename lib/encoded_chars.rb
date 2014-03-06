require 'matrix'

class EncodedChars

  CHARS = [
    ['b', 'f', 'p', 'v'],
    ['c', 'g', 'j', 'k', 'q', 's', 'x', 'z'],
    ['d', 't'],
    ['l'],
    ['m', 'n'],
    ['r']
  ]

  def get(letter)
    encoded_char = 0
    CHARS.each_with_index do |chars, index|
      encoded_char = index + 1 if chars.include? letter.downcase
    end
    encoded_char.to_s.gsub('0', '')
  end

end
require 'matrix'

class EncodedChars

  LIST_CHARS = {
    1 => ['b', 'f', 'p', 'v'],
    2 => ['c', 'g', 'j', 'k', 'q', 's', 'x', 'z'],
    3 => ['d', 't'],
    4 => ['l'],
    5 => ['m', 'n'],
    6 => ['r']
  }

  CHARS = Hash[*LIST_CHARS.map{|k,l| l.map{|v| [v,k] } }.flatten];

  def get(letter)    
    CHARS[letter.downcase].to_s
  end

end
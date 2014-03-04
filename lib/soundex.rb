class Soundex

  def encode(word)
    head(word) + encoded_tail(word)
  end

private

  TAIL_MAX_SIZE = 3

  def head(word)
    word[0]
  end

  def tail(word)
    word[1..-1]
  end

  def encoded_tail(word)
    encoded = String.new
    tail(word).each_char do |char| 
      break if is_full? encoded
      encoded += (char != "A") ? char : "0"
    end
    encoded
  end

  def is_full?(encoded)
    encoded.size >= TAIL_MAX_SIZE
  end

end
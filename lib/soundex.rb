class Soundex

  def encode(word)
    head(word) + encoded(tail(word))
  end

private

  TAIL_MAX_SIZE = 3

  def head(word)
    word[0]
  end

  def tail(word)
    drop_unneeded_letters(word[1..-1])
  end

  def encoded(word)
    encoded = String.new
    word.each_char do |char| 
      break if is_full? encoded
      encoded += encoded_char(char)
    end
    encoded.ljust 3, "0"
  end

  def encoded_char(char)
    if ['b', 'f', 'p', 'v'].include? char then
      "1"
    else
      (char != "A") ? char : "0"
    end
  end

  def drop_unneeded_letters(word)
    ['a', 'e', 'i', 'o', 'u', 'y', 'h', 'w'].each do |char| 
      word = word.gsub(char, '')
    end
    word
  end

  def is_full?(encoded)
    encoded.size >= TAIL_MAX_SIZE
  end

end
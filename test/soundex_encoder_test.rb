require 'minitest/autorun'
require_relative '../lib/soundex_encoder'

describe SoundexEncoder do

  before do
    @encoder = SoundexEncoder.new
  end

  it 'should replace consonants with appropriate digits' do
    @encoder.encode("ABCDEF").must_equal "123"
  end

  # it 'should replace consonants with appropriate digits' do
  #   @encoder.encode("BbDDgG").must_equal "123"
  # end

end
require 'minitest/autorun'
require_relative '../lib/soundex_encoder'

describe SoundexEncoder do

  before do
    @encoder = SoundexEncoder.new
  end

  it 'should replace consonants with appropriate digits' do
    @encoder.encode('ABCDEF').must_equal '123'
  end

  it 'should ignore same encoded value' do
    @encoder.encode('BbbDdDgGhH').must_equal '132'
  end

  it 'should encode twice when letters are separated by vowel' do
    @encoder.encode('babc').must_equal '112'
    @encoder.encode('bcic').must_equal '122'
  end

end
require 'minitest/autorun'
require_relative '../lib/encoded_chars'

describe EncodedChars do

  before do
    @chars = EncodedChars.new
  end

  it 'should encode letter b to digit 1' do
    @chars.get('b').must_equal '1'
  end

  it 'should encode letter D to digit 3' do
    @chars.get('R').must_equal '6'
  end

  it 'should not encode letter A' do
    @chars.get('A').must_equal ''
  end

end
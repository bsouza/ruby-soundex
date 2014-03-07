require 'minitest/autorun'
require_relative '../lib/soundex'

describe Soundex do
  
  before do
    @soundex = Soundex.new
  end

  describe 'basic rules' do
    it 'should have one letter followed by three numerical digits' do
      encoded = @soundex.encode('BAAA')
      encoded[0].must_equal 'B'
      encoded[1].must_equal '0'
      encoded[2].must_equal '0'
      encoded[3].must_equal '0'
    end

    it 'should have 4 chars' do
      @soundex.encode('Bclasd').size.must_equal 4
    end
  end

  describe 'first rule' do
    it 'should retain first letter and drop all other occurrences of a, e, i, o, u, y, h, w' do
      @soundex.encode('Aaei').must_equal 'A000'
      @soundex.encode('Biou').must_equal 'B000'
      @soundex.encode('Cyhw').must_equal 'C000'
    end
  end

  describe 'second rule' do
    it 'should replace b, f, p and v with digit 1' do
      @soundex.encode('Abfp').must_equal 'A100'
    end
  end

  describe 'third rule' do
    it 'should ignore same encoded value' do
      @soundex.encode('AaBbbddcc').must_equal 'A132'
    end

    it 'should ignore same encoded value separeted by h or w' do
      @soundex.encode('ABhbdwdcc').must_equal 'A132'
    end

    it 'should not ignore same encoded value when separated by vowels' do
      @soundex.encode("Arara").must_equal "A660"
    end
  end

  describe 'testing sample names (extracted from wiki)' do
    it 'Robert and Rupert should have the same encoded value' do
      @soundex.encode('Robert').must_equal "R163"
      @soundex.encode('Rupert').must_equal "R163"
    end

    it 'Rubin and Robin should have the same encoded value' do
      @soundex.encode('Rubin').must_equal "R150"
      @soundex.encode('Robin').must_equal "R150"
    end

    it 'Ashcraft and Ashcroft should have the same encoded value' do
      @soundex.encode('Ashcraft').must_equal "A261"
      @soundex.encode('Ashcroft').must_equal "A261"
    end

    it 'Tymczak encoded must be equal to T522' do
      @soundex.encode('Tymczak').must_equal "T522"
    end

    # it 'Pfister encoded must be equal to P236' do
    #   @soundex.encode('Pfister').must_equal "P236"
    # end
  end

end
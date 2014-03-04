require 'minitest/autorun'
require_relative '../lib/soundex'

describe Soundex do
  
  before do
    @soundex = Soundex.new
  end

  describe 'basic rules' do

    it "should have one letter followed by three numerical digits" do
      encoded = @soundex.encode("BAAA")
      encoded[0].must_equal "B"
      encoded[1].must_equal "0"
      encoded[2].must_equal "0"
      encoded[3].must_equal "0"
    end

    it "should have 4 chars" do
      @soundex.encode("Bclasd").size.must_equal 4
    end

  end

end
require 'roman_numeral'

describe RomanNumeral do

  context "basic conversion" do
    RomanNumeral::ARABIC.each do |roman, arabic|
      it "returns Arabic value #{arabic} for Roman numeral #{roman}" do
        RomanNumeral.new(roman).arabic.should eq(arabic)
      end
    end
  end


  context "multiple characters" do
    it "returns Arabic value 2 for Roman numeral II" do
      RomanNumeral.new('II').arabic.should eq(2)
    end

    it "returns Arabic value 250 for Roman numeral CCL" do
      RomanNumeral.new('CCL').arabic.should eq(250)
    end
  end


  context "multiple characters with some smaller than the next" do
    it "returns Arabic value 190 for Roman numeral CXC" do
      RomanNumeral.new('CXC').arabic.should eq(190)
    end

    # example numbers from http://en.wikipedia.org/wiki/Roman_numerals
    %w(MDCCCCLXXXXVIIII  MCMXCIX  MIM).each do |num|
      it "returns Arabic value 1999 for Roman numeral #{num}" do
        RomanNumeral.new(num).arabic.should eq(1999)
      end
    end
  end


  context "bad input" do
    context "#clean_up" do
      it "should return blank for an unknown character" do
        RomanNumeral.new('h').clean_up('h').should eq('')
      end

      it "should return blank for an empty string" do
        RomanNumeral.new('').clean_up('').should eq('')
      end

      it "should return blank for nil" do
        RomanNumeral.new(nil).clean_up(nil).should eq('')
      end

      it "should remove whitespace" do
        RomanNumeral.new('X X X I').clean_up('X X X I').should eq('XXXI')
      end

      it "should upcase passed-in numeral" do
        RomanNumeral.new('mdclxvi').clean_up('mdclxvi').should eq('MDCLXVI')
      end
    end

    context "#arabic" do
      it "should return nil for an empty string" do
        RomanNumeral.new('').arabic.should be_nil
      end
    end
  end

end
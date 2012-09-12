require 'roman_numeral'

describe RomanNumeral do

  context "basic conversion" do
    it "returns an Arabic 1 for a Roman numeral I" do
      RomanNumeral.new('I').arabic.should eq(1)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('V').arabic.should eq(5)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('X').arabic.should eq(10)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('L').arabic.should eq(50)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('C').arabic.should eq(100)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('D').arabic.should eq(500)
    end

    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.new('M').arabic.should eq(1000)
    end
  end


  context "multiple characters" do
    it "returns an Arabic 2 for a Roman numeral II" do
      RomanNumeral.new('II').arabic.should eq(2)
    end

    it "returns an Arabic 250 for a Roman numeral CCL" do
      RomanNumeral.new('CCL').arabic.should eq(250)
    end
  end


  context "multiple characters with some smaller than the next" do
    it "returns an Arabic 190 for a Roman numeral CXC" do
      RomanNumeral.new('CXC').arabic.should eq(190)
    end

    %w(MDCCCCLXXXXVIIII  MCMXCIX  MIM).each do |num|
      # example numbers from http://en.wikipedia.org/wiki/Roman_numerals
      it "returns 1999 for #{num}" do
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

    context "#to_arabic" do
      it "should return nil for an empty string" do
        RomanNumeral.new('').arabic.should be_nil
      end
    end
  end

end
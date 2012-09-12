require 'roman_numeral'

describe RomanNumeral do

  context "bad input" do
    it "should return nil for an unknown character" do
      RomanNumeral.to_arabic('h').should be_nil
    end

    it "should return nil for an empty string" do
      RomanNumeral.to_arabic('').should be_nil
    end

    it "should return nil for nil" do
      RomanNumeral.to_arabic(nil).should be_nil
    end

    it "should return correct value even with spaces" do
      RomanNumeral.to_arabic('X X X I').should eq(31)
    end
  end


  context "basic conversion" do
    it "returns an Arabic 1 for a Roman numeral I" do
      RomanNumeral.to_arabic('I').should eq(1)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('V').should eq(5)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('X').should eq(10)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('L').should eq(50)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('C').should eq(100)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('D').should eq(500)
    end
    it "returns an Arabic 5 for a Roman numeral V" do
      RomanNumeral.to_arabic('M').should eq(1000)
    end
  end


  context "multiple characters" do
    it "returns an Arabic 2 for a Roman numeral II" do
      RomanNumeral.to_arabic('II').should eq(2)
    end

    it "returns an Arabic 250 for a Roman numeral CCL" do
      RomanNumeral.to_arabic('CCL').should eq(250)
    end
  end


  context "multiple characters with some smaller than the next" do
    it "returns an Arabic 190 for a Roman numeral CXC" do
      RomanNumeral.to_arabic('CXC').should eq(190)
    end

    %w(MDCCCCLXXXXVIIII  MCMXCIX  MIM).each do |num|
      # example numbers from http://en.wikipedia.org/wiki/Roman_numerals
      it "returns 1999 for #{num}" do
        RomanNumeral.to_arabic(num).should eq(1999)
      end
    end
  end

end
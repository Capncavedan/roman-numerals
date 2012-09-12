require 'roman_numeral'

describe RomanNumeral do

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
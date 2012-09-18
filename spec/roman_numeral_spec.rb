require 'roman_numeral'

describe RomanNumeral do

  context "from Arabic --> Roman" do
    context "conversion of an Arabic value to Roman" do
      it "returns Roman numeral I for Arabic value 1" do
        RomanNumeral.new(1).roman.should eq('I')
      end

      it "returns Roman numeral V for Arabic value 5" do
        RomanNumeral.new(5).roman.should eq('V')
      end

      it "returns Roman numeral X for Arabic value 10" do
        RomanNumeral.new(10).roman.should eq('X')
      end

      it "returns Roman numeral XXX for Arabic value 30" do
        RomanNumeral.new(30).roman.should eq('XXX')
      end

      it "returns Roman numeral XL for Arabic value 40" do
        RomanNumeral.new(40).roman.should eq('XL')
      end

      it "returns Roman numeral L for Arabic value 50" do
        RomanNumeral.new(50).roman.should eq('L')
      end

      it "returns Roman numeral LX for Arabic value 60" do
        RomanNumeral.new(60).roman.should eq('LX')
      end

      it "returns Roman numeral LXX for Arabic value 70" do
        RomanNumeral.new(70).roman.should eq('LXX')
      end

      it "returns Roman numeral LXXX for Arabic value 80" do
        RomanNumeral.new(80).roman.should eq('LXXX')
      end

      it "returns Roman numeral XC for Arabic value 90" do
        RomanNumeral.new(90).roman.should eq('XC')
      end

      it "returns Roman numeral CD for Arabic value 400" do
        RomanNumeral.new(400).roman.should eq('CD')
      end

      it "returns Roman numeral D for Arabic value 500" do
        RomanNumeral.new(500).roman.should eq('D')
      end

      it "returns Roman numeral DC for Arabic value 600" do
        RomanNumeral.new(600).roman.should eq('DC')
      end

      it "returns Roman numeral M for Arabic value 1000" do
        RomanNumeral.new(1000).roman.should eq('M')
      end

      it "returns Roman numeral IV for Arabic value 4" do
        RomanNumeral.new(4).roman.should eq('IV')
      end

      it "returns Roman numeral IX for Arabic value 9" do
        RomanNumeral.new(9).roman.should eq('IX')
      end

      it "returns Roman numeral XV for Arabic value 15" do
        RomanNumeral.new(15).roman.should eq('XV')
      end

      it "returns Roman numeral XIX for Arabic value 19" do
        RomanNumeral.new(19).roman.should eq('XIX')
      end

      it "returns Roman numeral XXV for Arabic value 25" do
        RomanNumeral.new(25).roman.should eq('XXV')
      end

      it "returns Roman numeral XXVI for Arabic value 26" do
        RomanNumeral.new(26).roman.should eq('XXVI')
      end

      it "returns Roman numeral MCMXCIX for Arabic value 1999" do
        # should return a Roman numeral with commonly accepted format
        RomanNumeral.new(1999).roman.should eq('MCMXCIX')
      end
    end
  end


  context "somewhat tautologic comparisons" do
    context "of Arabic --> Roman --> Arabic" do
      (1..1001).each do |num|
        it "Arabic #{num} to Roman to Arabic matches #{num}" do
          roman = RomanNumeral.new(num).roman
          RomanNumeral.new(roman).arabic.should eq(num)
        end
      end
    end
  end


  context "Roman numeral patterns" do
    # Common usage rules as found on Wikipedia: http://en.wikipedia.org/wiki/Roman_numerals
    #
    # "I", "X", "C", and "M" can be repeated three times in succession, but no more.
    # "D", "L", and "V" can never be repeated.
    # "I" can be subtracted from "V" and "X" only.
    # "X" can be subtracted from "L" and "C" only.
    # "C" can be subtracted from "D" and "M" only.
    # "V", "L", and "D" can never be subtracted[8]
    # Only one small-value symbol may be subtracted from any large-value symbol.

    (1..1001).each do |num|
      context "repeating digits" do
        before do
          @roman = RomanNumeral.new(num).roman
        end

        it "#{num} in Roman should not contain more than 3 I's X's C's or M's in succession" do
          @roman.should_not =~ /IIII|XXXX|CCCC|MMMM/
        end

        it "#{num} in Roman should not repeat D's, L's or V's" do
          @roman.should_not =~ /DD|LL|VV/
        end

        it "should never subtract I from other than V or X, nor X from other than L or C" do
          @roman.should_not =~ /I[LCDM]|X[DM]/
        end

        it "should never subtract a V, L or D from anything larger" do
          @roman.should_not =~ /V[XLCDM]|L[CDM]|DM/
        end
      end
    end
  end


  context "from Roman --> Arabic" do
    context "basic conversion of a Roman numeral" do
      RomanNumeral::ARABIC.each do |roman, arabic|
        it "returns Arabic value #{arabic} for Roman numeral #{roman}" do
          RomanNumeral.new(roman).arabic.should eq(arabic)
        end
      end
    end


    context "multiple-character Roman numerals" do
      it "returns Arabic value 2 for Roman numeral II" do
        RomanNumeral.new('II').arabic.should eq(2)
      end

      it "returns Arabic value 250 for Roman numeral CCL" do
        RomanNumeral.new('CCL').arabic.should eq(250)
      end
    end


    context "multiple-character Roman numerals with some smaller than the next" do
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

    context "helper methods" do
      describe "#standalone_digits_in_proper_base_ten" do
        it "should return [3] for 3" do
          RomanNumeral.new().standalone_digits_in_proper_base_ten(3).should == [3]
        end

        it "should return [1000, 200, 30, 4] for 1234" do
          RomanNumeral.new().standalone_digits_in_proper_base_ten(1234).should == [1000, 200, 30, 4]
        end

        it "should return [10, 0] for 10" do
          RomanNumeral.new().standalone_digits_in_proper_base_ten(10).should == [10, 0]
        end

        it "should return [8000000 600000 70000 5000 300 0 9] for 8675309" do
          RomanNumeral.new().standalone_digits_in_proper_base_ten(8675309).should == [8000000, 600000, 70000, 5000, 300, 0, 9]
        end
      end
    end


    context "bad Roman numeral input" do
      context "#clean_up" do
        it "should return blank for an unknown character" do
          RomanNumeral.new.clean_up('h').should eq('')
        end

        it "should return blank for an empty string" do
          RomanNumeral.new.clean_up('').should eq('')
        end

        it "should return blank for nil" do
          RomanNumeral.new.clean_up(nil).should eq('')
        end

        it "should remove whitespace" do
          RomanNumeral.new.clean_up('X X X I').should eq('XXXI')
        end

        it "should upcase passed-in numeral" do
          RomanNumeral.new.clean_up('mdclxvi').should eq('MDCLXVI')
        end
      end

      context "#arabic" do
        it "should return nil for an empty string" do
          RomanNumeral.new('').arabic.should be_nil
        end
      end
    end
  end

end
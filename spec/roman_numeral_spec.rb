require 'roman_numeral'

describe RomanNumeral do

  context "#next_up_number" do
    it "returns 10 for 9" do
      RomanNumeral.new.next_up_number(9).should eq(10)
    end

    it "returns 100 for 99" do
      RomanNumeral.new.next_up_number(99).should eq(100)
    end

    it "returns 1000 for 999" do
      RomanNumeral.new.next_up_number(999).should eq(1000)
    end

    it "returns 2000 for 1999" do
      RomanNumeral.new.next_up_number(1999).should eq(2000)
    end
  end


  context "from Arabic --> Roman" do
    context "basic conversion of an Arabic value to Roman" do
      it "returns Roman numeral I for Arabic value 1" do
        RomanNumeral.new(1).roman.should eq('I')
      end

      it "returns Roman numeral V for Arabic value 5" do
        RomanNumeral.new(5).roman.should eq('V')
      end

      it "returns Roman numeral X for Arabic value 10" do
        RomanNumeral.new(10).roman.should eq('X')
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

      it "returns Roman numeral M for Arabic value 1000" do
        RomanNumeral.new(1000).roman.should eq('M')
      end
    end


    context "more involved conversion of an Arabic value to Roman" do
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

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

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

# "I", "X", "C", and "M" can be repeated three times in succession, but no more.

# "D", "L", and "V" can never be repeated.[7][8]

# "I" can be subtracted from "V" and "X" only.

# "X" can be subtracted from "L" and "C" only.

# "C" can be subtracted from "D" and "M" only.

# "V", "L", and "D" can never be subtracted[8]

# Only one small-value symbol may be subtracted from any large-value symbol.[9]

  # context "Roman numeral patterns" do
  #   (1..1001).each do |num|
  #     context "repeating digits" do
  #       before do
  #         @roman = RomanNumeral.new(num).roman
  #       end

  #       it "#{num} in Roman should not contain more than 3 I's in succession" do
  #         @roman.should_not =~ /I{4}/
  #       end
  #       it "#{num} in Roman should not contain more than 3 X's in succession" do
  #         @roman.should_not =~ /X{4}/
  #       end
  #       it "#{num} in Roman should not contain more than 3 C's in succession" do
  #         @roman.should_not =~ /C{4}/
  #       end
  #       it "#{num} in Roman should not contain more than 3 M's in succession" do
  #         @roman.should_not =~ /M{4}/
  #       end
  #       it "#{num} in Roman should not repeat D's" do
  #         @roman.should_not =~ /D{2,}/
  #       end
  #       it "#{num} in Roman should not repeat L's" do
  #         @roman.should_not =~ /L{2,}/
  #       end
  #       it "#{num} in Roman should not repeat V's" do
  #         @roman.should_not =~ /V{2,}/
  #       end

  #     end
  #   end
  # end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

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
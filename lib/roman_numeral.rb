class RomanNumeral

  TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def self.to_arabic(numeral)
    ret = 0
    numeral.each_char do |char|
      ret += TO_ARABIC[char]
    end
    ret
  end

end
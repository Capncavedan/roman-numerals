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
    numeral = numeral.to_s.gsub(/[^IVXLCDM]/, '')
    return nil if numeral == ''
    ret = 0
    numeral.chars.each_with_index do |char, i|
      next_char = numeral[i+1]
      if TO_ARABIC[char] < TO_ARABIC[next_char].to_i
        ret -= TO_ARABIC[char]
      else
        ret += TO_ARABIC[char]
      end
    end
    ret
  end

end
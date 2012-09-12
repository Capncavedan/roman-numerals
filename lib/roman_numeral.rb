class RomanNumeral

  attr_reader :arabic

  TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def initialize(num)
    @numeral = clean_up(num)
    @arabic = to_arabic(@numeral)
  end

  def to_arabic(numeral)
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

  def clean_up(num)
    num.to_s.upcase.gsub(/[^IVXLCDM]/, '')
  end

end
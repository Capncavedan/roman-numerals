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

  def initialize(num)
    @numeral = clean_up(num)
    calculate_arabic_equivalent
  end

  def clean_up(num)
    num.to_s.upcase.gsub(/[^IVXLCDM]/, '')
  end

  def arabic
    @arabic == 0 ? nil : @arabic
  end

  private

  def calculate_arabic_equivalent
    @arabic = 0
    @numeral.chars.each_with_index do |char, i|
      next_char = @numeral[i+1] # will be nil when loop is at end of string
      if next_char && TO_ARABIC[char] < TO_ARABIC[next_char]
        @arabic -= TO_ARABIC[char]
      else
        @arabic += TO_ARABIC[char]
      end
    end
  end

end
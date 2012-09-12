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
    calculate_arabic_value
  end

  def clean_up(num)
    num.to_s.upcase.gsub(/[^IVXLCDM]/, '')
  end

  private

  def calculate_arabic_value
    return nil if @numeral == ''
    @arabic = 0
    @numeral.chars.each_with_index do |char, i|
      next_char = @numeral[i+1]
      if TO_ARABIC[char] < TO_ARABIC[next_char].to_i
        @arabic -= TO_ARABIC[char]
      else
        @arabic += TO_ARABIC[char]
      end
    end
  end

end
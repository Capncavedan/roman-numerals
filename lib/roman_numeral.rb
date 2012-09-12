class RomanNumeral

  ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  ROMAN = {
     1    => 'I',
     5    => 'V',
     10   => 'X',
     50   => 'L',
     100  => 'C',
     500  => 'D',
     1000 => 'M'
  }

  def initialize(num)
    if num.is_a? Fixnum
      @arabic = num
    else
      @roman = clean_up(num)
      calculate_arabic_equivalent
    end
  end

  def clean_up(num)
    num.to_s.upcase.gsub(/[^IVXLCDM]/, '')
  end

  def arabic
    @arabic == 0 ? nil : @arabic
  end

  def roman
    ROMAN[@arabic]
  end

  private

  def calculate_arabic_equivalent
    @arabic = 0
    @roman.chars.each_with_index do |char, i|
      next_char = @roman[i+1] # will be nil when block is at end of string
      if next_char && ARABIC[char] < ARABIC[next_char]
        @arabic -= ARABIC[char]
      else
        @arabic += ARABIC[char]
      end
    end
  end

end
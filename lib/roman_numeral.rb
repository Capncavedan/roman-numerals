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

  SUBTRACTABLE_ROMANS = %w(I X C)


  def initialize(num=nil)
    if num.is_a? Fixnum
      @arabic = num
      calculate_roman_equivalent
    else
      @roman = clean_up(num)
      calculate_arabic_equivalent
    end
  end

  def next_up_number(num)
    first_char = num.to_s[0].to_i + 1
    rest_of_chars = '0' * (num.to_s.length - 1)
    (first_char.to_s + rest_of_chars).to_i
  end

  def clean_up(num)
    num.to_s.upcase.gsub(/[^IVXLCDM]/, '')
  end

  def arabic
    @arabic == 0 ? nil : @arabic
  end

  def roman
    @roman
  end


  private

  def calculate_roman_equivalent
    @roman = roman_equivalent(@arabic)
  end

  def roman_equivalent(arabic_number)
    ret = ''
    digits = []
    arabic_number.to_s.reverse.chars.each_with_index do |c,i|
      n = c + ('0' * i)
      digits << n.to_i
    end
    digits.reverse!
    digits.each do |d|
      if d >= 1000
        ret += ('M' * (d/1000))
      elsif d >= 900
        ret += 'CM'
      elsif d >= 100
        ret += ('C' * (d/100))
      elsif d >= 90
        ret += 'XC'
      elsif d >= 10
        ret += ('X' * (d/10))
      elsif d == 9
        ret += 'IX'
      elsif d >= 5
        ret += ('V' * (d/5))
      else
        ret += ('I' * d)
      end
    end
    ret += 'I' while (arabic_equivalent(ret) < arabic_number)
    ret
  end

  def calculate_arabic_equivalent
    @arabic = arabic_equivalent(@roman)
  end

  def arabic_equivalent(roman_string)
    ret = 0
    roman_string.chars.each_with_index do |char, i|
      next_char = roman_string[i+1] # will be nil when block is at end of string
      if next_char && ARABIC[char] < ARABIC[next_char]
        ret -= ARABIC[char]
      else
        ret += ARABIC[char]
      end
    end
    ret
  end

end
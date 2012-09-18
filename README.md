Roman Numerals
==============

Dabbling in Ruby with Roman numerals.

To get a Roman numeral's Arabic equivalent, pass in a string:

`RomanNumeral.new("MIM").arabic # => 1999`

To get the Arabic equivalent of a Roman numeral, pass in an integer:

`RomanNumeral.new(1999).roman # => "MCMXCIX"`

Note the returned string is valid, but not as minimalist as it could be.  1999, for example, should be MIM according to common Roman formatting as outlined on Wikipedia: http://en.wikipedia.org/wiki/Roman_numerals


Roman Numerals
==============

Dabbling in Ruby with Roman numerals.

To get a Roman numeral's Arabic equivalent, pass in a string:

`RomanNumeral.new("MCMXCIX").arabic # => 1999`

To get the Arabic equivalent of a Roman numeral, pass in an integer:

`RomanNumeral.new(1999).roman # => "MCMXCIX"`

Note the returned string is valid, and conforms to common/accepted usage patterns, but is not as minimalist as it could be.  1999, for example, could be expressed as `MIM`. Roman numerals are computed according to commonly accepted formatting as outlined on Wikipedia: http://en.wikipedia.org/wiki/Roman_numerals


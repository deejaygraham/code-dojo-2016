
class Fixnum

  Arabic_To_Roman = {
    1000 => "M", 900 => "CM", 500 => "D", 400 => "CD",
     100 => "C",  90 => "XC",  50 => "L",  40 => "XL",  
      10 => "X",   9 => "IX",   5 => "V",   4 => "IV",  
       1 => "I",  
  }

  def to_roman
    value = self
    value_as_roman = ""
    
    Arabic_To_Roman.each do | arabic, numeral |
      instances_of_numeral, value = value.divmod(arabic)
      value_as_roman << numeral * instances_of_numeral
    end

    value_as_roman

  end

end

(1..100).each { | number | puts number.to_roman }

class CaesarCipher
  #main translate function
  # @param [Object] text
  # @param [Object] offset
  def translate(text, offset)
    (0...text.length).each do |i|
      char_code = text[i].ord

      (a, z) = case char_code
               when 97..122 then [97, 122] # a-z
               when 65..90 then [65, 90]   # A-Z
               else next
               end
      rotate = offset > 0 ? 26 : -26
      char_code += adjust_offset(offset) # handle all offsets including those that fall outside of the bounds
      char_code -= rotate unless char_code.between?(a, z)
      text[i] = char_code.chr
    end
    text
  end

  private def adjust_offset(offset)
    case
    when offset > 26
      offset.modulo(26)
    when offset < -26
      -(offset * -1).modulo(26)
    else
      offset
    end
  end
end

module Bottom
  VERSION = "0.1.0"

  extend self

  CHARACTER_HASH = {
    200 => "🫂",
     50 => "💖",
     10 => "✨",
      5 => "🥺",
      1 => ",",
      0 => "❤️",
  }

  NUMBER_HASH = {
    "🫂"  => 200,
    "💖"  => 50,
    "✨"  => 10,
    "🥺"  => 5,
    ","  => 1,
    "❤️" => 0,
  }

  SEPERATOR = "👉👈"

  def encode(string : String) : String
    if !string.valid_encoding?
      raise ArgumentError.new("String must be valid UTF-8")
    end
    output = ""

    string.each_codepoint do |char|
      while char != 0
        CHARACTER_HASH.each do |key, value|
          if char >= key
            char -= key
            output += value
            break
          end
        end
      end
      output += SEPERATOR
    end
    return output
  end

  def verify_bottom(string : String)
    if !string.valid_encoding?
      raise ArgumentError.new("String must be valid UTF-8")
    end
    string.gsub(SEPERATOR, "").each_char do |char|
      if !NUMBER_HASH.has_key?(char.to_s)
        raise ArgumentError.new("Invalid char #{char} in bottom string: #{string}")
      end
    end
  end

  def decode(string : String) : String
    verify_bottom string
    output = ""

    string = string.strip.chomp SEPERATOR

    string.split(SEPERATOR).each do |letter|
      codepoint = 0
      letter.each_char do |char|
        codepoint += NUMBER_HASH[char.to_s]
      end
      output += codepoint.chr
    end
    return output
  end
end

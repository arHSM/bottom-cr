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

  # Encodes *string* as per the bottom spec.
  # Raises an `ArgumentError` if the *string* is not a valid UTF8 string.
  #
  # Example:
  #
  # ```
  # puts Bottom.encode("Hello")
  # # Output: 💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈
  # ```
  #
  # Returns `String`
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

  # Validates the given `String` instance.
  # Raises an `ArgumentError` if *string* is not a valid bottom-encoded string or the
  # string is not valid a valid UTF8 string.
  #
  # Example:
  #
  # Valid:
  # ```
  # puts Bottom.verify_bottom("💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈")
  # # Output: nil
  # ```
  #
  # Invalid:
  # ```
  # puts Bottom.verify_bottom("Hello")
  # # Output: ArgumentError
  # ```
  #
  # Returns `nil`
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

  # Validates and decodes the given *string*.
  # Raises an `ArgumentError` if *string* is not a valid bottom-encoded string or the
  # string is not valid a valid UTF8 string.
  #
  # Example:
  #
  # Valid:
  # ```
  # puts Bottom.decode("💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈")
  # # Output: Hello
  # ```
  #
  # Invalid:
  # ```
  # puts Bottom.decode("Hello")
  # # Output: ArgumentError
  # ```
  #
  # Returns `String`
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

# bottom-cr

A bottom spec implementation in Crystal

The spec can be found at https://github.com/bottom-software-foundation/spec

## Installation

Just download [`bottom.cr`](src/bottom.cr) and add it to your project or w/e

## Usage

```crystal
require "path/to/bottom.cr"

puts Bottom.encode("Hello")
# Output: 💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈
puts Bottom.decode("💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈")
# Output: Hello
```

## Documentation

### **def decode(string : String) : String**
> Validates and decodes the given *string*.
> Raises an `ArgumentError` if *string* is not a valid bottom-encoded string or the
> string is not valid a valid UTF8 string.
>
> Example:
>
> Valid:
> ```crystal
> puts Bottom.decode("💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈")
> # Output: Hello
> ```
>
> Invalid:
> ```crystal
> puts Bottom.decode("Hello")
> # Output: ArgumentError
> ```
>
> Returns `String`


### **def encode(string : String) : String**
> Encodes *string* as per the bottom spec.
> Raises an `ArgumentError` if the *string* is not a valid UTF8 string.
> 
> Example:
> 
> ```crystal
> puts Bottom.encode("Hello")
> # Output: 💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈
> ```
> 
> Returns `String`

### **def verify_bottom(string : String)**
> Validates the given `String` instance.
> Raises an `ArgumentError` if *string* is not a valid bottom-encoded string or the
> string is not valid a valid UTF8 string.
> 
> Example:
> 
> Valid:
> ```crystal
> puts Bottom.verify_bottom("💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈")
> # Output: nil
> ```
> 
> Invalid:
> ```crystal
> puts Bottom.verify_bottom("Hello")
> # Output: ArgumentError
> ```
> 
> Returns `nil`


## Contributors

- [arHSM](https://github.com/your-github-user) - creator and maintainer

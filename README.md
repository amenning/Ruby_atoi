# What's Atoi

The Atoi (Ascii TO Integer) class contain custom methods to analyze a 
string containing integers and return the first grouping of integers 
as an integer data type.  This integer grouping does not need to be the
first character, but the conversion will stop upon hitting the first 
non-integer ascii character following the first detected integer 
character.  The current version will ignore any potential sign indication.  

## Features of Atoi

*   This atoi is a custom method with the following constraints
*   Does not use functions built into the language
*   Does not use type casting
*   Does not use multiplication
*   Uses as few conditionals as possible

## How to use

This is what you need to do to use this custom Atoi class:

1.  Ensure you have ruby installed on your machine

2.  Download this repository and require the atoi.rb file in your program

3.  Make an instance of the atoi class and call the convert method to convert any strings containing numbers

```bash
# Require the atoi.rb file in your program with the correct pathname
require './atoi'

# Create a new instance of the atoi class
atoi = Atoi.new

# Call the convert method to return an integer from any number containing string
atoi.convert('123abc456') # This will return 123
atoi.convert('abc456') # This will return 456
atoi.convert('12.abc456') # This will return 12
atoi.convert('-123abc456') # This will return 123; note the absence of the negative sign
```

## The Author

This custom Atoi class was created by Carl Andrew Menning
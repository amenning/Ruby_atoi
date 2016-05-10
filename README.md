# What's Atoi

The Atoi (Ascii TO Integer) file adds new methods to the open Ruby String class using custom methods to analyze a 
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
* 	Allows for any base between 2-36 to be used

## How to use

This is what you need to do to use this custom Atoi class:

1.  Ensure you have ruby installed on your machine

2.  Download this repository and require the atoi.rb file in your program

3.  Make an atoi method call on a string object

```bash
# Require the atoi.rb file in your program with the correct pathname
require './atoi'

# Call the convert method to return an integer from any number containing string
'123abc456'.atoi # This will return 123
'abc456'.atoi # This will return 456
'12.3abc456'.atoi # This will return 12; note that only whole integers are returned
'-123abc456'.atoi # This will return 123; note the absence of the negative sign
'10103'.atoi(2) # This will return 10, which is 1010 from base 2 converted to base 10; note the result ignored the non binary character 3
'7b'.atoi(16) # This will return 123, which is 7b from base 16 converted to base 10;
```

## The Author

This custom Atoi class was created by Carl Andrew Menning
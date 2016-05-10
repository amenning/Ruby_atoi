#The Atoi (Ascii TO Integer) file adds new methods to the open Ruby String class using custom methods to analyze a 
#string containing integers and return the first grouping of integers 
#as an integer data type.  This integer grouping does not need to be the
#first character, but the conversion will stop upon hitting the first 
#non-integer ascii character following the first detected integer 
#character.  The current version will ignore any potential sign indication.  
#
#The methods below are also implemenented with the following constraints:
#
#"Implement atoi(), a function that converts an ASCII string representing a number
#into an integer. This should return an integer data type. Not another ASCII string.
#Do not use functions built into the language. Do not use type casting.
#- ...without using multiplication
#- ...using as few conditionals as possible"
# 
# The current method uses 6 conditionals; 2 are used for error checking, 2 could be removed if base was always 10
# The requirement to avoid multiplication allowed for easier conversion to allow adjustable base inputs bewteen 2-36
#
#Author::		Carl Andrew Menning 
#Version::		0.0.1
#License::		Distributed under the same terms as Ruby
class String
	#Class hash variable containing ascii characters 0-9 as keys and Fixnum integers 0-9 as corresponding values 
	@@ascii_hash = {
		'0' => 0,
		'1' => 1,
		'2' => 2,
		'3' => 3,
		'4' => 4,
		'5' => 5,
		'6' => 6,
		'7' => 7,
		'8' => 8,
		'9' => 9,
		'a' => 10,
		'b' => 11,
		'c' => 12,
		'd' => 13,
		'e' => 14,
		'f' => 15,
		'g' => 16,
		'h' => 17,
		'i' => 18,
		'j' => 19,
		'k' => 20,
		'l' => 21,
		'm' => 22,
		'n' => 23,
		'o' => 24,
		'p' => 25,
		'q' => 26,
		'r' => 27,
		's' => 28,
		't' => 29,
		'u' => 30,
		'v' => 31,
		'w' => 32,
		'x' => 33,
		'y' => 34,
		'z' => 35	
	}
	
	#The atoi method is the main method to analyze a string containing integers
	#and return an integer data type containing the first grouping of numbers in base 10.
	#
	#*Args*	  :
	#- String object receiver -> string containing characters to be converter to integer
	#- +base+ -> number base of integer contained within string with default = 10; base can be any value 2-36
	#*Returns* :
	#- if ascii numbers are present, it returns the first grouping of numbers as an integer data type of base 10
	#- if no ascii numbers are present, it returns nil
	#*Raises*  :
	#- +ArgumentError+ -> if base is not within range 2-36
	def atoi(base=10)
		raise ArgumentError, "Base must be between 2-36" unless base>=2 && base<=36
		num_str = self
		first_group = false
		resulting_int = 0
		num_str.each_char do |character|
			if String.is_digit?(character, base)
				first_group = true
				resulting_int = String.shift_integer_positions(resulting_int, base)
				resulting_int += String.ascii_lookup(character, base)
			elsif first_group==true
				break
			end
		end
		return resulting_int
	end

	#The shift_integer_positions method is the method used to shift current 
	#integers by one base to make room for the new "ones" integer without using multiplication.
	#For example: 
	#- 23 would become 230 in base 10
	#- 12 would become 192 in base 16
	#
	#*Args*	  :
	#- +old_number+ -> current integer to be shifted by 10x
	#- +base+ -> number base of integer contained within string with default = 10; base can be any value 2-36
	#*Returns* :
	#- shifted adjusted number according to the base; for base 10, by 10x
	#*Raises*  :
	#- +ArgumentError+ -> if input "old_number" is not an integer of Fixnum or Bignum data type
	def self.shift_integer_positions(old_number, base=10)
		raise ArgumentError, "Input is required to be of type Fixnum or Bignum" unless old_number.is_a?(Fixnum) || old_number.is_a?(Bignum)
		adjusted_number = 0
		for x in 1..base do
			adjusted_number += old_number
		end
		return adjusted_number
	end
	
	#The is_digit? method is the method used to confirm if current  
	#ascii string character has a corresponding integer defined using
	#the class hash variable @@ascii_hash.  The current version searches
	#based on the specified base.
	#
	#*Args*	  :
	#- +character+ -> ascii character to check
	#- +base+ -> number base of integer contained within string with default = 10; base can be any value 2-36
	#*Returns* :
	#- true if character is part of the ascii digits specified by the base, otherwise false
	#*Raises*  :
	#- This method contains no additional error checking
	def self.is_digit?(ascii_character, base=10)
		@@ascii_hash.sort.slice(0,base).each do |k,v|
			return true if k == ascii_character.downcase
		end
		return false
	end
	
	#The ascii_lookup method uses the class variable @@ascii_hash and   
	#returns the Fixnum integer that corresponds to the ascii digits 
	#contained within the specified base.  For all other inputs, it returns nil.
	#
	#*Args*	  :
	#- +ascii_character+ -> ascii character to convert
	#- +base+ -> number base of integer contained within string with default = 10; base can be any value 2-36
	#*Returns* :
	#- Fixnum integer corresponding to ascii character, if input is character digit of specified base; otherwise nil
	#*Raises*  :
	#- This method contains no additional error checking
	def self.ascii_lookup(ascii_character, base=10)
		@@ascii_hash.sort.slice(0,base).each do |k,v|
			return v if k == ascii_character.downcase
		end
	end
end	
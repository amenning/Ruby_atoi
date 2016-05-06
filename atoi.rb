class Atoi
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
		'9' => 9
	}
	
	def convert(num_str)
		first_group = false
		resulting_int = 0
		num_str.each_char do |character|
			if is_digit?(character)
				first_group = true
				resulting_int *= 10
				resulting_int += ascii_lookup(character)
			elsif (first_group==true)
				break
			end
		end
		return resulting_int
	end
	
	def easy_convert(num_str)
		resulting_int = 0
		only_num = strip_other_char(num_str)
		only_num.each_char do |character|
			resulting_int *= 10
			resulting_int += ascii_lookup(character)
		end
		return resulting_int
	end
	
	def strip_other_char(num_str)
		return num_str.scan(/\d+/).first
	end
	
	def is_digit?(character)
		return @@ascii_hash.key?(character)
	end
	
	def ascii_hash
		@@ascii_hash
	end
	
	def ascii_lookup(ascii)
		return @@ascii_hash[ascii]
	end
end	
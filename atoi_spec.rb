require './atoi'

describe "Atoi" do
	it "is an added method to the open Ruby String class" do
		test_string = String.new
		expect(test_string).to respond_to(:atoi)
	end
	
	it "raises NoMethodError for non-string inputs to convert method" do
		expect{1.atoi}.to raise_error(NoMethodError)
	end

	it "raises ArgumentError for bases other than those between 2 -36" do
		expect{"".atoi(1)}.to raise_error(ArgumentError)
		expect{"".atoi(37)}.to raise_error(ArgumentError)
		expect{"".atoi('a')}.to raise_error(ArgumentError)
	end
	
	it "converts String with numbers to integer with same value with default base 10" do
		expect("123".atoi).to eq(123)
	end		

	it "only convert first grouping of numbers to integer with same value  with default base 10" do
		expect("123abc456".atoi).to eq(123)
	end		

	it "allows first character to not be number character and converts first grouping of numbers to integer with same value  with default base 10" do
		expect("abc123abc456".atoi).to eq(123)
	end	
	
	it "identifies number characters using class hash definitions with default base 10" do
		expect(String.ascii_lookup("2")).to eq(2)
	end

	it "identifies number characters using class hash definitions with default base 16" do
		base = 16
		expect(String.ascii_lookup("c", base)).to eq(12)
	end
	
	it "checks if current character is a number character for default base 10" do
		expect(String.is_digit?("2")).to be true
	end	
	
	it "checks if current character is not a number character for default base 10" do
		expect(String.is_digit?("a")).to be false
	end

	it "checks if current character is not a number character for default base 10" do
		base = 36
		expect(String.is_digit?("z", base)).to be true
	end	
	
	it "shifts integer positions by one placement if non-zero for default base 10" do
		expect(String.shift_integer_positions(123)).to eq(1230)
	end

	it "shifts integer positions by one placement if non-zero for base 16" do
		base = 16
		expect(String.shift_integer_positions(12, base)).to eq(192)
	end	
end
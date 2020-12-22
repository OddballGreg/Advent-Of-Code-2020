input = File.read('input.txt').split("\n").map do |line|
	input_parts = line.split(': ') 
	rule_parts = input_parts.first.split(' ')
	range_parts = rule_parts.first.split('-').map(&:to_i)
	{
		rule: {
			range: range_parts.first..range_parts.last,
			char: rule_parts.last
		},
		password: input_parts.last
	}
end

valid_password_count = input.count do |item|
	item[:rule][:range].include?(item[:password].chars.select{ _1 == item[:rule][:char] }.size)
end

puts "Your answer is #{valid_password_count}"

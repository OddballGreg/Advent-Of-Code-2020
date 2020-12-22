input = File.read('input.txt').split("\n").map do |line|
	input_parts = line.split(': ') 
	rule_parts = input_parts.first.split(' ')
	position_parts = rule_parts.first.split('-').map(&:to_i)
	{
		rule: {
			positions: position_parts,
			char: rule_parts.last
		},
		password: input_parts.last
	}
end

valid_password_count = input.count do |item|
	item[:rule][:positions].count do |position|
		item[:password].chars[position-1] == item[:rule][:char]
	end == 1
end

puts "Your answer is #{valid_password_count}"

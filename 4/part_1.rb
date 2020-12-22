REQUIRED_PASSPORT_KEYS = %w(byr iyr eyr hgt hcl ecl pid)

valid_passports = 0

passport = {}
File.readlines('input.txt').each do |line|
	line = line.chomp
	if line.size.zero?
		valid_passports += 1 if (passport.keys & REQUIRED_PASSPORT_KEYS).size == REQUIRED_PASSPORT_KEYS.size
		passport = {}
	else
		line.split(' ').each do |field|
			parts = field.split(':')
			passport[parts.first] = parts.last
		end
	end
end

puts "Your answer is #{valid_passports}"

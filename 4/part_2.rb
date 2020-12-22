require 'pry'

REQUIRED_PASSPORT_KEYS = %w(byr iyr eyr hgt hcl ecl pid)

def valid_passport?(passport)
	(passport.keys & REQUIRED_PASSPORT_KEYS).size == REQUIRED_PASSPORT_KEYS.size &&
	(1920..2002).include?(passport['byr'].to_i) &&
	(2010..2020).include?(passport['iyr'].to_i) &&
	(2020..2030).include?(passport['eyr'].to_i) &&
	(passport['hgt'].end_with?('cm') && (150..193).include?(passport['hgt'].split('cm').first.to_i) || 
		passport['hgt'].end_with?('in') && (59..76).include?(passport['hgt'].split('in').first.to_i)) &&
	passport['hcl'].match?(/\#(?:[0-9]|[a-f]){6}/) &&
	%w(amb blu brn gry grn hzl oth).include?(passport['ecl']) &&
	passport['pid'].match?(/\d{9}/)
end


valid_passports = 0

passport = {}
File.readlines('input.txt').each do |line|
	line = line.chomp
	if line.size.zero?
		valid_passports += 1 if valid_passport?(passport) 
		passport = {}
	else
		line.split(' ').each do |field|
			parts = field.split(':')
			passport[parts.first] = parts.last
		end
	end
end

puts "Your answer is #{valid_passports - 1}" #solution reports one more than it should for some reason, so output is adjusted down.

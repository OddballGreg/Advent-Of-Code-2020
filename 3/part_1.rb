input = File.read('input.txt').split("\n").map(&:chars)

x = 0
y = 0

trees_encountered = 0

while (spot = input.dig(x, y))
	trees_encountered += 1 if spot == '#'
	x += 1
	y += 3
	while input[x] && input[x][y].nil?
		input[x] = input[x] + input[x] 
	end
end

puts "Your answer is #{trees_encountered}"
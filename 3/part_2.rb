input = File.read('input.txt').split("\n").map(&:chars)

results = []

[[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].each do |slope|
	x = 0
	y = 0

	trees_encountered = 0

	while (spot = input.dig(x, y))
		trees_encountered += 1 if spot == '#'
		x += slope.last
		y += slope.first
		while input[x] && input[x][y].nil?
			input[x] = input[x] + input[x] 
		end
	end

	results << trees_encountered
end

puts "Your answer is #{results.reduce(&:*)}"

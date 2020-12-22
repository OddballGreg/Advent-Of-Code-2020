input = File.read('input.txt').split.map(&:to_i)
results = {}

input.each do |i_one|
	input.each do |i_two|
		input.each do |i_three|
			results[i_one + i_two + i_three] = [i_one, i_two, i_three]
		end
	end
end

puts "Your answer is #{results[2020].reduce(&:*)}"
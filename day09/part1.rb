input = open('input').read

output = ''

while input && input.size > 0
	if input =~ /^\(\d+x\d+\)/
		instruction = input[/^\(\d+x\d+\)/]
		length, repeat = instruction.match(/(\d+)x(\d+)/).captures.map(&:to_i)
		input = input[instruction.length..-1]
		output << input[0...length] * repeat
		input = input[length..-1]
	else
		output << input[0]
		input = input[1..-1]
	end
end

puts ''
puts output
puts output.size

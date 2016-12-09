input = open('input').read

def expand(str)
	r = /\((\d+)x(\d+)\)/
	cursor = 0
	count = 0
	length = str.length
	while cursor < length
		instruction = str[cursor..-1].match(r)
		if instruction
			start = str[cursor..-1] =~ r
			count += start
			cursor += start
			isize, irepeat = instruction.captures.map(&:to_i)
			new_cursor = cursor + instruction.to_s.size + isize
			count += expand(str[(cursor + instruction.to_s.size)...(new_cursor)]) * irepeat
			cursor = new_cursor
		else
			count += length - cursor
			cursor = length
		end
	end
	count
end

puts ''
puts expand(input)

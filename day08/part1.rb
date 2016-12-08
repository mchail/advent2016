instructions = open('input').readlines

grid = []
6.times do
	grid << ['.'] * 50
end

instructions.each do |instruction|
	puts instruction
	tokens = instruction.split
	case tokens.first
	when 'rect'
		x, y = tokens[1].split('x').map(&:to_i)
		(0...x).each do |dx|
			(0...y).each do |dy|
				grid[dy][dx] = '#'
			end
		end
	when 'rotate'
		offset = tokens[4].to_i
		dir, index = tokens[2].split('=')
		index = index.to_i
		case dir
		when 'x'
			column = grid.map{|row| row[index]}
			column = column[-offset..-1] + column[0...-offset]
			column.each_with_index do |value, row|
				grid[row][index] = value
			end
		when 'y'
			grid[index] = grid[index][-offset..-1] + grid[index][0...-offset]
		end
	end
	puts grid.map(&:join)
end

puts grid.flatten.select{|v| v == '#'}.count


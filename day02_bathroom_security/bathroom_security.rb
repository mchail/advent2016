paths = open('input').read.split

buttons = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
]

code = ''

paths.each do |path|
	x, y = 1, 1
	path.each_char do |char|
		case char
		when 'L'
			x = [0, x - 1].max
		when 'R'
			x = [2, x + 1].min
		when 'U'
			y = [0, y - 1].max
		when 'D'
			y = [2, y + 1].min
		end
	end
	code << buttons[y][x].to_s
end

puts code

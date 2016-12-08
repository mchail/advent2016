paths = open('input').read.split

buttons = [
	[nil, nil, 1, nil, nil],
	[nil, 2, 3, 4, nil],
	[5, 6, 7, 8, 9],
	[nil, 'A', 'B', 'C', nil],
	[nil, nil, 'D', nil, nil]
]

code = ''
x, y = 0, 2

paths.each do |path|
	puts path
	path.each_char do |char|
		ox, oy = x, y
		case char
		when 'L'
			x -= 1
		when 'R'
			x += 1
		when 'U'
			y -= 1
		when 'D'
			y += 1
		end
		if x < 0 || y < 0 || buttons[y].nil? || buttons[y][x].nil?
			x, y = ox, oy
		end
	end
	code << buttons[y][x].to_s
end

puts code

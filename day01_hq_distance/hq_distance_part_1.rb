dirs = open('input').read.split(', ')

cards = %w(n e s w)
curr_card = 'n'

x, y = 0, 0

dirs.each do |dir|
	turn = dir[0]
	length = dir[1..-1].to_i

	curr_card_index = cards.index(curr_card)
	case turn
	when 'L'
		curr_card_index -= 1
	when 'R'
		curr_card_index += 1
	end

	curr_card = cards[(curr_card_index + 4) % 4]

	case curr_card
	when 'n'
		y += length
	when 'e'
		x += length
	when 's'
		y -= length
	when 'w'
		x -= length
	end
end

puts x, y
puts "part 1: #{x.abs + y.abs}"

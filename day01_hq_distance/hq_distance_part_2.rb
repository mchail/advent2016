require 'set'
require 'pry'

dirs = open('input').read.split(', ')

cards = %w(n e s w)
curr_card = 'n'

x, y = 0, 0
locs = Set.new
locs << [0, 0]

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
		nxs = [x]
		nys = ((y + 1)..(y + length)).to_a
		y += length
	when 'e'
		nxs = ((x + 1)..(x + length)).to_a
		nys = [y]
		x += length
	when 's'
		nxs = [x]
		nys = ((y - length)...y).to_a
		y -= length
	when 'w'
		nxs = ((x - length)...x).to_a
		nys = [y]
		x -= length
	end

	nxs.each do |nx|
		nys.each do |ny|
			newloc = [nx, ny]
			if locs.include?(newloc)
				puts nx, ny
				puts "part 2: #{nx.abs + ny.abs}"
				exit
			end

			locs << newloc
		end
	end
end

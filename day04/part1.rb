lines = open('input').readlines

puts lines.map{ |line|
	_, name, sector, cksum = line.match(/(([a-z\-]+)([0-9]+))\[(.*)\]/).captures
	name = name.gsub('-', '')
	top = name.split('').group_by{|c| c}.values.sort{ |a, b|
		if a.size == b.size
			a[0] <=> b[0]
		else
			b.size <=> a.size
		end
	}.first(5).map(&:first).join
	if top == cksum
		sector.to_i
	else
		0
	end
}.inject(&:+)

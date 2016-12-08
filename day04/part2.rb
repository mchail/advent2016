lines = open('input').readlines

alpha = ('a'..'z').to_a

lines.each{ |line|
	_, name, sector, cksum = line.match(/(([a-z\-]+)([0-9]+))\[(.*)\]/).captures
	letters = name.gsub('-', '')
	top = letters.split('').group_by{|c| c}.values.sort{ |a, b|
		if a.size == b.size
			a[0] <=> b[0]
		else
			b.size <=> a.size
		end
	}.first(5).map(&:first).join
	next unless top == cksum
	sector = sector.to_i
	decoded = name.each_char.map{ |char|
		if char == '-'
			' '
		else
			alpha[(alpha.index(char) + sector) % 26]
		end
	}.join
	if decoded =~ /north/
		puts decoded
		puts sector
	end
}

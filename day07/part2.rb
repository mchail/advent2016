require 'pry'

lines = open('input').readlines

# lines = lines[0..5]
puts lines.select{ |line|
	inside = line.scan(/\[(\w+)\]/).flatten.join('-')
	outside = line.gsub(/\[\w+\]/, '-')

	abas = []
	(0..(inside.size - 3)).each{|cursor|
		substring = inside[cursor..(cursor + 2)]
		if substring[0] == substring[2] && substring[0] != substring[1]
			abas << [substring[0], substring[1]]
		end
	}
	abas.any? do |match|
		# binding.pry
		a, b = match
		a != b && outside =~ /#{b}#{a}#{b}/
	end
}.count

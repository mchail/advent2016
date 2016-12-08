lines = open('input').readlines

def abba?(text)
	text.scan(/(.)(.)\2\1/).any? do |letters|
		letters[0] != letters[1]
	end
end

puts lines.select{ |line|
	inside = line.scan(/\[(\w+)\]/).flatten
	next if inside.any? do |word|
		abba?(word)
	end
	abba?(line.gsub(/\[\w+\]/, '-'))
}.count

require 'digest'

input = 'uqwqemis'

code = '........'
found = 0
counter = 0

while found < 8
	test = input + counter.to_s
	digest = Digest::MD5.hexdigest(test)
	if digest.start_with?('00000')
		pos = digest[5].to_i(16)
		letter = digest[6]
		if code[pos] == '.' && pos < 8
			code[pos] = letter
			found += 1
			puts code
		end
	end
	counter += 1
	puts counter if counter % 100000 == 0
end

puts code

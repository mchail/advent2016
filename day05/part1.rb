require 'digest'

input = 'uqwqemis'

code = ''
counter = 0

while code.size < 8
	test = input + counter.to_s
	digest = Digest::MD5.hexdigest(test)
	if digest.start_with?('00000')
		code << digest[5]
	end
	counter += 1
	puts counter if counter % 100000 == 0
end

puts code

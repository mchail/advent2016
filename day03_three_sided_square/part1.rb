puts open('input').each_line.select{ |line|
	nums = line.split.map(&:to_i).sort
	nums[0] + nums[1] > nums[2]
}.count

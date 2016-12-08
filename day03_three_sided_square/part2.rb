puts open('input').each_line.each_slice(3).map{ |lines|
	lines.map!{ |line|
		line.split.map(&:to_i)
	}
	(0..2).select{ |index|
		nums = lines.map{|line| line[index]}.sort
		nums[0] + nums[1] > nums[2]
	}.count
}.inject(&:+)

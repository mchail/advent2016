puts open('input').readlines.map{|l| l.split('')}.inject(&:zip).map(&:flatten).map{|l| l.group_by{|c| c}.sort_by{|k, v| v.size}.last.first}.join

puts open('input').readlines.map{|l| l.split('')}.inject(&:zip).map(&:flatten).map{|l| l.group_by{|c| c}.sort_by{|k, v| v.size}.first.first}.join

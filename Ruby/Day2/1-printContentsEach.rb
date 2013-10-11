i = 0
values = ""

(1..16).to_a.each do |x|
	i += 1

	values += x.to_s
	if(i % 4 == 0)
		puts "#{values}"
		values = ""
	end
end
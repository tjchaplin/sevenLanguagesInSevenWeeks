answer = rand(10)
print "Enter your number: "
guess = gets.to_i

while guess != answer
	if guess > answer
		print "Too high. Try again: "
	end

	if guess < answer
		print "Too low. Try again: "
	end

	guess = gets.to_i
end

print "Correct! The number was: #{answer}\n"
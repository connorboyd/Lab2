# Part1: Hello World
class HelloWorldClass
	def initialize(name)
		@name = name.capitalize
	end
	def sayHi
		puts "Hello #{@name}!"
	end
end
hello = HelloWorldClass.new("Connor")
hello.sayHi

def palindrome?(string)
	string1 = string.gsub(/[^a-zA-Z]/, "").downcase
	return string1 == string1.reverse
end

puts palindrome?("racecar")

def rps_game_winner(players)
	if(players.length != 2)
		raise WrongNumberOfPlayersError
	end
	if players[0]
		
	end
end

def count_words(string)
	string1   = string.gsub(/[^a-zA-Z\s]/, "").downcase
	wordArray = string1.split
	wordHash  = Hash.new(0)
	wordArray.each {|x| wordHash[x]+=1}
	return wordHash
end

puts count_words("A man, a plan, a canal -- Panama")
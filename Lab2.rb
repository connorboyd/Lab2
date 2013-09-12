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



def count_words(string)
	string1   = string.gsub(/[^a-zA-Z\s]/, "").downcase
	wordArray = string1.split
	wordHash  = Hash.new(0)
	wordArray.each {|x| wordHash[x]+=1}
	return wordHash
end

puts count_words("A man, a plan, a canal -- Panama")



class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError 		<  StandardError ; end

def doesFirstWin(first, second)
	if first == second
		return true
	end
	if first == "r"
		return second == "s"
	end
	if first == "p"
		return second == "r"
	end
	if first == "s"
		return second == "p"
	end
end


def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	validStrategies = ["r","p","s"]
	raise NoSuchStrategyError unless validStrategies.include?(game[0][1].downcase) && validStrategies.include?(game[1][1].downcase)

end

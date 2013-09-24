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
p "Hello World:"
hello.sayHi

def palindrome?(string)
	string1 = string.gsub(/[^a-zA-Z]/, "").downcase
	return string1 == string1.reverse
end

p "Palindrome:"
p palindrome?("racecar")



def count_words(string)
	string1   = string.gsub(/[^a-zA-Z\s]/, "").downcase
	wordArray = string1.split
	wordHash  = Hash.new(0)
	wordArray.each {|x| wordHash[x]+=1}
	return wordHash
end

p "Count Words:"
p count_words("A man, a plan, a canal -- Panama")



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
	raise NoSuchStrategyError unless validStrategies.include?(game[0][1].downcase)&&validStrategies.include?(game[1][1].downcase)
	if(doesFirstWin(game[0][1].downcase,game[1][1].downcase))
		return game[0]
	else
		return game[1]
	end
end

p "Game:"
p rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
#p rps_game_winner([ ["Allen", "S"],   ["Omer", "P"] ])


def rps_tournament_winner(tournament)
	if(tournament[0][1].class == String)	#Bottom of bracket. One RPS game
		return rps_game_winner(tournament)
	else
		oneSide   = rps_tournament_winner(tournament[0])
		otherSide = rps_tournament_winner(tournament[1])
		return rps_tournament_winner([oneSide, otherSide])
	end
end

testTournament = [
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"],  ["Michael", "S"] ],
	],
	[
		[ ["Allen", "S"], ["Omer", "P"] ],
		[ ["David E.", "R"], ["Richard X.", "P"] ]
	]
]
p "Tournament:"
p rps_tournament_winner(testTournament)

def combine_anagrams(words)
	arrayOfAnagrams = Array.new()
	words.each do |thisWord|
		temp = []
		words.each do |nextWord|
			if (thisWord.downcase.split(//).sort == nextWord.downcase.split(//).sort)
				temp.push(nextWord)
			end
		end
		arrayOfAnagrams.push(temp)
	end
	uniqueArray = arrayOfAnagrams.uniq
	return uniqueArray

end

p "Combine Anagrams:"
p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])

#Todo: Getters and setters

class Dessert
	def initialize(name, calories)
		@name     = name
		@calories = calories
	end

	def healthy?
		@calories < 200
	end

	def delicious?
		true	#All desserts are delicious 
	end
end

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end

	def delicious?
		return @flavor != "black licorice"
	end
end

dessert1 = Dessert.new("Cake",299)
p dessert1.healthy?

jellybean = JellyBean.new("Jeffrey", 199, "white licorice")
p jellybean.healthy?




class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s       # make sure it's a string
		attr_reader attr_name            # create the attribute's getter
		attr_reader attr_name+"_history" # create bar_history getter
		class_eval %Q{ 
			def #{attr_name}=(attr_name)	#Set the attribute
				@attr_name = attr_name
				if @#{attr_name}_history	#If the history array already exists, add the attribute to the end
					@#{attr_name}_history << attr_name 
				else 	#Array is not initialized
					@#{attr_name}_history =  Array.new 	#Initialize array
					@#{attr_name}_history << nil		#Add nil to the array
					@#{attr_name}_history << attr_name	#Append the variable to the array
				end 
			end
		}
	end
end

class Foo
	attr_accessor_with_history :bar
end

p f = Foo.new
p f.bar = 1
p f.bar = 2
p f.bar_history # => if your code works, should be [nil, 1, 2]

p f.bar_history.instance_of?(Array)


class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
			super
		end
	end

	def in(otherCurrency)
		withoutS = otherCurrency.to_s.gsub( /s$/, '')
		if(@@currencies.has_key?(withoutS))
			return self / @@currencies[withoutS]
		end

	end

end

p 20.dollars.in(:euros)
p 20.euros.in(:rupees)
p 20.euro.in(:yen)


class String
	def palindrome?
		string1 = self.gsub(/[^a-zA-Z]/, "").downcase
		return string1 == string1.reverse
	end
end


p "racecar".palindrome?

module Enumerable

	def palindrome?
		return self == self.reverse
	end
end


p [1,2,3,4,3,2,1].palindrome?




class CartesianProduct
    include Enumerable

    def initialize(sequence1, sequence2)
    	@sequence1 = sequence1
    	@sequence2 = sequence2
    end

    def each
    	@sequence1.each do |x|
    		@sequence2.each do |y|
    			yield [x,y]
    		end
    	end
    end
 end
#Example test cases:

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty

require_relative '../config/environment.rb'
require "pp"
require "pry"

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line

#Startups
twitter = Startup.new("Twitter", "John Tweeter", "Tech")
fb = Startup.new("Facebook", "Mark Zuck", "Tech")
vamonde = Startup.new("Vamonde", "Alice Vamonde", "Travel")
chowly = Startup.new("Chowly", "Ben Chowly", "Food")
litter = Startup.new("Litter", "John Tweeter", "Earth")

# p twitter.name
# p fb.founder
# p vamonde.domain
# puts "_"*10
# p Startup.domains

#VentureCaps
big_money = VentureCapitalist.new("Big Money", 20000000)
christine = VentureCapitalist.new("Christine Doherty", 50000000)
lexie = VentureCapitalist.new("Lexie DeGrandchamp", 1000000000)
remus = VentureCapitalist.new("Remus Doherty-DeGrandchamp", 9000000000)
nikki = VentureCapitalist.new("Nikki Luciano", 6000000000)

# p big_money.name
# p christine.total_worth
# p VentureCapitalist.all
# puts "_"*10
# p VentureCapitalist.tres_commas_club

#FundingRound
# round_one = FundingRound.new(twitter, remus, "Angel", 1000000.00)

# p round_one.startup 
# p round_one.venture_capitalist
# p round_one.type
# p round_one.investment
# puts "-"*10
# p FundingRound.all

twitter.sign_contract(big_money, "Angel", 700)
twitter.sign_contract(christine, "Round 1", 8000)
twitter.sign_contract(christine, "Round 3", 9)
twitter.sign_contract(nikki, "Round 3", 4000)
twitter.sign_contract(nikki, "Round 4", 5000)
fb.sign_contract(nikki, "Angel", 500)
fb.sign_contract(remus, "Angel", 200)
twitter.sign_contract(lexie, "Angel", 800)
twitter.sign_contract(lexie, "second", 900)
# p VentureCapitalist.tres_commas_club
# p twitter.big_investors

christine.offer_contract(vamonde, "Angel", 5000)
remus.offer_contract(vamonde, "Angel", 10000)
remus.offer_contract(vamonde, "Second", 7000)
nikki.offer_contract(chowly, "Third", 100)
nikki.offer_contract(chowly, "Third", 10000)
remus.offer_contract(twitter, "Fourth", 500)

p remus.biggest_investment
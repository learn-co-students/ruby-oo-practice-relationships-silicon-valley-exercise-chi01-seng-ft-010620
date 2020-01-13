require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

cool = Startup.new("Cool", "Dave", "tech")
james = VentureCapitalist.new("James", 957000)
ash = VentureCapitalist.new("Ash", 1500000)
this = Startup.new("This", "Max", "join")
# cool.pivot("More", "tech")
# VentureCapitalist.tres_commas_club
angel = cool.sign_contract(ash, "angel", 500000)
another = cool.sign_contract(james, "angel", 50000)
some = ash.offer_contract(cool, "angel", 10000)
# p FundingRound.all
# angel = FundingRound.new(cool, ash, "angel", 500000)
 p ash.invested("tech")
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line
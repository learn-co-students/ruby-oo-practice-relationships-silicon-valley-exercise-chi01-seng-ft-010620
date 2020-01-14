require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

odin = StartUp.new("Odin", "Kevin", "odin.com")
ganash = StartUp.new("Ganash", "Keenan", "ganash.com")
odin.pivot("thor.com", "Thor")
steve = VentureCapitalist.new("Steve", 10000000)
bruce = VentureCapitalist.new("Bruce", 2000000000)
bobby = VentureCapitalist.new("Bobby", 20000000000)
ganash_first = FundingRound.new(ganash, steve, 120000, "angel")
odin_first = FundingRound.new(odin,steve,25000,"preseed")
odin_second = FundingRound.new(odin, bruce, 1000000, "seed")

odin_first.start_up





binding.pry
0 #leave this here to ensure binding.pry isn't the last line
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startup
ratebarn = Startup.new("Rate_Barn", "Frank", "tech")
snapsheet = Startup.new("Snapsheet", "Brad", "insurtech")
grubhub = Startup.new("GrubHub", "Joe", "services")

#VentureCapitalist
vc1 = VentureCapitalist.new("VC1", 1500000000)
vc2 = VentureCapitalist.new("VC2", 80000)
vc3 = VentureCapitalist.new("VC3", 1200000000)

#FundingRound
fr1 = FundingRound.new(ratebarn, vc1, "Angel", 150000.50)
fr2 = FundingRound.new(snapsheet, vc2, "Seed", 550000.88)
fr3 = FundingRound.new(grubhub, vc3, "Seed", 190000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

# ruby tools/console.rb
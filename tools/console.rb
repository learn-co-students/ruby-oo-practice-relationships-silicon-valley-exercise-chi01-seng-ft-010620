require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
chowly = Startup.new("Chowly","Sterling Douglass", "restaurant software")
salesforce = Startup.new("Salesforce","Marc Benioff","CRM")

rich_guy = VentureCapitalist.new("Chad", 100000)
richer_guy = VentureCapitalist.new("Brad", 2000000000)
richest_guy = VentureCapitalist.new("Tad", 5000000000)

series_a = FundingRound.new(chowly, rich_guy, "Series A", 60000.0)
series_b = FundingRound.new(salesforce, richer_guy, "Series B", 1000000.0)
series_c = FundingRound.new(salesforce, richest_guy, "Series C", 2000000.0)
chowly_series_b = FundingRound.new(chowly, rich_guy, "Series B", 70000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
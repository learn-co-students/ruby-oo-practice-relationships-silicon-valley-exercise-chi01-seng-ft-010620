class Startup
    attr_reader :name, :founder, :domain, :founder_name, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 

        @@all << self
    end 

    def pivot(domain, name)
        @domain = domain
        @name = name 
    end 

    def sign_contract(venture_capitalist, type, investment)
        @venture_capitalist = venture_capitalist 
        @type = type
        @investment = investment

        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
    #    x = FundingRound.all.select {|fr| fr.startup == self}
       investments = funding_rounds.map {|s| s.investment}
       "$"+'%.2f' % investments.sum
    #    "$"+'%.2f' %
    end 

    def investors
    #    x = FundingRound.all.select {|fr| fr.startup == self}
       investors = funding_rounds.map{|s| s.venture_capitalist.name}.uniq
    #    investors.uniq
    end 

    def big_investors
    #    x = FundingRound.all.select {|fr| fr.startup == self}
       investors = funding_rounds.map {|s| s.venture_capitalist}
       big = investors.find_all {|i| i.total_worth > 999999999}
       big.map{|x| x.name}.uniq
    end

    def self.all
        @@all
    end 

    def self.find_by_founder(founder_name)
        @founder_name
        Startup.all.find {|startups| startups.founder == founder_name}
    end 

    def self.domains
        Startup.all.map {|startups| startups.domain}
    end 

end

class Startup
    attr_accessor :name, :domain
    attr_reader :founder

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
    #given a string of a domain and a string of a name, change the 
    #domain and name of the startup. This is the only public method 
    #through which the domain should be changed.

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end
    #given a string of a founder's name, 
    #returns the first startup whose founder's name matches
    
    def self.domains
        self.all.map do |startup|
            startup.domain
        end
        startup.domain.uniq
    end
    #should return an array of all of the different startup domains

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end
    #given a venture capitalist object, type of investment (as a string), 
    #and the amount invested (as a float), creates a new funding round and 
    #associates it with that startup and venture capitalist.

    def num_funding_rounds
        FundingRound.all.select do |funding_round| 
            funding_round.startup == self
        end
    end
    #Returns the total number of funding rounds that the startup has gotten

    def total_funds
        total = 0
        num_funding_rounds.each do |round| 
            total += round.investment
        end
        total
    end
    #Returns the total sum of investments that the startup has gotten

    def investors
        funds = []
        num_funding_rounds.each do |round| 
            funds << round.venture_capitalist
        end
        funds.uniq
    end
    #Returns a unique array of all the venture capitalists that have invested in this company

    def big_investors
        investors.select do |investor| 
            investor.total_worth > 10000000000
        end
    end      
    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

end

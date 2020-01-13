class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder
        @domain = domain
        @@all << self
    end 

    def pivot(name, domain)
        @name = name 
        @domain = domain
    end 

    def self.all
        @@all
    end 

    def self.find_by_founder(name)
        @@all.find {|startup| startup.founder == name}
    end 

    def self.domains
        @@all.map { |startup| startup.domain}
    end 

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end 

    def my_fr
        FundingRound.all.select do |funding|
            funding.startup == self
        end 
    end 

    def num_funding_rounds
        my_fr.count
    end 

    def total_funds 
        total = 0
        my_fr.each do |my_fr|
            total += my_fr.investment
        end 
        return total
    end 

    def investors
        my_vc = my_fr.map do |my_fr|
            my_fr.venture_capitalist
        end 
        my_vc.uniq
    end 

    def big_investors
        investors.select do |investors|
            investors.total_worth >= 1000000
        end 
    end 
end

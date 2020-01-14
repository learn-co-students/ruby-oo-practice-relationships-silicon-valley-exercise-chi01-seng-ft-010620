require "pry"


class StartUp
    attr_accessor :name 
    attr_reader :founder, :domain

    @@all = []


    def initialize(name, founder, domain)
           @name = name
           @domain = domain
           @founder = founder
           @@all << self
    end 

       
    def name(name)
        @name
    end


    def founder
        @founder
    end

      def domain
        @domain
    end 

   

    def pivot(domain, name)
        @domain = domain 
        @name = name
    end


    def self.find_by_owner(owner)
        self.all.find {|i| i.founder == owner}
     
    end

    def self.all 
    @@all
    end
    
   def self.domains
        @@all.map { |x| x.domain}
    end

    def sign_contract(venture_cap, type, amount)
        FundingRound.new(self, venture_cap, amount, type)
     end

    def num_funding_rounds
        one_more = FundingRound.all.select{|x| x.startup == self}
        one_more.count
    end

    def total_funds
        poop = FundingRound.all.select  {|x| x.startup == self}
        fired_up = poop.map {|x| x.amount }
        fired_up.sum
    end

    def investors 
        poop = FundingRound.all.select  {|x| x.startup == self}
        fired_up = poop.map {|x| x.venture_capitalist.name }
    end

    def big_investors 
        poop = FundingRound.all.select  {|x| x.startup == self}
        fired_up = poop.map {|x| x.venture_capitalist }
        fired_up.select{|x| x.total_worth >= 1000000000 }
    end



end


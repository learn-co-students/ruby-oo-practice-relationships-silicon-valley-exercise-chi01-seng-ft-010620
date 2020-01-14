class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end
    #returns an array of all venture capitalists in the Trés Commas club 
    #(they have more then 1,000,000,000 total_worth)

    def offer_contract(startup, type, amount)
        FundingRound.new(self, startup, type, amount)
    end
    #given a startup object, type of investment (as a string), and the amount 
    #invested (as a float), creates a new funding round and associates it with 
    #that startup and venture capitalist.

    def funding_rounds
        FundingRound.all.select do |round| 
            round.venture_capitalist == self
        end       
    end
    #returns an array of all funding rounds for that venture capitalist

    def portfolio
        startups = []
        funding_rounds.each do |round|
            startups << round.startup
        end
        startups.uniq
    end
    #Returns a unique list of all startups this venture capitalist has funded

    def biggest_investment
        funding_rounds.max_by do |funding_round|
            funding_round.investment
        end
    end
    #returns the largest funding round given by this venture capitalist

    def invested(domain)
        total = 0
        self.funding_rounds.each do |funding|
            if funding.this_startup.domain == domain
                total += funding.investment
            end
        end
        total
    end
    #given a domain string, returns the total amount invested in that domain

end

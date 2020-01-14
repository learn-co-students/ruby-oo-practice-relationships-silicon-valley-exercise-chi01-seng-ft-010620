class Startup

    attr_reader :founder, :domain, :name

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

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, amount_invested)
        FundingRound.new(self, venture_capitalist, type, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        sum = 0
        self.funding_rounds.each do |funding_round|
            sum += funding_round.investment
        end
        sum
    end

    def investors
        investors = self.funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end
        investors.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end


end

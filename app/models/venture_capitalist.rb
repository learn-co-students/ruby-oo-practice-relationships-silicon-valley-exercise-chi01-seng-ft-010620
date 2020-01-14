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
        self.all.select do |vc|
            vc.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, amount_invested)
        FundingRound.new(startup, self, type, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        startups = self.funding_rounds.map do |funding_round|
            funding_round.startup.name
        end
        startups.uniq
    end

    def biggest_investment
        sorted = self.funding_rounds.sort {|a, b| b.investment <=> a.investment}
        sorted[0]
    end

    def investment(domain)
        total = 0
        self.funding_rounds.each do |funding_round|
            if funding_round.startup.domain == domain
                total += funding_round.investment
            end
        end
        total
    end

end

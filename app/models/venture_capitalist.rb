class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

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
        @@all.select { |venture_capitalists| venture_capitalists.total_worth >= 1000000 }
    end 

    def offer_contract(start_up, type, investment)
        FundingRound.new(start_up, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select do |funding|
            funding.venture_capitalist == self
        end 
    end 

    def portfolio
        a = funding_rounds.map do |fr|
            fr.startup
        end 
        a.uniq
    end 

    def biggest_investment
        funding_rounds.max_by { |funding_rounds| funding_rounds.investment}
    end 

    def invested(domain_name)
        total = 0
        funding_rounds
        domains = funding_rounds.select { |fr| fr.startup.domain == domain_name}
        domains.each { |domain| total += domain.investment}
        total
    end 
end

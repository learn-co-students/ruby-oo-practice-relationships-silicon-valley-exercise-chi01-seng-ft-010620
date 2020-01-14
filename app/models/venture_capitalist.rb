require "pry"

class VentureCapitalist
    attr_reader :name, :total_worth, :startup, :type, :investment, :domain

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        
        # "$"+total_worth.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
        @@all << self
    end

    def offer_contract(startup, type, investment)
        @startup = startup
        @type = type
        @investment = investment

        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        startups = funding_rounds.map {|r| r.startup}
        # rounds = FundingRound.all.select {|fr| fr.venture_capitalist == self}
        # startups = rounds.map {|r| r.startup}
        startups.map {|s| s.name}.uniq
    end

    def biggest_investment
        # rounds = FundingRound.all.select {|fr| fr.venture_capitalist == self}
        "$"+'%.2f' %  funding_rounds.map {|r| r.investment}.max
    end

    def invested(domain)
        @domain = domain
        rounds = FundingRound.all.select {|fr| fr.venture_capitalist == self && fr.startup.domain == domain}
        "$"+'%.2f' % rounds.map {|r| r.investment}.sum
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        x = VentureCapitalist.all.select {|v| v.total_worth > 999999999}
        x.map {|vc| vc.name}
    end

end

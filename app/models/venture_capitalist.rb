class VentureCapitalist
    attr_reader :name, :total_worth


    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.tres_commas_club
        self.all.select { |x| x.total_worth >= 1000000000}
    end

    def total_worth
        @total_worth
    end

    def self.all
        @@all
    end
    
    def offer_contract (startup, amount, type )
        FundingRound.new(startup, self, amount, type)
    end

    def funding_rounds
        FundingRound.all.select{|x| x.venture_capitalist == self}
    end



    def portfolio
        tutu = FundingRound.all.select{|x| x.venture_capitalist == self}
        tutu.map{|x| x.startup}
    end

    def biggest_investment 
        tutu = FundingRound.all.select{|x| x.venture_capitalist == self}
        pompei = tutu.max{ |x|  x.amount <=> x.amount}
    end

    def invested(domain_name)
        tutu = FundingRound.all.select{|x| x.venture_capitalist == self}
        pomipe = tutu.select {|x| x.start_up.domain == domain_name}
        umbrella = pomipe.map{ |x| x.amount}
        umbrella.sum
        

    end


end

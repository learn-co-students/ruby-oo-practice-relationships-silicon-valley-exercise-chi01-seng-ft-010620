class FundingRound
    attr_reader :start_up, :venture_capitalist, :type, :amount

    @@all = []

        def initialize (start_up, venture_capitalist, amount, type)
        @start_up = start_up
        @venture_capitalist = venture_capitalist
        @type = type
        @amount = amount
        @@all << self
        end

        def amount
            @amount
        end

    def self.all
     @@all
    end

    def investment
       self.amount.to_f
    end


    def startup
    self.start_up
    end

    def v_c
        self.venture_capitalist
    end

    def type_of_funding
        self.type
    end

    

end

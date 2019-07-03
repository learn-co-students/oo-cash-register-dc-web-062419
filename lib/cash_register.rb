require 'pry'

class CashRegister

    attr_reader :discount, :items
    attr_accessor :total

    # @@items = []

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    @@receipt = {}

    def add_item(title, price, q=1)
        # def tally 
        #     @items << title
        # end
        @@receipt[title] = price
        q.times { @items << title}
        @total += price*q
    end

    def apply_discount
        @total = @total*(100-discount)/100
        @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total}."
    end

    def items
        @items
    end

    def void_last_transaction
        @total -=  @@receipt.find {|k,v| k==@items.last }[1]
        # binding.pry
    end

end

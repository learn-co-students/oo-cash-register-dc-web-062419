require 'pry'

require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_item_price

    

    def initialize(discount =0)
       @total = 0
       @discount = discount
       @items = []
    end

    def total
        @total 
    end

    def add_item(title,price,quantity = 1) 
        @last_item_price = price * quantity
        if quantity == 1
            self.total += price 
            @items << title
        elsif quantity > 1
            self.total += price * quantity
            # binding.pry
            quantity.times do 
                @items << title
            # binding.pry
            end
        end

    def void_last_transaction
        # binding.pry
        self.total -= last_item_price

    end
        
    end

    def apply_discount

        if discount == 0
            return "There is no discount to apply."
        else
       
            x = self.total / 100 * discount
            self.total = self.total - x
            # binding.pry
            return "After the discount, the total comes to $#{self.total}."
        end


    end

    
end

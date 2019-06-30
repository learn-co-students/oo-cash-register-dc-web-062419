require 'pry'
class CashRegister
    
        attr_accessor :discount, :total, :last_transaction
    
    def initialize(discount= 0)
        @total = 0
        @discount = discount
        @items = []
        @quantity
    end

    def add_item(title, price, quantity= 1)
        self.total = total +  (price * quantity) 
        quantity.times do
          @items << title
        end
        self.last_transaction = price * quantity
        # binding.pry
    end


    def apply_discount
        if discount > 0 
        self.total = (self.total * (1 - (discount * 0.01))).to_i
         "After the discount, the total comes to $#{self.total}."
        #  binding.pry
        else
            "There is no discount to apply."
        end

    end

    def items
        @items
    end

    def void_last_transaction 

       self.total = self.total - self.last_transaction

    end

end
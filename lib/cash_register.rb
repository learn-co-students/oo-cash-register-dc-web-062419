require 'pry'

class CashRegister

    attr_accessor :total, :discount, :last_transaction
    attr_reader :items

    def initialize(discount=0)
        @total = 0
        @items = []
        @discount = discount
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        total = self.total += price*quantity
        quantity.times {self.items << title}
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount > 0
            self.total = self.total - (self.total * self.discount/100)
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end
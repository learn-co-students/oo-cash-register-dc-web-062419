class CashRegister
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_added = {}
  end
  attr_accessor :total, :discount, :last_item_added
  
  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    self.items.fill(title, self.items.size, quantity)
    self.last_item_added = {"title": title, "price": price, "quantity": quantity}
  end
  
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total *= (1 - self.discount*0.01)
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  
  def items
    return @items
  end
  
  def void_last_transaction
    self.total -= self.last_item_added[:price].to_f
    self.items.pop
  end
end
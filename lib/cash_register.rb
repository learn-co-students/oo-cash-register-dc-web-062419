class CashRegister
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0.to_f
  end

  attr_accessor :total, :discount, :last_transaction
  attr_reader :items

  def add_item(title,price,quantity=1)
    self.total=(self.total+=price*quantity)
    quantity.times {@items << title}
    @last_transaction = price
  end

  def apply_discount
    if discount > 0
      self.total=(self.total - self.total * discount/100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total=(self.total-=self.last_transaction)
  end
end

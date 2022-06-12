require "pry"

class CashRegister

    attr_accessor :discount, :total, :items, :last_item

    def initialize (discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total = total + (price * quantity)
        quantity.times {self.items << title}
        self.last_item = (price * quantity)
    end

    def apply_discount
        if discount
        @total = total - Integer(total.to_f * (discount.to_f / 100.to_f))
        "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_item
    end


end
